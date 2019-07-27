package main

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"
)

func main() {

	connStr := "user=postgres dbname=postgres host=localhost password=postgres sslmode=disable"
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		fmt.Println(err)
		return
	}
	// defecr fmt.Println("succesfully closed end")
	defer db.Close()
	// defer fmt.Println("succesfully closed")
	err = db.Ping()
	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println("vim-go  ")
}
