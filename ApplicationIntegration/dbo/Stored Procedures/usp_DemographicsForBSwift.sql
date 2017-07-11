USE [ApplicationIntegration]
GO

/****** Object:  StoredProcedure [dbo].[usp_DemographicsForBSwift]    Script Date: 08/02/2016 14:20:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DemographicsForBSwift]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DemographicsForBSwift]
GO

USE [ApplicationIntegration]
GO

/****** Object:  StoredProcedure [dbo].[usp_DemographicsForBSwift]    Script Date: 08/02/2016 14:20:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE        PROCEDURE [dbo].[usp_DemographicsForBSwift]
AS

/* 	Author: 	Reetika Singh
	Date:		11/19/2013
	Purpose:	Load bSwift DemographicFile
	Revision:	1. Add Additional Employee Status
				2. display complete Employee Status like A1, A2
				3. Add Adjusted Hire Date to identify rehires.
				4. For H-1B - Out of State H1B should be ‘OOSPhysH1B’
							California H1B should be ‘CAPHYSH1B’
				HCM - 1135 -
					The EM Fellowship Physicians will be added to Lawson HireSource = PHYSEMP
					Add these employee physicians to the Bswift Interface
					Use Benefit Class Code = CAEEPhys, OOSEEPhys
					Update the Benefit Class Code for H-1B physicians to use CAEEPhys
  HCM-1488 Modified to include Idaho 3600-3699
  HCM-1488 Modified to include NewJersey 3700-3799
  HCM-1503 Modified to include Illinois SNF 3800-3899

*/

SET QUOTED_IDENTIFIER OFF
SET ANSI_NULLS OFF

BEGIN

--Load this SP to make sure all the Exchange tables are updated

EXECUTE usp_LoadExchangeInfo;


--DROP TABLE #Test
--Refresh Lawson Tables from Lawson and LS_Emplookup from Web





SELECT DISTINCT
'MEDAMERICA' as [GROUP NUMBER],
RTRIM(E.FICA_NBR) as USERID,
E.EMPLOYEE as EMPLOYEEID,
'E' as RELATION,
E.FIRST_NAME as [FIRST NAME],
REPLACE (E.LAST_NAME, ',','') as [LAST NAME],
CASE
    --  Rev. 7/15/15   New BENEFIT_CLASS_CODE rows added as LOA & NBE.
    --
    WHEN E.EMP_STATUS IN ('L4', 'L5') THEN 'LOA'
    WHEN E.EMP_STATUS IN ('A2', 'A5', 'A6', 'A7',  'A8', 'A9') THEN 'NBE'
ELSE
	CASE
		  WHEN E.PROCESS_LEVEL = 9100 AND DEPARTMENT NOT IN (065, 093, 094, 310) THEN 'MedAmCorp'
		  WHEN E.PROCESS_LEVEL = 9100 AND DEPARTMENT IN (065, 093, 094, 310) THEN 'ACC' --NOT COMING THROUGH
		  WHEN E.PROCESS_LEVEL = 9200 AND E.SALARY_CLASS = 'S' THEN 'MBSISAL'
		  WHEN E.PROCESS_LEVEL = 9200 AND E.SALARY_CLASS = 'H' THEN 'MBSI'
		  WHEN E.PROCESS_LEVEL BETWEEN 1000 AND 1999 AND PAY_FREQUENCY = 4 THEN 'CAPHYS'
		  WHEN E.PROCESS_LEVEL BETWEEN 2100 AND 3899 AND PAY_FREQUENCY = 4 THEN 'OOSPhys'
		  WHEN E.PROCESS_LEVEL BETWEEN 1000 AND 7999 AND PAY_FREQUENCY = 3 THEN
					CASE WHEN E.PROCESS_LEVEL BETWEEN 1000 AND 1999 AND PA.HIRE_SOURCE IN ('VISA', 'PHYSEMP')
							THEN  'CAEEPHYS'
						 WHEN E.PROCESS_LEVEL BETWEEN 2100 AND 7999 AND PA.HIRE_SOURCE IN ('VISA', 'PHYSEMP')
							THEN  'OOSEEPHYS'
						 ELSE 'PA/NP/OSA' END
	ELSE 'NO BN CLASS' END
