USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadLMSJOb]    Script Date: 10/13/2016 10:24:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        PROCEDURE [dbo].[usp_LoadLMSJOb] 
AS

/* 	Author: 	Reetika Singh
	Date:		10/7/2016
	Purpose:	
	Revision:	

*/


BEGIN

SET NOCOUNT ON;
SET XACT_ABORT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION;

			/*7/14/2016 -- Job Number cannot be changed once the record is created.
							For Ex: 2BILLTR174 has JobNumber of 353,
							but in the new file has a Number of 356.
							Can we please ensure we continue with the previous number and
							use new number for new jobs. */



			--Insert new jobs only
			INSERT INTO LMSJobs (JOB_CODE, JOB_NAME, JOB_DOMAIN)
			SELECT DISTINCT LTRIM(RTRIM(LAE.R_POSITION)) R_POSITION,
					LTRIM(RTRIM(EB.Title)),
					'CEPAmerica' JOB_DOMAIN
			FROM LMSEmployee LMSE
			JOIN EmployeeBase EB ON LMSE.EMP_NO = EB.ProviderMasterID
			JOIN AppStaging.dbo.LawsonEMPLOYEE LAE ON LAE.EMPLOYEE = EB.LawsonID
			WHERE PRIMARY_JOB NOT IN ('PA/NP', 'PT', 'MD', 'Advanced Provider')
			AND EB.Status = 0
			AND LAE.EMP_STATUS NOT LIKE 'T%'
			AND LTRIM(RTRIM(LAE.R_POSITION)) NOT IN (SELECT JOB_CODE FROM LMSJobs)
			ORDER BY R_POSITION



	
	
		COMMIT TRANSACTION;
		
	END TRY
	
	BEGIN CATCH
		IF (XACT_STATE()) = -1
			ROLLBACK TRANSACTION;

		-- test if the transaction is committable
		IF (XACT_STATE()) = 1
			COMMIT TRANSACTION;

	END CATCH;

	
	

END
GO
