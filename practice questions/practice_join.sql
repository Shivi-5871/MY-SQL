drop database if exists joins_practice;
create database joins_practice;
use joins_practice;

create table Employees(
	employee_id int primary key,
    first_name varchar(50),
    city varchar(50),
    salary decimal(10, 2),
    department_id int,
    manager_id int
);

create table departments(
	department_id int primary key,
    department_name varchar(50),
    location varchar(50)
);

create table projects(
	project_id int primary key,
    project_name varchar(50),
    department_id int,
    budget decimal(10, 2)
);

create table employee_bonus(
	bonus_id int primary key,
    employee_id int,
    bonus_amount decimal(10, 2),
    bonus_year int
);

insert into employees(employee_id, first_name, city, salary, department_id, manager_id) values
(101, 'Rahul', 'Delhi', 85000, 1, 104),
(102, 'Priya', 'Mumbai', 65000, 2, 104),
(103, 'Aman', 'Pune', 72000, 1, 105),
(104, 'Neha', 'Delhi', 95000, 3, NULL),
(105, 'Karan', 'Jaipur', 60000, 2, 104),
(106, 'Sneha', 'Mumbai', 78000, 4, 105),
(107, 'Arjun', 'Lucknow', 55000, NULL, 104),
(108, 'Simran', 'Pune', 90000, 3, 105),
(109, 'Riya', 'Delhi', 68000, 5, 104),
(110, 'Varun', 'Jaipur', 82000, NULL, 105);

insert into Departments(department_id, department_name, location) values
(1, 'IT', 'Delhi'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Bengaluru'),
(4, 'Marketing', 'Pune'),
(6, 'Sales', 'Hyderabad');

insert into projects(project_id, project_name, department_id, budget) values
(201, 'Website Redesign', 1, 500000),
(202, 'Recruitment Drive', 2, 150000),
(203, 'Tax Automation', 3, 400000),
(204, 'Social Media Campaign', 4, 200000),
(205, 'Mobile App', 1, 800000),
(206, 'Sales Expansion', 6, 350000),
(207, 'Data Migration', 3, 250000);

insert into employee_bonus(bonus_id, employee_id, bonus_amount, bonus_year) values
(1, 101, 10000, 2025),
(2, 102, 5000, 2025),
(3, 104, 15000, 2025),
(4, 106, 8000, 2025),
(5, 108, 12000, 2025),
(6, 101, 5000, 2026),
(7, 109, 7000, 2026);

-- 1. Display the department name, employee count, total salary, and average salary for each department. 
-- Include departments with zero employees and sort by total salary descending.
select d.department_name, count(e.employee_id) as employee_count, sum(e.salary) as total_salary,


-- 2. Find employees who have received a bonus and earn more than ₹70,000. Display their name, department, salary, and bonus amount. 
-- Sort by bonus amount from highest to lowest.

-- 3. Display each department's name, number of projects, and total project budget. Include only departments with more than one project.

-- 4. Find the highest-paid employee in each department. Display the employee name, salary, and department name.

-- 5. Find departments whose total employee salary is greater than ₹1,50,000. Display department name, employee count, and total salary.

-- 6. Display employee names, their manager names, department names, and salaries for employees earning more than ₹65,000. 
-- Sort by department name and salary descending.

-- 7. Display departments that have at least one project but no employees.

-- 8. Find employees who have received more than one bonus record. Display employee name, total bonus received, and number of bonuses.
-- Sort by total bonus in descending order.

-- 9. Display department name, total number of employees, number of projects, and total project budget. Include departments having no employees or projects.

-- 10. Find employees who have received a bonus and whose department has a project budget greater than ₹300,000. 
-- Display employee name, department, salary, bonus, and project name. Sort by salary descending.