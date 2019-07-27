DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name TEXT NOT NULL,

  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE posts(
  id BIGSERIAL NOT NULL PRIMARY KEY,
  url TEXT NOT NULL,
  domain TEXT NOT NULL,
  title TEXT NOT NULL,
  user_id BIGINT REFERENCES users(id),

  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE comments(
  id BIGSERIAL NOT NULL PRIMARY KEY,
  body TEXT NOT NULL,
  post_id BIGINT REFERENCES posts(id),
  user_id BIGINT REFERENCES users(id),
  parent_id BIGINT NOT NULL,
  /* FOREIGN KEY (parent_id) REFERENCES comments(id), */

  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);



insert into users (name) values ('Denis');
insert into users (name) values ('Scarff');
insert into users (name) values ('Thwaite');
insert into users (name) values ('McFadzean');
insert into users (name) values ('Humphrey');
insert into users (name) values ('Jills');
insert into users (name) values ('Ianniello');
insert into users (name) values ('Kauble');
insert into users (name) values ('Gallager');
insert into users (name) values ('MacCarrick');


insert into posts (title, url, domain, user_id) values ('Willcott', 'http://artisteer.com/odio/in/hac/habitasse.aspx', 'mtv.com', 10);
insert into posts (title, url, domain, user_id) values ('Tofanelli', 'http://posterous.com/ligula/pellentesque/ultrices/phasellus.js', 'lycos.com', 5);
insert into posts (title, url, domain, user_id) values ('Eades', 'https://about.me/elit/proin/risus.jpg', 'g.co', 9);
insert into posts (title, url, domain, user_id) values ('Eddis', 'http://berkeley.edu/vulputate/nonummy/maecenas/tincidunt/lacus/at.aspx', 'twitpic.com', 7);
insert into posts (title, url, domain, user_id) values ('Hainsworth', 'http://yahoo.co.jp/volutpat/dui.jpg', 'apache.org', 1);
insert into posts (title, url, domain, user_id) values ('Geraldi', 'https://thetimes.co.uk/augue/a/suscipit/nulla.json', 'bloglines.com', 5);
insert into posts (title, url, domain, user_id) values ('Moreside', 'https://histats.com/bibendum.jpg', 'barnesandnoble.com', 10);
insert into posts (title, url, domain, user_id) values ('Wolverson', 'https://spiegel.de/pede/ullamcorper.jpg', 'prweb.com', 7);
insert into posts (title, url, domain, user_id) values ('Duffer', 'http://sina.com.cn/consequat/dui/nec/nisi/volutpat/eleifend.jsp', 'ustream.tv', 5);
insert into posts (title, url, domain, user_id) values ('Biers', 'http://youku.com/morbi/vestibulum/velit.aspx', 'comcast.net', 4);
insert into posts (title, url, domain, user_id) values ('Gately', 'https://princeton.edu/nibh.xml', 'mac.com', 10);
insert into posts (title, url, domain, user_id) values ('Baike', 'http://acquirethisname.com/ultrices.jsp', 'about.com', 1);
insert into posts (title, url, domain, user_id) values ('Braker', 'http://prlog.org/diam/cras/pellentesque.js', 'amazon.co.jp', 7);
insert into posts (title, url, domain, user_id) values ('Benedit', 'https://umich.edu/viverra/pede/ac/diam/cras/pellentesque.json', 'dagondesign.com', 8);
insert into posts (title, url, domain, user_id) values ('Yoseloff', 'https://istockphoto.com/luctus/rutrum/nulla/tellus/in.html', 'loc.gov', 5);
insert into posts (title, url, domain, user_id) values ('Rawlcliffe', 'https://ask.com/tristique/fusce/congue/diam/id/ornare.html', 'is.gd', 4);
insert into posts (title, url, domain, user_id) values ('Bransom', 'https://smugmug.com/odio/in.jpg', 'paginegialle.it', 9);
insert into posts (title, url, domain, user_id) values ('Emby', 'https://tripadvisor.com/nulla/ultrices/aliquet.aspx', 'pinterest.com', 1);
insert into posts (title, url, domain, user_id) values ('Ungaretti', 'http://posterous.com/lacinia/nisi/venenatis/tristique/fusce.png', 'foxnews.com', 1);
insert into posts (title, url, domain, user_id) values ('Glowinski', 'https://cmu.edu/sapien/dignissim/vestibulum/vestibulum/ante/ipsum/primis.js', 'unicef.org', 2);


insert into comments (body, post_id, user_id, parent_id) values ('Etiam justo. Etiam pretium iaculis justo.', 9, 2, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 19, 4, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', 10, 10, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 16, 7, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 12, 7, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 20, 4, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 19, 1, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 1, 6, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 17, 7, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 8, 1, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 6, 10, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 19, 2, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 13, 5, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 11, 7, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 20, 4, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 7, 5, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 14, 2, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 6, 3, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 6, 3, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 17, 6, 0);
insert into comments (body, post_id, user_id, parent_id) values ('In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', 14, 8, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 12, 10, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 3, 10, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Sed ante. Vivamus tortor. Duis mattis egestas metus.', 10, 4, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 19, 9, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 20, 9, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 14, 6, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 14, 9, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 10, 9, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 15, 1, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 16, 8, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 1, 4, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 18, 2, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 17, 6, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 11, 5, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1, 5, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 2, 8, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Curabitur gravida nisi at nibh.', 16, 9, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 3, 6, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 17, 9, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 20, 10, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 11, 6, 0);
insert into comments (body, post_id, user_id, parent_id) values ('In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 20, 4, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1, 3, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 9, 3, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 1, 6, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', 7, 8, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 3, 5, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 10, 4, 0);
insert into comments (body, post_id, user_id, parent_id) values ('Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', 8, 1, 0);

