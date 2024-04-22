-- 1. Create the departments table (if it doesn't exist)
CREATE TABLE IF NOT EXISTS departments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Insert department data 
INSERT INTO departments (name)
VALUES
('Engineering'),  
('Sales'),  
('Marketing'),  
('HR');

-- 3. Create the Employee table (if it doesn't exist)
ALTER TABLE Employee
ADD COLUMN employee_salary DECIMAL(10,2) NOT NULL;
CREATE TABLE IF NOT EXISTS Employee (
  employee_id SERIAL PRIMARY KEY,
  employee_name VARCHAR(255) NOT NULL,
  employee_salary DECIMAL(10,2) NOT NULL,
  department_id INT,
  hire_date DATE
);

-- Insert into employee data
INSERT INTO Employee (employee_name, employee_salary, department_id, hire_date)
VALUES
('Alice', 60000.00, 1, '2020-01-01'),  
('Bob', 70000.00, 1, '2020-01-15'),  
('Charlie', 80000.00, 2, '2020-02-01'),  
('Dave', 90000.00, 3, '2020-02-15'),
('Eve', 100000.00, 4, '2020-03-01');

-- 5. Query to get department with highest salary
SELECT d.name AS department_name, e.employee_name, e.employee_salary
FROM departments d
JOIN Employee e ON d.id = e.department_id
JOIN (
    SELECT department_id, MAX(employee_salary) AS max_salary
    FROM Employee
    GROUP BY department_id
) emax ON e.department_id = emax.department_id AND e.employee_salary = emax.max_salary;

