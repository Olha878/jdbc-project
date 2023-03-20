select * from EMPLOYEES;
-- 1. Display full addresses from locations table in a single column
select STREET_ADDRESS||', '||city||' '||POSTAL_CODE as full_address from LOCATIONS;

-- 2. Display all information of the employee who has the minimum salary in employees
-- table
select * from EMPLOYEES
where SALARY=(select min(SALARY)from EMPLOYEES);

-- 3. Display the second minimum salary from the employees
select SALARY from EMPLOYEES
    where SALARY= (select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc)
                                      where ROWNUM<=2);

-- 4. Display all information of the employee who has the second minimum salary
select * from EMPLOYEES
where SALARY=(select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc) where ROWNUM<3);

-- 5. List all the employees who are making above the average salary;
select * from EMPLOYEES
where SALARY>(select avg(SALARY) from EMPLOYEES);

-- 6. List all the employees who are making less than the average salary
select * from EMPLOYEES
where SALARY<(select avg(SALARY) from EMPLOYEES);

-- 7. Display manager name of 'Neena'
select FIRST_NAME from EMPLOYEES
where EMPLOYEE_ID=(select EMPLOYEE_ID from EMPLOYEES
                                    where FIRST_NAME='Neena');

-- 8. Find the 3rd maximum salary from the employees table (do not include duplicates)
select distinct SALARY from EMPLOYEES
where SALARY = (select  min(SALARY) from (Select distinct SALARY from EMPLOYEES order by SALARY desc)
                                            where ROWNUM <=3);

-- 9. Find the 5th maximum salary from the employees table (do not include duplicates)
select distinct SALARY from EMPLOYEES
where SALARY = (select  min(SALARY) from (Select distinct SALARY from EMPLOYEES order by SALARY desc)
                where ROWNUM <=5);

Select  distinct SALARY from EMPLOYEES order by SALARY desc;

-- 10. Find the 7th maximum salary from the employees table (do not include duplicates)
select distinct SALARY from EMPLOYEES
where SALARY = (select min(SALARY) from (Select distinct SALARY from EMPLOYEES order by SALARY desc)
                where ROWNUM <=7);

-- 11. Find the 10th maximum salary from the employees table (do not include duplicates)
select distinct SALARY from EMPLOYEES
where SALARY = (select distinct min(SALARY) from (Select distinct SALARY from EMPLOYEES order by SALARY desc)
                where ROWNUM <=10);

-- 12. Find the 3rd minimum salary from the employees table (do not include duplicates)
select distinct SALARY from EMPLOYEES
where SALARY = (select max(SALARY) from(select distinct SALARY from EMPLOYEES order by SALARY asc)
                                   where ROWNUM<=3);
-- 13. Find the 5th minimum salary from the employees table (do not include duplicates)
select distinct SALARY from EMPLOYEES
where SALARY = (select max(SALARY) from(select distinct SALARY from EMPLOYEES order by SALARY asc)
                where ROWNUM<=3);