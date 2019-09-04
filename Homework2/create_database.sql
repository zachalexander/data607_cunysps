CREATE DATABASE `movie_ratings`;

CREATE TABLE friends (  
	friend_id INT PRIMARY KEY,  
	first_name VARCHAR(255),     
	last_name VARCHAR(255) 
);

CREATE TABLE movies (  
	movie_id INT PRIMARY KEY,     
	movie_name VARCHAR(255),     
	year INT 
);

CREATE TABLE ratings (  
	friend_id INT,     
	movie_id INT,  
	rating INT 
);

INSERT INTO friends (friend_id, first_name, last_name) VALUES  
(1, "Jeff", "Blanco"), 
(2, "Adrian", "Hamilton"), 
(3, "Charles", "Benedict"), 
(4, "Kathy", "Thompson"), 
(5, "Melissa", "Smith"), 
(6, "Jasper", "Cunningham"), 
(7, "Katherine", "Williams"), 
(8, "Ronald", "Beavers");

INSERT INTO movies (movie_id, movie_name, year) VALUES  
(1, "The Perfect Date", 2019), 
(2, "Murder Mystery", 2019), 
(3, "Dogtooth", 2019), 
(4, "Forever My Girl", 2018), 
(5, "Fifty Shades Freed", 2018), 
(6, "Truth or Dare", 2018);

INSERT INTO ratings (friend_id, movie_id, rating) VALUES  
(1, 1, 3), 
(1, 2, 1), 
(1, 3, 2), 
(1, 4, 2), 
(1, 5, 5), 
(1, 6, 4), 
(2, 1, 5), 
(2, 2, 5), 
(2, 3, 2), 
(2, 4, 1), 
(2, 5, 3), 
(2, 6, 1), 
(3, 1, 1), 
(3, 2, 2), 
(3, 3, 1), 
(3, 4, 3), 
(3, 5, 1), 
(3, 6, 2), 
(4, 1, 2), 
(4, 2, 3), 
(4, 3, 3), 
(4, 4, 5), 
(4, 5, 4), 
(4, 6, 4), 
(5, 1, 1), 
(5, 2, 1), 
(5, 3, 1), 
(5, 4, 1), 
(5, 5, 1), 
(5, 6, 1), 
(6, 1, 2), 
(6, 2, 1), 
(6, 3, 4), 
(6, 4, 3), 
(6, 5, 5), 
(6, 6, 5), 
(7, 1, 4), 
(7, 2, 2), 
(7, 3, 1), 
(7, 4, 4), 
(7, 5, 3), 
(7, 6, 2), 
(8, 1, 2), 
(8, 2, 5), 
(8, 3, 3), 
(8, 4, 4), 
(8, 5, 4), 
(8, 6, 1);
