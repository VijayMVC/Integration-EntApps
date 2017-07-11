
CREATE PROCEDURE [dbo].[usp_ReportStartDateMisMatch] AS
/*

 */

BEGIN

--DROP TABLE #Temp1

SELECT DISTINCT CC1.*, F.Record_Status__c, WH.CEPA_Contracted_Site__c, 
			WH.Galen_Contracted_Site__c, F.Rehire__c, WH.Practice_Location__c
INTO #Temp1
FROM (
	SELECT Provider_Master_ID__c, C.LastName, C.FirstName, C.Title__c, A.Name AS SiteName, 
		A.Id AS SiteID , 'xxxx' AS WebCode, CC.Estimated_Start_Date__c, CC.Contact__c
	FROM Salesforce...Concierge_Checklist__c CC
	JOIN Salesforce...Contact C ON CC.Contact__c = C.Id
	JOIN Salesforce...Account A ON A.Id = CC.Site_Location_1__c
	WHERE C.Provider_Master_ID__c IS NOT NULL
	UNION
	SELECT Provider_Master_ID__c, C.LastName, C.FirstName, C.Title__c, A.Name AS SiteName, 
		A.Id AS SiteID, 'xxxx' AS WebCode, CC.Estimated_Start_Date__c, CC.Contact__c
	FROM Salesforce...Concierge_Checklist__c CC
	JOIN Salesforce...Contact C ON CC.Contact__c = C.Id
	JOIN Salesforce...Account A ON A.Id = CC.Site_Location_2__c
	WHERE C.Provider_Master_ID__c IS NOT NULL
) CC1
JOIN Salesforce...Work_History__c WH ON WH.Contact__c = CC1.Contact__c
			AND CC1.SiteID = WH.Health_Care_Facility__c
JOIN Salesforce...Facility__c F ON F.Contact__c = CC1.Contact__c
WHERE WH.To__c IS NULL
AND (F.Record_Status__c NOT LIKE 'Former%'
AND F.Record_Status__c IS NOT NULL)
--AND (CEPA_Contracted_Site__c = 'true' OR Galen_Contracted_Site__c = 'true')
AND WH.Active__c = 'true'
--ORDER BY CC1.Name



/* Pal/Pom Triplets:
		ID					Name
		001A000000LwGa7IAF	Palomar Medical Center
		001A000000LwGesIAF	Pomerado Hospital
		001G000000oeeqYIAQ	Palomar Health Downtown Campus*/


INSERT INTO #Temp1
SELECT DISTINCT T.Provider_Master_ID__c, T.LastName, T.FirstName, T.Title__c, 
Healthcare_Facility_Name__c, Health_Care_Facility__c, 'xxxx' AS WebCode, 
Estimated_Start_Date__c, T.Contact__c, T.Record_Status__c, WH.CEPA_Contracted_Site__c,
WH.Galen_Contracted_Site__c, T.Rehire__c, WH.Practice_Location__c
FROM Salesforce...Work_History__c WH
JOIN (SELECT * FROM #Temp1 
	WHERE SiteID IN ('001G000000oeeqYIAQ',
					'001A000000LwGa7IAF',
					'001A000000LwGesIAF')
) T on T.Contact__c = WH.Contact__c
WHERE WH.Contact__c IN (
				SELECT Contact__c
				FROM #Temp1
				WHERE SiteID IN ('001G000000oeeqYIAQ',
							'001A000000LwGa7IAF',
							'001A000000LwGesIAF'))
AND Health_Care_Facility__c IN ('001G000000oeeqYIAQ',
							'001A000000LwGa7IAF',
							'001A000000LwGesIAF')
