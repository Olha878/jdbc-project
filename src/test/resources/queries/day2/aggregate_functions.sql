select *
from employees;

/*
Aggregate functions - multi rows - group functions

-count --> it will count rows
-max --> it will give us max value
-min --> it will give us min value
-sum --> it will give total value
-avg --> it will give average value

Aggregate functions takes multi row and return one result
All of them ignore null values
*/

--how many departments we have?
select * from DEPARTMENTS;
select count(*) from DEPARTMENTS;

-- how many locations we have?
select count(*) from LOCATIONS;


--null values
select * from EMPLOYEES; --total 107
select count(DEPARTMENT_ID) from EMPLOYEES; -- total 106, one id is null

--Task:
--how many different first name we have
select count(distinct FIRST_NAME) from EMPLOYEES;

--how many employees working as IT_PROG or SA_REP
select count (*)from EMPLOYEES
where JOB_ID in ('IT_PROG','SA_REP');

--max
SELECT MAX(SALARY) from EMPLOYEES;

--min
SELECT MIN(SALARY) from EMPLOYEES;

--avg
select AVG(SALARY) from EMPLOYEES;

select round(AVG(SALARY)) from EMPLOYEES;
select round(AVG(SALARY),1) from EMPLOYEES;
select round(AVG(SALARY),2) from EMPLOYEES;

--sum
SELECT sum(SALARY) from EMPLOYEES;