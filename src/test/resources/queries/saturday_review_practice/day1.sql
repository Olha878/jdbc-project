--------------- SELECT ,WHERE, LIKE -------------------

--TASK 1 - display department names  from departments table
select DEPARTMENT_NAME
from DEPARTMENTS;

--TASK 2 - display first_name, last_name, department_id, salary from employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
from EMPLOYEES;

--TASK 3 - display first_name, last_name, department_id, salary from employees whose salary is higher than 9000
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
from EMPLOYEES
where SALARY > 9000;

--TASK 4 - display first_name, last_name, department_id, salary from employees
--         whose salary equals or more than 9000 and salary equals or less than 15000
--         sort result based on salary asc
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
from EMPLOYEES
where SALARY >= 9000
  and SALARY <= 15000
order by SALARY;
-- AS DEFAULT IT WILL SORT IN ASC ORDER

--OPT2->
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
from EMPLOYEES
where SALARY BETWEEN 9000 AND 15000 -- BETWEEN LOWER AND UPPER (THIS BOUNDARIES ARE INCLUDED)
order by SALARY ASC;


--TASK 5 -  display first_name, last_name, department_id, salary from employees
--          whose firstname is Peter and salary is bigger than 5000
--          sort result based on salary desc
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
from EMPLOYEES
where FIRST_NAME = 'Peter'
  and SALARY > 5000
order by SALARY desc;
-- INSTEAD OF SALARY WE CAN USE COLUMN NAME WHICH IS '4'


--TASK 6 - display country_id, country_name from countries table for region id 2 or 4
--         sort result based on region_id desc and country_name asc
--opt1-->
select COUNTRY_ID, COUNTRY_NAME, REGION_ID
FROM COUNTRIES
WHERE REGION_ID = 2
   OR REGION_ID = 4
ORDER BY REGION_ID DESC, COUNTRY_NAME ASC;

--opt2-->
select COUNTRY_ID, COUNTRY_NAME, REGION_ID
FROM COUNTRIES
WHERE REGION_ID in (2, 4)
ORDER BY REGION_ID DESC, COUNTRY_NAME ASC;

--TASK 7 -  display employee firstname and lastname as fullname , salary as annual salary  , job_id
--          whose job title starts with S
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, SALARY AS ANNUAL_SALARY, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S%';

--% --> refers 0 or more letter
-- _ --> refers to a single letter

-- whose job id starts with S and total 6 letter
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, SALARY AS ANNUAL_SALARY, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S_____';


-- TASK 8 - display country id and country name where country name ends with a
SELECT COUNTRY_ID, COUNTRY_NAME
from COUNTRIES
where COUNTRY_NAME like '%a';


-- TASK 9 -  display country id and country name where country name ends with a and third letter is i

SELECT COUNTRY_ID, COUNTRY_NAME
from COUNTRIES
where COUNTRY_NAME like '__i%a';


------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/
select FIRST_NAME, SALARY
from EMPLOYEES
where SALARY > 3000
order by lower(substr(FIRST_NAME, -3)) asc, SALARY desc;



--------------- GROUP BY, HAVING  -------------------

-- TASK 10- 1 -  how many city we have in each country from locations table

select COUNTRY_ID, count(CITY)
FROM LOCATIONS
GROUP BY COUNTRY_ID;

-- TASK 10- 2  - order them based on city count in desc
select COUNTRY_ID, count(CITY) AS CITY_COUNT
FROM LOCATIONS
GROUP BY COUNTRY_ID
ORDER BY COUNT(CITY) DESC;

-- TASK 10- 3 -  filter result where country id starts with C
select COUNTRY_ID, count(CITY)
FROM LOCATIONS
WHERE COUNTRY_ID LIKE 'C%'
GROUP BY COUNTRY_ID
ORDER BY COUNT(CITY) DESC;

-- TASK 10- 3 -  display country id if city count is bigger than 1
select COUNTRY_ID, count(CITY)
FROM LOCATIONS
GROUP BY COUNTRY_ID
HAVING COUNT(CITY) > 1
ORDER BY COUNT(CITY) DESC;

-- TASK 11 -1  How many employees is working for each department
SELECT DEPARTMENT_ID, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- TASK 11 -2  ignore null departments
SELECT DEPARTMENT_ID, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;
-- TASK 11 -3  display department id where employees count is less than 5
SELECT DEPARTMENT_ID, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)<5;

------- SUBQUERY -------
-- TASK 12 - Display those employees firstname,lastname and salary
--           who get higher salary than the employee whose employee_id is 132

--STEP1-->
SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 132;

--STEP2-->
SELECT  FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY>2100;

--STEP3--> COMBINE -> USE AS SUBQUERY
SELECT  FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY>(SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 132);

-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table
select * from EMPLOYEES;
-- manager id is 124 which is Kevin Mourgos (this is a manager for Peter Vargas)
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID = (SELECT MANAGER_ID FROM EMPLOYEES WHERE FIRST_NAME='Peter'and LAST_NAME='Vargas');

-- TASK 14 - Display Employees first_name,last_name who reports to 'Steven King'

--FIRST-- FIND EMPLOYEE ID FOR 'STEVEN KING'
SELECT EMPLOYEE_ID FROM EMPLOYEES
WHERE FIRST_NAME='Steven' and LAST_NAME='King'; -- employee id = 100

