use first;
select * from users;
drop table customer_details;

create table customer_details (
	Id int primary key auto_increment,
	First_Name varchar(50) not null,
	Last_Name varchar(50) null,
    Address varchar(250) unique,
    Phone char(10) unique,
    Age int check(Age > 0),
    Country varchar(50) default 'India',
    Email varchar(50) unique,
    Pincode char(6) default '201301',
    Date_Inserted date default(current_date()),
    Created_Time time default(current_time()),
    Created_At datetime default(current_timestamp()),
    Order_Summary tinytext
);

insert into customer_details(First_Name, Last_Name, Address, Phone, Age, Country, Email, Pincode, Order_Summary) values
('Shivi', 'Agarwal', 'Delhi', '9214035768', '23', 'UK', 'shivi@gmail.com', '222111', 'Delivered');

insert into customer_details(First_Name, Last_Name, Address, Phone, Age, Email, Order_Summary) values
('Dev', 'Verma', 'Bangalore', '9568740010', '25', 'dev@gmail.com', 'Shipped'),
('Jaimen', 'Sharma', 'Noida', '960012035', '24', 'jaimen@gmail.com', 'Pending');

insert into customer_details(First_Name, Address, Phone, Age, Country, Email, Pincode, Order_Summary) values
('Mahi', 'Bombay', '7542013065', '23', 'Canada', 'mahi@gmail.com', '243201', 'Delivered');

delete from customer_details where Address = 'Greater Noida';

insert into customer_details(First_Name, Address, Phone, Age, Country, Email, Pincode, Order_Summary) values
('Rohan', 'Greater Noida', '9425710368', '23', 'USA', 'rohan@gmail.com', '124035', 'Pending');

select * from customer_details;