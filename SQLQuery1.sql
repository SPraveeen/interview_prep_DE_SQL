-- create database
create database employee;

-- use database
use employee

-- delete database
use master
drop database employee

-- create table
create table emp1(
emp_id int,
name varchar(30),
address varchar(100),
salary int
)

-- insert values
insert into emp1 values(1,'syuba','canada',888),(2,'elumba','newyork',999),(3,'praveen','ireland',543)

-- read table
select * from emp1

-- crate table and only insert few column values in a tabble
insert into emp1 (emp_id,name,salary)values(4,'rahul',780)

-- SQL CONSTRAINTS
--8. SQL constraints
-- Definition:
-- SQL constraints are rules applied to columns in a database table
-- to enforce data integrity and ensure the accuracy and reliability of the data.
1. NOT NULL
Definition: Ensures that a column cannot have a NULL value.
2. UNIQUE
Definition: Ensures that all values in a column are unique across the table, preventing duplicate entries.
3. PRIMARY KEY
Definition: A combination of NOT NULL and UNIQUE.
It uniquely identifies each row in a table and cannot accept NULL values.
4. FOREIGN KEY
Definition: Establishes a relationship between two tables by ensuring that a value in one table matches a value in another, maintaining referential integrity.
5. CHECK
Definition: Ensures that all values in a column satisfy a specific condition, helping to enforce business rules.
(Note: There is a handwritten note next to this pointing out an example condition: age > 18)
6. DEFAULT
definition: Provides a default value for a column when no value is specified during the insertion of a new record.

-- 9 ->not null and unique constraint
-- table - email cant be blank
-- tbale - unique phone number

create table emp2(
id int,
email varchar(30) not null,
phone int unique
)
insert into emp2 values (1,'abc@gmial.com',123)

insert into emp2 (id,phone) values (2,445)

-- Msg 515, Level 16, State 2, Line 59
-- Cannot insert the value NULL into column 'email', table 'employee.dbo.emp2'; column does not allow nulls. INSERT fails.
-- The statement has been terminated.

--10. check and default constraints

--1 . create table emp ehere age column should contain value only greater than 18
--2.  create table emp where country value should automatic take default INDIA.

create table emp3(
id int,
age int check (age>18),
country varchar(90) default 'ireland'
)

select * from emp3

insert into emp3(id,age) values (1,19)

--11. PRIMARY KEY & UNIQUE KEY
-- PRIMARY KEY -
-- A PRIMARY KEY is a column (or a set of columns) that uniquely identifies each row in a table.
-- No two rows can have the same primary key value, and it can't be NULL.
-- IT DOESNT CONTAIN DUPLICATE VALUE
-- IT CANT BE NULL
-- WE CAN HAVE ONLY 1 PRIMARY KEY IN THE TABLE

-- primary key can't contain duplicate and null
create table emp4(
id int,
email varchar(50)
)

-- foreign key
create table department(
dept_id int primary key,
dept_name varchar(30)
)

create table student(
id int primary key,
name varchar(30),
dept_id int 
foreign key (dept_id) references department(dept_id)
)

-- filters -> where 

-- delete{for specific row/data from table} ||| drop{complete table and data deleted} ||| truncate{delete complete records from table}

delete from emp2 where id =6

-- delete all rows
delete from emp1

-- delete complete rows
truncate table emp1

-- drop 
drop table emp1

-- 15 update in sql
-- update emp locat as india where it is null
update emp2 set location='india'
where location is null

-- update dalary as 1 lakh for sam
update emp3 set salary = '100000'
where name ='sam'

-- update dalary as 1 lakh where is null
update emp3 set salary ='100000'
where salary is null

-- and//or//not//in// not in