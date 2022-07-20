--basic example of error handling

begin try

select 1/0 as Error;
end try

begin catch
select
ERROR_NUMBER() AS Errornumber,
ERROR_state() AS errorstate,
ERROR_SEVERITY() AS Errorseverity,
ERROR_PROCEDURE() AS Errorprocedure,
ERROR_LINE() AS Errorline,
ERROR_MESSAGE() AS Errormessage
end catch