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
  actors VARCHAR(300)
);
ALTER TABLE movies ADD COLUMN imdb_id VARCHAR(20);
