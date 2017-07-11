USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_KenticoSFDCDataIntegration]    Script Date: 10/20/2016 17:06:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER        PROCEDURE [dbo].[usp_KenticoSFDCDataIntegration] 
AS

/* 	Author: 	Reetika Singh
	Date:		8/5/2014
	Purpose:	Load SFDCaccount and Contract info over to Kentico for Public Websites. Using Kentico
				as a Linked Server
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

--SQL table for Marketing

--Load tracking info
INSERT INTO [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoadTracking 
SELECT GETDATE(), 0, '1/1/1900', 0

INSERT INTO [174.143.32.29].[stage.CEPAmerica.com].dbo.KenticoSFDCLoadTracking 
SELECT GETDATE(), 0, '1/1/1900', 0


--Combine all contracts into one comma separated column 
TRUNCATE TABLE [Prac_Loc]

INSERT INTO Prac_Loc
SELECT AccountID,
       STUFF((SELECT ',' + rtrim(convert(varchar(255),Practice_Location__c))
        FROM   Salesforce...Contract b
        WHERE  a.AccountId = b.AccountId
        AND Display_on_Public_Website__c = 'true'
        FOR XML PATH('')),1,1,'') Practice_Location__c, MIN(StartDate) StartDate
FROM   Salesforce...Contract a
WHERE (Year(a.EndDate) > Year(GETDATE())
OR a.EndDate IS NULL)
AND Display_on_Public_Website__c = 'true'
GROUP BY AccountID

--Add Scribe program

UPDATE Prac_Loc
SET PracticeLocation = PracticeLocation + ',' + 'Scribe'
WHERE AccountID IN (SELECT Id FROM SalesForce.dbo.Account
					WHERE Scribe_Program__c IS NOT NULL)



TRUNCATE TABLE KenticoSFDCLoad

INSERT INTO KenticoSFDCLoad
SELECT A.Id AccountId, A.Public_Name__c, A.BillingCity, A.BillingState, A.BillingStreet, A.BillingPostalCode,
Year(C.StartDate) StartDate, A.bdtot__c AS StaffedBeds, C.PracticeLocation, NULL, --A.Scribe_Program__c, 
A.Public_Community_Information__c, A.Public_Site_Description__c, A.vem__c AS Visits, --A.UCC_Visits__c, 
EDMD.Name AS EDMedicalDirector, HospMD.Name AS HMMedicalDirector, A.trauml90__c As TraumaLevel,
A.hospown__c as HospitalType, NULL, NULL
FROM Salesforce...Account A
JOIN [Prac_Loc] C
		ON A.Id = C.AccountId
LEFT OUTER JOIN Salesforce...Contact EDMD
		ON EDMD.Id = A.Medical_Director__c
LEFT OUTER JOIN Salesforce...Contact HospMD
		ON HospMD.Id = A.Hospitalist_Medical_Director__c
--WHERE Year(C.EndDate) > Year(GETDATE())+ 2
WHERE A.Name NOT IN 
	('George Bailey Detention Facility',
	'Incline Village Community Hospital',
	'John Muir Medical Center, Walnut Creek HBOT',
	'Marin OCH',
	'Saddleback Memorial Center for Advanced Wound Healing',
	'Samaritan Physical Therapy',
	'San Bernardino County Detention Facility',
	'San Bernardino Juvenile Detention & Assessment Centers',
	'San Mateo County Jail',
	'Vista Detention Facility')

--Special insert for Medamerica and MBSI

INSERT INTO KenticoSFDCLoad
SELECT A.Id AccountId, A.Name, A.BillingCity, A.BillingState, A.BillingStreet,
A.BillingPostalCode, 0 AS StartDate, 0 AS StaffedBeds,
'Corporate' AS PracticeLocation, A.Scribe_Program__c, A.Public_Community_Information__c, 
A.Public_Site_Description__c, A.vem__c AS Visits, --A.UCC_Visits__c, 
'' AS EDMedicalDirector, '' AS HMMedicalDirector, 
A.trauml90__c As TraumaLevel, A.hospown__c as HospitalType, NULL, NULL
FROM Salesforce...Account A
WHERE A.Name IN 
	('MedAmerica, Inc.',
	'MedAmerica Billing Services, Inc.',
	'MedAmerica Billing Services Inc-Ontario')
order by A.Name



--Update Visits count - to be pulled from SiteLine (on Contracts object)

	UPDATE KenticoSFDCLoad
	SET Visits = C.Visit_Count__c
	FROM SalesForce...Contract C
	WHERE C.AccountId = KenticoSFDCLoad.AccountId
	AND KenticoSFDCLoad.PracticeLocation = C.Practice_Location__c
	AND KenticoSFDCLoad.PracticeLocation not like '%Emergency%'

--SNF's dont need Visits/Amy

	UPDATE KenticoSFDCLoad
	SET Visits = NULL
	WHERE PracticeLocation = 'Skilled Nursing'
	
--ED visits
	UPDATE KenticoSFDCLoad
	SET Visits = C.Visit_Count__c
	FROM SalesForce...Contract C
	WHERE C.AccountId = KenticoSFDCLoad.AccountId
	AND KenticoSFDCLoad.PracticeLocation like '%Emergency%'
	AND C.Practice_Location__c = 'Emergency Medicine'

--Anes visits and MD

	UPDATE KenticoSFDCLoad
	SET AnesCases = C.Cases__c  ,
	AnesMedicalDirector = Con.Name
	FROM KenticoSFDCLoad KS
	JOIN SalesForce...Contract C
		ON C.AccountId = KS.AccountId
	left outer join Salesforce...Contact Con on Con.Id = C.Medical_Director__c
	WHERE Practice_Location__c = 'Anesthesia'
	AND Year(EndDate) = 2848



--by Eric - can we change “UCC” to “Ambulatory & Urgent Care”?


UPDATE KenticoSFDCLoad
SET PracticeLocation = REPLACE(PracticeLocation, 'UCC', 'Ambulatory & Urgent Care')

--SELECT * FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoad 
	
DELETE FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoad 

INSERT INTO [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoad 
SELECT * FROM KenticoSFDCLoad


DELETE FROM [174.143.32.29].[stage.CEPAmerica.com].dbo.KenticoSFDCLoad 

INSERT INTO [174.143.32.29].[stage.CEPAmerica.com].dbo.KenticoSFDCLoad 
SELECT * FROM KenticoSFDCLoad



UPDATE [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoadTracking 
SET RowsLoaded = (SELECT COUNT(*) FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoad),
LoadEndTime = GetDate()
WHERE RowsLoaded = 0
and LoadEndTime = '1/1/1900'
and LoadStartTime IN (SELECT MAX(LoadStartTime) 
					FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoadTracking)



UPDATE [174.143.32.29].[stage.cepamerica.com].dbo.KenticoSFDCLoadTracking 
SET RowsLoaded = (SELECT COUNT(*) FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoad),
LoadEndTime = GetDate()
WHERE RowsLoaded = 0
and LoadEndTime = '1/1/1900'
and LoadStartTime IN (SELECT MAX(LoadStartTime) 
					FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoadTracking)

--SELECT * FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoadTracking 



END


