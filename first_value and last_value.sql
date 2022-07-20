select * from employees

select * from employees_salary

select employee_id, first_name, salary,
first_value(first_name)
over( order by salary desc) as highest_salary
from employees 


--last_value()
select employee_id, first_name, salary,
last_value(first_name)
over( order by salary ) as lowest_salary
from employees 
