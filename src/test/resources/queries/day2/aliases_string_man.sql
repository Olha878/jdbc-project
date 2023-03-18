select * from employees;


/*
1. Column alieases--> it is a temporary name to show in display

2. Table alieases which we will learn later
Employees

*/
-- the query below second column name is "ROUND(AVG(SALARY))" which is not nice.
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) as "Average salary"
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --to remove null department id from result
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY)>6000
ORDER BY 2 ASC;

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) as Average_salary
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --to remove null department id from result
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY)>6000
ORDER BY 2 ASC;

--manager is asking display annual salary for all employees as annual_salary
Select FIRST_NAME,SALARY*12 AS ANNUAL_SALARY
FROM EMPLOYEES;

--NOTE --> WE ARE JUST DISPLAYING AND NOTHING WILL CHANGE IN DB(DATABASE)

--CONCAT FOR JAVA WE USE + , IN SQL WE USE ||
--I WANT TO GET FULLNAME COLUMN WHERE WE HAVE FIRSTNAME+' '+LASTNAME

SELECT FIRST_NAME||' '||LAST_NAME AS FULL_NAME
FROM EMPLOYEES;

--ADD @CYDEO.COM TO ALL THE EMAILS IN THE EMPLOYEES TABLE
SELECT EMAIL||'@cydeo.com' as Email
from EMPLOYEES;

select concat(email,'@cydeo.com') from EMPLOYEES;

--lowercase
select  lower(email||'@cydeo.com') from EMPLOYEES;

--uppercase

select  upper(email||'@cydeo.com') from EMPLOYEES;

--INITCAP
--it makes first letter uppercase
select initcap(EMAIL||'@cydeo.com') from EMPLOYEES;

--length
--it will count the length in the column that are provided
select EMAIL,length(email)as email_length from EMPLOYEES;

--display all employees where firstname length equals 6
select FIRST_NAME from EMPLOYEES
where length(FIRST_NAME)=6;

--another situation
select FIRST_NAME from EMPLOYEES
where FIRST_NAME like '______'

--how many first names we have with a six digits?
select count(*) from EMPLOYEES
where FIRST_NAME like '______';

--display initials from first name and last name --> S.K. --> N.K.

--SUBSTR(columnName,beginningIndex,numberOfChar)
select * from EMPLOYEES;
select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1)||'.' as initials
from EMPLOYEES;

-- if beginning index is 0, it will be treated as 1.
-- it doesn't matter what you entered as the first index(0,1), you will get the same result
select substr(FIRST_NAME,1,1)||'.'||substr(LAST_NAME,0,1)||'.' as initials
from EMPLOYEES;

-- when you use "-" before first index it will start from the end of the string.
-- if we don't specify number of char it will go till the end
select FIRST_NAME, substr(FIRST_NAME,-2,2) from EMPLOYEES;
select FIRST_NAME, substr(FIRST_NAME,-4) from EMPLOYEES; -- with no index