END AS [BENEFIT CLASS CODE],
PA.BEN_DATE_1 as [BENEFIT CLASS DATE],
CASE WHEN E.SALARY_CLASS = 'S' THEN E.PAY_RATE ELSE 0 END AS SALARY,
CASE WHEN E.SALARY_CLASS = 'H' THEN E.PAY_RATE ELSE 0 END AS [HOURLY RATE],
CASE WHEN E.SALARY_CLASS = 'H' THEN 0 ELSE '' END AS [HOURS PER WEEK],
CASE WHEN (E.PROCESS_LEVEL BETWEEN 1000 AND 7999) AND PAY_FREQUENCY = 4
		THEN PA.BEN_SALARY_1
		ELSE E.PRO_RATE_TOTAL END AS [BENEFITS BASE SALARY],
RTRIM(E.FICA_NBR) as [SOCIAL SECURITY NUMBER],
PA.BIRTHDATE as [DATE OF BIRTH],
PA.SEX as GENDER,
PA.BEN_DATE_1 AS [BENEFIT CALC. DATE],
E.DATE_HIRED as [HIRE DATE],
CASE WHEN E.ADJ_HIRE_DATE IS NULL
		THEN E.DATE_HIRED
		ELSE E.ADJ_HIRE_DATE END as [ADJ HIRE DATE],
CASE WHEN E.PROCESS_LEVEL = 9100 THEN 9105
	WHEN E.PROCESS_LEVEL = 9200 THEN 9202
	WHEN E.PROCESS_LEVEL BETWEEN 2300 AND 2399 THEN 1201 /*AEP*/
	WHEN E.PROCESS_LEVEL BETWEEN 1000 AND 1999 THEN 1101 /*CEP*/
	WHEN PROCESS_LEVEL BETWEEN 2200 AND 2299 THEN 2205 /*DEP*/
	WHEN PROCESS_LEVEL BETWEEN 2500 AND 2599 THEN 1601 /*IEP*/
	WHEN PROCESS_LEVEL BETWEEN 2700 AND 2799 THEN 2705 /*KEP*/
	WHEN PROCESS_LEVEL BETWEEN 2800 AND 2899 THEN 2805 /*MEP*/
	WHEN PROCESS_LEVEL BETWEEN 2900 AND 2999 THEN 2905 /*ILP*/
	WHEN PROCESS_LEVEL BETWEEN 2400 AND 2499 THEN 2405 /*TEP*/
	WHEN PROCESS_LEVEL BETWEEN 2600 AND 2699 THEN 1701 /*WAP*/
	WHEN PROCESS_LEVEL BETWEEN 2100 AND 2199 THEN 1501/*WEP*/
	WHEN PROCESS_LEVEL BETWEEN 3000 AND 3099 THEN 3005 /*DCP*/
	WHEN PROCESS_LEVEL BETWEEN 3100 AND 3199 THEN 3105 /*TNP*/
	WHEN PROCESS_LEVEL BETWEEN 3300 AND 3399 THEN 3300 /* Missouri*/
	WHEN PROCESS_LEVEL BETWEEN 3400 AND 3499 THEN 3400 /*Kansas*/
	WHEN PROCESS_LEVEL BETWEEN 3500 AND 3599 THEN 3500 /*Illinois*/
	WHEN PROCESS_LEVEL BETWEEN 3600 AND 3699 THEN 3600 /*Idaho*/
	WHEN PROCESS_LEVEL BETWEEN 3700 AND 3799 THEN 3700 /*NewJersey*/
	WHEN PROCESS_LEVEL BETWEEN 3800 AND 3899 THEN 3800 /*Illinois SNF*/
	ELSE CONVERT(int, (LEFT(PROCESS_LEVEL, 2) + '00')) END AS 'PAYROLL ID',
CASE
--    --  Rev. 7/15/15
--    -- New BENEFIT_CLASS_CODE logic for LOA & NBE part-time.
    WHEN E.EMP_STATUS IN ('A2', 'A5', 'A8') AND E.SALARY_CLASS = 'S' THEN '6'
    WHEN E.EMP_STATUS IN ('A2', 'A5', 'A8') AND E.SALARY_CLASS = 'H' THEN '2'
ELSE
	CASE
		 WHEN E.SALARY_CLASS = 'S' THEN '1' --1 = Full-Time Salary - logic is ok since excluding part time statuses
		 WHEN E.SALARY_CLASS = 'H' THEN '5' --5 = Full-Time Hourly - logic is ok since excluding part time statuses
		 ELSE NULL END
