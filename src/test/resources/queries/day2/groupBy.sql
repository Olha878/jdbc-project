--your manager is asking all jobs and  their average salary

select * from EMPLOYEES;
select distinct JOB_ID from EMPLOYEES;

--get me average salary for IT_PROG
SELECT AVG(SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--GET ME AVERAGE SALARY FOR 'AC_ACCOUNT'
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'AC_ACCOUNT';

--
SELECT AVG(SALARY), COUNT(*),SUM(SALARY), MIN(SALARY),MAX(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

--DISPLAY HOW MANY DEPARTMENTS WE HAVE IN EACH LOCATION
SELECT LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID
ORDER BY COUNT(*) DESC ;

SELECT LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID
ORDER BY 2 DESC ;  -- THE NUMBER INDICATED WHICH COLUMN TO SORT IN ORDER


--DISPLAY HOW MANY COUNTRIES WE HAVE IN EACH REGION
SELECT REGION_ID, COUNT(*)
FROM COUNTRIES
GROUP BY REGION_ID;

--SORT THEM BASED ON NUMBER OF COUNTRIES IN DESCENDING ORDER
SELECT REGION_ID, COUNT(*)
FROM COUNTRIES
GROUP BY REGION_ID
ORDER BY 2 DESC ;

SELECT REGION_ID, COUNT(*)
FROM COUNTRIES
GROUP BY REGION_ID
ORDER BY COUNT(*) DESC ;

-------------
--GET ME TOTAL SALARY FOR EACH DEPARTMENT FROM EMPLOYEES TABLE

SELECT DEPARTMENT_ID,SUM(SALARY), COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID,SUM(SALARY), COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL -- IF YOU DON'T WANT TO DISPLAY NULL VALUE IN THE RESULT
GROUP BY DEPARTMENT_ID;

--display job id where their avg salary more than 5K
select JOB_ID, AVG(SALARY)
from EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY)>5000;

--display DEPARTMENTS where their avg salary more than 6K
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY)>6000
ORDER BY 2 ASC;

--DISPLAY DUPLICATE FIRST_NAME FROM EMPLOYEES TABLE
SELECT FIRST_NAME, COUNT(*)
FROM EMPLOYEES
GROUP BY FIRST_NAME
HAVING COUNT(*)>1;

--DISPLAY DEPARTMENT ID WHERE EMPLOYEES COUNT IS BIGGER THAN 5
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>5
ORDER BY 2 DESC;
