use sample2;

select * from customer;
describe customer;



drop table customer_orders;

create table customer_orders(
	Order_Id int primary key auto_increment,
    Customer_Id int,
    Order_Date date default(current_date()),
    Order_Amount decimal(10, 2) not null,
    Order_Status Enum('Pending', 'Shipped', 'Delivered', 'Cancelled') default 'Pending',
    Foreign key (customer_Id) references customer(ID) on delete cascade on update cascade
);

insert into customer_orders(Customer_Id, Order_Amount, Order_Status) values
(1, 1500.50, 'Shipped'),
(1, 2200.00, 'Pending'),
(2, 500.75, 'Delivered'),
(3, 2500.45, 'Cancelled');

select * from customer_orders;
describe customer_orders;