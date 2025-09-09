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
 
 
 
 
 
 
 
 
 
 
 




