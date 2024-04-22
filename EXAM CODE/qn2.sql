-- 1. Create the Employee table (if it doesn't exist)
CREATE TABLE IF NOT EXISTS Employee (
  employee_id INTEGER PRIMARY KEY,
  employee_name VARCHAR(255) NOT NULL,
  employee_age VARCHAR(255) NOT NULL,
  employee_address VARCHAR(255)
);

-- 2. Insert employee data (assuming the table is now created)
INSERT INTO Employee (employee_id, employee_name, employee_age, employee_address)
VALUES
  (1001, 'Rohan', '26', 'Delhi'),  
  (1002, 'Ankit', '30', 'Gurgaon'),
  (1003, 'Gaurav', '27', 'Mumbai'),
  (1004, 'Raja', '32', 'Nagpur')
ON CONFLICT (employee_id) DO UPDATE
SET
  employee_name = EXCLUDED.employee_name,
  employee_age = EXCLUDED.employee_age,
  employee_address = EXCLUDED.employee_address;

-- 3. Select employee with employee_id = 1004
SELECT * FROM Employee WHERE employee_id = 1004;

SELECT * FROM Employee;

SELECT * FROM Employee WHERE employee_name LIKE 'R%';

SELECT employee_id AS id, employee_age AS age, employee_name AS name
FROM Employee
ORDER BY employee_age ASC, employee_name DESC;

SELECT DISTINCT employee_address
SELECT FROM Employee;


OTHER QUESTIONS:

SERIES TABLE
CREATE TABLE Series (
  series_id SERIAL PRIMARY KEY,
  series_name VARCHAR(255) NOT NULL,
  description TEXT
);

EPISODE TABLE
CREATE TABLE Episode (
  episode_id SERIAL PRIMARY KEY,
  series_id INTEGER REFERENCES Series(series_id),
  episode_number INTEGER,
  director_id INTEGER REFERENCES Director(director_id)
);


ACTOR TABLE
CREATE TABLE Actor (
  actor_id SERIAL PRIMARY KEY,
  actor_name VARCHAR(255) NOT NULL
);
PARTICIPATION ..MANY TO MANY
CREATE TABLE Participation (
  participation_id SERIAL PRIMARY KEY,
  actor_id INTEGER REFERENCES Actor(actor_id),
  episode_id INTEGER REFERENCES Episode(episode_id)
);



b)
Primary Key (PK):
 A primary key is a column or a set of columns that uniquely identifies each record in a table. 
It must be unique for each row and cannot contain NULL values.

Foreign Key (FK):
 A foreign key is a column or a set of columns in one table that points to the primary key in another table. 
It establishes a relationship between two tables.