END AS [TIME STATUS],
CASE WHEN PROCESS_LEVEL IN ('9100') THEN 'MASM'
	 WHEN PROCESS_LEVEL IN ('9200') THEN 'MBSISM'
	 WHEN PROCESS_LEVEL NOT IN ('9100', '9200') AND E.SCHEDULE = 'MIDLEVEL'
		THEN 'MASM'
	 WHEN PROCESS_LEVEL NOT IN ('9100', '9200') AND PA.HIRE_SOURCE = 'VISA'
		THEN 'MASM'
	 ELSE 'MAM' END AS [PAY FREQUENCY], -- 1 = Monthly (Physicians), 2 = Semi-Montly
E.EMAIL_ADDRESS as [WORK E-MAIL],
'ADD USERNAME!!!!!!!!!!!!!!!!!!!!!!!' as [USER NAME], --INSERT WEB USER NAME HERE AS USER NAME----------------------
REPLACE (E.ADDR1, ',',' ') AS [HOME ADDRESS1] ,
REPLACE (E.ADDR2, ',',' ') AS [HOME ADDRESS2] ,
REPLACE (E.CITY, ',','') AS CITY,
E.STATE AS STATE,
E.ZIP AS ZIP,
--  Rev. 7/15/15
--CASE WHEN E.EMP_STATUS IN ('A1', 'A3', 'A4', 'L1', 'L2', 'L3', 'L6',  'S1', 'S2')
  CASE WHEN E.EMP_STATUS IN ('A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'L1', 'L2', 'L3', 'L4', 'L5', 'L6', 'S1', 'S2')
		THEN 'A'
		ELSE '' END AS [EMPLOYMENT STATUS], --REHIRE = 'Z' IF NEEDED, NEED TO DEAL WITH LOGIC (ADJ HIREDATE > DATEOFHIRE?)
'' AS [TERMINATION REASON], --NEED TO ADD AFTER GO-LIVE, ONLY PASSING ACTIVE FOR GO-LIVE OF OPEN ENROLLMENT
''AS [TERMINATION DATE], --NEED TO ADD AFTER GO-LIVE, ONLY PASSING ACTIVE FOR GO-LIVE OF OPEN ENROLLMENT
--NEED TO ADD TERMINATION DATE
E.EMP_STATUS AS [Division],  --PASS ACTUAL EMPLOYEE STATUS,
E.R_POSITION AS [Location], --PASS ACTUAL PRIMARY POSITION
E.PROCESS_LEVEL AS [BENEFIT FIELD 4], --PASS ACTUAL PROCESS LEVEL
PA.BEN_DATE_3,
CASE WHEN E.EMP_STATUS IN ('A1', 'A3', 'A4', 'L1', 'L2', 'L3', 'L6',  'S1', 'S2')
	THEN '1' ELSE '' END AS [Auto-Enroll],
LTRIM(RTRIM(PA.HIRE_SOURCE)) [EMPLOYEE TYPE]
INTO #Test
FROM AppStaging.dbo.LawsonEMPLOYEE E
JOIN AppStaging.dbo.LawsonPAEMPLOYEE PA
	ON  E.EMPLOYEE = PA.EMPLOYEE
--  Rev.   7/15/15
  --WHERE (EMP_STATUS IN ('A1', 'A3', 'A4', 'L1', 'L2', 'L3', 'L6', 'S1', 'S2')
 WHERE (EMP_STATUS IN ('A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'L1', 'L2', 'L3', 'L4', 'L5', 'L6', 'S1', 'S2')
AND E.PROCESS_LEVEL NOT BETWEEN 8000 AND 8200)
ORDER BY [BENEFIT CLASS CODE]



--No Username and email for MBSI from Lawson, it is populated later from exchange

UPDATE #Test
SET [WORK E-MAIL] = '',
[USER NAME] = ''
where [BENEFIT CLASS CODE] NOT IN ('MedAmCorp', 'ACC', 'CAPHYS',
										'OOSPhys', 'PA/NP/OSA', 'CAEEPHYS', 'OOSEEPHYS')

--Duplicates

DELETE FROM #Test
WHERE EMPLOYEEID IN (
			SELECT LP.EMPLOYEE
			FROM #Test T
			JOIN AppStaging.dbo.LawsonPAEMPLOYEE LP
				ON T.EMPLOYEEID = LP.EMPLOYEE
			WHERE USERID IN (
					SELECT USERID
					FROM #Test
					GROUP BY USERID, [LAST NAME], [FIRST NAME]
					HAVING COUNT(*) > 1
					)
			AND LP.BEN_SALARY_1 = 0)
			--AND LP.BEN_SALARY_2 = 0))
			--AND LP.BEN_SALARY_3 = 0
			--AND LP.BEN_SALARY_4 = 0
			--AND LP.BEN_SALARY_5 = 0))



