drop database if exists sample2;
create database sample2;
use sample2;

create table customer(
	ID int primary key auto_increment,
    First_name varchar(50) not null,
    Last_name varchar(50),
    Phone varchar(10) not null,
    Age tinyint unsigned check(Age > 0),
    Country varchar(50) default 'India',
    Email varchar(50) unique,
    Address tinytext,
    Pincode char(6) default '201301',
    Date_inserted_at DATE default (current_date()),
    created_time time default (current_time()),
    created_at_datetime timestamp default (current_timestamp())
);

insert into customer(First_name, Last_name, Phone, Age, Country, Email, Address, Pincode) values
('Shivi', 'Agarwal', '1234567890', 23, 'USA', 'asdf@gmail.com', 'delhi, India', '222333');

insert into customer(First_name, Last_name, Phone, Age, Country, Email, Address, Pincode) values
('Hello', 'Bye', '1234565890', 22, 'USA', 'qwerty@gmail.com', 'Noida, India', '255546');


insert into customer(First_name, Last_name, Phone, Age, Email, Address) values
('Rahul', 'Verma', '9754102836', 28, 'rahul.gupta@gmail.com', 'C65 Sector 43 Noida'),
('Priya', 'Gupta', '9451780263', 35, 'priya.verma@gmail.com', 'A596 Sector 4 Noida');

select * from customer;

describe customer;


create table customer_orders (
	order_Id int primary key auto_increment,
    customer_id int,
    order_date date default(current_date()),
    order_amount decimal(10, 2) not null,
    order_status enum('Pending', 'Shipped', 'Delievered', 'Cancelled') default 'Pending',
    foreign key (customer_id) references customer(ID) on delete cascade on update cascade
);

insert into customer_orders (customer_id, order_amount, order_status) values
(1, 1500.50, 'Shipped'),
(1, 2200.00, 'Pending'),
(2, 500.75, 'Delievered'),
(2, 1800.00, 'Cancelled'),
(3, 750.25, 'Shipped');


describe customer;
describe customer_orders;
select * from customer_orders;


insert into customer(First_name,Last_name,Phone,Age,Country,Email,Pincode)
values
('vishal','Tyagi','4536565767',25,'USA','vishal_new@gmail.com','123456');

insert into customer(First_name,Last_name,Phone,Age,Email)
values
('Aman','Tyagi','4536565767',25,'aman_new@gmail.com');

insert into customer(First_name, Last_name, Phone, Age, Country, Email, Pincode) values
('Saima', 'Tyagi', '9425703618', 25, default, 'Saima_default@gmail.com', default);

insert into customer(First_name, Last_name, Phone, Age, Country, Email, Pincode) values
('Rohit', 'Tyagi', '7540213860', 24, default, 'Rohit@gmail.com', default);

select * from customer;
select * from customer_orders;