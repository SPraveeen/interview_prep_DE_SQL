-- INTERVIEW PREPARATION SERIES
insert into employee values (3,'divam',100),(4,'sui',9876);
insert into employee values (1,'divam',400),(2,'sui',976);
-- SQL - PART -2

-- query1:  FIND 2ND HIGEST SALARY ( DIFFERENT WAYS TO FIND )
select * from employee
order by salary desc
limit 1 offset 1;

-- windows function
with cte as (
select *,dense_rank() over(order by salary desc) as d_rnk from employee)
select * from cte where d_rnk=2;

-- max method
select max(salary) from employee where salary <(
select max(salary) from employee);

-- query2 : FIND 3RD HIGEST SALARY
with cte as (
select *, row_number() over(order by salary desc) as rn from employee)
select * from cte where rn=3;

-- query3 : FIND 2ND HIGEST SALARY BASED ON EACH DEPARTMENT
with cte as (
select *, dense_rank() over(partition by id order by salary desc) as drnk from employee)
select * from cte where drnk=2;

-- query4:     FIND BOTTOM 2 SALARY EMPLOYEE DETAILS
select * from employee
order by salary asc
limit 2;

-- QUERY 5: FIND TOP 2 SALARY EMPLOYEE DETAILS
select * from employee
order by salary desc
limit 2;

-- query6 : FIND LOWEST SALARY EMPLOYEE IN EACH DEPARTMENT
select * from (
select *, dense_rank() over(partition by id order by salary asc) as d_rnk from employee)d
where d_rnk = 1;

select min(salary),id from employee group by id;

-- query7 : FIND 3rd to 5th SALARY EMPLOYEE
with cte as (
select *, row_number() over(order by salary desc) as rn from employee)
select * from cte where rn between 3 and 5;