--Clean Exchange data

DELETE FROM ExchangeDataImportEmployee
WHERE ipphone = 'ipphone'
or ISNUMERIC(ipphone) <> 1
or ipphone LIKE '%,%'
or ipphone LIKE '%+%'
or ipphone LIKE '%.%'

UPDATE ExchangeDataImportEmployee
SET PhoneNumber = ''
WHERE PhoneNumber IN ('Not Applicable', 'Not Available')


UPDATE ExchangeDataImportEmployee
SET PhoneNumber = REPLACE(LTRIM(RTRIM(PhoneNumber)), '+', '')

--FOR Providers from ExchangeData

UPDATE #Test
SET [WORK E-MAIL] = LTRIM(RTRIM(P.Email)),
	[USER NAME] = LTRIM(RTRIM(P.SamAccountName))
FROM #Test
JOIN LawsonIDMatch LE
	ON LE.LawsonEmpNo = #Test.EMPLOYEEID
JOIN ExchangeDataImport P
	ON P.MPID = LE.ProviderMasterID
WHERE --[BENEFIT CLASS CODE] IN ('MedAmCorp', 'ACC', 'CAPHYS', 'OOSPhys', 'PA/NP/OSA', 'CAPHYSH1B')
P.Email <> ''
and LE.LawsonEmpNo NOT LIKE '0%'
AND ISNUMERIC(MPID) = 1



--FOR MA and MBSI from ExchangeData

UPDATE #Test
	SET [WORK E-MAIL] = P.Email,
	[USER NAME] = P.SamAccountName
FROM #Test
JOIN ExchangeDataImportEmployee P
	ON P.ipphone = #Test.EMPLOYEEID







UPDATE #Test
SET [USER NAME] = Username
from #Test
JOIN PhysicianInfo P
	ON P.Email = #Test.[WORK E-MAIL]
where [USER NAME] like '%!!!%'
AND [BENEFIT CLASS CODE] IN ('MedAmCorp', 'ACC', 'CAPHYS', 'OOSPhys', 'PA/NP/OSA',
								'CAEEPHYS', 'OOSEEPHYS')
AND [WORK E-MAIL] <> ''
AND [LAST NAME] = P.LastName


--


--Clean up userNames


UPDATE #Test
SET [USER NAME] = ''
WHERE [USER NAME] LIKE '%!!!%'


UPDATE #Test
SET [USER NAME] = P.Username
FROM PhysicianInfo P
WHERE P.Email_cep = #Test.[WORK E-MAIL]
and [USER NAME] LIKE ''
AND #Test.[BENEFIT CLASS CODE] IN ('MedAmCorp', 'ACC', 'CAPHYS', 'OOSPhys', 'PA/NP/OSA',
										'CAEEPHYS', 'OOSEEPHYS')

--select * from #Test
--where [LAST NAME] like '%alba%'



--Partnership Level update

TRUNCATE TABLE BSwiftDemographics

INSERT INTO BSwiftDemographics
SELECT DISTINCT B.*, PM.PartnershipLevel
FROM #Test B
LEFT OUTER JOIN ProviderMaster PM
	ON PM.SSNFormatted = B.USERID
LEFT OUTER JOIN PartCodeLookup P
	ON P.PartnershipLevelCode = PM.PartnershipLevelCode

DELETE
FROM BSwiftDemographics
WHERE [LAST NAME] = 'TAM'
AND [FIRST NAME] = 'YONG YONG'




