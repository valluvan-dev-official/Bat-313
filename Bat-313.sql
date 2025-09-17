-- comments : 

-- inline comments : --
    
-- Multiline Comments : 
/*
create database for storing datas
*/

-- DDL -> Data Definition Language

/*
syntax:
	
    create database db_name;
*/


create database Bat_313;

-- Database use panna comment

/*
Syntax :

	use db_name
*/ 

use Bat_313;

-- To view Available Databases :

show databases; 


-- Table create panna syntax :

/*

CREATE TABLE table_name (
column1 datatype constraints,
column2 datatype constraints,
...
);

*/ 

create table students(
Rollno int primary key,
Name varchar(30),
Address varchar(200)
);

describe students;

show schemas;


-- Alter Table :

-- Add a new column :

alter table students add Class varchar(50) not null;

-- Modify datatype 

alter table students modify Class Char(20) not null;

-- Add Constraints :

alter table students modify Address varchar(200) not null;

-- Rename a Column :

alter table students rename column Address to Location;

-- Drop Column :

alter table Students Drop Class;

-- Truncate Table :

truncate table students;


-- ========= Data Manipulation Language ============

-- INSERT : - Data add panrathu

/* 
syntax :

INSERT INTO tablename (column1,column2,...) VALUES(value1,value2,...);

	- columns & values count must be same
*/

insert into students (Rollno,name,Location) values(101,"Hari",'Chennai');

insert into Students (Rollno,Location) values(102,"Madurai");

insert into students values(103,"Arun","Nellai");

insert into students values(104,"Varun","Nellai"),(105,"Santhosh","Thanjavur"),(106,"sai","chennai");


-- 2. Update :

/*
update tablename set columnname = newvalue where condition;

*/


update students set Location = "Chennai" where name = "varun";


/*

delete from tablename where condition

*/

delete from students where Rollno = 105;

-- Delete All Records :

delete from students;

-- DQL COMMANDS : --> SELECT 

/*

there are two Types :
	
    1. Simple select
    2. Complex select

*/

-- Simple Select :

-- Retrive all rows and Columns :

-- Syntax : select * from tablename

select * from students;


-- selecting specific columns :

-- Syntax : select column1,column2 from tablename;

select Name,Location from students;


-- using Where Condition :

select * from Students where name = "sai";




create table Employees(
emp_id int primary key,
emp_name varchar(30),
job_desc varchar(50),
salary int 
); 


INSERT INTO Employees VALUES(1,'Ram','ADMIN',1000000);
INSERT INTO Employees VALUES(2,'Harini','MANAGER',2500000);
INSERT INTO Employees VALUES(3,'George','SALES',2000000);
INSERT INTO Employees VALUES(4,'Ramya','SALES',1300000);
INSERT INTO Employees VALUES(5,'Meena','HR',2000000);
INSERT INTO Employees VALUES(6,'Ashok','MANAGER',3000000);
INSERT INTO Employees VALUES(7,'Abdul','HR',2000000);
INSERT INTO Employees VALUES(8,'Ramya','ENGINEER',1000000);
INSERT INTO Employees VALUES(9,'Raghu','CEO',8000000);
INSERT INTO Employees VALUES(10,'Arvind','MANAGER',2800000);
INSERT INTO Employees VALUES(11,'Akshay','ENGINEER',1000000);
INSERT INTO Employees VALUES(12,'John','ADMIN',2200000);
INSERT INTO Employees VALUES(13,'Abinaya','ENGINEER',2100000);
INSERT INTO Employees(emp_id,emp_name,job_desc)VALUES(14,'Abi','ENGINEER');


select * from Employees;

select emp_name,job_desc from Employees;

/*
WHERE :

	- The WHERE clause is used to filter records;
    
    - it is used to extract only those records that fulfill a specified condition.

SYNTAX :

	- select column1,column2 ... from table_name WHERE condition;
*/

select emp_name,job_desc from Employees where job_desc = "ENGINEER";

select * from Employees where salary >= 2000000;



/*
AND
OR
NOT

AND :
	the and operator displays a record if all the conditions separated by and are TRUE.
    
syntax :

	SELECT COLUMN1,COLUMN2 ... FROM TABLE_NAME WHERE CONDITION AND CONDITION AND CONDITION;

OR :
	the or operator displays a record if any of the conditions separated by OR is TRUE.
    
syntax :

	select column1,column2 ... from table_name where condition1 or condition2 or condition3;
    
NOT :
	the not operator displays a record if the condition is not TRUE.

syntax :
	select column1,column2... from table_name where not conditon;
*/

