DROP DATABASE IF EXISTS training_functions;
CREATE DATABASE training_functions;
USE training_functions;

CREATE TABLE CourseEnrollments (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(40),
LastName VARCHAR(40),
CourseName VARCHAR(40),
Fee DECIMAL(10,2),
EnrollmentDate DATE,
CompletionDate DATE
);

INSERT INTO CourseEnrollments(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate) VALUES
(101, 'aman', 'Sharma', 'Python', 12500.75, '2026-01-05', '2026-03-20'),
(102, 'priya', 'Verma', 'MySQL', 9800.40, '2026-01-12', '2026-02-28'),
(103, 'rahul', 'Singh', 'Python', 15750.90, '2026-02-01', '2026-04-15'),
(104, 'neha', 'Gupta', 'Power BI', 11200.25, '2026-02-10', '2026-05-05'),
(105, 'ishita', 'Kapoor', 'MySQL', 8900.60, '2026-03-03', '2026-04-22'),
(106, 'arjun', 'Mehta', 'Python', 13650.15, '2026-03-15', '2026-06-10'),
(107, 'simran', 'Joshi', 'Power BI', 10400.95, '2026-04-01', '2026-06-30'),
(108, 'vikas', 'Rao', 'MySQL', 7600.50, '2026-04-18', '2026-05-29'),
(109, 'kiran', 'Malik', 'Python', 14999.99, '2026-05-02', '2026-07-25'),
(110, 'rohan', 'Sethi', 'Power BI', 11950.35, '2026-05-20', '2026-08-14');

SELECT * FROM CourseEnrollments;

-- String functions

-- 1. Display each student’s full name in uppercase with a single space between the first and last names using CONCAT() and UPPER().
select upper(concat(FirstName, ' ', LastName)) as FullName
from CourseEnrollments;

-- 2. Display each student’s full name with the first letter of FirstName in uppercase and the remaining letters unchanged, using CONCAT(), UPPER() and SUBSTRING().
select concat(upper(substring(FirstName, 1, 1)), substring(FirstName, 2), ' ', LastName) as FullName 
from CourseEnrollments;

-- 3. Create a student code consisting of the first three letters of CourseName in uppercase, a hyphen, and StudentID using LEFT(), UPPER() and CONCAT().
select concat(upper(LEFT(CourseName, 3)), '-', StudentID) as StudentCode
from CourseEnrollments;

-- 4. Display FirstName reversed and also display its original character count using REVERSE() and CHAR_LENGTH().
select reverse(FirstName) as reverseName, char_length(FirstName) as LengthofName
from CourseEnrollments;

-- 5. Display the position of the letter a in FirstName using LOCATE(), along with FirstName.
select locate('a', FirstName) as Position, FirstName
from CourseEnrollments;

-- 6. Replace every letter a in FirstName with o, then convert the result to uppercase using REPLACE() and UPPER().
select upper(replace(FirstName, 'a', 'o')) as FirstName
from CourseEnrollments;

-- 7. Display FirstName padded on the left with zeroes to a total length of 12 characters using LPAD().
select lpad(FirstName, 12, '0')
from CourseEnrollments;

-- 8. Display a course label made of the last two letters of CourseName, a hyphen, and the first two letters of FirstName using RIGHT(), LEFT() and CONCAT().
select concat(right(CourseName, 2), '-', left(FirstName, 2)) as CourseLabel
from CourseEnrollments;

-- 9. Display the first three letters of FirstName in uppercase followed by the last two letters of LastName in lowercase 
--  using SUBSTRING(), RIGHT(), UPPER(), LOWER() and CONCAT().
select concat(upper(substring(FirstName, 1, 3)), lower(right(LastName, 2))) as Concated_Name
from CourseEnrollments;


-- Numeric functions

-- 10. Display Fee rounded to one decimal place and also Fee rounded to the nearest whole number using ROUND().
select round(Fee, 1) as One_place_round, round(Fee, 0) as Whole_Number
from CourseEnrollments;

-- 11. Display Fee rounded upward and downward to whole numbers in separate columns using CEIL() and FLOOR().
select ceil(Fee) as ceil_value, floor(Fee) as floor_value
from CourseEnrollments;

-- 12. Display the remainder when Fee is divided by 500 using MOD(), alongside the original Fee.
select mod(Fee, 500) as Remainder, Fee
from CourseEnrollments;

-- 13. Display the absolute difference between Fee and 10000 using ABS().
select abs(Fee - 10000) as absolute_difference
from CourseEnrollments;

-- 14. Display Fee multiplied by 1.18 and rounded to two decimal places using ROUND().
select round(Fee * 1.18, 2) AS updated_fee
from CourseEnrollments;

-- 15. Display Fee formatted with a thousands separator and exactly two decimal places using FORMAT().
select format(Fee, 2) AS formatted_fee
from CourseEnrollments;

-- Date functions

-- 16. Display the enrollment year, enrollment month name and enrollment day name in separate columns using YEAR(), MONTHNAME() and DAYNAME().
select year(EnrollmentDate) as Enrollment_Year, monthname(EnrollmentDate) as Enrollment_Month, dayname(EnrollmentDate) as Enrollment_Day
from CourseEnrollments;

-- 17. Display EnrollmentDate in DD/MM/YYYY format and CompletionDate in Month DD, YYYY format using DATE_FORMAT().
select date_format(EnrollmentDate, '%d/%m/%Y') as Enrollment_Date, date_format(CompletionDate, '%M %d, %Y') as Completion_Date
from CourseEnrollments;

-- 18. Calculate the number of days between EnrollmentDate and CompletionDate using TIMESTAMPDIFF().
select timestampdiff(day, EnrollmentDate, CompletionDate) as Days_Between
from CourseEnrollments;

-- 19. Display the date 1 month and 10 days after EnrollmentDate using nested DATE_ADD() calls.
select date_add(date_add(EnrollmentDate, interval 1 month), interval 10 day) as New_Enrollment_Date
from CourseEnrollments;

-- 20. Display the date exactly 7 days before CompletionDate using DATE_ADD() with a negative interval.
select date_add(CompletionDate, interval -7 day) as Previous_Completion_Date
from CourseEnrollments;

-- 21. Display the number of complete months between EnrollmentDate and CompletionDate using TIMESTAMPDIFF().
select timestampdiff(month, EnrollmentDate, CompletionDate) as Complete_Months
from CourseEnrollments;

-- 22. Display the enrollment date shifted forward by 1 year, 2 months and 5 days using nested DATE_ADD() calls.
select date_add(date_add(date_add(EnrollmentDate, interval 1 year), interval 2 month), interval 5 day) as Shifted_Enrollment_Date
from CourseEnrollments;

-- 23. Display EnrollmentDate and CompletionDate with their weekday names using DAYNAME().
select EnrollmentDate, dayname(EnrollmentDate) AS Enrollment_Weekday, CompletionDate, dayname(CompletionDate) AS Completion_Weekday
from CourseEnrollments;

-- 24. Display the number of days from EnrollmentDate until the current date using TIMESTAMPDIFF() and CURDATE().
select timestampdiff(day, EnrollmentDate, curdate()) AS Days_SinceEnrollment
from CourseEnrollments;

-- 25. Display the original CompletionDate and its date after adding 15 days, formatted as DD/MM/YYYY using DATE_ADD() and DATE_FORMAT().
select date_format(CompletionDate, '%d/%m/%Y') as Original_CompletionDate, 
	date_format(date_add(CompletionDate, interval 15 day), '%d/%m/%Y') as New_CompletionDate
from CourseEnrollments;

-- Use the CourseEnrollments table for every question. No row filtering is required.