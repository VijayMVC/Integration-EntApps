CREATE PROCEDURE [dbo].[usp_LoadLawsonToBO] 
AS

/* 	Author: 	Reetika	
	Date:		1/08/2013
	Purpose:	Load Lawson Info for BO
	Revision:	As Per Iarvin and Cidy:
	
				So here are the fields that we need in the Lawson folder under
				provider master:
				1.	Hire date
				2.	Adjusted Hire Date
				3.	Ben Date 1 & 2
				4.	Process Level
				5.	Process Level description
				6.	Job Code
				7.	Position Level
				8.	Position Codes
				9.	Position Descriptions



*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
			
			
			TRUNCATE TABLE LawsonForBO
			
			INSERT INTO LawsonForBO
			SELECT ProviderMasterID, LE.EMPLOYEE, LE.EMP_STATUS,
					LAST_NAME, FIRST_NAME, DATE_HIRED As HireDate,
					ADJ_HIRE_DATE As AdjHireDate,
					LPE.BEN_DATE_1, LPE.BEN_DATE_2,
					LE.PROCESS_LEVEL, LP.Name AS Process_LevelDesc,
					LE.JOB_CODE, LJ.DESCRIPTION AS JobCodeDesc,
					LE.R_POSITION AS PositionCode,
					LPOS.POS_LEVEL
			FROM AppStaging.dbo.LawsonEMPLOYEE LE
			JOIN AppStaging.dbo.LawsonJOBCODE LJ ON LE.JOB_CODE = LJ.JOB_CODE
			JOIN AppStaging.dbo.LawsonPRSYSTEM LP ON LP.PROCESS_LEVEL = LE.PROCESS_LEVEL
			JOIN AppStaging.dbo.LawsonPAEMPLOYEE LPE ON LPE.EMPLOYEE = LE.EMPLOYEE
			JOIN AppStaging.dbo.LawsonPAEMPPOS LPOS ON LPOS.R_POSITION = LE.R_POSITION
									AND LPOS.EMPLOYEE = LE.EMPLOYEE
			JOIN LawsonIDMatch LID ON LID.LawsonEmpNo = LE.EMPLOYEE
			WHERE LPOS.END_DATE = '1753-01-01 00:00:00.000'
			ORDER BY LAST_NAME, FIRST_NAME

				
				
END
