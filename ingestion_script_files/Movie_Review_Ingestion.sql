CREATE SCHEMA movie_review;

CREATE TABLE movie_review.Movies (
    id INTEGER PRIMARY KEY,
    title VARCHAR(50)
);

CREATE TABLE movie_review.Users (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE movie_review.Movie_Rating (
    movie_id INTEGER,
    user_id INTEGER,
    rating INTEGER,
    PRIMARY KEY (movie_id,user_id)
);


INSERT INTO movie_review.Movies VALUES (1, 'Inception'),
(2, 'The Matrix'),
(7, 'Interstellar'),
(4, 'The Dark Knight'),
(5, 'Pulp Fiction'),
(6, 'Gladiator'),
(3, 'Avatar');

INSERT INTO movie_review.Users  VALUES  (1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana'),
(6, 'Eve'),
(5, 'James'),
(7, 'Isabella');

INSERT INTO movie_review.Movie_rating VALUES (1, 1, 9),
(2, 1, 8),
(7, 2, 10),
(4, 2, 9),
(5, 3, 7),
(1, 3, 9),
(2, 4, 8),
(7, 4, 10),
(4, 6, 8),
(5, 6, 9),
(1, 4, 9),
(7, 1, 10),
(4, 3, 9),
(2, 6, 7),
(5, 2, 8);
