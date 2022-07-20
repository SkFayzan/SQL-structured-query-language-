use practice_udmy
go

select * from tblTransaction 

merge into tbltransaction as target
using tbltransaction as source
on target.employeenumber = source.employeenumber
and target.dateoftransaction = source.dateoftransaction
when not matched by target then
insert  ([amount], [dateoftransaction], [employeenumber])
values (source.amount, source.dateoftransaction, source.employeenumber)
when matched then
update set amount = target.amount + source.amount
when not matched by source then
delete;
