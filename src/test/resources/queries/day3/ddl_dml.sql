select * from employees;

--create table syntax:
/*
  create table TableName(
    colName1 DataType Constrains,
    colName2 DataType Constrains(optional),
    colName3 DataType Constrains,
    ...
);
*/

--Create Table---

create table scrumteam_olga(
    emp_id INTEGER PRIMARY KEY,
    first_name varchar(30) not null,
    last_name varchar(20) not null,
    job_title varchar(20),
    salary Integer
);

/*
insert info tableName(column1, column2, ...)
values(value1, value2 ...);
*/

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
values (1,'Severus','Snape','Tester',13000);
--update salary
update SCRUMTEAM set SALARY=130000
where SALARY=13000;

select * from SCRUMTEAM;

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
values (2,'Harold','Finch','Developer',140000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
values (3,'Phoebe','Buffay','Scrum Master',90000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
values (4,'Michael','Scofield','PO',150000);

--save changes so that other people, connections can get the updates.
commit ;

/*
Update table_name
set column1 = value1,
column2 = value2
where condition;
*/

update SCRUMTEAM
set SALARY = SALARY+5000;

select * from SCRUMTEAM;

update SCRUMTEAM
set SALARY = 110000
where EMP_ID=3;

/*
delete from table_name
where condition
*/

delete from SCRUMTEAM
where EMP_ID = 4;

commit ;

--CRUD
--CREATE (insert)
--READ (select)
--UPDATE (update)
--DELETE (delete)

------Alter------
--add new column
alter table SCRUMTEAM add gender varchar(10);

select * from SCRUMTEAM;

update SCRUMTEAM
set GENDER = 'Male'
where EMP_ID = 1;

--Rename the column
alter table SCRUMTEAM rename column salary to annual_salary;

--Drop column (delete column)
alter table SCRUMTEAM drop column gender;

--rename table
alter table  SCRUMTEAM rename to agileteam;

select * from agileteam;


---Truncate-- will remove all the data from the table, but not remove the table intself
TRuncate table  agileteam;

--Drop table-- will delete the table with all the content

drop table agileteam;
commit ;
drop table scrumteam_olga;
commit;