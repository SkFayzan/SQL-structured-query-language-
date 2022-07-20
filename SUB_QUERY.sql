use employees
select * from employees
SELECT * FROM tblDepartment


select avg(salary) from employees

  select * from employees-- outer query / main query
  where salary > (select avg(salary) from employees) --subquery / inner query


  --there are three type of sub query

  /* 1- SCALAR SUBQUERY
     2- MULTIPLE ROW SUBQUERY
	 3- CORRELATED SUBQURY*/

--1- SCALAR SUBQUERY(IT ALWAYES RETURN ONE ROW AND 1 COLUMN)
SELECT e.* 
FROM employees e
join(SELECT AVG(salary) SAL FROM employees) AVG_SAL
ON e.salary > AVG_SAL.SAL

          --or
select * from employees-- outer query / main query
  where salary > (select avg(salary) from employees) --subquery / inner query