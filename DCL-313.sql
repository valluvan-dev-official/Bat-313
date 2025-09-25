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









-- =====================================================


CREATE TABLE ATM_Accounts (
    acc_no INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);


INSERT INTO ATM_Accounts VALUES
(101, 'Hari', 5000),
(102, 'Vijay', 3000),
(103, 'Abisheck', 7000);


DELIMITER $$

CREATE PROCEDURE withdrawmoney(
	IN P_acc_no INT,
    IN P_amount int
    
Begin 
	Declare current_balance int 
    
    select balance into current_balance from atm_accounts where acc_no = p_acc_no
    
    if current_balance >= p_amount Then
		update ATM_Accounts
		Set balance = balance - p_amount
		where acc_no = p_acc_no;
	else
		signal sqlstate '45000'
        set message_text = "Insufficient Balance";
	end if;
end //

delimiter ;
		
)



























