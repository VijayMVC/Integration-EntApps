
CREATE PROCEDURE [dbo].[usp_LoadWebAutoCPAC] AS
/*Stored Procedure created to provider Partnership Level History 
and LOA History to support the data preparation
process for the CPAC evaluation website.
*/

	TRUNCATE TABLE ApplicationIntegration.dbo.SFDCDepartmentHistory

	INSERT INTO  ApplicationIntegration.dbo.SFDCDepartmentHistory		
	SELECT PMB.LastName,
	 PMB.FirstName,
	 PMB.ProviderMasterID,
	 DH.From__c As FromDate,
	 DH.To__c As ToDate,
	 DH.Comments__c,
	 DH.Partnership_History__c,
	 DH.Partnership_History_Details_1__c
	FROM AppStaging.dbo.SFDCPartHistoryStaging DH
	JOIN ProviderMasterBase PMB
			ON DH.Contact__c = PMB.SFID
	WHERE DH.Partnership_History__c NOT LIKE '%Meeting%'
		AND DH.Partnership_History__c <>'NPO'
		AND (PMB.Title LIKE 'D%O%'
			OR PMB.Title LIKE 'M%D%')
	ORDER By DH.From__c


	TRUNCATE TABLE WebAutoCPACPartnershipLevel

	INSERT INTO WebAutoCPACPartnershipLevel
	SELECT     
		PartnershipHistory, 
		PMID, 
		FromDate,
		ToDate,
		Convert(varchar(255),Comments),
		PartHistDetails,
		getdate()		
		FROM dbo.SFDCDepartmentHistory       
		WHERE PartnershipHistory IN ('Biennial Review', 'Full Partnership', 
							'Level 1 Partnership', 'Level 2 Partnership', 
							'Level 3 Partnership', 'Level 4 Partnership',
							'Senior Partnership', 'Board Delay', 'Advancement Review',
							'Locum Tenen', 'Agency', 'Employee')
		ORDER BY PartnershipHistory



	TRUNCATE TABLE WebAutoCPACLeave

	INSERT INTO WebAutoCPACLeave
	SELECT 
		PartnershipHistory,    
		PMID,
		FromDate, 
		ToDate,
		Comments,
		getdate() As CreDate
		FROM   SFDCDepartmentHistory
		WHERE PartnershipHistory IN ('Leave of Absence #1','Leave of Absence #2',
				'Leave of Absence #3','Leave of Absence #4','Leave of Absence #5',
				'Leave of Absence #6','Sabbatical #1','Sabbatical #2','Sabbatical #3',
				'Sabbatical #4','Sabbatical #5','Sabbatical #6','Waiver of Hours',
				'Separation','Part-Time Reclassification','Emeritus Partner')
		ORDER BY PartnershipHistory



	/* 5/6/2010 This new AdminPay query replaces all the old Unions and gets the data from a 
	more up-to-date table 
	NOTE: The package data pump from LawDataStage could have gone directly into WebAutoCPACAdmin
			The data pump is also the place to see which PayCodes are brought over
	*/	
	TRUNCATE TABLE WebAutoCPACAdminPay

	-- Get the appropriate archive records
	INSERT INTO WebAutoCPACAdminPay (ProviderMasterID, PayPeriod, PayCode, PayCodeDescr, PSID, 
				DeptDescr, CalendarYear, Mo, Credate )
	SELECT ProviderMasterID, PayPeriod, PayCode, PayCodeDescr, PSID, 
			DeptDescr, CalendarYear, Mo, Credate 
		FROM WebAutoCPACAdminPay_PreLawsonArchive
		WHERE CalendarYear >= 2005 AND PayPeriod <> '2008100'

	---- Now get all the records pulled from the current YTD tables
	---- NOTE that the limiting was done during the DataPump part of the package calling this procedure
	INSERT INTO WebAutoCPACAdminPay (ProviderMasterID, PayPeriod, 
		PayCode, PayCodeDescr, PSID, DeptDescr, CalendarYear, 
			Mo, Credate )
	SELECT ProviderMasterID, PayPeriod, '21', 'Dept Stipend', --PayCode, PayCodeDescr,
		CsuPSID, DeptDescr, CalendarYear, LEFT(ActivityIn, 2),
			GETDATE() 
		FROM dbo.YTDEarningsStatementArchiveMD
		WHERE PayCode = 'P21'

	UPDATE WebAutoCPACAdminPay
	SET Mo = REPLACE(Mo, '/', '');
	
	

	TRUNCATE TABLE ApplicationIntegration.dbo.WebAutoCPACAdminCredit

	INSERT INTO ApplicationIntegration.dbo.WebAutoCPACAdminCredit

	SELECT ProviderMasterID, LastName, FirstName, 
		Title, SA.Administrative_Credit_Tier__c,
		SA.Administrative_Credit_Amount__c,
		SA.Unit__c,
		SA.Administrative_Credit_From__c  FromDate,
		SA.To__c ToDate,
		SA.Comments__c 
	FROM Salesforce...Special_Agreement__c SA
	JOIN ApplicationIntegration.dbo.ProviderMasterBase PMB ON PMB.SFID = SA.Contact__c
	WHERE SA.RecordTypeId = '01216000001QQBoAAO'
	ORDER BY ProviderMasterID
