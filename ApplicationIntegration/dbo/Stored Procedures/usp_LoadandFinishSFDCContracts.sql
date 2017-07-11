CREATE PROCEDURE [dbo].[usp_LoadandFinishSFDCContracts] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Load SFDC Contracts for Provider Master Database
	Revision:	
	
*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	
	--Transfer SFDC Contracts
	
	TRUNCATE TABLE SFDCContracts	
	
	INSERT INTO SFDCContracts
	SELECT DISTINCT PS.SFID,
		PS.StaffGroup,
		PS.ProviderMasterID,
		PS.WebID,
		CASE WHEN PS.StaffGroup = 'CEP'
			THEN 'California Emergency Physicians Medical Group'
			ELSE PS.Facility END AS Facility,
		con.Payer_Type__c AS PayerType,
		con.Payer_Name__c AS PayerName,
		con.Status__c,
		Ac.Name AS SiteName,
		GE.Practice_Location__c,
		con.X1st_Date_Worked__c AS FirstWorkedDate,
		con.Last_Date_Worked__c AS LastWorkedDate,
		con.Mailed_to_Provider__c AS MailedToProvider,
		con.Received_from_Provider__c AS RecFromProvider,
		con.Mailed_to_Payer__c AS MailedToPayer,
		con.Payer_Reference_1__c AS PayerRefNo,
		con.Individual_Billing_Number__c AS IndividualBillNo,
		GE.Assigned_Group_Billing_Number__c AS GroupBillNo,
		Con.Follow_Up_Date__c As FollowUpDate,
		U.Name As PESpecialist,
		Convert(Varchar(1000), con.Comments__c) AS Comments,
		GETDATE(),
		GETDATE()
	FROM ProviderStatusStaging PS
	JOIN Salesforce...Contracts__c Con
			ON PS.SFID = Con.Contact__c
	LEFT OUTER JOIN SalesForce...Group_Enrollment_Contract__c GE
			ON GE.Id = con.Group_Enrollment_Contract__c
	LEFT OUTER JOIN Salesforce...Account AC 
			ON AC.Id = con.Healthcare_Facility_Name__c
	LEFT OUTER JOIN Salesforce...[User] U
			ON U.Id = Con.Provider_Enrollment__c
	WHERE ProviderMasterID IS NOT NULL
	


	INSERT INTO SFDCContracts
		(ProviderMasterID, 
 		 StaffGroup,
		 WebID)
	SELECT DISTINCT 
		 Prov.ProviderMasterID,	
		 CASE WHEN PS.StaffGroup IS NULL
			THEN 'GALEN'
			ELSE 'CEP' END As StaffGroup,
		 Prov.WebID
		FROM ProviderMaster Prov
		INNER JOIN ProviderStatusStaging PS
		  	ON Prov.ProviderMasterID = PS.ProviderMasterID
		WHERE PS.Active = 'Y'
		    AND NOT EXISTS
			(SELECT 1
				FROM SFDCContracts SC
				WHERE SC.ProviderMasterID = PS.ProviderMasterID
				  AND SC.StaffGroup	  = PS.StaffGroup)

	
		/* Next is to determine what new combinations have been added.  
			These will need to be matched in the
			SiteLocationEchoContractsMatching table	*/

	INSERT INTO SiteLocationSFDCContractsMatches
		(SFDCInsurancePlanCode,
		 SFDCInsurancePlanName
		)
	SELECT DISTINCT 
		 SC.PayerType,
		 SC.PayerName
		FROM SFDCContracts SC
		WHERE SC.PayerType IS NOT NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM SiteLocationSFDCContractsMatches SLSC
				WHERE SLSC.SFDCInsurancePlanName = SC.PayerName)

END
