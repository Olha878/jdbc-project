select substr(FIRST_NAME, 0, 1) || '.' || substr(LAST_NAME, 0, 1) || '.' as initials,
FIRST_NAME ||' '|| LAST_NAME as full_name
from EMPLOYEES;

--create view, table in a sql
create view EmployeeInfo as
select substr(FIRST_NAME, 0, 1) || '.' || substr(LAST_NAME, 0, 1) || '.' as initials,
FIRST_NAME ||' '|| LAST_NAME as full_name
from EMPLOYEES;

--drop view, delete table from the sql
drop view EmployeeInfo;