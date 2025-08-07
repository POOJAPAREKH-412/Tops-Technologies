CREATE TABLE IF NOT EXISTS Company (
    CompanyID INT AUTO_INCREMENT PRIMARY KEY, 
    CompanyName VARCHAR(45), 
    Street VARCHAR(45), 
    City VARCHAR(45), 
    State VARCHAR(2), 
    Zip VARCHAR(10)
);

-- 1.) Create Contact Table
CREATE TABLE IF NOT EXISTS Contact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45), 
    City VARCHAR(45), 
    State VARCHAR(2), 
    Zip VARCHAR(10),
    IsMain Boolean,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-- 2.) Create Employee Table
CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

-- 3.) Create ContactEmployee Table
CREATE TABLE IF NOT EXISTS ContactEmployee (
    ContactEmployeeId INT AUTO_INCREMENT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- 4.) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800
UPDATE Employee SET Phone = '215-555-8800' WHERE FirstName = 'Lesley' AND LastName = 'Bland';

-- 5.) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters”
UPDATE Company SET CompanyName = 'Urban Outfitters' WHERE CompanyName = 'Urban Outfitters, Inc.';

-- 6.)  In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement).
DELETE FROM ContactEmployee WHERE ContactEmployeeID = 1;

-- 7.) SELECT DISTINCT E.FirstName, E.LastName
FROM Employee E JOIN ContactEmployee CE ON E.EmployeeID = CE.EmployeeID JOIN Contact C ON CE.ContactID = C.ContactID JOIN Company Co ON C.CompanyID = Co.CompanyID WHERE Co.CompanyName = 'Toll Brothers';

-- 8.) What is the significance of “%” and “_” operators in the LIKE statement?
--> “%” is used to match zero or more no. of characters while “_” is used to match only single character.


-- 9.) Explain normalization in the context of databases.
--> Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity.
-- It involves dividing large tables into smaller, related tables and defining relationships between them.
-- The main goal of normalization is to eliminate duplicate data, ensure logical data storage, and minimize anomalies during insert, update, or delete operations.
-- Common normal forms include 1NF (atomic values), 2NF (no partial dependencies), and 3NF (no transitive dependencies), each ensuring better data structure and consistency.


-- 10.) What does a join in MySQL mean?
--> JOIN in MySQL combines rows from two or more tables based on a related column(Foreign Key).


-- 11.) What do you understand about DDL, DCL, and DML in MySQL?
--> DDL :- Data Definition Language
-- Used to define and modify the structure of database objects such as tables, schemas, and indexes.
-- Examples: CREATE, ALTER, DROP, RENAME, TRUNCATE

-- DML :- Data Manipulation Language
-- Used to manipulate data stored in the database tables.
-- Examples: INSERT, UPDATE, DELETE, SELECT

-- DCL :– Data Control Language
-- Used to control access and permissions on database objects.
-- Examples: GRANT, REVOKE


-- 12.) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
--> The JOIN clause in MySQL is used to combine rows from two or more tables based on a related column, usually a foreign key.
-- It allows you to retrieve meaningful information from multiple tables in a single query by defining how the tables are related.
-- The most common types of joins are:
-- INNER JOIN, which returns only the matching rows from both tables,
-- LEFT JOIN, which returns all rows from the left table and matching rows from the right,
-- RIGHT JOIN, which returns all rows from the right table and matching ones from the left,
-- and FULL JOIN (not directly supported in MySQL but can be simulated), which returns all rows when there is a match in either table.