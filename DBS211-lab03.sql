//1. Create Tables
DROP TABLE l5_castings;
DROP TABLE l5_movies;
DROP TABLE l5_actors;
DROP TABLE l5_directors;

CREATE TABLE l5_movies ( 
m_id            INT         PRIMARY key, 
title           VARCHAR(35) NOT NULL, 
release_year    INT         NOT NULL, 
director        INT         NOT NULL, 
score           DECIMAL(3, 2), 
CONSTRAINT score_range CHECK (score < 5 AND score > 0 ) );

CREATE TABLE l5_actors ( 
a_id        INT         PRIMARY key, 
first_name  VARCHAR(20) NOT NULL, 
last_name   VARCHAR(30) NOT NULL );

CREATE TABLE l5_castings ( 
movie_id INT, 
actor_id INT, 
PRIMARY key(movie_id, actor_id), 
CONSTRAINT movie_casting_fk FOREIGN key (movie_id) REFERENCES l5_movies(m_id), 
CONSTRAINT actor_casting_fk FOREIGN key (actor_id) REFERENCES l5_actors(a_id) );

CREATE TABLE l5_directors ( 
director_id INT         PRIMARY key, 
first_name  VARCHAR(20) NOT NULL, 
last_name   VARCHAR(30) NOT NULL );

//2. Modify the L5_MOVIES table to create a foreign key constraint that refers to table L5_DIRECTORS.   
ALTER TABLE l5_movies 
ADD CONSTRAINT director_movie_fk FOREIGN key (director) REFERENCES l5_directors(director_id);

//3. Modify the L5_MOVIES table to create a new constraint so the uniqueness of the movie title is guaranteed.  
ALTER TABLE l5_movies 
ADD CONSTRAINT title_unique UNIQUE (title); 

//4. Insert Data
INSERT INTO l5_directors (director_id, first_name, last_name)  
VALUES (1010, 'Rob', 'Minkoff');   
INSERT INTO l5_directors (director_id, first_name, last_name)  
VALUES (1020, 'Bill', 'Condon');  
INSERT INTO l5_directors (director_id, first_name, last_name)  
VALUES (1050, 'Josh', 'Cooley');  
INSERT INTO l5_directors (director_id, first_name, last_name)  
VALUES (2010, 'Brad', 'Bird');  
INSERT INTO l5_directors (director_id, first_name, last_name)  
VALUES (3020, 'Lake', 'Bell');  

INSERT INTO l5_movies (m_id, title, release_year, director, score) 
VALUES (100, 'The Lion King' , 2019, 3020, 3.50);
INSERT INTO l5_movies (m_id, title, release_year, director, score) 
VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20); 
INSERT INTO l5_movies (m_id, title, release_year, director, score) 
VALUES (300, 'Toy Story 4', 2019, 1020, 4.50);

INSERT INTO l5_movies (m_id, title, release_year, director, score) 
VALUES (400, 'Mission Impossible', 2018, 2010, 5.00); //Error: Socre restrict < 5

INSERT INTO l5_movies (m_id, title, release_year, director, score) 
VALUES (500, 'The Secret Life of Pets' , 2016, 1010, 3.90);
   
//5. Drop Tables
DROP TABLE l5_castings;
DROP TABLE l5_movies;
DROP TABLE l5_actors;
DROP TABLE l5_directors;
