select * from employees

--lag()--shows previous row value to print new colume(same value in leading in new row )


select  first_name, salary,MANAGER_ID,employee_id,
lag(EMPLOYEE_ID) over(/*partition by manager_id*/ order by first_name) as mylag
from employees

--lead()--shows after row value to print new colume(same value in leading in new row )

select  first_name, salary,MANAGER_ID,employee_id,
lead(EMPLOYEE_ID) over( order by first_name) as mylead
from employees