-- AND 

select * from employees where job_desc="sales" and emp_name = "ramya";

select Emp_name from Employees where salary >= 1500000 and job_desc = "Manager" ;


-- OR :

select * from Employees where emp_id = 5 or salary = 2300000 or emp_name = "abi" or job_desc = "admin";

select * from Employees where Job_desc = "Engineer" or job_desc = "Manager"; 

-- NOT 

select * from Employees where not emp_name ="ramya";

select * from employees where not salary <= 3000000;


-- Combined Operators :

select * from Employees where emp_name="ramya" and (salary =1000000 or salary=1300000) and not job_desc= "Engineer" ;

/*
ORDER BY :
	the order by keyword is used to sort the result set in ascending or descending order.
    
syntax :

	select column1,column2... from table_name order by coumn_name,... asc|desc;
*/

select * from Employees order by salary desc;

select * from Employees order by Job_desc;

select * from employees where job_desc = "Engineer" order by salary;


/*
NULL VALUES :
		- a field with a null value is field with no value
	is null
    is not null
    
syntax :

	- select column_name from table_name where column_name is null;
    
*/

select emp_name from employees where salary is null;


/*
limit :
	
    The limit clause is used to specify the number of records to return
    
syntax :

 - select column_names from table_name wher conditon limit number;
*/

select * from Employees limit 5;

select * from Employees limit 7 offset 3 ;

select * from Employees where salary>=2000000 limit 3 offset 4;


/*
min() and max() : - aggregate functions

MIN() :
	- min() function returns the smallest value of selected column.

MAX() :
	- max() function returns the largest value of the selected column.

SYNTAX :
	- select min(column_name) from table_name where condition;

*/

select min(salary) from Employees;


select max(salary) from Employees;

/*
COUNT(), AVG(), SUM() :  aggregate functions

COUNT() :

	- count() function returns the number of rows that matches a specified criterion.
    - ignores null values

syntax :

	select count(column_name) from table_name where condition;
    
AVG() :

	 -avg() function returns the average value of a numeric column. 
syntax :

	select avg(column_name) from table_name where condition;
    
SUM() :

	- sum() function returns the total sum of a numeric column.
	- ignores null values

syntax :

	select sum(column_name) from table_name where condition;
    
*/

select count(salary) from Employees where job_desc= "Engineer";

select avg(salary) from employees where job_desc = "Manager";

select sum(salary) from employees where job_desc = "Sales";


/* group by 

GROUP BY statement groups rows that have the same values

GROUP BY statement is often used with aggregate functions

syntax :

	SELECT column_name(s)
	FROM table_name
	WHERE condition
	GROUP BY column_name(s)
*/

select job_desc , count(emp_name) from employees group by job_desc;

select job_desc,min(salary) from employees group by job_desc;


select job_desc , count(emp_id) as Total_employees , count(salary) as No_of_Salaries from employees group by job_desc; 



/* using between 

values can be numbers, text, or dates

BETWEEN operator selects values within a given range.
BETWEEN operator is inclusive: begin and end values are included.

*/

select * from Employees where salary between 1000000 and 2500000;

select emp_name,job_desc,salary from employees where emp_id between 5 and 13;


select emp_name,job_desc,salary from employees where job_desc between "Manager" and "sales";



/*like and wildcards

	 - LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
     
	wildcard character is used to substitute one or more characters in a string.

	There are two wildcards often used in conjunction with the LIKE operator:

	1. The percent sign (%) represents zero, one, or multiple characters
	2. The underscore sign (_) represents one, single character
    
    admin --->   a%n : an,asn,asssn
    
    abi  --> a_i : abi
						
    
    
syntax :
	SELECT column1, column2, ...
	FROM table_name
	WHERE columnN LIKE pattern;
    
*/

select * from employees where job_desc like "h_";

select * from employees where job_desc like "%n%";

 /* select distinct

	SELECT DISTINCT statement is used to return only distinct (different) values.
*/


select distinct job_desc from employees;  
 
 
 
  /* 
string functions

*/

-- lcase & ucase :
 
 select ucase(emp_name) as Name, lcase(job_desc) as Job_Role from Employees;
 
 
 -- char_length : 
 
 select job_desc,char_length(job_desc) as letter_Count from employees group by job_desc ;
 
 
 -- concat :
 
 select emp_name , concat(salary,".$") as Salary from employees;
 
 
 -- format :
 
 select emp_name , format(salary,0) from employees;
 
 
 -- left & right:
 
