-- WQA TO FIND NTH\3RD\4TH\5TH...... HIGHEST SALARY FROM THE TABLE WITH OUT USING TOP/LIMIT KEYWORD
select salary from employeesrecords e1
where 2 =(select count(distinct salary)
         from employeesrecords e2
		 where e2.salary > e1.salary)

--SECOND HIGHEST SALARY FROM TABLE
select max(salary) from employeesrecords
where salary not in (select max(salary) from employeesrecords)

                --OR

select max(salary) from employeesrecords
where salary <> (select max(salary) from employeesrecords)
--FIND THE EMPLOYEE WITH THE SECOND HIGHEST SALARY

select * from employeesrecords
where salary in
(select max(salary) from employeesrecords
where salary <> (select max(salary) from employeesrecords))



--WAQ TO FIND THIRD-HIGHEST SALARY FROM THE EMPLOYEESRECORDS
select top 1 salary from (
select top 3 salary from employeesrecords
order by salary desc)result
order by salary

-- find 3^rd and nth salary with out using top() function/using inner query and outer query

select min(salary)
from
(select distinct top 3 salary
from employeesrecords
ordr by salary desc
) as o


--WAQ TO  FIND DUPLICATE ROWS IN A TABLE

select  count(salary)
from employeesrecords
group by salary
having count(salary) > 1

exec  example(stored procedure)

--WAQ TO CALCULATE THE EVEN AND ODD RECORDS FROM A TABLE

-- FOR EVEN
select * from employeesrecords where mod(EMPLOYEE_ID/2)=0

--FOR ODD
select * from employeesrecords where EMPLOYEE_ID%2=1

--WAQ TO DISPLAY THE FIRST AND LAST RECORD FROM THE TABLE

--FOR FIRST RECORD
select * from employeesrecords
where EMPLOYEE_ID = (select min(employee_id) from employeesrecords)							

-- FOR LAST RECORD

select * from employeesrecords
where EMPLOYEE_ID = (select max(employee_id) from employeesrecords)

--HOW DO YOU COPY ALL ROWS OF A TABLE USING SQL QUERY

SELECT * into employees
from employeesrecords

--copy perticular column from given table
select employee_id,salary,first_name into employees_salary
from employees

--copy only structure(blue print\only colume)
select * into structure_employees
from employees
where 3=4     --here we put the uncondition 3=4 because it's runs empety table only with columne name

select * from structure_employees

--WAQ TO RETRIVE THE LIST OF EMPLOYEES WORKING IN THE SAME DEPARTMENT
 SELECT DISTINCT E.EMPLOYEE_ID,E.FIRST_NAME, E.DEPARTMENT_ID
 FROM employees E,employees E1
 WHERE E.DEPARTMENT_ID = E1.DEPARTMENT_ID
 AND E.EMPLOYEE_ID <> E1.EMPLOYEE_ID

 --WAQ TO RETRIVE THE LAST 3 RECORDS FROM THE EMPLOYEE TABLE
 
 select top 3 * from employees
 order by EMPLOYEE_ID desc

 --FIND MAXIMUM SALARY FROM EACH DEPARTMNT

 SELECT dept_id,max(salary) as salary from employees
 group by dept_id 


--- ALTERNATIVE FOR TOP CLAUS IN SQL
-------TOP CLAUSE FUNCTION
select top 3 * from employees

---ALTRNATIVE(ROWCOUNT)
set rowcount 3
select * from employees
set rowcount 0