-- creating databse
CREATE Database movie_database;
-- connecting to databse
\c movie_database
-- creating table inside the database
CREATE TABLE movies (
	id serial4 PRIMARY KEY,
	name VARCHAR(50),
	image_url VARCHAR(1000),
  year VARCHAR(5),
  director VARCHAR(50),
  actors VARCHAR(1000)
);
ALTER TABLE movies ADD COLUMN imdb_id VARCHAR(20);

CREATE TABLE users(
	id serial4 PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	password_digest VARCHAR(500) NOT NULL
);
