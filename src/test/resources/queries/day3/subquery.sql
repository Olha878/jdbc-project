select *
from employees;

--Display all info who is making maximum salary
select max(SALARY)
from EMPLOYEES;
--24000
-- if we know max salary can we find a person with that salary?
select *
from EMPLOYEES
where SALARY = 24000;

--dynamic result

select *
from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES);

--Display all the info who is getting min salary
select *
from EMPLOYEES
where SALARY = (select min(SALARY) from EMPLOYEES);

--display all info who is getting second highest salary
--fint max salary from employees
select max(SALARY)
from EMPLOYEES;

--second max salary
select max(SALARY)
from EMPLOYEES
where SALARY < 24000;

-- who is making this salary
select *
from EMPLOYEES
where SALARY = 17000;

--make it dynamic
select *
from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES where SALARY < (select max(SALARY) from EMPLOYEES));

--display all info who is getting more than average
select round(avg(SALARY))from EMPLOYEES;

select * from EMPLOYEES
where SALARY>(select avg(SALARY) from EMPLOYEES);


