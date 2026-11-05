drop database if exists DDL_commands;
create database DDL_commands;
use DDL_commands;

create table my_table(
	id INT,
    name varchar(100) not null,
    age int not null,
    created_at Timestamp default current_timestamp
);

insert into my_table(id, name, age) values
(1, 'Rohit', 25),
(2, 'Sachin', 35),
(3, 'Vikas', 28);

-- create table 2
create table my_table2(
	id INT,
    description varchar(255) not null
);

insert into my_table2(id, description) values
(1, 'Item 1'),
(2, 'Item 2'),
(3, 'Item 3');


-- alter commands 
alter table my_table add column email varchar(100);
alter table my_table add column middle_name varchar(50) after name;
alter table my_table add column emp_rank int first;

select * from my_table;

-- changing the column's constraints using modify
alter table my_table modify column name varchar(150) not null;
describe my_table;

-- changing column name and type
alter table my_table change column email email_address varchar(200); 

-- drop the column in a database
alter table my_table drop column age;

-- add a primary key(if not already defined)
alter table my_table add primary key (id);

-- add a foregin key constraints to my_table2
alter table my_table2 add constraint fk_id foreign key (id) references my_table(id);  -- it is referencing the table 1 for the foreign key to the table 2 

alter table my_table2 drop foreign key fk_id;
alter table my_table drop primary key;

rename table my_table to my_new_table;