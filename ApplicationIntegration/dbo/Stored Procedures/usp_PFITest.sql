
CREATE        PROCEDURE [dbo].[usp_PFITest] 
AS


SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	declare @cmd nvarchar(1000)
	set @cmd= 'DTSRun /S "sacdc-svrdevapp" /N "TEMP_PFITest" /E'
	exec master..xp_cmdshell 'DTSRun /S "sacdc-svrdevapp" /N "TEMP_PFITest" /E', no_output

	
	
--	INSERT INTO PMBTest
--select * from ProviderMasterBase
--where ProviderMasterID = 1

--delete from PMBTest
--where ProviderMasterID <> 1

--select * from PMBTest
	

END

