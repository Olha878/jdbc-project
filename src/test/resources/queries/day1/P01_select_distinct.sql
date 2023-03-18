select * from employees;

select * from departments;

select * from employees;

--SQL language is case insensitive

select department_name from departments;

select DEPARTMENT_ID,DEPARTMENT_NAME from DEPARTMENTS;

select * from DEPARTMENTS, EMPLOYEES;

select * from DEPARTMENTS, EMPLOYEES;
select EMPLOYEES.First_name, DEPARTMENT_NAME from DEPARTMENTS,EMPLOYEES;

--Distinct --> Display only different values from result

select FIRST_NAME from EMPLOYEES;
select distinct (FIRST_NAME) from EMPLOYEES;

select SALARY from EMPLOYEES;

select distinct (SALARY) from EMPLOYEES;

select FIRST_NAME,LAST_NAME from EMPLOYEES;

--Display all info from Locations table
select * from LOCATIONS;

--display country name and region id from counties table

select COUNTRY_NAME, REGION_ID from COUNTRIES;

--display job id and job title from table

select JOB_ID,JOB_TITLE from JOBS;

/* It shows different values from query result based on provided columns
  it will remove the duplicates */

  select  distinct  FIRST_NAME from EMPLOYEES;