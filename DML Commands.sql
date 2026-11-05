DROP DATABASE if exists Update_delete;
CREATE DATABASE Update_delete;
USE Update_delete;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL CHECK(total_amount > 0),
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zip_code)
VALUES
('Arjun', 'Sharma', 'arjun.sharma@example.com', '9876543210', '123 MG Road', 'Mumbai', 'Maharashtra', '400001'),
('Rohit', 'Verma', 'rohit.verma@example.com', '9876543211', '456 Park Street', 'Delhi', 'Delhi', '110001'),
('Priya', 'Singh', 'priya.singh@example.com', '9876543212', '789 Main Road', 'Bangalore', 'Karnataka', '560001'),
('Anjali', 'Rao', 'anjali.rao@example.com', '9876543213', '101 Lake View', 'Hyderabad', 'Telangana', '500001'),
('Vikram', 'Patel', 'vikram.patel@example.com', '9876543214', '202 High Street', 'Ahmedabad', 'Gujarat', '380001');

INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES
(1, '2024-07-01', 1500.00, 'Pending'),
(2, '2024-07-02', 2500.00, 'Shipped'),
(3, '2024-07-03', 3500.00, 'Delivered'),
(4, '2024-07-04', 4500.00, 'Cancelled'),
(5, '2024-07-05', 5500.00, 'Pending');

select * from customers;
 
-- UPDATE
update customers set phone = '1234567890' where customer_id = 1;
 
update customers set email = 'abc@gmail.com' where customer_id = 1;
update customers set email = 'xyz@gmail.com' where city = 'Mumbai';  -- wont run because of safe mode
 
set sql_safe_updates = 0;
update customers set email = 'delhi@gmail.com' where city = 'Delhi';
set sql_safe_updates = 1;

-- using the CASE syntax for updating or adding the data at once
alter table customers add column middle_name varchar(50);

set sql_safe_updates = 0;
update customers set middle_name = case
	when customer_id  = 1 then 'Raj'
	when customer_id  = 2 then 'Kumar'
	when customer_id  = 3 then 'Meera'
	when customer_id  = 4 then 'Lakshmi'
	when customer_id  = 5 then 'Ravi'
end;
set sql_safe_updates = 1;


-- DELETE : in this command we first need to delete from the child table then only we will delete the row from the parent table
select * from customers;
select * from orders;

delete from orders where customer_id = 1;
delete from customers where customer_id = 1;

-- TRUNCATE, DEELETE, DROP
 

