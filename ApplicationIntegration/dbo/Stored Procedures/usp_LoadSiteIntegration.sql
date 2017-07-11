
CREATE PROCEDURE [dbo].[usp_LoadSiteIntegration] 
AS

/* 	Author: 	Reetika	
	Date:		11/05/2012
	Purpose:	Load Sites Names and Ids from all different systems
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
			
		TRUNCATE TABLE SiteIntegration

		INSERT INTO SiteIntegration

		SELECT DISTINCT SP.AccountId SFAccountId, SP.ContractId SFContractId, SP.WebCode,
		C.Hospital_NPI__c, MARSPractice, LP.ProcessLevel, ST.CtrID ,SP.Practice_Location__c ,
		SP.Name SFDCPublicName, A.Legal_Name__c SFDCLegalName, PL.PracOnlyName MBSISiteName, PL.PracShortName MBSISiteShortName,
		ST.CtrKey AS SitelineName,PR.NAME LawsonSiteName,
		SP.BillingStreet, SP.BillingCity, SP.BillingState, SP.BillingPostalCode, SP.BillingCountry,
		SP.HospitalPhone
		FROM SFDCPracLine SP
		JOIN AppStaging.dbo.SFDCContractStaging C ON C.Id = SP.ContractId
		JOIN SalesForce...Account A ON A.Id = C.AccountId
		JOIN Hospital_region HR ON HR.Code = SP.WebCode
		JOIN LS_pLevelLookup LP ON LP.WebCode = SP.WebCode
		LEFT OUTER JOIN AppStaging.dbo.LawsonPRSYSTEM PR ON PR.PROCESS_LEVEL = LP.ProcessLevel
		LEFT OUTER JOIN Siteline_TblCtr ST on ST.CtrTin = LP.ProcessLevel
		LEFT OUTER JOIN LocationCrossMapMARS LM ON LM.Site = SP.WebCode
		LEFT OUTER JOIN PracLookUp PL on PL.Practice = LM.MARSPractice		
		WHERE HR.status = 0
		ORDER BY SFDCPublicName, Practice_Location__c


			

	
	
END

