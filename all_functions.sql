DROP DATABASE IF EXISTS all_functions;
CREATE DATABASE all_functions;
Use all_functions;

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

-- Insert some sample data into the table
INSERT INTO Employees (FirstName, LastName, BirthDate, HireDate, Salary, DepartmentID)
VALUES
('ajay', 'Kumar尽', '1998-01-15', '2010-06-01', 60000.28, 1),
('ashish', 'Tyagi', '1985-02-20', '2012-09-15', 75000.60, 2),
('sachin', 'Diskshit', '1979-03-10', '2011-04-20', 80000.01, 1),
('richa', 'Mittal', '1990-07-12', '2015-01-05', -70000.90, 3),
('aditi', 'Bhardwaz', '1988-11-30', '2013-10-10', 68000.10, 2);
select * from Employees;
 
-- StTRING FUNCTIONS

-- 1. concat function
select concat(FirstName, ' ', LastName) as FullName, birthdate, departmentid from employees; 

-- 2. Concat_Ws() (With Seperator)
select concat_ws('-', '2026', '02', '03') as full_date;

-- 3. Trim() => removes spaces from both the sides
select trim(' Hello ');

-- 4. LTrim() => removes spaces from LEFT sides
select ltrim(' Hello');

-- 5. Trim() => removes spaces from RIGHT sides
 select rtrim('Hello ');
 
-- 6. convert to upperCase or lowerCase
select upper(FirstName) as FirstNameUpper from employees;
select lower(LastName) as LastNameLower from employees;

-- 7. upper and concat 
select upper(concat(FirstName, ' ', LastName)) as FirstNameUpper from employees;

-- 8. get the char_length of FirstName # tell you the number of characters
-- character_length() same
select char_length(lastName) as charlength, length(LastName) as length from employees;

-- 9. substring of firstName
select substring(FirstName, 2) as FirstNameSub, firstname from employees; 
select substring(FirstName, 2, 3) as FirstNameSub, firstname from employees; 
select upper(substring(FirstName, 1, 1)) as FirstNameSub, firstname from employees; 

-- 10. left() extracts character from the left 
select left('Hello', 2);

-- 11. right() extracts character from the right 
select right('Hello', 2);

-- 12. capitalize of firstName
select concat(upper(substring(FirstName, 1, 1)), substring(FirstName, 2)) as FirstNameLetterUpper from employees;
select FirstName, LastName, concat(concat(upper(substring(FirstName, 1, 1)), substring(FirstName, 2)), ' ', LastName) as FirstNameLetterUpper from employees;   -- dobara kar 

-- 13. find output location of alphabet in firstname and lastname
select FirstName, locate('a', FirstName) from employees; 
select lastname, locate('a', lastname) from employees;

-- 14. find postion of substring through index values
select locate('world', 'Hello world');  -- output will be 7 

-- 15. lpad() pads string from left 
select lpad('5', 3, '0') as l_pad;

-- 16. rpad() pads string from right 
select rpad('Hi', 3, '*') as r_pad;

-- 17. reverse the string 
select reverse(lastname) as reverse_wordf, reverse(firstname) as reverse_word from employees;

-- 18. space()  return the space
select concat('1', space(10), 'Hello');

-- 19. strcmp()  compares two string
select strcmp('Aello', 'Hello') as string_compare;

-- 20. ascii() value function
select ascii('A') as ascii_value;

-- 21. char() returns character from its ascii value
select char(65) as character_returned;    -- return BLOB 
select char(65 USING utf8mb4) as character_returned;    -- utf8mb4 converts BLOB into the character into the string
select char(65 USING utf8) as character_returned;    -- utf8mb4 converts BLOB into the character


-- 22. format() formats number as a string
select format(1234567.894, 2);

-- 23. insert()
select insert('Hello world', 7, 5, 'MySql');     -- 7th position and 5 words

-- 24. replace()
select upper(replace(FirstName, 'a', 'o')) as FirstName
from Employees;


-- NUMERIC FUNCTIONS

-- 1. Round function  
select round(salary) as salaray_rounded, salary as original_salary from employees;

-- 2. ceiling of salary
select ceiling(salary) as ceiling_salary, salary as original_salary from employees;

-- 3. floor of salary
select floor(salary) as floor_salary, salary as original_salary from employees;

-- 4. Absolute value of a number, abs() : returns the positive value of the number
select abs(salary) as absolute_salary, salary as original_salary from employees;

-- 5. Modulus of a number: gives the remainder of the division operation betweent two number
select mod(salary, 5000) as SalaryModulus, salary as original_salary from employees;

-- 6. if - else statement
select firstname, salary,
	if(salary > 70000, 'High', 'Low') as salaryyLevel
from employees;

-- 7. CASE FUNCTIONS
select firstname, salary,
	case 
		when salary >= 75000 then 'very high'
        when salary >= 70000 then 'high'
        else 'Average'
end as SalaryLevel
from employees;

-- 8. DATE AND TIME
select firstname, salary, now() as currentDateTime, curdate() as currentDate, curtime() as currentTime from employees;

select firstname, salary, hiredate, 
	year(hiredate) as hireYear,
	month(hiredate) as hireMonth,
    monthname(hiredate) as Month_Name,
	day(hiredate) as hireday,
	dayname(hiredate) as Day_name
from employees;

-- INCREASING DAY, MONTH, YEAR 

select hiredate as original_date,
(date_add(hiredate, interval 1 year)) as newDate from employees;

select hiredate as original_date,
(date_add(hiredate, interval 1 month)) as newDate from employees;

select hiredate as original_date,
(date_add(hiredate, interval 1 day)) as newDate from employees;

select hiredate as original_date,
date_add(date_add(date_add(hiredate, interval 1 year), interval 1 month), interval 1 day) as newDate from employees;

select date_format(hiredate, '%d%m%y') as hiredate from employees;

select timestampdiff(year, birthdate, curdate()) as age from employees;
select firstname, salary, birthdate, timestampdiff(year, birthdate, curdate()) as age from employees;
select firstname, salary, birthdate, timestampdiff(month, birthdate, curdate()) as age from employees;
select firstname, salary, birthdate, timestampdiff(day, birthdate, curdate()) as age from employees;
select firstname, salary, birthdate, timestampdiff(hour, birthdate, curdate()) as age from employees;
select firstname, salary, birthdate, timestampdiff(minute, birthdate, curdate()) as age from employees;
select firstname, salary, birthdate, timestampdiff(second, birthdate, curdate()) as age from employees;