UPDATE BSwiftDemographics
SET [WORK EMAIL] = B.[WORK EMAIL],
[USER NAME] = B.[USER NAME]
FROM BSwiftDemographicsMaster B
WHERE B.EMPLOYEEID = BSwiftDemographics.EMPLOYEEID
AND (((BSwiftDemographics.[WORK EMAIL] NOT LIKE '%cep.com%'
AND BSwiftDemographics.[WORK EMAIL] NOT LIKE '%medamerica.com%')
OR BSwiftDemographics.[WORK EMAIL] = NULL
OR BSwiftDemographics.[WORK EMAIL] = ''))
--AND BSwiftDemographics.[BENEFIT CLASS CODE] IN ('MedAmCorp', 'ACC', 'CAPHYS', 'OOSPhys', 'PA/NP/OSA', 'CAPHYSH1B'))

--Update missing Email

--SELECT * FROM BSwiftDemographics
--WHERE [LAST NAME] like '%alba%'




--MasterFile Update




--Update Termed people
UPDATE BSwiftDemographicsMaster
SET [TERMINATIONREASON] = 1,
[EMPLOYMENT STATUS] = CASE WHEN E.EMP_STATUS LIKE 'T%'
					THEN 'T'
					ELSE 'Temp' END,
[BENEFIT FIELD 2] = E.EMP_STATUS,
[TERMINATIONDATE]= E.TERM_DATE
FROM BSwiftDemographicsMaster BM
JOIN AppStaging.dbo.LawsonEMPLOYEE E
		ON E.EMPLOYEE = BM.EMPLOYEEID
WHERE E.EMP_STATUS LIKE 'T%'



--Delete all T5 that also have active Lawson ID
DELETE
FROM BSwiftDemographicsMaster
WHERE EMPLOYEEID IN (SELECT EMPLOYEE
				FROM AppStaging.dbo.LawsonEMPLOYEE E
				WHERE E.EMP_STATUS = 'T5')


--Delete all other than termed employees to adjust all status changes

DELETE FROM BSwiftDemographicsMaster
WHERE TERMINATIONREASON <> 1


--REHIRE LOGIC


--Get the actual Rehire date and mark the record as rehire
UPDATE BSwiftDemographics
SET [HIRE DATE] = E.ADJ_HIRE_DATE
--[EMPLOYMENT STATUS] = 'z'
FROM AppStaging.dbo.LawsonEMPLOYEE E
WHERE E.FICA_NBR = BSwiftDemographics.USERID
AND E.ADJ_HIRE_DATE > E.DATE_HIRED
AND E.EMP_STATUS NOT LIKE 'T%'
AND USERID IN (SELECT USERID
					FROM BSwiftDemographicsMaster E
					WHERE E.[EMPLOYMENT STATUS] = 'T')



--Get rid of Rehired Terms
DELETE
FROM BSwiftDemographicsMaster
WHERE USERID IN (SELECT USERID
				FROM BSwiftDemographics E
				WHERE E.[EMPLOYMENT STATUS] NOT LIKE '%T')



/* 2/19/2014 As per Katrina
 Exclude all with Status Like L that have FTE = 0.5*/

DELETE
FROM BSwiftDemographics
WHERE EMPLOYEEID IN (SELECT EMPLOYEE
						FROM AppStaging.DBO.LawsonEMPLOYEE LE
						WHERE LE.FTE_TOTAL = '0.5'
)
AND [EMPLOYMENT STATUS] <> 'T'
AND [BENEFIT FIELD 2] LIKE 'L%'






--INSERT All new Employees (includes rehires)
INSERT INTO BSwiftDemographicsMaster
SELECT DISTINCT [GROUP NUMBER]
      ,[USERID]
      ,[EMPLOYEEID]
      ,[RELATION]
      ,[FIRST NAME]
      ,[LAST NAME]
      ,[BENEFIT CLASS CODE]
      ,[BENEFIT CLASS DATE]
      ,[SALARY]
      ,[HOURLY RATE]
      ,[HOURS PER WEEK]
      ,[BENEFITS BASE SALARY]
      ,[SOCIAL SECURITY NUMBER]
      ,[DATE OF BIRTH]
      ,[GENDER]
      ,[BENEFIT CALC DATE]
      ,[HIRE DATE]
      ,CASE WHEN [ADJ HIRE DATE] IS NULL
		THEN [HIRE DATE]
		ELSE [ADJ HIRE DATE] END as [ADJ HIRE DATE]
      ,[PAYROLL ID]
      ,[TIME STATUS]
      ,[PAY FREQUENCY]
      ,[WORK EMAIL]
      ,[USER NAME]
      ,[HOME ADDRESS1]
      ,[HOME ADDRESS2]
      ,[CITY]
      ,[STATE]
      ,[ZIP]
      ,[EMPLOYMENT STATUS]
      ,[TERMINATIONREASON]
      ,[TERMINATIONDATE]
      ,[BENEFIT FIELD 2]
      ,[BENEFIT FIELD 3]
      ,[BENEFIT FIELD 4]
      ,[BEN DATE 3]
      ,[AUTOENROLL]
      ,[EMPLOYMENT FIELD 1]
      ,''
      ,[EMPLOYEE TYPE]
