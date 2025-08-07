-- Step 1: Create Database and Use it
CREATE DATABASE IF NOT EXISTS try;
USE try;

-- Step 2: Create employees table
CREATE TABLE employees (
    Employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE
);

-- Step 3: Create employee_audit table
CREATE TABLE employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE,
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 4: Insert sample data into employees table
INSERT INTO employees (name, position, salary, hire_date) VALUES
('John Doe', 'Software Engineer', 80000.00, '2022-01-15'),
('Jane Smith', 'Project Manager', 90000.00, '2021-05-22'),
('Alice Johnson', 'UX Designer', 75000.00, '2023-03-01');

-- Step 5: Create Trigger
DELIMITER $$

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, name, position, salary, hire_date)
    VALUES (NEW.Employee_id, NEW.name, NEW.position, NEW.salary, NEW.hire_date);
END$$

DELIMITER ;

-- Step 6: Create Stored Procedure
DELIMITER $$

CREATE PROCEDURE AddNewEmployee (
    IN p_name VARCHAR(100),
    IN p_position VARCHAR(100),
    IN p_salary DECIMAL(10,2),
    IN p_hire_date DATE
)
BEGIN
    INSERT INTO employees (name, position, salary, hire_date)
    VALUES (p_name, p_position, p_salary, p_hire_date);
END$$

DELIMITER ;

-- Step 7: Example call to procedure (optional for testing)
CALL AddNewEmployee('Michael Scott', 'Regional Manager', 95000.00, '2025-08-06');