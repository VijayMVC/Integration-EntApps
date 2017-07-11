USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_KenticoSFDCAnesProviders]    Script Date: 10/20/2016 17:04:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER        PROCEDURE [dbo].[usp_KenticoSFDCAnesProviders] 
AS

/* 	Author: 	Reetika Singh
	Date:		9/10/2015
	Purpose:	Load Anesthesia providers for Kentico
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

--SQL table for Marketing

--Load tracking info
INSERT INTO [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCAnesProvidersTracking 
SELECT GETDATE(), 0, '1/1/1900', 0

INSERT INTO [174.143.32.29].[stage.CEPAmerica.com].dbo.KenticoSFDCAnesProvidersTracking 
SELECT GETDATE(), 0, '1/1/1900', 0






TRUNCATE TABLE KenticoSFDCAnesProviders

INSERT INTO KenticoSFDCAnesProviders
SELECT PMB.ProviderMasterID, PMB.LastName, PMB.FirstName, PMB.Title,
EI.Name , EI.Address_1__c Address1, EI.Address_2__c Address2, EI.City__c City, EI.State__c State,
HR.SFDCName, PL.Practice_Location__c,
PL.BillingStreet, PL.BillingCity, PL.BillingState, PL.BillingPostalCode
FROM ProviderMasterBase PMB
JOIN ProviderMaster PM ON PM.ProviderMasterID = PMB.ProviderMasterID
JOIN SiteBase SB ON PMB.ProviderMasterID = SB.ProviderMasterID
JOIN Hospital_region HR ON HR.Code = SB.WebCode
JOIN SFDCPracLine PL ON PL.ContractId = HR.TCstruct
LEFT OUTER JOIN AppStaging.dbo.SFDCEducationStaging SE
				ON SE.Contact__c = PMB.SFID
JOIN SalesForce...E_T_Institution__c EI ON EI.Id = SE.Institution_1__c
WHERE PL.Practice_Location__c = 'Anesthesia'
AND PMB.Status = 0
AND SE.Education_Type__c = 'Residency'
AND SE.Specialty__c = 'Anesthesiology'
AND SE.State__c IS NOT NULL
AND PM.StaffStatus IN ('Current Medical Staff', 'Applicant')
AND SB.PrimarySite = 'Y'
ORDER BY LastName

	
DELETE FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCAnesProviders  

INSERT INTO [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCAnesProviders  
SELECT * FROM KenticoSFDCAnesProviders 


DELETE FROM [174.143.32.29].[stage.CEPAmerica.com].dbo.KenticoSFDCAnesProviders  

INSERT INTO [174.143.32.29].[stage.CEPAmerica.com].dbo.KenticoSFDCAnesProviders  
SELECT * FROM KenticoSFDCAnesProviders 



UPDATE [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCAnesProvidersTracking  
SET RowsLoaded = (SELECT COUNT(*) FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCAnesProviders),
LoadEndTime = GetDate()
WHERE RowsLoaded = 0
and LoadEndTime = '1/1/1900'
and LoadStartTime IN (SELECT MAX(LoadStartTime) 
					FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCAnesProvidersTracking)



UPDATE [174.143.32.29].[stage.cepamerica.com].dbo.KenticoSFDCAnesProvidersTracking 
SET RowsLoaded = (SELECT COUNT(*) FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCAnesProviders),
LoadEndTime = GetDate()
WHERE RowsLoaded = 0
and LoadEndTime = '1/1/1900'
and LoadStartTime IN (SELECT MAX(LoadStartTime) 
					FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCAnesProvidersTracking)

--SELECT * FROM [174.143.32.29].[www.CEPAmerica.com].dbo.KenticoSFDCLoadTracking 



END



