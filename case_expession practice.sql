select * from employees

select salary,
case 
when salary > '10000' then 'rich'
when salary between'6000' and  '8000' then 'middle_class'
when salary between '4000' and '6000' then 'poor'
else 'begger'
end as salary_report
from employees

select  max(salary) from employees
where salary <>(select max(salary) from employees)

select salary from employees
order by salary desc;


with cte as
(
select first_name,hire_date,

row_number() over( partition by first_name,hire_date order by first_name,hire_date) row_num

from employeesrecords
)
delete from cte
where row_num>1



select SUBSTRING(phone_number,1,4) from employees


Select INSTR(FIRST_NAME, BINARY'a') from employees where FIRST_NAME = 'donald';

begin tran
Select replace(first_name,'d','a') from employees
rollback tran;


Select * from employees 
where FIRST_NAME like 'a%';

select * from employees
where FIRST_NAME like '________r'

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) As employee_Name, Salary
FROM employees 
WHERE EMPLOYEE_ID IN 
(SELECT EMPLOYEE_ID FROM employees
WHERE Salary BETWEEN 5000 AND 10000);

---to get who reports to whom,use self join

select e.first_name + ' ' + e.last_name as employee1,m.first_name + ' ' + m.last_name as manager1
from employees e inner join employees m
on m.employee_id=e.MANAGER_ID
order by manager1

----left join is usful for show null valus which employes do not have assiend manager

select e.first_name + ' ' + e.last_name as employee1,m.first_name + ' ' + m.last_name as manager1
from employees e left join employees m
on m.employee_id=e.MANAGER_ID
order by manager1

SELECT first_name, hire_date, COUNT(*) as duplicate
FROM employeesrecords
GROUP BY first_name, hire_date

HAVING COUNT(*) > 1;

SELECT *,cast(employee_id as smallint) FROM employees WHERE  EMPLOYEE_ID % 2 = 1;

alter table employees alter column employee_id int;

SELECT * INTO new_employesrecord FROM employeesrecords;

SELECT * from new_employesrecord 

select * into new_employe_structure from employeesrecords
where 1=0;

select * from structure_employees

SELECT * FROM employeesrecords
INTERSECT
SELECT * FROM new_employesrecord;

(SELECT * FROM employeesrecords)
minus
(SELECT * FROM employees);

SELECT getdate();


select max (salary)
from employeesrecords
where salary
not in(select distinct top 2 salary from employeesrecords
order by salary desc)


update employees
set manager_id = replace(manager_id, '0', '1')

drop table employees