
CREATE PROCEDURE [dbo].[usp_LoadNewPartnerOrientationAttendance] AS


/*
	Stored Procedure populates table with Yes if provider has 
	attended New Partner Orientation. If attended more than 
	once, max date is inserted into the table, one record 
	per provider.
 */

TRUNCATE TABLE NewPartnerOrientation

INSERT INTO NewPartnerOrientation
(ProviderMasterID, Lastname, FirstName, Status)
SELECT ProviderMasterID, Lastname, Firstname, Status
FROM ProviderMasterBase
WHERE CEPLEVEL <> 'P'


UPDATE NewPartnerOrientation
SET SFID = ProviderMaster.SFID
FROM NewPartnerOrientation, ProviderMaster
WHERE NewPartnerOrientation.ProviderMasterID = ProviderMaster.ProviderMasterID

--drop table #tempyes
CREATE TABLE #TEMPYES
(Name VARCHAR (100) NULL,
SFID VARCHAR (18) NULL,
NPODATE DATETIME NULL,
ProviderMasterID INT)

INSERT INTO #TEMPYES
(NAME, SFID, NPODATE)
SELECT Con.Name AS Name,
Con.Id AS SFID,
Max(From__c) AS MeetDate 
FROM AppStaging.dbo.SFDCPartHistoryStaging AS PH
JOIN AppStaging.dbo.SFDCContactStaging AS Con 
		ON PH.Contact__c = Con.Id
WHERE Partnership_History__c = 'NPO'
GROUP BY Con.Id, Con.Name

UPDATE #TEMPYES
SET ProviderMasterID = ProviderMaster.ProviderMasterID
FROM #TEMPYES, ProviderMaster
WHERE #TEMPYES.SFID = ProviderMaster.SFID

UPDATE NewPartnerOrientation
SET MostRecentAttendanceDate = #TEMPYES.NPODATE
FROM NewPartnerOrientation, #TEMPYES
WHERE NewPartnerOrientation.ProviderMasterID = #TEMPYES.ProviderMasterID

UPDATE NewPartnerOrientation
SET AttendedNewPartnerOrientation = 'Yes'
WHERE NewPartnerOrientation.MostRecentAttendanceDate is not null


UPDATE NewPartnerOrientation
SET AttendedNewPartnerOrientation = 'Not in SFDC'
WHERE NewPartnerOrientation.MostRecentAttendanceDate is null

