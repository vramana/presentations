package main

import (
	"strconv"
	"database/sql"
	"fmt"
	// "encoding/json"
	"github.com/gin-gonic/gin"

	_ "github.com/lib/pq"
)

type User struct {
	Id int `json:"id"` 
	Name string `json:"name"` 		
}


func getUser(db *sql.DB, userId int) (User, error) {

	user := User{}

	var name string

	row := db.QueryRow("SELECT name FROM users WHERE id = $1", userId)

	err := row.Scan(&name)

	if err != nil {
		return user, err
	}

	user.Id = userId
	user.Name = name

	return user, nil
}

type Post struct {
	Id int `json:"id"`
	Title string `json:"title"`
	URL string `json:"url"`
	Domain string `json:"domain"`
	UserId int `json:"user_id"`
}


func getPost(db *sql.DB, postId int) (Post, error) {
	post := Post{}

	row := db.QueryRow("SELECT title, url, domain, user_id FROM posts WHERE id = $1", postId)

	var title, url, domain string
	var userId int
	err := row.Scan(&title,&url, &domain, &userId)
	if err != nil {
		return post, err
	}

	post.Id = postId
	post.Title = title
	post.URL = url
	post.Domain = domain
	post.UserId = userId

	return post, nil
}

func getPosts(db *sql.DB) ([]Post, error) {
	rows, err := db.Query("SELECT id, title, url, domain, user_id FROM posts") 
	if err != nil {
		return []Post{}, err 
	}

	posts := []Post{}

	for rows.Next() {
		var title, url, domain string
		var id, userId int

		err := rows.Scan(&id, &title,&url, &domain, &userId)
		if err != nil {
			return []Post{}, err
		}

		posts = append(posts, Post{ 
			Id:id, 
			Title: title,
			Domain: domain,
			URL: url,
			UserId: userId,
		})
	}

	return posts, nil
}


func createPost(db *sql.DB, post Post) error {
	_, err := db.Exec("INSERT INTO posts (title, domain, url, user_id) VALUES ($1, $2, $3, $4)",
  			post.Title,
  			post.Domain,
  			post.URL,
  			post.UserId)

  	return err 

}

func getPostHandler(c *gin.Context, db *sql.DB) {
	_id := c.Param("id")

	id, err := strconv.Atoi(_id)
	if err != nil {
		c.Status(400)
		return
	}

	post, err := getPost(db, id)
	if err != nil {
		c.Status(500)
		return
	}

	c.JSON(200, post)
}

func getPostsHandler(c *gin.Context, db *sql.DB) {

	posts, err := getPosts(db)
	if err != nil {
		c.Status(500)
		return
	}	

	c.JSON(200, posts)
}


func createPostHandler(c *gin.Context, db *sql.DB) {
	post := Post{}
	err := c.BindJSON(&post)

	if err != nil {
		c.Status(400)
		return
	}

	err = createPost(db, post)
	if err != nil {
		c.Status(500)
		return
	}

	c.Status(201)
}

func main() {

	connStr := "user=postgres dbname=postgres host=localhost password=postgres sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer db.Close()
	err = db.Ping()
	if err != nil {
		fmt.Println(err)
		return
	}


 	post := Post{
 		Title: "Coderplex Meetup",
 		URL: "https://chat.coderplex.org",
 		Domain: "chat.coderplex.org",
 		UserId: 2,
 	}
 	
 	err = createPost(db, post)
	if err != nil {
		fmt.Println(err)
		return
	} 	


	router := gin.Default()

	router.GET("/posts/:id", func (c *gin.Context) {  getPostHandler(c, db) })
	router.GET("/posts", func (c *gin.Context) {  getPostsHandler(c, db) })
	router.POST("/posts", func (c *gin.Context) {  createPostHandler(c, db) })


	err =	router.Run(":8000")
	if err != nil {
		fmt.Println(err)
		return
	}


	// user, err := getUser(db, 1)
	// if err != nil {
	// 	fmt.Println(err)
	// 	return
	// }

	// fmt.Printf("%+v\n", user)


	// bytes, err :=	json.Marshal(user)
	// if err != nil {
	// 	fmt.Println(err)
	// 	return		
	// }

	// fmt.Printf("%s\n", bytes)


	// post, err := getPost(db, 1)
	// if err != nil {
	// 	fmt.Println(err)
	// 	return
	// }

	// fmt.Println(post)
}
