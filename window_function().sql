

select * from(
select EMPLOYEE_ID,job_id,
row_number() over(partition by job_id order by employee_id) as dp from employeesrecords)e
where e.dp <9;

from employeesrecords
group by DEPARTMENT_ID

-- rank() function
select employee_id,job_id,salary,
rank() over(partition by job_id order by salary desc) as rank ,
dense_rank() over(partition by job_id order by salary desc ) as dense_rank,
row_number() over(partition by job_id order by salary desc) as row_num
from employeesrecords

--fetch a query to display if the salary of an employees is higher, lower or equal to the previous employee

select employee_id,job_id,salary,
lag(salary) over(partition by job_id order by salary desc) as lag 
from employeesrecords

--same query but specifies no null/skep the values in 2 step in previous employees salary

select employee_id,job_id,salary,
lag(salary,2,0) over(partition by job_id order by salary desc) as lag 
from employeesrecords

--lead()
select employee_id,job_id,salary,
lag(salary) over(partition by job_id order by salary desc) as lag ,
lead(salary) over(partition by job_id order by salary desc) as lead
from employeesrecords

--lag() with cas statement

select e.employee_id,e.job_id,e.salary,
lag(salary) over(partition by job_id order by salary desc) as lag ,
case 
when e.salary >lag(salary) over(partition by job_id order by salary desc) then 'higher than previous employee'
when e.salary <lag(salary) over(partition by job_id order by salary desc) then 'lower than previous employee'
when e.salary =lag(salary) over(partition by job_id order by salary desc) then 'same as than previous employee'
end sal_range

from employeesrecords as e
