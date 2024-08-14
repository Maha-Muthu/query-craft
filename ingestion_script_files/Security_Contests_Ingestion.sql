CREATE SCHEMA Security_Contests;

CREATE TABLE Security_Contests.Hackers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Security_Contests.Submissions (
    date VARCHAR(20),
    submission_id INTEGER,
    hacker_id INTEGER REFERENCES Security_Contests.Hackers,
    score INTEGER
);

INSERT INTO Security_Contests.Hackers VALUES  (1, 'Ethan'),
(2, 'Sophia'),
(3, 'Jackson'),
(4, 'Olivia'),
(5, 'Liam'),
(6, 'Emma'),
(7, 'Noah'),
(8, 'Ava'),
(9, 'Lucas'),
(10, 'Mia');

INSERT INTO Security_Contests.Submissions VALUES ('2023-01-01', 1, 1, 95),
('2023-01-02', 2, 2, 88),
('2023-01-03', 3, 3, 90),
('2023-01-04', 4, 4, 85),
('2023-01-05', 5, 5, 92),
('2023-01-06', 6, 6, 87),
('2023-01-07', 7, 7, 93),
('2023-01-08', 8, 8, 89),
('2023-01-09', 9, 9, 96),
('2023-01-10', 10, 10, 94),
('2023-02-01', 11, 1, 85),
('2023-02-02', 12, 2, 88),
('2023-02-03', 13, 3, 91),
('2023-02-04', 14, 4, 84),
('2023-02-05', 15, 5, 90),
('2023-02-06', 16, 6, 86),
('2023-02-07', 17, 7, 87),
('2023-02-08', 18, 8, 92),
('2023-02-09', 19, 9, 94),
('2023-02-10', 20, 10, 95),
('2023-03-01', 21, 1, 89),
('2023-03-02', 22, 2, 90),
('2023-03-03', 23, 3, 88),
('2023-03-04', 24, 4, 87),
('2023-03-05', 25, 5, 92),
('2023-03-06', 26, 6, 91),
('2023-03-07', 27, 7, 85),
('2023-03-08', 28, 8, 89),
('2023-03-09', 29, 9, 94),
('2023-03-10', 30, 10, 93);
