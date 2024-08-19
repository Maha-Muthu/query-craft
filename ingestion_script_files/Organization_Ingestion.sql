CREATE SCHEMA organization;

CREATE TABLE organization.department (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE organization.employee (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES organization.department
);

INSERT INTO organization.department VALUES (1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

INSERT INTO organization.employee VALUES (1, 'Alice', 60000, 1),
(2, 'Bob', 70000, 2),
(3, 'Charlie', 80000, 3),
(4, 'Diana', 75000, 4),
(5, 'Eve', 50000, 5),
(6, 'Frank', 65000, 1),
(7, 'Grace', 72000, 2),
(8, 'Hank', 85000, 3),
(9, 'Ivy', 78000, 4),
(10, 'Jack', 52000, 5),
(11, 'Kate', 61000, 1),
(12, 'Leo', 73000, 2),
(13, 'Mia', 88000, 3),
(14, 'Nick', 79000, 4),
(15, 'Olive', 53000, 5);
