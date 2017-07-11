create PROCEDURE [dbo].[stpRunJobPR197Import]
WITH EXECUTE AS OWNER

AS



DECLARE @ReturnCode tinyint -- 0 (success) or 1 (failure)

exec msdb.dbo.sp_start_job @job_name ='PR197_Import';

 