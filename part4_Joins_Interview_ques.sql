-- SQL PART-4##############MOST ASKED JOIN RELATED QUESTION
CREATE TABLE TABLE1
( 
ID INT 
);

INSERT INTO TABLE1 VALUES(10);
INSERT INTO TABLE1 VALUES(10);
INSERT INTO TABLE1 VALUES(10);
INSERT INTO TABLE1 VALUES(10);
INSERT INTO TABLE1 VALUES(10);

SELECT * FROM TABLE1;

CREATE TABLE TABLE2
( 
ID INT 
);
INSERT INTO TABLE2 VALUES(10);
INSERT INTO TABLE2 VALUES(10);
INSERT INTO TABLE2 VALUES(10);

-- QUERY 1-- HOW MANY RECORDS WE WILL GET WHEN WE PERFORM INNER JOIN
-- 5*3 = 15 // each 10 don't know which 10 to join so each 10 will join each other 10 in other table, 
-- total of 5*3 => 15 rows

select count(*) from table1 t1
inner join table2 t2 
on t1.id=t2.id;

-- QUERY 2-- HOW MANY RECORDS WE WILL GET WHEN WE PERFORM LEFT JOIN
-- all left + matching so again same like inner --> 5*3 =>15

select count(*) from table1 t1
left join table2 t2 
on t1.id=t2.id;

-- QUERY 3-- HOW MANY RECORDS WE WILL GET WHEN WE PERFORM RIGHT JOIN
-- 3 * 5 =>15

select count(*) from table1 t1
right join table2 t2 
on t1.id=t2.id;

-- QUERY 4-- HOW MANY RECORDS WE WILL GET WHEN WE PERFORM FULL JOIN

select count(*) from table1 t1 left join table2 t2 on t1.id=t2.id
union all
select count(*) from table1 t1 right join table2 t2 on t1.id=t2.id;

-- inserting null values and finding answers
insert into table1 values(null);
insert into table1 values(null);

insert into table2 values(null);

-- left join 15+ 2 nulls = 17
-- right join 15+1 null = 16
-- full join 15+3 nulls = 18
-- inner join it excludes null only 15
