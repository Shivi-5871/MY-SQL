-- Create Database
drop database if exists company_db;
CREATE DATABASE company_db;
USE company_db;

-- Create Departments Table
CREATE TABLE departments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

-- Create Employees Table (with manager_id)
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    join_date DATE,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);

-- Insert Data into Departments
INSERT INTO departments (name) VALUES
('HR'),
('Sales'),
('Engineering'),
('Finance'),
('Marketing');

-- Insert Data into Employees (with manager_id directly)
-- Note: Managers must be inserted before subordinates
INSERT INTO employees (name, salary, department_id, join_date, manager_id) VALUES
-- HR Department
('Bob', 60000, 1, '2021-03-22', NULL),         -- id = 1 (Manager)
('Alice', 50000, 1, '2020-01-15', 1),          -- id = 2
('Ivan', 40000, 1, '2018-09-03', 1),           -- id = 3

-- Sales Department
('David', 70000, 2, '2020-07-12', NULL),       -- id = 4 (Manager)
('Charlie', 55000, 2, '2019-11-05', 4),        -- id = 5
('John', 50000, 2, '2019-12-11', 4),           -- id = 6
('Ken', 65000, 2, '2021-11-05', 4),            -- id = 7

-- Engineering Department
('Frank', 85000, 3, '2022-04-01', NULL),       -- id = 8 (Manager)
('Eve', 72000, 3, '2021-01-10', 8),            -- id = 9
('Leo', 100000, 3, '2023-01-01', 8),           -- id = 10

-- Finance Department
('Heidi', 95000, 4, '2022-06-30', NULL),       -- id = 11 (Manager)
('Grace', 65000, 4, '2020-08-19', 11);         -- id = 12

select * from employees;
select * from departments;

-- 1. find the employees who earns more than the average salary 
set @avg_salary = (select avg(salary) from employees);
select * from employees
where salary > @avg_salary;

-- best practice for Subqueries 
select * from employees
where salary > (select avg(salary) from employees);


-- 2. list departments that have more than 2 employees
select *
from departments
where id in (select department_id
				from employees
				group by department_id
				having count(*) > 2);
                

-- 3. highest paid employee in the company
select * from employees
where salary = (select max(salary) from employees);


-- 4. employees who work in the same department as the JOHN
select *
from employees
where department_id = (select department_id
						from employees
						where name = 'John'); 
                        

-- 5. list employees who joined after the oldest employee in department 1
select * 
from employees 
where join_date > (select min(join_date) 
					from employees 
                    where department_id = 1);
                    

-- 6. get all the departments that have no employee
select id, name
from departments 
where id not in (select distinct(department_id) from employees);


-- 7. second highest salary   *** MOST IMPORTANT ***
select * from employees where salary = (select max(salary) from employees 
                                            where salary < (select max(salary) from employees));


-- 8. Get the name of employees who have the same salary as someone else
select * 
from employees 
where salary in (select salary from employees 
					group by salary 
                    having count(*) > 1);
-- This finds salaries that are shared by multiple employees and then fetches all employees with those salaries.


-- 9. Show employees whose salary is greater than their department's average salary.   *** IMPORTANT ***
-- *WRONG QUERY* BOB NOT COMING because in the second alias, it is comparing the table by itself only and calculating the average 
-- salary of the whole company rather than the each departmnt.
-- select name, salary 
-- from employees e 
-- where salary > (select avg(salary) 
-- 					from employees e
--                     where department_id = e.department_id);
	
-- BOB COMING, because we have nt defined the second alias and it is now calculating  the avergae salary of each department
select name, salary 
from employees e 
where salary > (select avg(salary) 
					from employees
                    where department_id = e.department_id);

-- For each employee, it checks if their salary is greater than the average salary of their department.


-- 10. Find departments where the total salary exceeds 100000.    *** IMPORTANT ***
select * from departments;
select name 
from departments 
where id in (select department_id 
				from employees 
                group by department_id 
                having sum(salary) > 100000);
-- The subquery groups salaries by department and selects those where the total exceeds 100000. The outer query returns department names for those IDs.


-- 11. Employees who earn more than their manager   *** VERY VERY IMPORTANT *** 
select
	e.id as employee_id,
    e.name as employee_name,
    e.salary as employee_salary,
    m.id as manager_id,
    m.name as manager_name,
    m.salary as manager_salary
from employees e
join employees m on e.manager_id = m.id
where e.salary > m.salary;










-- Q1. Basic subquery
-- Find employees whose salary is greater than the average salary of the entire company.
select name, salary from employees where salary > (select avg(salary) from employees);

-- Q2. Maximum salary
-- Display the employee(s) who earn the highest salary in the company using a subquery.
select name from employees where salary = (select max(salary) from employees);

-- Q3. Second-highest salary
-- Find the employee(s) earning the second-highest salary in the company.
select * from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));

-- Q4. Correlated subquery (very important)
-- Find employees whose salary is greater than the average salary of their own department.
select name, salary from employees e where salary > (select avg(salary) from employees where department_id = e.department_id);



select * from employees e left join departments d on e.id = d.id where e.name = 'Sales';

-- Q6. IN subquery
-- Display employees who work in departments that have more than-- Q5. Department comparison
-- Find employees who earn more than the average salary of the Sales department.
select * from employees;
select * from departments;
-- 2 - sales
select * from employees where salary > (select avg(e.salary) from employees e
											left join departments d on e.department_id = d.id where d.name = 'sales');

-- Q7. NOT IN subquery
-- Find employees who do not work in the Sales department. Use a subquery.
select * from employees e where e.department_id not in (select id 
															from departments d 
                                                            where d.name = 'sales');


-- Q8. EXISTS subquery
-- Display departments that have at least one employee.
select * from departments d where exists (select department_id 
											from employees e 
                                            where e.department_id = d.id);


-- Q9. Manager-related subquery
-- Find employees whose salary is greater than their manager's salary. Do this using a subquery, not a JOIN.

-- Q10. Nested subquery (advanced)
-- Find the department whose average salary is the highest among all departments.
select select avg(e.salary), e.department_id from employees e group by department_id;
