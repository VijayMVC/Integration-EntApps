

CREATE        PROCEDURE [dbo].[usp_PA-NPHistoricalCountsArchive] 
AS

/* 	Author: 	Reetika Singh
	Date:		9/4/2014
	Purpose:	Archives old file. Moves new file and sends out an email
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	
	DECLARE @cmd VARCHAR(5000)

	DECLARE @LoadYYYYMM VARCHAR(100)
	SET @LoadYYYYMM = LTRIM(RTRIM(CONVERT(CHAR(10),GETDATE()-30,112)))

	--PRINT @LoadYYYYMM

	--SELECT @LoadYYYYMM

	DECLARE @FileName1 VARCHAR(500)
	DECLARE @NewFileName1 VARCHAR(500)

	--Archive old file

	SET @FileName1 = '"\\SACDC-SVRLBI10\LawsonDocuments\91_PA-NP Historical Counts\PA-NP Historical Counts.xls"'
	SELECT @FileName1

	SET @NewFileName1 = '"PA-NP Historical Counts - ' + @LoadYYYYMM + '.xls"'
	SELECT @NewFileName1


	SET @cmd = 'RENAME' + ' ' + @FileName1 + ' ' + @NewFileName1 
	EXEC Master..xp_cmdshell @cmd


	--Transfer and rename new file
	DECLARE @cmd1 VARCHAR(5000)


	SET @cmd1 = 'Copy /Y "F:\CEPIntegratedDB\Outgoing Files\Monthly\PA-NP Historical Counts_Final.xls" "\\SACDC-SVRLBI10\LawsonDocuments\91_PA-NP Historical Counts\PA-NP Historical Counts.xls"'  
	EXEC Master..xp_cmdshell @cmd1


	--Send out notification

	EXEC msdb.dbo.sp_send_dbmail
		@recipients=N'PANPchanges@medamerica.com',
		@copy_recipients =N'singhr@medamerica.com',
		@subject=N'PA-NP Historical Counts Report has been refreshed',
		@body=N'
	*** Please do not respond to this email.  This email has been automatically generated. ***'


    	







	

END


