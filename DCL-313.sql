create database companyDB;
use companyDB;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);


INSERT INTO Employees VALUES
(1, 'Arjun', 50000),
(2, 'Divya', 60000),
(3, 'Karthik', 55000);


-- Create a User 

/*

CREATE USER 'username'@'host' IDENTIFIED BY 'password';



create user 'trainer'@'localhost' identified by "trainer@123";

-- Grant Permission ():

-- select permission only :

grant select on Employees to 'trainer'@'localhost';


-- Check User Privileges :

show grants for 'trainer'@'localhost'; 

show grants;


GRANT USAGE ON *.* TO `trainer`@`localhost`;


GRANT SELECT ON `companydb`.`employees` TO `trainer`@`localhost`


*/





























