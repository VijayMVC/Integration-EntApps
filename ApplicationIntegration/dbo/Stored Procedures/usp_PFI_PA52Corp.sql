


CREATE        PROCEDURE [dbo].[usp_PFI_PA52Corp] 
AS


SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	--declare @cmd nvarchar(1000)
	--set @cmd= 'DTSRun /S "sacdc-svrdevapp" /N "TEMP_PFITest" /E'
	exec master..xp_cmdshell 'DTSRun /S "sacdc-svrdevapp" /N "Lawson - Duplicate Data Entry PA52_PFI_Corp" /E'--, no_output

	
	
--	INSERT INTO PMBTest
--select * from ProviderMasterBase
--where ProviderMasterID = 1

--delete from PMBTest
--where ProviderMasterID <> 1

--select * from PMBTest
	

END



