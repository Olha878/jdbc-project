select  * from EMPLOYEES;

/*
    ORDER BY
-it allows us to sort data base on provided column
-AS a Default it will  order the result ASCENDING ORDER (A-Z, 0-9)
-IF you want to sort it DESCENDING order we need to specify right after column name
*/

--display all employees based on salary in asc order

select  * from EMPLOYEES
order by SALARY ;

--same query
select  * from EMPLOYEES
order by SALARY ASC;

--display all employees based on salary in DESC order
select  * from EMPLOYEES
order by SALARY DESC ;

--display all employees based on their firstname desc
select * from EMPLOYEES
order by FIRST_NAME desc ;

--display all info where employee id is less than 120 and order them based on salary desc
select *
from EMPLOYEES
where EMPLOYEE_ID<120
order by SALARY desc;

--display all information from employees and order them based on first name asc last name desc
select * from EMPLOYEES
order by FIRST_NAME, LAST_NAME desc ;