FROM BSwiftDemographics
WHERE EMPLOYEEID NOT IN (SELECT EMPLOYEEID
						FROM BSwiftDemographicsMaster E)






SELECT *
FROM BSwiftDemographicsMaster T
--JOIN AppStaging.dbo.LawsonPAEMPLOYEE LP
--				ON T.EMPLOYEEID = LP.EMPLOYEE
--WHERE (LP.BEN_SALARY_1 = 0
--			AND LP.BEN_SALARY_2 = 0
--			AND LP.BEN_SALARY_3 = 0
--			AND LP.BEN_SALARY_4 = 0
--			AND LP.BEN_SALARY_5 = 0)
--AND T.[BENEFIT CLASS CODE] IN ('MedAmCorp', 'ACC', 'CAPHYS', 'OOSPhys', 'PA/NP/OSA')


UPDATE BSwiftDemographicsMaster
SET TERMINATIONDATE = '12/31/9999'
WHERE (TERMINATIONDATE = '1/1/1900'
OR TERMINATIONDATE IS NULL
OR TERMINATIONDATE = '01/01/1753')


UPDATE BSwiftDemographicsMaster
SET [BEN DATE 3]  = '12/31/9999'
WHERE ([BEN DATE 3]   = '1/1/1900'
OR [BEN DATE 3]   IS NULL
OR [BEN DATE 3]   = ''
OR [BEN DATE 3]   = '01/01/1753')


UPDATE BSwiftDemographicsMaster
SET [ADJ HIRE DATE] = '12/31/9999'
WHERE ([ADJ HIRE DATE] = '1/1/1900'
OR [ADJ HIRE DATE] IS NULL
OR [ADJ HIRE DATE] = '')


UPDATE BSwiftDemographicsMaster
SET TERMINATIONREASON = ''
WHERE TERMINATIONREASON IS NULL

UPDATE BSwiftDemographicsMaster
SET [EMPLOYMENT FIELD 1] = ''
WHERE [EMPLOYMENT FIELD 1] IS NULL
OR  [EMPLOYMENT FIELD 1] = 'NULL'


UPDATE BSwiftDemographicsMaster
SET [PAY FREQUENCY] = ''
WHERE [PAY FREQUENCY] IS NULL


UPDATE BSwiftDemographicsMaster
SET [USER NAME] = ''
WHERE [USER NAME] IS NULL

UPDATE BSwiftDemographicsMaster
SET ZIP = ''
WHERE ZIP IS NULL

--Already in file where Ben Sal has been made = 0
DELETE
FROM BSwiftDemographicsMaster
WHERE EMPLOYEEID IN (SELECT LP.EMPLOYEE
				FROM AppStaging.dbo.LawsonPAEMPLOYEE LP
				WHERE (LP.BEN_SALARY_1 = 0
							AND LP.BEN_SALARY_2 = 0
							AND LP.BEN_SALARY_3 = 0
							AND LP.BEN_SALARY_4 = 0
							AND LP.BEN_SALARY_5 = 0))
AND [BENEFIT CLASS CODE] IN ('MedAmCorp', 'ACC', 'CAPHYS', 'OOSPhys', 'PA/NP/OSA',
									'CAEEPHYS', 'OOSEEPHYS')


DELETE
FROM BSwiftDemographicsMaster
WHERE [BENEFIT CLASS CODE] = 'NO BN CLASS'
AND [EMPLOYMENT STATUS] = 'T'


--Final Email and UserName upload

