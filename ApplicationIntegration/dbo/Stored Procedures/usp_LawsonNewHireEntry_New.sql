



CREATE                      PROCEDURE [dbo].[usp_LawsonNewHireEntry_New] 
AS

/* 	Author: 	Reetika Singh
	Date:		12/15/2010
	Purpose:	Load new hires into Lawson using PA31 and PA52.4
	Revision:	As per Jen H and Sarah Adams:
				Currently Lawson loads providers with a hire date = first shift on schedule. 
				For most midlevels this date has to be updated during the hiring process 
				because they have so many fluctuations to their first shift since an 
				orientation non-scheduled shift requires them to be added in Lawson. 
				These non-scheduled orientation shifts are really what is causing most of the 
				issues.
				If the Lawson team uploaded all providers with some sort of dummy date or 
				maybe date entered in MPDB this would require all hire dates to be manually 
				changed on our end. Since this is not an issue for physicians I would recommend 
				leaving the current process in place for physicians and only doing so for 
				midlevel providers.

				

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	TRUNCATE TABLE dbo.LawsonNewHireEntry

	--Physicians get their dates from schedule 
	SELECT DISTINCT dbo.ProviderMaster.ProviderMasterID,
		Min(ProviderHoursDetail.DateOfService) MINDOS, Site
	INTO #TempTbl1
	FROM  dbo.ProviderMaster, ProviderHoursDetail
		WHERE ( ProviderHoursDetail.ProviderMasterID=dbo.ProviderMaster.ProviderMasterID  )
		AND (ProviderMaster.Title LIKE 'D%O%'
			OR ProviderMaster.Title LIKE 'M%D%')
		GROUP BY dbo.ProviderMaster.ProviderMasterID, Site
		HAVING MIN(dateofservice) >= '1/1/2005'
		
		
	--PA's get their dates from Hire Date in SFDC 
	INSERT INTO #TempTbl1
	SELECT DISTINCT ProviderMaster.ProviderMasterID,
		ProviderMasterBase.HireDate MINDOS, SB.WebCode Site
	FROM  dbo.ProviderMaster
	JOIN  ProviderMasterBase 
			ON ProviderMasterBase.ProviderMasterID=dbo.ProviderMaster.ProviderMasterID
	JOIN SiteBase SB ON SB.ProviderMasterID = ProviderMaster.ProviderMasterID
	WHERE (ProviderMaster.Title NOT LIKE 'D%O%'
			AND ProviderMaster.Title NOT LIKE 'M%D%')
		AND HireDate >= '1/1/2012'
		AND ProviderMaster.CurrentProviderFlag = 'Y'
		AND SB.PrimarySite = 'Y'
	
	/* Used below to manually add a new-hire to the temp table
	THIS MUST BE DISABLED AFTER PROCESSING 
	Added 11/19/2012 to handle missed hires where provider 
	has already started working
	*/
	
	/*  Enable two lines below for manual hire */
	--INSERT INTO #TempTbl1 (ProviderMasterID, MINDOS, Site)
	--VALUES (6171, '2012-11-27', 'BER1')
	/* Lines above can be processed for one run */
	
	INSERT INTO dbo.LawsonNewHireEntry
	SELECT PM.ProviderMasterID,
		PMB.LastName,
		PMB.FirstName,
		LEFT(PMB.MiddleNameOrInitial, 1) AS MiddleInit ,
		PMB.MiddleNameOrInitial,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN PM.Title
			ELSE '' END AS Title,
		PMB.PreferredName,
		PMB.PhoneNbr1,
		PMB.CEPEmail,
		PMB.Address1,
		PMB.City1,
		PMB.State1,
		PMB.ZipCode1,
		'US' AS Country,
		NULL,
		PM.Gender,
		PMB.MaritalStatus,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN '.0001' ELSE NULL END As PayRate ,
		'Y' AS AutoDeposit,
		PM.DateOfBirth,
		PM.SSNFormatted,
		LL.ProcessLevel,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN CONVERT(VARCHAR(10),DATEADD(dd,-(DAY(TT.MINDOS)-1),TT.MINDOS),101) 
			ELSE CONVERT(VARCHAR(10),TT.MINDOS, 101) END AS DateOfHire,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN CONVERT(VARCHAR(10),DATEADD(dd,-(DAY(TT.MINDOS)-1),TT.MINDOS),101) 
			ELSE CONVERT(VARCHAR(10),TT.MINDOS, 101) END AS BenefitDate1,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN CONVERT(VARCHAR(10),DATEADD(dd,-(DAY(TT.MINDOS)-1),TT.MINDOS),101) 
			ELSE CONVERT(VARCHAR(10),TT.MINDOS, 101) END AS BenefitDate2,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN '500000' 
			ELSE NULL END AS BenefitSalary1,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN '500000' 
			ELSE NULL END AS BenefitSalary2,
		 CASE 
			WHEN PMB.StaffGroup1 = 'CEP' 
					AND (PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%')
				THEN 'PTNR-ED0'                  
			WHEN PMB.StaffGroup1 = 'CEP' 
					AND (PM.Title NOT LIKE '%M%D%' AND  PM.Title NOT LIKE '%D%O%') 
				THEN 'EPHYASS1' 
			WHEN PMB.StaffGroup2 = 'GALEN'
					AND (PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%')
				THEN 'HLST-HOSP'                  
			WHEN PMB.StaffGroup2 = 'GALEN' 
					AND (PM.Title NOT LIKE '%M%D%' AND  PM.Title NOT LIKE '%D%O%') 
				THEN 'HLSTASS1'END AS Pos,
		NULL,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN 'A1'
		ELSE 
			CASE WHEN PS.PositionStatus = 'Part Time'
				THEN 'A2'
		    	WHEN PS.PositionStatus = 'Full Time' 
				THEN 'A1' 
		     	WHEN PS.PositionStatus = 'Per Diem'
				THEN 'A6' END
		END AS STATUS,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN '1.0'
		ELSE 
			CASE WHEN PS.PositionStatus = 'Part Time'
				THEN '0.5'
		     	WHEN PS.PositionStatus = 'Full Time' 
				THEN '1.0' 
		     	WHEN PS.PositionStatus = 'Per Diem'
				THEN '0.25'END 
		END AS FTE,		
		CONVERT(VARCHAR(10),TT.MINDOS, 101) AS FirstWorkDate,
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN CONVERT(VARCHAR(8),DATEADD(dd,-(DAY(TT.MINDOS)-1),
				TT.MINDOS),112)
			ELSE CONVERT(VARCHAR(8),TT.MINDOS, 112) END As EffectiveDate,
		'Y',
		'Y',
		CASE WHEN PM.Title LIKE '%M%D%' OR PM.Title LIKE '%D%O%'
			THEN 'N'                  
			ELSE 'Y' END,
		'Y' ,
		Null,
		'Y', Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,
		 Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,
		 Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,
		 Null,Null,Null,Null,Null,Null, NULL
	FROM ProviderMasterBase PMB
	JOIN ProviderMaster PM ON PM.ProviderMasterID = PMB.ProviderMasterID
	JOIN ProviderStatusStaging PS ON PS.ProviderMasterID = PM.ProviderMasterID
	JOIN (SELECT ProviderMasterID, WebCode 
		FROM SiteBase
		WHERE PrimarySite = 'Y') AS SB ON SB.ProviderMasterID = PMB.ProviderMasterID
	JOIN LS_pLevelLookup AS LL ON LL.WebCode = SB.WebCode
	JOIN #TempTbl1 AS TT ON TT.ProviderMasterID = PMB.ProviderMasterID
			AND (TT.Site = SB.WebCode)
	WHERE PMB.Status = 0
	AND PS.Active = 'Y'
	--AND PMB.StaffGroup1 = 'CEP'
	AND PM.SSNFormatted NOT IN (SELECT DISTINCT FICA_NBR 
					FROM AppStaging.dbo.LawsonEMPLOYEE)  
	AND PM.SSNFormatted NOT IN (SELECT DISTINCT  FICA_NBR
					FROM AppStaging.dbo.LawsonAPPLICANT)  
-- 	
	

	
	
	UPDATE LawsonNewHireEntry
	SET PosPL = CASE WHEN Pos = 'HLST-HOSP'
					THEN 'HLSTHOSP' + '' + Convert(char(10), ProcessLevel)
					ELSE Pos + '' + Convert(char(10), ProcessLevel) END 

	UPDATE LawsonNewHireEntry
	SET Title = Replace(Title,'.', '')
	
	UPDATE LawsonNewHireEntry
	SET MaritalStatus = 'S'
	WHERE MaritalStatus IN ('Engaged', 'Single')
	
	UPDATE LawsonNewHireEntry
	SET MaritalStatus = 'M'
	WHERE MaritalStatus = 'Married'	
	
	UPDATE LawsonNewHireEntry
	SET MaritalStatus = 'P'
	WHERE MaritalStatus = 'Partnered'
	
	UPDATE LawsonNewHireEntry
	SET MaritalStatus = 'D'
	WHERE MaritalStatus = 'Divorced'
	
	UPDATE LawsonNewHireEntry
	SET MaritalStatus = 'R'
	WHERE MaritalStatus = 'Separated'
	
	UPDATE LawsonNewHireEntry
	SET MaritalStatus = 'W'
	WHERE MaritalStatus = 'Widowed'

	
	DROP TABLE #TempTbl1
	
	


	--creates DME file for PFI upload

	Exec usp_LawsonNewHireEntry_PA31DME
	

END




