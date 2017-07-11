


CREATE        PROCEDURE [dbo].[usp_PFI_SendEmailCorp] 
AS


SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	exec master..xp_cmdshell 'DTSRun /S "sacdc-svrdevapp" /N "Lawson - Duplicate Data Entry Email Applicants Corp" /E'

	
	
END