--SECOND-- FIND employees whom manager id = 100
select FIRST_NAME,LAST_NAME from EMPLOYEES
where MANAGER_ID=100;

--combine subquery ->
select FIRST_NAME,LAST_NAME from EMPLOYEES
where MANAGER_ID=(SELECT EMPLOYEE_ID FROM EMPLOYEES
                  WHERE FIRST_NAME='Steven' and LAST_NAME='King');

-- TASK 15 -  display all information who is getting 11th highest salary


select * from EMPLOYEES
where SALARY = (select min(SALARY)from (select distinct SALARY from EMPLOYEES order by SALARY desc)where ROWNUM<12);


-- TASK 16 - Display employees first_name,last_name who is working in Marketing department
select * from EMPLOYEES;
select * from DEPARTMENTS;

select FIRST_NAME, LAST_NAME from EMPLOYEES
where DEPARTMENT_ID=(select DEPARTMENT_ID from DEPARTMENTS where DEPARTMENT_NAME='Marketing');
--- DDL / DML ---


----- JOINS ----

-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name
select FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
from EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + THOSE DID NOT MATCH FROM LEFT TABLE
-- Display all first_name and department_name including the  employee without department
select FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
from EMPLOYEES E LEFT JOIN  DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--HOW MANY EMPLOYEES WORKS IN DEPARTMENT where department name starts with S
select DEPARTMENT_NAME, count(FIRST_NAME)
from EMPLOYEES E LEFT JOIN  DEPARTMENTS D
 ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
where DEPARTMENT_NAME like 'S%'
group by DEPARTMENT_NAME;

-- RIGHT OUTER JOIN
-- Display all first_name and department_name including the department without employee
select FIRST_NAME,DEPARTMENT_NAME
from EMPLOYEES E RIGHT JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID

-- FULL OUTER JOIN
-- Display all firstname and department name including the department without employees
-- and also employees without the department
select FIRST_NAME,DEPARTMENT_NAME
from EMPLOYEES E FULL JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--TASK 1-1
-- From the departments and locations tables,
-- display the department name, city, and state province for each department.
SELECT DEPARTMENT_NAME, CITY,STATE_PROVINCE
FROM DEPARTMENTS D JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

--TASK 1-2
-- display only department names ends with Sales
SELECT DEPARTMENT_NAME, CITY,STATE_PROVINCE
FROM DEPARTMENTS D JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE DEPARTMENT_NAME LIKE '%Sales';

-- TASK 2
-- From employees, departments, and locations tables,
-- find those employees whose first name contains a letter 'z'.
-- Return first name, last name, department, city, and state province.
select FIRST_NAME,LAST_NAME,DEPARTMENT_NAME,CITY,STATE_PROVINCE
from EMPLOYEES E join DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID= L.LOCATION_ID
WHERE FIRST_NAME LIKE '%z%';

--TASK 3
-- From the employees and departments table,
-- compute the average salary, number of employees for each department.
-- Return department name, average salary and number of employees.
SELECT  DEPARTMENT_NAME,ROUND(AVG(SALARY)) AS AVERAGE_SALARY, COUNT(EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEES
FROM DEPARTMENTS D JOIN EMPLOYEES E ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME;


--TASK 4
-- From the employees, departments, and locations tables,
-- find full name (first and last name), and salary of those employees
-- who work in any department located in Oxford .
SELECT FIRST_NAME,LAST_NAME AS FULL_NAME,SALARY
FROM EMPLOYEES
where DEPARTMENT_ID=(select DEPARTMENT_ID from DEPARTMENTS D join LOCATIONS L on D.LOCATION_ID=l.LOCATION_ID
                                        where CITY like 'Oxford');

-- to check HOW MANY EMPLOYEES HAVE DEPARTMENT ID= 80, WHICH IS CORRESPONDING FOR CITY OXFORD
select LOCATION_ID from LOCATIONS where CITY like 'Oxford';
select * from EMPLOYEES
where DEPARTMENT_ID=80;

--TASK 5
-- From the employees, departments, and locations tables,
-- find avg salary for each city
select CITY, ROUND(avg(SALARY)) AS AVEGARE_SALARY
from EMPLOYEES E JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS ON D.LOCATION_ID = LOCATIONS.LOCATION_ID
GROUP BY CITY;

-- TO CHECK HOW MANY EMPLOYEES FOR EACH CITY
SELECT  CITY, COUNT(EMPLOYEE_ID) FROM EMPLOYEES E JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
 JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
GROUP BY CITY;





----- SELF JOIN ---
-- Display  all employees and their  managers information
SELECT W.FIRST_NAME, W.LAST_NAME, M.FIRST_NAME, M.LAST_NAME FROM
  EMPLOYEES W JOIN EMPLOYEES M  ON W.MANAGER_ID=M.EMPLOYEE_ID;

-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
SELECT W.FIRST_NAME, W.LAST_NAME,W.SALARY, M.FIRST_NAME,M.LAST_NAME, M.SALARY
    FROM EMPLOYEES W JOIN EMPLOYEES M
ON W.EMPLOYEE_ID=M.EMPLOYEE_ID
WHERE W.SALARY>M.SALARY;


-------  SET OPERATORS ---

