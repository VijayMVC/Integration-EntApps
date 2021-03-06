USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadLMSEmpOrg]    Script Date: 11/08/2016 13:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER        PROCEDURE [dbo].[usp_LoadLMSEmpOrg] 
AS

/* 	Author: 	Reetika Singh
	Date:		10/7/2016
	Purpose:	
	Revision:	11/8/2016 -- Removed duplicate for 8112

*/


BEGIN

SET NOCOUNT ON;
SET XACT_ABORT ON;

	BEGIN TRY
	
		BEGIN TRANSACTION;


			TRUNCATE TABLE LMSEmployeeOrg

			INSERT INTO LMSEmployeeOrg
			SELECT DISTINCT LEO.* FROM (
			SELECT LE.EMP_NO,
				LTRIM(RTRIM(SB.WebCode)) ORG_CODE,
				LE.[START_DATE] JOIN_DATE,
				CASE WHEN LTRIM(RTRIM(SB.PrimarySite)) = 'Y'
					THEN 1 ELSE 0 END [PRIMARY]
			FROM LMSEmployee LE
			JOIN SiteBase SB ON SB.ProviderMasterID = LE.EMP_NO
			UNION
			SELECT LE.EMP_NO,
				LTRIM(RTRIM(SB.WebCode)) ORG_CODE,
				LE.[START_DATE] JOIN_DATE,
				CASE WHEN LTRIM(RTRIM(SB.PrimarySite)) = 'Y'
					THEN 1 ELSE 0 END [PRIMARY]
			FROM LMSEmployee LE
			JOIN EmployeeSiteBase SB ON SB.ProviderMasterID = LE.EMP_NO
			) LEO
			JOIN LMSOrg LO ON LO.ORG_CODE = LEO.ORG_CODE
			ORDER BY LEO.EMP_NO

		/*11/8/2016 --		Removing duplicate record for EMP_NO 8112 - it is because of multiple roles at a site		*/
			
		
		DELETE 
		FROM LMSEmployeeOrg
		WHERE EMP_NO = 8112
			AND [PRIMARY] = 0
			AND ORG_CODE = 'ADV1'
			AND EXISTS (SELECT * 
						FROM LMSEmployeeOrg
						WHERE EMP_NO = 8112
						AND [PRIMARY] = 1
						AND ORG_CODE = 'ADV1')
		
		
		
		
		
	
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


