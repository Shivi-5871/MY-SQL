use customers_database;


select * from customers where state = 'Delhi' and points > 100;
select first_name, last_name, monthly_income from customers where monthly_income between 50000 and 100000;
select * from customers where first_name regexp '^A';
select * from customers where state = 'Delhi' or points > 100;


-- Highest monthly_income 
select * from customers order by monthly_income desc limit 1;
-- select max(monthly_income) as highest_monthly_income from customers;
-- select * from customers where monthly_income = ( select max(monthly_income) from customers);


-- second highest monthly_income 
select * from customers order by monthly_income desc limit 1,1;

select * from customers where phone is null or phone = '';
select * from customers where sector is not null and sector <> '';
select distinct state from customers;  -- unique state from the table 
select count(distinct state) from customers;
select * from customers where birth_date < '1990-01-01';
select * from customers where birth_date between '1985-01-01' and '2000-12-31';

-- name is exactly 5 characters long
select first_name from customers where length(first_name) = 5;
select * from customers order by points desc limit 5;

-- name contains only alphabets and is at least 3 characters long.
select * from customers where first_name regexp '^[A-Za-z]{3,}$'; 

select * from customers where address like '%road%';
select * from customers where address regexp 'road$';

select * from customers where first_name regexp 'n$';

select * from customers order by monthly_income desc;

select * from customers where city != 'Mumbai';

select * from customers where points > 100 and city in ('Delhi', 'Pune', 'Chennai');