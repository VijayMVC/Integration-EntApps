


CREATE   PROCEDURE [dbo].[usp_SFDC_CEPLevelMismatch]
AS
/* 	Author: 	Reetika
	Date:		12/19/2012
	Purpose:	In Salesforce:
					IF CEP Level in SFDC <> CEP Levels in Lawson then generate the report
	Revision:	*/


SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN 



	

		SELECT LID.ProviderMasterID, EC.Employee,
		CASE WHEN Charindex('Partner', EC.Code) <> 0 
			THEN LEFT(LTRIM(RTRIM(REPLACE(EC.Code, 'PARTNER', ''))), 1) 
			ELSE LEFT(EC.Code, 1) + Right(EC.Code, 2) END AS LawsonLevel,
		EC.DATE_ACQUIRED AS LawsonLevelEffDate
		INTO #TempEC
		FROM AppStaging.dbo.LawsonEMPCODES EC
		JOIN LawsonIDMatch LID
			ON EC.EMPLOYEE = LID.LawsonEmpNo
		WHERE EC.DATE_ACQUIRED = (SELECT MAX(DATE_ACQUIRED)
								FROM AppStaging.dbo.LawsonEMPCODES EC1
								WHERE EC.EMPLOYEE = EC1.EMPLOYEE)
		AND Year(EC.DATE_RETURNED) = 1753
		AND (CODE NOT LIKE '%GALEN%'
			AND CODE NOT LIKE '%SEMA%')
		AND CODE NOT LIKE 'PARTNER EM'
		ORDER BY EMPLOYEE 


		--DROP TABLE #TempSFLevel

		SELECT C.Provider_Master_ID__c AS PMID, 
		PL.PartnershipLevelCode, D.From__c, F.Staff_Status1__c, F.Staff_Status_Date__c
		INTO #TempSFLevel
		from Salesforce.dbo.Contact C
		join Salesforce...Facility__c F
			On C.Id = F.Contact__c
		join Salesforce...Department_History__c D
			On D.Contact__c = C.Id
		JOIN PartCodeLookup PL
			ON D.Partnership_History__c = PL.PartnershipLevel
		where D.To__c IS NULL
		AND F.To__c IS NULL
		AND F.Record_Status__c NOT LIKE 'Former%'
		AND F.Facility__c = D.Entity__c
		AND (F.Facility__c <> 'Sutter Emergency Medical Associates'
				OR F.Facility__c IS NULL)
		AND (F.Staff_Status1__c LIKE '%Partner%'
		OR F.Staff_Status1__c LIKE '%Hospitalist%')
		ORDER BY C.Provider_Master_ID__c

		--Including providers where there is a provider status but not Partnership History
		INSERT INTO #TempSFLevel
		SELECT C.Provider_Master_ID__c AS PMID, 
		'', '',
		F.Staff_Status1__c,
		F.Staff_Status_Date__c
		FROM Salesforce.dbo.Contact C
		JOIN Salesforce...Facility__c F
			On C.Id = F.Contact__c
		WHERE F.To__c IS NULL
			AND F.Record_Status__c NOT LIKE 'Former%'
			AND (F.Facility__c <> 'Sutter Emergency Medical Associates'
					OR F.Facility__c IS NULL)
			AND NOT EXISTS (SELECT *
						FROM Salesforce...Department_History__c D
						WHERE D.Contact__c = C.Id )
			AND C.Provider_Master_ID__c IS NOT NULL  
			AND (F.Staff_Status1__c LIKE '%Partner%'
				OR F.Staff_Status1__c LIKE '%Hospitalist%')
				
	

		DROP TABLE CEPMismatch


		SELECT DISTINCT PM.ProviderMasterID, EC.EMPLOYEE AS LawsonID, PM.LastName, PM.FirstName, 
			PM.CEPLevel AS PMLevel, 
			EC.LawsonLevel,
			LEFT(EC.LawsonLevelEffDate, 11) LawsonLevelEffDate,
			SL.PartnershipLevelCode AS SFDCPartLevel,
			LEFT(SL.From__c, 11) AS SFDCPartLevelFrom,
			SL.Staff_Status1__c AS SFDCStaffStatus,
			LEFT(SL.Staff_Status_Date__c,11) AS SFDCStaffStatusDate,
			PM.Status into CEPMismatch
			FROM ProviderMasterBase PM
			LEFT OUTER JOIN #TempEC EC
				ON EC.ProviderMasterID = PM.ProviderMasterID
			LEFT OUTER JOIN #TempSFLevel SL
				ON SL.PMID = PM.ProviderMasterID
			WHERE STATUS = 0
			and (Title like 'M%D%'
			or Title like 'D%O%')
			--and StaffGroup1 = 'CEP'
			and ((PM.CEPLevel <> EC.LawsonLevel
				OR PM.CEPLevel <> SL.PartnershipLevelCode
				OR EC.LawsonLevel <> SL.PartnershipLevelCode)
				OR 	SL.PartnershipLevelCode = ''
				OR (EC.LawsonLevelEffDate <> SL.From__c
				OR EC.LawsonLevelEffDate <> SL.Staff_Status_Date__c
				OR SL.From__c <> SL.Staff_Status_Date__c))
			ORDER BY PM.ProviderMasterID

--select * from CEPMismatch


--DROP TABLE #TempEC
--DROP TABLE #TempSFLevel


END