select emp_name ,right(job_desc,3) as Coolie from employees;
 
 
/* DATE

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
YEAR - format YYYY or YY

 */


alter table employees add column Joining_date Date;


update employees set Joining_date = "2025-02-10";

update employees set Joining_Date = "2024-09-10" where job_desc = "manager";

select * from employees;

update employees set Joining_date = "2024-08-04" where job_desc = "ceo" or job_desc = "Admin"; 

-- Date Functions :  

select now();

select date(now());

select curdate();

select sysdate();

-- year ,month ,day

select year("2025-10-06");

select month(now());

select day(now());

-- dayname , motnh name :

select dayname(now()); 

select monthname(now()); 

/*

dayofweek()
dayofmonth()
dayofyear()
week()
quarter()

*/

select date_format(curdate(),"%d-%m-%Y") as date;

select datediff(curdate(),"2025-02-21") as date;

select date_format(now(),'%W , %b %Y');

/*
=======  Date Specifiers =======

| Code   | Meaning                              | Example (`2025-09-10`) |
| ------ | ------------------------------------ | ---------------------- |
| **%Y** | Year (4-digit)                       | `2025`                 |
| **%y** | Year (2-digit)                       | `25`                   |
| **%M** | Full month name                      | `September`            |
| **%b** | Abbreviated month                    | `Sep`                  |
| **%m** | Month (01–12)                        | `09`                   |
| **%c** | Month (1–12, no leading zero)        | `9`                    |
| **%d** | Day of month (01–31)                 | `10`                   |
| **%e** | Day of month (1–31, no leading zero) | `10`                   |
| **%j** | Day of year (001–366)                | `253`                  |
| **%W** | Full weekday name                    | `Wednesday`            |
| **%a** | Abbreviated weekday                  | `Wed`                  |
| **%w** | Day of week (0=Sunday, 6=Saturday)   | `3`                    |


========== Time Specifiers ==========

| Code            | Meaning                      | Example (`15:45:23`) |
| --------------- | ---------------------------- | -------------------- |
| **%H**          | Hour (00–23)                 | `15`                 |
| **%k**          | Hour (0–23, no leading zero) | `15`                 |
| **%h** / **%I** | Hour (01–12)                 | `03`                 |
| **%l**          | Hour (1–12, no leading zero) | `3`                  |
| **%i**          | Minutes (00–59)              | `45`                 |
| **%s**          | Seconds (00–59)              | `23`                 |
| **%f**          | Microseconds (000000–999999) | `123456`             |
| **%p**          | AM or PM                     | `PM`                 |


=========== Combined Specifiers =============


| Code   | Meaning                                   | Example       |
| ------ | ----------------------------------------- | ------------- |
| **%r** | Time in 12-hour format (hh\:mm\:ss AM/PM) | `03:45:23 PM` |
| **%T** | Time in 24-hour format (hh\:mm\:ss)       | `15:45:23`    |
| **%D** | Day of month with suffix                  | `10th`        |
| **%U** | Week number (Sunday as first day)         | `37`          |
| **%u** | Week number (Monday as first day)         | `37`          |
| **%V** | Week number with mode (ISO-8601 standard) | `37`          |
| **%X** | Year for the ISO week (4-digit)           | `2025`        |
| **%x** | Year for the ISO week (2-digit)           | `25`          |

*/


/*
HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

Syntax :
	SELECT column_name(s)
	FROM table_name
	WHERE condition
	GROUP BY column_name(s)
	HAVING condition;
    
where filter rows
having filter groups
*/

select job_desc, count(emp_id) from employees group by job_desc having count(emp_id) >= 2;

select job_desc , count(salary) from employees where salary >= 1300000 group by job_desc having count(emp_id) >= 2 ;

select job_desc ,sum(salary) as Total_Salary from employees group by job_desc having sum(salary) >= 3500000 and count(*) >= 1;



-- Operators :

/*
	Operators are symbols or keywords used to perform operations on values
    
    campare values
    perform calculations
    
    1. Arithmentic Operators
    2. Comparison Operators
    3. Logical Operators
    4. Bitwise Operators
    5. Assignment Operators
*/

-- Arithmetic operators :

/*
1. + - Addition       
2. - - subtraction
3. * - Multiplication
4. / - Division
5. % - Modulus
*/


