select * from employees;
select * from EMPLOYEES;

create table Developers(
                           Id_Number Integer primary key,
                           Names varchar(30),
                           Salary Integer
);

select * from DEVELOPERS;

create table Testers(
                        Id_Number Integer primary key,
                        Names varchar(30),
                        Salary Integer
);
select * from Testers;

insert into developers values (1, 'Mike', 155000);
insert into developers values (2, 'John', 142000);
insert into developers values (3, 'Steven', 850000);
insert into developers values (4, 'Maria', 120000);
insert into testers values (1, 'Steven', 110000);
insert into testers values(2, 'Adam', 105000);
insert into testers values (3, 'Lex', 100000);

commit work;

select * from DEVELOPERS
union
select * from TESTERS;

select NAMES from DEVELOPERS
    union
select NAMES from TESTERS;

select * from DEVELOPERS
union all
select * from TESTERS;

-- wrong data type (will not work)
select ID_NUMBER, NAMES from DEVELOPERS
union all
select NAMES,SALARY from TESTERS;

-- MINUS  SHOW RECORDS FROM QUERY1 THAT ARE NOT PRESENT IN QUERY2
select names from DEVELOPERS
minus
select names from TESTERS;

select names from TESTERS
minus
select names from DEVELOPERS;

--INTERSECT will return the common value
select names from DEVELOPERS
intersect
select names from TESTERS;
