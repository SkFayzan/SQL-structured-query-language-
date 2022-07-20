use practice_udmy

--pivot function
with mytable as
(select year(dateoftransaction) as TheYear, month(dateoftransaction) as TheMonth, amount from tblTransaction)


select *  from mytable
pivot

(sum(amount) for themonth in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) as mypvt
order by TheYear


--another way to create p[ivot table    in this query we defind the common table information table (mytable) replace with the modifiled table
select * from 
(select year(dateoftransaction) as THEYEAR, month(dateoftransaction) as THEMONTH, AMOUNT FROM tblTransaction)
as mytable
pivot(sum(amount) for THEMONTH in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) as pivottable
order by theyear


--ho to replac null values  

with mytable as
(select year(dateoftransaction) as TheYear, month(dateoftransaction) as TheMonth, amount from tblTransaction)


select THEYEAR, ISNULL([1],0) AS [1],
                ISNULL([2],0) AS [2],
				ISNULL([3],0) AS [3],
				ISNULL([4],0)AS [4],
				ISNULL([5],0) AS [5],
				ISNULL([6],0) AS [6],
				ISNULL([7],0) AS [7],
				ISNULL([8],0) AS [8],
				ISNULL([9],0) AS [9],
				ISNULL([10],0) AS [10],
				ISNULL([11],0) AS [11],
				ISNULL([12],0) AS [12]  from mytable
pivot

(sum(amount) for themonth in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) as mypvt
order by TheYear

--COPY THE PIVOT TABLE INTO ANATHORE TABLE JUST USED INTO_TABLE NAME

with mytable as
(select year(dateoftransaction) as TheYear, month(dateoftransaction) as TheMonth, amount from tblTransaction)


select THEYEAR, ISNULL([1],0) AS [1],
                ISNULL([2],0) AS [2],
				ISNULL([3],0) AS [3],
				ISNULL([4],0)AS [4],
				ISNULL([5],0) AS [5],
				ISNULL([6],0) AS [6],
				ISNULL([7],0) AS [7],
				ISNULL([8],0) AS [8],
				ISNULL([9],0) AS [9],
				ISNULL([10],0) AS [10],
				ISNULL([11],0) AS [11],
				ISNULL([12],0) AS [12] INTO TBLPIVOT2 from mytable
pivot

(sum(amount) for themonth in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) as mypvt
order by TheYear


--UNPIVOT TABLE SAME AS PIVOT BUT HERE THE AGGRIGATE FUNCTION DOES NOT USE EX-MAX ,SUM,AVG

SELECT * FROM TBLPIVOT2
UNPIVOT (AMOUNT FOR MONTYH IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS TBLUNPIVOT

WHERE AMOUNT <> 0