create table Groceries (
product_id int primary key,
product_name varchar(50),
price int,
quantity int);


insert into Groceries values(101,"Milk",100,10),
(102,"Soada",25,20),
(103,"Rice",150,50),
(104,"Oil",250,5);


select * from groceries;

select product_name, price, quantity, (price * quantity) as Total_price from groceries;



-- Comparison Operator :

/*
1. = - Equal to
2. != or <> -Not equal to
3. > - Greater than
4. < - Less than
5. >= - Greater than or equal to
6. <= - Less than or equal to

*/

select product_name from groceries where price >= 100;


-- Logical Operator :

/*
1. And 
2. Or
3. Not
*/


-- Bitwise Operator :

/*
1. & - Bitwise And
2. | - Bitwise Or
3. ~ - Bitwise Not
4. ^ - Bitwise XOR
5. << - left shift
6. >> - right shift

usecase : low-level binary operations
*/


/*
use case : 
		assign values to variables
        
1. =   - equal  
2. :=  - colon equal
*/

set @balance = 5000;

set @deposit := 13000;

set @balance = @balance + @deposit;


select @balance;



-- Constraints :

-- create department table :

create table Department (
dept_id int primary key,
dept_name varchar(50) unique not null
);


insert into Department values(1,"HR"),(2,"IT"),(3,"Finance");

insert into Department values(4,"Marketing");

select * from department;

create table employee (
emp_id int primary key auto_increment,
emp_name varchar(50) NOT NULL,
EMAIL varchar(100) UNIQUE,
SALARY decimal(10,2) CHECK(SALARY >= 10000),
STATUS varchar(20) DEFAULT 'ACTIVE',
DEPT_ID INT,
foreign key (DEPT_ID) references DEPARTMENT(DEPT_ID)
);

INSERT INTO employee (emp_id,emp_name,email,salary,dept_id) VALUES(101, "RAVI","ravi@gmail.com",50000,1);

INSERT INTO employee (emp_name,email,salary,dept_id) VALUES ("PRIYA","priya@gmail.com",60000,2),
("karthik","karthik@gmail.com",70000,3);


insert into employee (emp_id,emp_name,email,salary,dept_id) values(
104, "Meena", "meena@gmail.com",55000,2
);

select * from Employee;


-- NOT NULL : 

insert into employee(emp_id,emp_name,email,salary,dept_id) values(
105,NULL, "abc@gmail.com",4000,1
);

-- UNIQUE :

insert into employee(emp_id,emp_name,email,salary,dept_id) values(
106,"ABI","ravi@gmail.com",40000,2
);

-- CHECK :

insert into employee (emp_id,emp_name,email,salary,dept_id) values(
107,"suresh","suresh@gmail.com",9000,2
);

-- FORIEGN KEY :

insert into	employee(emp_id,emp_name,email,salary,dept_id) values(
108,"ganesh","ganesh@gmail.com",35000,10
);


select * from employee;


-- Subquery :
/*

	- it is enclosed in parentheses ()
    - it is executed first, and the result passed to the outer query.
    
1. Single - row subquery :
	retunrs one value [one row,one column]
    where
    
2. Multi - row subquery :
	reurns multiple values [one column , many rows]
    IN , ANY , ALL
    
3. Multi - column subquery :
	return multiple columns [one row, many columns]
    where , from
    
4. Correlated subquery :
	subquery depends on the outer query
    EXISTS
*/


create table departments (
dept_id int primary key,
dept_name varchar(30)
);

create table studentss (
std_id int primary key,
name varchar(30),
marks int,
dept_id int
);


insert into departments values(101,"CSE"),
(102,"ECE"),
(103,"MECH");

insert into departments values(104,"civil");

insert into studentss values(1,"Arun",85,101),
(2,"Bala",90,102),
(3,"Charu",95,101),
(4,"David",80,103);

-- Subquery in Select Statement : Find Students with Highest Marks 

select name,marks from studentss where marks = (select max(marks) from studentss);

-- Subquery in Where clause : find students from the "CSE" Department

select name from studentss where dept_id = (select dept_id from departments where dept_name = "CSE");


-- Subquery with IN : find the students in the "CSE" or "ECE" departments

select name from studentss where dept_id in (select dept_id from departments where dept_name in("CSE","ECE"));


-- Subquery with ANY : Find students with marks more than student in MECH 

select name, marks from studentss
where marks > ANY (select marks from studentss where dept_id = 103 );


