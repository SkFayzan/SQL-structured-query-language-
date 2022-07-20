
-- extract month from date
select month ( hire_date)
from employees
--extract the year from date

select year ( hire_date)
from employees
--extract day from date
select day ( hire_date)
from employees
-- extract hire date only in the month of feb 
select hire_date
from employees
where month(hire_date) =2
--
select * from employees

--
select phone_number from employees 
where phone_number like '%507%'
--count()
select count(*) from employees
--max()
select max(salary) from employees
--min()
select min (hire_date) from employees
--sum()
select sum(salary) from employees
--avg()
select avg(salary) from employees

--find the total no of employee and total no of salary working for department_id=110

select count(*)as total_emp_no,sum(salary) as total_salary
from employees
where DEPARTMENT_ID=110