UPDATE BSwiftDemographicsMaster
SET [WORK EMAIL] = ED.Email,
[USER NAME] = ED.SamAccountName
from LS_EmplLookup LE
join PhysicianInfo P ON P.ID = LE.ID
join ExchangeDataImport ED
	on ED.SamAccountName = P.Username
where BSwiftDemographicsMaster.EMPLOYEEID = LE.LawsonNum
AND  ([USER NAME] = ''
or [WORK EMAIL] = '')
and [BENEFIT CLASS CODE] NOT IN ( 'MBSI', 'MBSISAL')
and LE.LawsonNum not LIKE '0%'



--Fix UserName truncation issue by pulling in mismatched usernames from PhysicianInfo


UPDATE BSwiftDemographicsMaster
SET [USER NAME] = Ph.Username
FROM PhysicianInfo Ph
WHERE BSwiftDemographicsMaster.[LAST NAME] = Ph.LastName
	AND BSwiftDemographicsMaster.[FIRST NAME] = Ph.FirstName
	AND BSwiftDemographicsMaster.[WORK EMAIL] = Ph.Email_cep
	AND BSwiftDemographicsMaster.[USER NAME] <> Ph.Username

--Refresh and Update for PA Flag

UPDATE BSwiftDemographicsMaster
SET [PA FLAG] = ''

UPDATE BSwiftDemographicsMaster
SET [PA FLAG] = 'Y'
WHERE EMPLOYEEID IN (SELECT EMPLOYEE FROM AppStaging.dbo.LawsonPGEMPLOYEE
				WHERE GROUP_NAME = 'H-CEP PANP' )


--UPDATE Address for all populations -- Employees from Lawson and PA/Docs from PMB

UPDATE BSwiftDemographicsMaster
SET [HOME ADDRESS1] = REPLACE (E.ADDR1, ',',' ') ,
[HOME ADDRESS2] = REPLACE (E.ADDR2, ',',' '),
CITY = REPLACE (E.CITY, ',',''),
STATE = E.STATE,
ZIP = E.ZIP
FROM AppStaging.dbo.LawsonEMPLOYEE E
WHERE E.EMPLOYEE = BSwiftDemographicsMaster.EMPLOYEEID



UPDATE BSwiftDemographicsMaster
SET [HOME ADDRESS1] = REPLACE (LTRIM(RTRIM(PMB.Address1)), ',',' ') ,
[HOME ADDRESS2] = '',
CITY = REPLACE (LTRIM(RTRIM(PMB.City1)), ',',''),
STATE = LTRIM(RTRIM(PMB.State1)),
ZIP = LTRIM(RTRIM(PMB.ZipCode1))
FROM ProviderMasterBase PMB
JOIN ProviderMaster PM ON PM.ProviderMasterID = PMB.ProviderMasterID
WHERE PM.SSNFormatted = BSwiftDemographicsMaster.[SOCIAL SECURITY NUMBER]



--Get rid of Rehired Terms
DELETE
FROM BSwiftDemographicsMaster
WHERE USERID IN (SELECT USERID
						FROM BSwiftDemographicsMaster E
						WHERE E.[EMPLOYMENT STATUS] LIKE 'A%')
AND [EMPLOYMENT STATUS] LIKE 'T%'



--no MBSI email and user names till SSO go live

UPDATE BSwiftDemographicsMaster
SET [WORK EMAIL]= '',
[USER NAME] = ''
WHERE [BENEFIT CLASS CODE] IN ('MBSI', 'MBSISAL')


--For Web

TRUNCATE TABLE BSwiftDemographicsForWeb

INSERT INTO BSwiftDemographicsForWeb
SELECT [GROUP NUMBER], EMPLOYEEID, [FIRST NAME], [LAST NAME], [BENEFIT CLASS CODE],
[HIRE DATE], [WORK EMAIL],
CASE WHEN [USER NAME] = NULL
THEN ''
ELSE [USER NAME] END , [EMPLOYMENT STATUS]
FROM BSwiftDemographicsMaster


--Final Bswift Query for data transfer
--SELECT * FROM BSwiftDemographicsMaster
--where [BEN DATE 3] <> '12/31/9999'
--WHERE [EMPLOYMENT STATUS] <> 'T'
--UNION
--SELECT * FROM BSwiftDemographicsMaster
--WHERE [EMPLOYMENT STATUS] = 'T'
--AND TERMINATIONDATE > GETDATE() - 30












END

GO


