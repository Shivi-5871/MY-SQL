drop database if exists Shopping_Management;
create database Shopping_Management;
use Shopping_Management;

create table customers(
	Customer_Id int primary key auto_increment,
    Customer_Name varchar(100),
    Email varchar(100) unique not null,
    Phone_Number char(10) unique not null,
    Age tinyint check(Age > 0),
    Gender enum('Male', 'Female', 'Other'),
    Country varchar(50) default 'India',
    City varchar(50) not null,
    Pincode char(6) default '201301',
    Registration_Date date default(current_date()),
    Registration_Time time default(current_time()),
    Created_At timestamp default(current_timestamp()),
    Address varchar(250) unique,
    Customer_Status enum('Active', 'Inactive', 'Blocked') default 'Active',
    Customer_Notes tinytext
);

describe customers;

insert into customers(Customer_Name, Email, Phone_Number, Age, Gender, City, Pincode, Address, Customer_Status, Customer_Notes) values
('Shivi Agarwal', 'shivi@gmail.com', '9564785200', 23, 'Female', 'Delhi', '253210', 'A52 Mandawli', 'Inactive', 'scfvgbhnj');

insert into customers(Customer_Name, Email, Phone_Number, Age, Gender, Country, City, Address, Customer_Status, Customer_Notes) values
('Mahi Tyagi', 'mahi@gmail.com', '7840231540', 23, 'Female', 'India', 'Noida', 'B20 KP', 'Active', 'zxcfvbhcf'),
('Rohan Sharma', 'sharma.rohan@gmail.com', '9410237564', 25, 'Male', 'Italy', 'Paris', 'Bologna Street', 'Active', 'tfghbgvhb'),
('Rahul Gupta', 'rahulgupta@gmail.com', '7540231568', 35, 'Male', 'India', 'Delhi', 'Anand Vihar', 'Blocked', 'txrcfvgbhnjm');

insert into customers(Customer_Name, Email, Phone_Number, Age, Gender, Country, City, Address, Customer_Notes) values
('Aani Tyagi', 'aani@gmail.com', '7541320250', 20, 'Female', 'India', 'Ghaziabad', 'Kaushambi', 'dxcfgvbhj');

select * from customers;

create table orders(
	Order_Id int primary key auto_increment,
    Customer_Id int,
    Order_Date date default(current_date()),
    Order_Amount decimal(10,2) not null,
    Order_Status enum('Pending', 'Processing', 'Shipped', 'Delivered') default 'Pending',
    Payment_Method enum('Cash', 'Card', 'UPI', 'Net Banking'),
	Payment_Status enum('Pending', 'Paid', 'Failed') default 'Pending',
    Shipping_Address varchar(250) not null,
    Delivery_Pincode char(6),
    Quantity int unsigned check(Quantity > 0) not null,
	Discount_Amount decimal(10, 2) default 0,
    Delivery_Date date,
    Created_At time stamp default(current_timestamp()),
    Tracking_Number varchar(50) unique not null,
    Delivery_Status enum('Not Dispatched', 'In Transit', 'Delivered', 'Returned') default 'Not Dispatched',
    Order_Notes tinytext,
    Foreign Key (Customer_Id) references customers(Customer_Id) on delete cascade on update cascade
);