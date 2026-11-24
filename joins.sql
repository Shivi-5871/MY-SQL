Drop database if exists join_database;
CREATE DATABASE join_database;
USE join_database;

-- create two tables table1 and table2
CREATE TABLE table1 (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    phone_number VARCHAR(15)
);

CREATE TABLE table2 (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10, 2),
    address VARCHAR(100)
);

-- Insert Data into the Tables

-- Insert data into table1
INSERT INTO table1 (id, first_name, last_name, city, phone_number) VALUES
(1, 'Rahul', 'Sharma', 'Delhi', '9876543210'),
(2, 'Priya', 'Verma', 'Mumbai', '8765432109'),
(3, 'Amit', 'Patel', 'Ahmedabad', '7654321098'),
(4, 'Anjali', 'Singh', 'Kolkata', '6543210987'),
(5, 'Vijay', 'Kumar', 'Bangalore', '5432109876');

-- Insert data into table2
INSERT INTO table2 (id, first_name, last_name, city, salary, address) VALUES
(3, 'Amit', 'Patel', 'Ahmedabad', 75000.00, 'Street 21, Ahmedabad, Gujarat'),
(4, 'Anjali', 'Singh', 'Kolkata', 82000.00, 'Park Street, Kolkata, West Bengal'),
(5, 'Vijay', 'Kumar', 'Bangalore', 92000.00, 'MG Road, Bangalore, Karnataka'),
(6, 'Sanjay', 'Reddy', 'Hyderabad', 70000.00, 'Banjara Hills, Hyderabad, Telangana'),
(7, 'Megha', 'Iyer', 'Chennai', 88000.00, 'Anna Nagar, Chennai, Tamil Nadu');


select * from table1;
select * from table2;

-- inner join : returns only the record that have matching values in both the tables
select * from table1 inner join table2 on table1.id = table2.id; 

select 
	table1.id as id_table1,
    table2.id as id_table2,
    table1.first_name,
    table2.address
from table1 inner join table2 on table1.id = table2.id;

-- left join/left outer join : returns all records from the left table(table1) and the matched records from the right table(table2)
-- the result is NULL from the right side if there is no match 
select * from table1
left join table2 on table1.id = table2.id;

-- left anti 
select table1.* 
from table1
left join table2 
on table1.id = table2.id
where table2.id is null;

-- right join/right outer join : returns all records from the right table(table2) and the matched records from the left table(table1)
-- the result is NULL from the left side if there is no match 
select table1.*, table2.*
from table1
right join table2
on table1.id = table2.id;

-- right anti
select t2.*, t1.*
from table1 t1
right join table2 t2
on t1.id = t2.id
where t1.id is null;

-- union : it will work only on the same no of columns and will join the tables vertically
select table1.id, table1.first_name, table1.last_name from table1
union
select table2.id, table2.first_name, table2.last_name from table2;

-- union all : it will give the duplicate/same values from both the tables in the result 
select table1.id, table1.first_name, table1.last_name from table1
union all
select table2.id, table2.first_name, table2.last_name from table2;

-- cross join : it is a dot product of both the given tables
select table1.id, table1.first_name, table1.last_name, table1.city, table1.phone_number,
		table2.salary, table2.address
from table1
cross join table2;
 
CREATE TABLE employees_selfjoin (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees_selfjoin (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'David', 2),
(5, 'Eve', 2);

select * from employees_selfjoin;
-- self join/ regular join
-- LEFT JOIN: All employees, even if they don't have a manager
select 
	e.employee_id as Employee_ID,
    e.name as Employee,
    m.name as Manager
from 
	employees_selfjoin e
left join employees_selfjoin m
	on e.manager_id = m.employee_id;
    
-- INNER JOIN (JOIN): Only employees who have a matching manager
select 	
	e.employee_id as Employee_ID,
	e.name as Employee,
    m.name as Manager
from employees_selfjoin e
join employees_selfjoin m
	on e.manager_id = m.employee_id;
    
