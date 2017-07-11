USE [ApplicationIntegration]
GO

/****** Object:  StoredProcedure [dbo].[usp_LMS_VerifySFTP]    Script Date: 08/24/2016 16:07:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_LMS_VerifySFTP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_LMS_VerifySFTP]
GO

USE [ApplicationIntegration]
GO

/****** Object:  StoredProcedure [dbo].[usp_LMS_VerifySFTP]    Script Date: 08/24/2016 16:07:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_LMS_VerifySFTP]
AS
/*
exec usp_LMS_VerifySFTP
*/
BEGIN
  SELECT CASE WHEN COUNT(*) = 6 THEN 0 ELSE 1 END VerifyResult
  FROM dbo.LMS_DataLoadSFTPOutput WHERE
  LineText IN (
  'local:Employee.txt => remote:/Inbound/Stage/DataSync/Employee.txt'
,'local:EmployeeJob.txt => remote:/Inbound/Stage/DataSync/EmployeeJob.txt'
,'local:EmployeeManaged Organization.txt => remote:/Inbound/Stage/DataSync/EmployeeManaged Organization.txt'
,'local:EmployeeOrg.txt => remote:/Inbound/Stage/DataSync/EmployeeOrg.txt'
,'local:Job.txt => remote:/Inbound/Stage/DataSync/Job.txt'
,'local:Organization.txt => remote:/Inbound/Stage/DataSync/Organization.txt'
)
END

GO