-- Correlated Subquery [Exists] : Find departments with atleast one Student

select dept_name from departments as D
where EXISTS (select * from studentss as S where S.dept_id = D.dept_id);



-- JOINS 

/*
    a join is like combining two lists (tables) based on something they have in common(a common column). 

	Types of joins :
    
		1. INNER JOIN
        2. LEFT JOIN
        3. RIGHT JOIN
        4. FULL OUTER JOIN
        5. CROSS JOIN
*/


-- Customr table :

create table Customers (
ID int primary key, 
Name varchar(50));

-- Order Table :

create table Orders (
order_id int primary key,
customer_id int,
product varchar(50)
);

-- Values for customers table :

insert into customers values(1, "kala"),(2,"abi"),(3,"priya");

-- Values for Orders table :

insert into orders values(101 , 1 , "Laptop"),
(102,2,"Phone"),
(103,1,"tablet"),
(104,4,"headphones");

-- INNER JOIN : 

/*
 - Returns only the rows that having macthing values in both tables
 
When you want to see only the customers who have placed orders.
*/

select customers.Name,orders.product 
from customers 
inner join orders on customers.ID = orders.customer_id; 



-- LEFT JOIN :

/*

- Returns all rows from the left table and the matching rows from the right table.
- if there is no match, NULL values are returned for columns from the right table.

when you want to see all customers , even if they haven't place any orders. 

*/

select customers.Name,orders.Product
from customers
left Join orders on customers.ID = orders.customer_id;



-- RIGHT JOIN :

/*
- Returns all rows from the right table and the matching rows from the left table.
- if there is no match, NULL values are returned for columns from the left table.

when you want to see all orders, even if there is no matching customers.
*/


select customers.Name,orders.product
from customers
right join orders on customers.ID = orders.customer_id;



/*
 - Returns all rows when there is a match in either the left or right table.
 - if there is no match, NULL values are returned for columns  from the table without a match.
  
 when you want to see all customers and all orders, even if there is no match.
*/



select customers.Name,orders.Product
from customers
left Join orders on customers.ID = orders.customer_id
union
select customers.Name,orders.product
from customers
right join orders on customers.ID = orders.customer_id;



-- CROSS JOIN :

/*

- Return the cartesian product of the two tables
- all possible combinations of rows

when you want to see every customee paried with evry order.
 
*/

select customers.Name,orders.product
from customers
cross join 
orders;


-- Inner Join New Example :


select customers.ID,customers.Name,orders.product,orders.order_id
from customers 
inner join orders on customers.ID = orders.customer_id; 


-- Self Join 

/*
Table Name - Employees

| emp\_id | emp\_name | manager\_id |
| ------- | --------- | ----------- |
| 1       | Ravi      | NULL        |
| 2       | Arjun     | 1           |
| 3       | Divya     | 1           |
| 4       | Meena     | 2           |

*/


create Table Bt_Employees(
emp_id int primary key,
emp_name varchar(50) not null,
manager_id int null
);

insert into Bt_employees values(1, 'Ravi', NULL),
(2, 'Arjun', 1),
(3, 'Divya', 1),
(4, 'Meena', 2),
(5, 'Karthik', 2),
(6, 'Sanjay', 3);


select * from Bt_employees;

select E.emp_id, E.emp_name as Employee , M.emp_name as Manger
from Bt_employees as E
Left Join Bt_Employees as M on E.manager_id = M.emp_id;



-- DCL COMMANDS
/*
SELECT
INSERT
UPDATE
DELETE
ALL
*/

-- CREATE USER :

create user "new_user"@'localhost' identified by "password123";

-- GRANT PREVILEGES :

grant select on bat_313.employees to "new_user"@"localhost";

-- Grant One More Permission :

grant insert on bat_313.employees to "new_user"@"localhost";


-- OverAll Permissions :

grant All privileges on bat_313.employees to "new_user"@"localhost"; 


-- REVOKE PERMISSIONS :

revoke insert on bat_313.employees from "new_user"@"localhost";


SHOW grants FOR "new_user"@"localhost";



-- CREATE USER 'admin'@'192.168.1.100' IDENTIFIED BY 'admin123';

-- CREATE USER 'report'@'mycompany.com' IDENTIFIED BY 'report123';

/*
+----------+-----------+
| user     | host      |
+----------+-----------+
| trainer  | localhost |
| student  | %         |
| admin    | 192.168.1.100 |
+----------+-----------+

*/


















