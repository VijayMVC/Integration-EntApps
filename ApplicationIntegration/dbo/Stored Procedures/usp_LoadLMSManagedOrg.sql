USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadLMSManagedOrg]    Script Date: 10/13/2016 10:24:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        PROCEDURE [dbo].[usp_LoadLMSManagedOrg] 
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

			
			TRUNCATE TABLE LMSManagedOrg

			--COO Sees all CEP Organization data

			--Emp_No for COO

			DECLARE @EMP_NO int

			SET @EMP_NO = (SELECT DISTINCT DF.MPID
							FROM Dir_TestFlatData DF
							JOIN ProviderMasterBase PMB ON PMB.ProviderMasterID = DF.MPID
							WHERE PMB.Status = 0
							AND DisplayTitle LIKE 'Chief Operations Officer%')

			--PRINT @EMP_NO


			INSERT INTO LMSManagedOrg
			SELECT *
			FROM (
			--COO is head of all Divisions
			SELECT @EMP_NO Emp_No, LTRIM(RTRIM(CD.divCode)) OrgCode, '1' IncludeHierarchy
			FROM CEP_division CD
			JOIN ProviderMasterBase PMB ON PMB.WebID = CD.dirMPID
			WHERE CD.dirMPID <> ''
			AND PMB.Status = 0


			--COO is head of all regions under his divs
			UNION

			SELECT @EMP_NO Emp_No, LTRIM(RTRIM(R.RegionCode)) OrgCode, '1' IncludeHierarchy
			FROM Regions R
			WHERE R.division <> ''


			--COO is head of all Sites
			UNION


			SELECT @EMP_NO Emp_No, LTRIM(RTRIM(HR.Code)) OrgCode, '1' IncludeHierarchy
			FROM Hospital_region HR
			WHERE TCstruct IS NOT NULL
			AND HR.status = 0
			AND HR.Region <> '') COO

			--ORDER BY dirMPID




			--Division heads see everything tied to division



			INSERT INTO LMSManagedOrg

			SELECT DISTINCT *
			FROM (

			--division head is head of division
			SELECT PMB.ProviderMasterID Emp_No,
					LTRIM(RTRIM(divCode)) OrgCode,
					'1' IncludeHierarchy
			FROM CEP_division CD
			JOIN ProviderMasterBase PMB ON PMB.WebID = CD.dirMPID
			WHERE CD.dirMPID <> ''
			AND PMB.Status = 0

			--div head is head of regions under his divs
			UNION

			SELECT PMB.ProviderMasterID Emp_No,
					LTRIM(RTRIM(R.RegionCode)) OrgCode,
					'1' IncludeHierarchy
			FROM CEP_division CD
			JOIN Regions R on LTRIM(RTRIM(R.division)) = LTRIM(RTRIM(CD.divCode))
			JOIN ProviderMasterBase PMB ON PMB.WebID = CD.dirMPID
			WHERE CD.dirMPID <> ''
			AND PMB.Status = 0



			--div head is head of Sites under his divs under his regions
			UNION


			SELECT PMB.ProviderMasterID Emp_No,
					LTRIM(RTRIM(HR.Code)) OrgCode,
					'1' IncludeHierarchy
			FROM Hospital_region HR
			JOIN Regions R ON LTRIM(RTRIM(HR.Region)) = LTRIM(RTRIM(R.RegionCode))
			JOIN CEP_division CD ON LTRIM(RTRIM(R.division)) = LTRIM(RTRIM(CD.divCode))
			JOIN ProviderMasterBase PMB ON PMB.WebID = CD.dirMPID
			WHERE CD.dirMPID <> ''
			AND HR.TCstruct IS NOT NULL
			AND PMB.Status = 0
			AND HR.status = 0
			AND HR.Region <> ''

			--ORDER BY dirMPID

			UNION

			--Region head sees their regions
			SELECT PMB.ProviderMasterID Emp_No,
					LTRIM(RTRIM(R.RegionCode)) OrgCode,
					'1' IncludeHierarchy
			FROM Regions R
			JOIN ProviderMasterBase PMB ON PMB.WebID = R.Region_Dir
			WHERE R.Region_Dir <> ''
				AND R.division <> ''
				AND PMB.Status = 0

			--Region head sees their regions and associated sites
			UNION

			SELECT PMB.ProviderMasterID Emp_No,
					LTRIM(RTRIM(HR.Code)) OrgCode,
					'1' IncludeHierarchy
			FROM Hospital_region HR
			JOIN Regions R ON LTRIM(RTRIM(HR.Region)) = LTRIM(RTRIM(R.RegionCode))
			JOIN ProviderMasterBase PMB ON PMB.WebID = R.Region_Dir
			WHERE R.Region_Dir <> ''
			AND TCstruct IS NOT NULL
			AND PMB.Status = 0
			AND HR.status = 0
			AND HR.Region <> ''


			--ORDER BY Region_Dir

			UNION

			--MD see orgs they are MD of

			SELECT PMB.ProviderMasterID Emp_No,
					LTRIM(RTRIM(HR.Code)) OrgCode,
					'1' IncludeHierarchy
			FROM Hospital_region HR
			JOIN ProviderMasterBase PMB ON PMB.WebID = HR.Site_Dir
			WHERE HR.Region <> ''
			AND HR.TCstruct IS NOT NULL
			AND HR.Site_Dir <> ''
			AND PMB.Status = 0
			AND HR.status = 0
			AND HR.Region <> ''
			) MO
			ORDER BY MO.Emp_No, MO.OrgCode


			DELETE FROM LMSManagedOrg
			WHERE Emp_No NOT IN (SELECT Emp_No FROM LMSEmployee)


			--Managed org for Corporate Division Heads

			INSERT INTO LMSManagedOrg
			SELECT DISTINCT EB.ProviderMasterID Emp_No,
					LTRIM(RTRIM(UPPER(LEFT(CD.division, 3)) + CONVERT(nvarchar(4), CD.ProcessLevel))) ORG_CODE,
					'1' IncludeHierarchy
			FROM CorporateDivisions CD
			JOIN EmployeeBase EB ON EB.LawsonID = CD.DivHeadID
	
	
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
