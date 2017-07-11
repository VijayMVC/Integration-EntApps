


CREATE        PROCEDURE [dbo].[usp_PFI_SendEmail] 
AS


SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	exec master..xp_cmdshell 'DTSRun /S "sacdc-svrdevapp" /N "Lawson - Duplicate Data Entry Email Applicants" /E'

	
	
END



