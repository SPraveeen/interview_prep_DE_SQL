-- INTERVIEW PREPARATION SERIES -1SQL - PART -1
use studying_db;

create table employee (
    id int,
    name varchar(100),
    salary int
);

insert into employee values (1,'subha',200),(2,'praven',7000);
insert into employee values (1,'subha',200),(2,'praven',7000);

-- query1: how to create new table structure based on existing table struc-- note ( only schema need to create )
-- empl new // employee old

select * from employee;

create table empl as 
select * from employee where 1=2;

select * from empl;

-- query2 : how to create new table based on existing table-- note ( copy data also from one table to another)

create table empl1
select * from employee where 1=1;

select * from empl1;

-- query3 : how to find duplicate records are there in the table or not

select id,count(*)as "no_of id's" from employee
group by id
having count(id)>1;

-- using window function
select * from (
select *, row_number() over(partition by id order by id) as r_n from employee) d
where d.r_n>1;

-- query4: Find duplicate records which repeated multiple times
with cte1 as (
select *, row_number() over(partition by id order by id) as r_n from employee)
select * from cte1 where r_n>1;

-- query5 :remove duplicate records from table
with cte as(
select *, row_number() over(partition by id order by id) as r_n from employee)
select * from cte where r_n=1