


CREATE                      PROCEDURE [dbo].[usp_LoadOnboardLookupTables] 
AS

/* 	Author: 	Reetika Singh
	Date:		6/20/2012
	Purpose:	Update lookup tables on application from SFDC
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


		TRUNCATE TABLE SFDCPicklistStaging

		INSERT INTO SFDCPicklistStaging
		SELECT * FROM Salesforce...sys_sfpicklists



		TRUNCATE TABLE LookupAggregate

		INSERT INTO LookupAggregate
		SELECT PickListValue 
		FROM SFDCPicklistStaging
		WHERE ObjectName LIKE 'Malpractice_Carriers__c%'
		AND FieldName = 'Coverage_Range2__c'
		ORDER BY PickListValue


		TRUNCATE TABLE LookupIndividual

		INSERT INTO LookupIndividual
		SELECT PickListValue 
		FROM SFDCPicklistStaging
		WHERE ObjectName LIKE 'Malpractice_Carriers__c%'
		AND FieldName = 'Coverage_Range__c'
		ORDER BY PickListValue


		TRUNCATE TABLE LookupCertifyingBoard

		INSERT INTO LookupCertifyingBoard
		SELECT DISTINCT  ID, Name 
		FROM SalesForce...Issuer__c
		WHERE Category__c = 'Board'
		AND Name <> 'N/A'
		ORDER BY Name



		TRUNCATE TABLE dbo.LookupDegree

		INSERT INTO LookupDegree
		SELECT PickListValue 
		FROM SFDCPicklistStaging
		WHERE ObjectName = 'Education__c'
		AND FieldName = 'Degree__c'
		ORDER By PickListValue



		TRUNCATE TABLE LookupHospital

		INSERT INTO LookupHospital
		SELECT DISTINCT Id AS SFID, Name AS Name,
		BillingStreet As Addr1, BillingCity AS City, BillingState As State ,
		BillingPostalCode As Zip, Fax, Phone, BillingCountry
		FROM Salesforce...Account
		--where ED_Contract_Holder__c = '001A000000LwvkyIAB'
		WHERE Name not like '%not%provided%'
		ORDER BY Name



		TRUNCATE TABLE LookupLang

		INSERT INTO LookupLang
		SELECT PickListValue 
		FROM SFDCPicklistStaging
		WHERE ObjectName = 'Contact'
		AND FieldName = 'Cred_Enter_Non_English_Language_u_speak__c'
		ORDER BY PickListValue



		TRUNCATE TABLE LookupMalPracticeCarrier

		INSERT INTO LookupMalPracticeCarrier
		SELECT DISTINCT Id, Name, State__c, City__c 
		FROM Salesforce...Carrier__c
		ORDER BY Name



		TRUNCATE TABLE LookupMaritalStatus

		INSERT INTO LookupMaritalStatus
		SELECT PickListValue 
		FROM SFDCPicklistStaging
		WHERE ObjectName = 'Contact'
		AND FieldName = 'Cred_Marital_Status__c'
		ORDER BY PickListValue



		TRUNCATE TABLE LookupSchools

		INSERT INTO LookupSchools
		SELECT Id AS SFID, Name AS Name, Sub_Name__c,
		Address_1__c As Addr1, Address_2__c As addr2,City__c AS City, State__c ,Country__c As Country,
		Zip_Code__c, Fax__c,Phone__c
		FROM SalesForce...E_T_Institution__c
		ORDER BY Name


		TRUNCATE TABLE LookupSpecialty

		INSERT INTO LookupSpecialty
		SELECT PickListValue 
		FROM SFDCPicklistStaging
		WHERE ObjectName = 'Specialty__c'
		AND FieldName = 'Specialty__c'
		ORDER BY PickListValue


		TRUNCATE TABLE LookupTitle

		INSERT INTO LookupTitle
		SELECT PickListValue 
		FROM SFDCPicklistStaging
		WHERE ObjectName = 'Contact'
		AND FieldName = 'Title__c'
		ORDER BY PickListValue



		TRUNCATE TABLE LookupTrainingType

		INSERT INTO LookupTrainingType
		SELECT PickListValue 
		FROM SFDCPicklistStaging
		WHERE ObjectName = 'Education__c'
		AND FieldName = 'Education_Type__c'
		AND PickListValue IN ('Internship', 'Residency', 'Fellowship', 'Other Training')
		ORDER BY PickListValue


		TRUNCATE TABLE LoopkupRefProviderType
		
		INSERT INTO LoopkupRefProviderType
		SELECT PickListValue
		FROM SFDCPicklistStaging
		WHERE ObjectName = 'Credentialing_Reference__c'
		AND FieldName = 'Provider_Type__c' 





END



