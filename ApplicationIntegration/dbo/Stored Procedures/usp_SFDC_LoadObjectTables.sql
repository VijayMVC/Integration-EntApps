

CREATE Procedure [dbo].[usp_SFDC_LoadObjectTables]

AS

/* =====================================================================

Downloads all the data for all SFDC objects related to a Contact.
The data is downloaded to the AppStaging DB

 =====================================================================
 */


SET NOCOUNT ON 

SET DEADLOCK_PRIORITY HIGH

BEGIN

/*Object Name : Contact
	ED Contact Holder: CEP America
	Record Type : Credentialing
	*/
	IF OBJECT_ID('AppStaging.dbo.SFDCContactStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCContactStaging;

	SELECT *
	INTO AppStaging.dbo.SFDCContactStaging
	FROM Salesforce...Contact
	WHERE AccountId = '001A000000LwvkyIAB'
	AND RecordTypeId = '012G0000000yDrOIAU'
	
/*Object Name : Provider Status
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCFacilityStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCFacilityStaging;


	SELECT * 
	INTO AppStaging.dbo.SFDCFacilityStaging
	FROM SalesForce...Facility__c


/*Object Name : Work History
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCWorkHistoryStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCWorkHistoryStaging;

	SELECT *
	INTO AppStaging.dbo.SFDCWorkHistoryStaging
	FROM SalesForce...Work_History__c


/*Object Name : Address Object - No Home as Home Address 
								is mapped to Contact Object
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCAddressStagingNoHome', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCAddressStagingNoHome;

	SELECT *
	INTO AppStaging.dbo.SFDCAddressStagingNoHome
	FROM SalesForce...Billing_Address__c
	WHERE Type__c <> 'Home'


/*Object Name : Education and Training
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCEducationStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCEducationStaging;

	SELECT *
	INTO AppStaging.dbo.SFDCEducationStaging
	FROM SalesForce...Education__c
	
	
/*Object Name : Malpractice 
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCMalPracStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCMalPracStaging;

	SELECT *
	INTO AppStaging.dbo.SFDCMalPracStaging
	FROM Salesforce...Malpractice_Carriers__c
	
	
/*Object Name : Adverse Action
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCAdverseActionStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCAdverseActionStaging;

	SELECT * 
	INTO AppStaging.dbo.SFDCAdverseActionStaging
	FROM Salesforce...Malpractice_Judgement__c
	
	
/*Object Name : New Hire Checklist
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCNewHireChecklistStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCNewHireChecklistStaging;

	SELECT *
	INTO AppStaging.dbo.SFDCNewHireChecklistStaging
	FROM SalesForce...New_Hire_Biennial_Checklists__c
	

/*Object Name : Reference
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCReferenceStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCReferenceStaging;

	SELECT * 
	INTO AppStaging.dbo.SFDCReferenceStaging
	FROM Salesforce...Credentialing_Reference__c


/*Object Name : Professional Credentials
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCCredentialsStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCCredentialsStaging;

 
	SELECT * 
	INTO AppStaging.dbo.SFDCCredentialsStaging
	FROM Salesforce...Professional_Credentials__c
	

/*Object Name : Partnership History
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCPartHistoryStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCPartHistoryStaging;

	SELECT * 
	INTO AppStaging.dbo.SFDCPartHistoryStaging
	FROM Salesforce...Department_History__c


/*Object Name : Specialty
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCSpecialtyStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCSpecialtyStaging;

	SELECT * 
	INTO AppStaging.dbo.SFDCSpecialtyStaging
	FROM Salesforce...Specialty__c
	
	
/*Object Name : Contract
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCContractStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCContractStaging;

	SELECT * 
	INTO AppStaging.dbo.SFDCContractStaging
	FROM Salesforce...Contract
	

/*Object Name : Account with Contracts
*/
	IF OBJECT_ID('AppStaging.dbo.SFDCAccountContractStaging', 'U') IS NOT NULL
		DROP TABLE AppStaging.dbo.SFDCAccountContractStaging;

	SELECT A.Id AS AccountId, C.Id AS ContractId, HR.Code WebCode,
		A.Public_Name__c,A.BillingStreet, A.BillingCity, A.BillingState, 
		A.BillingPostalCode, A.BillingCountry, C.Phone__c,
		C.Practice_Location__c, C.Practice_Location_Code__c
	INTO AppStaging.dbo.SFDCAccountContractStaging
	FROM Salesforce...Account A
	JOIN Salesforce.dbo.Contract C on A.Id = C.AccountId
	JOIN Hospital_region HR on HR.TCstruct = C.Id
	
	
			  
END