AND Health_Care_Facility__c NOT IN (SELECT SiteId
								FROM #Temp1
								WHERE SiteID IN ('001G000000oeeqYIAQ',
											'001A000000LwGa7IAF',
											'001A000000LwGesIAF')
									AND WH.Contact__c = #Temp1.Contact__c)
AND To__c IS NULL
--AND (WH.CEPA_Contracted_Site__c = 'true' OR WH.Galen_Contracted_Site__c = 'true')
AND WH.Active__c = 'true'
ORDER BY T.LastName, T.FirstName

/* Dignity Health Sacramento Triplets
		ID					Name
		001A000000LwGQZIA3	Mercy General Hospital
		001A000000LwGRPIA3	Mercy San Juan Medical Center
		001A000000LwGRgIAN	Methodist Hospital of Sacramento*/

INSERT INTO #Temp1
SELECT DISTINCT T.Provider_Master_ID__c, T.LastName, T.FirstName, T.Title__c, 
Healthcare_Facility_Name__c, Health_Care_Facility__c, 'xxxx' AS WebCode, 
Estimated_Start_Date__c, T.Contact__c, T.Record_Status__c, WH.CEPA_Contracted_Site__c,
WH.Galen_Contracted_Site__c, T.Rehire__c, WH.Practice_Location__c
FROM Salesforce...Work_History__c WH
JOIN (SELECT * FROM #Temp1 
	WHERE SiteID IN ('001A000000LwGQZIA3',
					'001A000000LwGRPIA3',
					'001A000000LwGRgIAN')
) T on T.Contact__c = WH.Contact__c
WHERE WH.Contact__c IN (
				SELECT Contact__c
				FROM #Temp1
				WHERE SiteID IN ('001A000000LwGQZIA3',
								'001A000000LwGRPIA3',
								'001A000000LwGRgIAN'))
AND Health_Care_Facility__c IN ('001A000000LwGQZIA3',
								'001A000000LwGRPIA3',
								'001A000000LwGRgIAN')
AND Health_Care_Facility__c NOT IN (SELECT SiteId
								FROM #Temp1
								WHERE SiteID IN ('001A000000LwGQZIA3',
								'001A000000LwGRPIA3',
								'001A000000LwGRgIAN')
									AND WH.Contact__c = #Temp1.Contact__c)
AND To__c IS NULL
--AND (WH.CEPA_Contracted_Site__c = 'true' OR WH.Galen_Contracted_Site__c = 'true')
AND WH.Active__c = 'true'
ORDER BY T.LastName, T.FirstName
						





/* Shermans Quintuplets
		ID					Name
		001A000000LwEezIAF	Advocate Sherman Hospital
		001G000000fS5I4IAK	Advocate Sherman Outpatient Centers - Algonquin
		001G000000fS5jEIAS	Advocate Sherman Outpatient Centers - Royal
		001G000000fS5kGIAS	Advocate Sherman Outpatient Centers - South Elgin
*/

INSERT INTO #Temp1
SELECT DISTINCT T.Provider_Master_ID__c, T.LastName, T.FirstName, T.Title__c, 
Healthcare_Facility_Name__c, Health_Care_Facility__c, 'xxxx' AS WebCode, 
Estimated_Start_Date__c, T.Contact__c, T.Record_Status__c, WH.CEPA_Contracted_Site__c,
WH.Galen_Contracted_Site__c, T.Rehire__c, WH.Practice_Location__c
FROM Salesforce...Work_History__c WH
JOIN (SELECT * FROM #Temp1 
	WHERE SiteID IN ('001A000000LwEezIAF',
						'001G000000fS5I4IAK',
						'001G000000fS5jEIAS',
						'001G000000fS5kGIAS')
) T on T.Contact__c = WH.Contact__c
WHERE WH.Contact__c IN (
				SELECT Contact__c
				FROM #Temp1
				WHERE SiteID IN ('001A000000LwEezIAF',
						'001G000000fS5I4IAK',
						'001G000000fS5jEIAS',
						'001G000000fS5kGIAS'))
AND Health_Care_Facility__c IN ('001A000000LwEezIAF',
						'001G000000fS5I4IAK',
						'001G000000fS5jEIAS',
						'001G000000fS5kGIAS')
AND Health_Care_Facility__c NOT IN (SELECT SiteId
								FROM #Temp1
								WHERE SiteID IN ('001A000000LwEezIAF',
												'001G000000fS5I4IAK',
												'001G000000fS5jEIAS',
												'001G000000fS5kGIAS')
								AND WH.Contact__c = #Temp1.Contact__c)
AND To__c IS NULL
--AND (WH.CEPA_Contracted_Site__c = 'true' OR WH.Galen_Contracted_Site__c = 'true')
AND WH.Active__c = 'true'
ORDER BY T.LastName, T.FirstName



			
			

--UPDATE #Temp1
--SET WebCode = HR.Code
--FROM ApplicationIntegration.dbo.Hospital_region HR
--WHERE HR.SFID = #Temp1.SiteID
--AND HR.HospitalName like '%Hospitalist%'
--AND #Temp1.Galen_Contracted_Site__c = 'true'



--UPDATE #Temp1
--SET WebCode = HR.Code
--FROM ApplicationIntegration.dbo.Hospital_region HR
--WHERE HR.SFID = #Temp1.SiteID
--AND HR.HospitalName NOT like '%Hospitalist%'
--AND #Temp1.CEPA_Contracted_Site__c = 'true'



UPDATE #Temp1
SET WebCode = HR.Code
FROM #Temp1
JOIN Salesforce.dbo.Contract Con
	ON Con.AccountId = #Temp1.SiteID
	AND Con.Practice_Location__c = #Temp1.Practice_Location__c
JOIN ApplicationIntegration.dbo.Hospital_region HR
	ON HR.TCstruct = Con.Id
WHERE HR.status = 0






--select * from #Temp1
--where WebCode = 'xxxx'

TRUNCATE TABLE ReportStartDtMisMatch


INSERT INTO ReportStartDtMisMatch

SELECT T.Provider_Master_ID__c AS MPID, T.FirstName, T.LastName, T.Title__c As Title, T.SiteName, 
T.Estimated_Start_Date__c AS SalesforceStartDate, Ph.DOS AS WebSchedule, T.Record_Status__c,
T.Rehire__c
FROM #Temp1 T
JOIN (SELECT P.ProviderMasterID, Min(DateOfService) DOS, SiteName, Site
		 FROM ApplicationIntegration.dbo.ProviderHoursDetail P
		 JOIN ApplicationIntegration.dbo.ProviderMasterBase PM
			ON P.ProviderMasterID = PM.ProviderMasterID
		 WHERE PM.Status IN (2, 0)
		 GROUP BY P.ProviderMasterID, SiteName, Site
		 HAVING MIN(DateOfService) >= (GETDATE ()- 360)
) PH on PH.ProviderMasterID = T.Provider_Master_ID__c
	AND PH.Site = T.WebCode
WHERE T.Estimated_Start_Date__c > PH.DOS
--AND FC.From__c > '10/1/2013'
ORDER BY T.FirstName, T.LastName, T.Estimated_Start_Date__c


















		
END

