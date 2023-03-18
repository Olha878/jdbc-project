select *
from employees;

select *
from EMPLOYEES
where ROWNUM < 11;

--display all info from employees who is getting 5 highest salary
-- this is a bad practice , since first it leaves only 5 rows from the table and then sorts it
select *
from EMPLOYEES
where ROWNUM < 6
order by SALARY desc;

--the way to do it
select *
from EMPLOYEES
order by SALARY desc;

-- we take "from" the table above, this way we can manipulate the result
select *
from (select *
      from EMPLOYEES
      order by SALARY desc)
where ROWNUM < 6;

--display all the info who is getting 5th highest salary
select distinct SALARY
from EMPLOYEES
order by SALARY desc;

--fisrt we need to find what is 5th highest salary
select min(salary)
from (select distinct SALARY from EMPLOYEES order by SALARY desc)
where ROWNUM < 6;

--who is making 5th highest salary
select *
from EMPLOYEES
where SALARY = (select min(SALARY)
                from (select distinct SALARY from EMPLOYEES order by SALARY desc)
                where rownum <= 5);

--how do you find who is making 37th highest salary
select *
from EMPLOYEES
where SALARY = (select min(SALARY)
                from (select distinct SALARY from EMPLOYEES order by SALARY desc)
                where ROWNUM <= 37);

--homework --> display all info who is getting 3rd lowest salary
select * from EMPLOYEES
order by SALARY asc;

select distinct SALARY from EMPLOYEES
order by SALARY asc;--2400

select * from EMPLOYEES
where SALARY = (select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc)
                                   where ROWNUM<=3);

-- who is getting 46th min salary dynamically
select * from EMPLOYEES
where SALARY = (select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc)
                where ROWNUM <47 );





