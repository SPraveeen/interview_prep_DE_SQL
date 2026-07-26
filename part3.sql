#################################################################
use studying_db;
-- SQL INTERVIEW QUESTION -- INTERVIEW
SELECT table_name 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE' 
  AND TABLE_SCHEMA = 'studying_db';
  
drop table customer_calls;
drop table emp;
drop table empl;
drop table empll;
drop table employee;
drop table users_info;

select * from empll;

create table empll (
id int,
fname varchar(20),
midname varchar(20),
lname varchar(20),
salary int ,
hiredate date
);

insert into empll values(4,null,null,'megha',30000,'2023-07-01');
insert into empll values(5,null,null,'hari',30000,'2023-01-01');

select * from empll;

-- query1 Find the Employees who hired in the Last 2 months.
select *,timestampdiff(month,hiredate,current_date()) as diff from empll
where timestampdiff(month,hiredate,current_date()) between 0 and 2;

-- query2 : Find the Employees who hired in the Last n days.
select *,timestampdiff(day,hiredate,current_date()) as diff from empll
where timestampdiff(day,hiredate,current_date()) between 0 and 90;

-- query3: Find the Employees who hired in the Last n years.
select *, timestampdiff(year,hiredate,current_date()) as diff from empll
where timestampdiff(year,hiredate,current_date()) between 0 and 4;

-- query 4  find out the all employee name and salary details
-- note (if fname null then consider lname)
select id, coalesce(fname,midname,lname) as name, salary from empll;