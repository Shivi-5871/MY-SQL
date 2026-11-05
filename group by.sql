drop database if exists having_groupby;
create database having_groupby;
use having_groupby;

create table sales(
	sale_id int auto_increment primary key,
    product_name varchar(50),
    sale_date date,
    quantity int,
    price_per_unit decimal(10, 2)
);

insert into sales (product_name, sale_date, quantity, price_per_unit) values 
('product A', '2023-09-01', 10, 15.50),
('product B', '2023-09-01', 5, 22.75),
('product A', '2023-09-02', 7, 15.50),
('product C', '2023-09-03', 3, 12.40),
('product B', '2023-09-03', 8, 22.75),
('product A', '2023-09-04', 12, 15.50),
('product C', '2023-09-04', 9, 12.40);

select * from sales;

-- group by: using it in the product_name
select product_name, sum(quantity) as total_quantity from sales group by product_name;

-- group by: using it with filter where with product A only
select product_name, sum(quantity) as total_quantity from sales where product_name = 'product A' group by product_name;

-- group by: using it in the product_name
select product_name, sum(quantity) as total_quantity
from sales
where product_name = 'product A' or product_name = 'product B' or product_name = 'product C' 
group by product_name;


-- group by: using it with both where and having
select product_name, sum(quantity) as total_quantity
from sales
where product_name = 'product A' or product_name = 'product B' or product_name = 'product C' 
group by product_name
having total_quantity > 12;


-- group by: using it with both where and having
-- when we want to see the minimum values we use ascending order and to see the values having max, then we use desc 
select product_name, sum(quantity) as total_quantity
from sales
where product_name = 'product A' or product_name = 'product B' or product_name = 'product C' 
group by product_name
having total_quantity > 12
order by total_quantity asc
limit 10;


select product_name, sum(quantity) as total_quantity
from sales
group by product_name
having total_quantity > 10;


select product_name, count(sale_id) as sale_counts
from sales
group by product_name
having sale_counts > 2;

-- Average (avg) 
select product_name, avg(price_per_unit) as avg_price
from sales
group by product_name
having avg_price > 15;

-- Maximum (MAX)
select product_name, max(quantity) as max_quantity
from sales
group by product_name
having max_quantity > 10;

-- minimum (min)
select product_name, min(quantity) as min_quantity
from sales
group by product_name
having min_quantity > 5;

-- sum with additional conditions
select product_name, sum(quantity * price_per_unit) as revenue
from sales
group by product_name
having revenue > 200;

-- using multiple aggregations together
select product_name, sum(quantity) as total_quantity, avg(price_per_unit) as avg_price, count(sale_id) as total_sales
from sales
group by product_name
having total_sales > 2 and avg_price > 15;

-- group by with where
select product_name, sum(quantity) as total_quantity
from sales
where sale_date > '2023-09-01'
group by product_name
having total_quantity > 10;