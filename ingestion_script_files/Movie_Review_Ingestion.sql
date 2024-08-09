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
    created_on DATE,
    PRIMARY KEY (movie_id,user_id)
);


INSERT INTO movie_review.Movies VALUES (1, 'Inception'),
(2, 'The Matrix'),
(3, 'Interstellar'),
(4, 'The Dark Knight'),
(5, 'Pulp Fiction');

INSERT INTO movie_review.Users  VALUES  (1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana'),
(5, 'Eve');

INSERT INTO movie_review.Movie_rating VALUES (1, 1, 9, '2023-01-01'),
(2, 1, 8, '2023-01-05'),
(3, 2, 10, '2023-02-10'),
(4, 2, 9, '2023-02-15'),
(5, 3, 7, '2023-03-01'),
(1, 3, 9, '2023-03-05'),
(2, 4, 8, '2023-04-01'),
(3, 4, 10, '2023-04-05'),
(4, 5, 8, '2023-05-10'),
(5, 5, 9, '2023-05-15'),
(1, 4, 9, '2023-06-01'),
(3, 1, 10, '2023-06-10'),
(4, 3, 9, '2023-07-01'),
(2, 5, 7, '2023-07-05'),
(5, 2, 8, '2023-08-01');
