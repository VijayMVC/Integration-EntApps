USE [ApplicationIntegration]
GO

/****** Object:  StoredProcedure [dbo].[usp_LMS_EmailVerifyResult]    Script Date: 08/24/2016 16:06:48 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_LMS_EmailVerifyResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_LMS_EmailVerifyResult]
GO

USE [ApplicationIntegration]
GO

/****** Object:  StoredProcedure [dbo].[usp_LMS_EmailVerifyResult]    Script Date: 08/24/2016 16:06:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_LMS_EmailVerifyResult]
@VerifyResult int
AS
/*
exec usp_LMS_EmailVerifyResult 0
*/
BEGIN
DECLARE @themsg NVARCHAR(200)
  SELECT @themsg =
  CASE WHEN @VerifyResult = 0 THEN 'Success: LMS Files transmitted.'
       ELSE 'Failure: LMS Files NOT transmitted.' END 
  EXEC msdb.dbo.sp_send_dbmail
	@recipients=N'singhr@medamerica.com; millerm@medamerica.com; myersr@medamerica.com; rafaelr@medamerica.com',
	@subject=@themsg

--	@recipients=N'myersr@medamerica.com',


END
GO

