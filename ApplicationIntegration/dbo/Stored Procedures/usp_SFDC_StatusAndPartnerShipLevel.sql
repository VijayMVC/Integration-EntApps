USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_SFDC_StatusAndPartnerShipLevel]    Script Date: 12/08/2016 10:30:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dbo].[usp_SFDC_StatusAndPartnerShipLevel] 
AS
/* 	Author: 	Reetika
	Date:		4/30/2012
	Purpose:	Updating Status and Partnership Levels.
	Revision:	*/


SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN 




/* PartnershipLevel, Date , Staff Status, Start Date */
		/* Earlier Active flag was not used and ProviderMaster was randomly getting updated 
		when there was more than one staffgroup. Problem was casued when one SG was Active 
		and other inactive the update statement would just pick one randomly. 
		Now by splitting the update statement and updating the Active cases later 
		we are making sure all active cases remain active.*/
		
/*12/8/2016 -- Added logic to pull the latest Hire date in case of multiple Povider Status Records*/

	UPDATE  ProviderMaster
		SET PartnershipLevel 		= RTRIM(LTRIM(PS.StaffStatus)), 
			PartnershipLevelDate 	= PS.PartnershipLevelDate,
			StaffStatus				= PS.RecordStatus,
			DateOfHire				= PS.[From],
			CurrentProviderFlag		= PS.Active,
			CurrentStaffFlag		= PS.Active,
			EmailAddress1			= CASE WHEN PS.ForwardingEmail IS NOT NULL
											THEN PS.ForwardingEmail
											ELSE Prov.EmailAddress1 END,
			CEPEmailAddress			= PS.CorporateEmail 
			FROM ProviderStatusStaging AS PS
			INNER JOIN ProviderMaster	Prov
				 ON PS.SFID = Prov.SFID
			WHERE PS.Active = 'N'
				AND PS.[From] IN (SELECT MAX([From])
								FROM ProviderStatusStaging PS2
								WHERE PS2.Active = 'N'
									AND PS2.ProviderMasterID = Prov.ProviderMasterID
									AND PS2.ProviderMasterID = PS.ProviderMasterID
								GROUP BY PS2.ProviderMasterID)

		/* Added logic to mark Retired = Separated */
	UPDATE  ProviderMaster
		SET PartnershipLevel 		= RTRIM(LTRIM(PS.StaffStatus)), 
			PartnershipLevelDate 	= PS.PartnershipLevelDate,
			StaffStatus				= PS.RecordStatus,
			DateOfHire				= PS.[From],
			CurrentProviderFlag		= PS.Active,
			CurrentStaffFlag		= PS.Active,
			EmailAddress1			= CASE WHEN PS.ForwardingEmail IS NOT NULL
											THEN PS.ForwardingEmail
											ELSE Prov.EmailAddress1 END,
			CEPEmailAddress			= PS.CorporateEmail 
			FROM ProviderStatusStaging AS PS
			INNER JOIN ProviderMaster	Prov
				 ON PS.SFID = Prov.SFID
			WHERE PS.Active = 'N'
				AND PS.RecordStatus IN ('Emeritus',  'Retired' )
				AND PS.[From] IN (SELECT MAX([From])
								FROM ProviderStatusStaging PS2
								WHERE PS2.Active = 'N'
									AND PS2.ProviderMasterID = Prov.ProviderMasterID
									AND PS2.ProviderMasterID = PS.ProviderMasterID
									AND PS2.RecordStatus IN ('Emeritus',  'Retired' )
								GROUP BY PS2.ProviderMasterID)
	
	
	UPDATE  ProviderMaster
		SET PartnershipLevel 		= RTRIM(LTRIM(PS.StaffStatus)), 
			PartnershipLevelDate 	= PS.PartnershipLevelDate,
			StaffStatus				= PS.RecordStatus,
			DateOfHire				= PS.[From],
			CurrentProviderFlag		= PS.Active,
			CurrentStaffFlag		= PS.Active,
			EmailAddress1			= CASE WHEN PS.ForwardingEmail IS NOT NULL
											THEN PS.ForwardingEmail
											ELSE Prov.EmailAddress1 END
			FROM ProviderStatusStaging AS PS
			INNER JOIN ProviderMaster	Prov
				 ON PS.SFID = Prov.SFID
			WHERE PS.Active = 'Y'
			AND PS.RecordStatus NOT LIKE 'Former%'
	
				
				
	UPDATE  ProviderMaster
		SET PartnershipLevel 		= RTRIM(LTRIM(PS.StaffStatus)), 
			PartnershipLevelDate 	= PS.PartnershipLevelDate,
			StaffStatus				= PS.RecordStatus,
			DateOfHire				= PS.[From],
			CurrentProviderFlag		= PS.Active,
			CurrentStaffFlag		= PS.Active,
			EmailAddress1			= CASE WHEN PS.ForwardingEmail IS NOT NULL
											THEN PS.ForwardingEmail
											ELSE Prov.EmailAddress1 END
			FROM ProviderStatusStaging AS PS
			INNER JOIN ProviderMaster	Prov
				 ON PS.SFID = Prov.SFID
			WHERE PS.Active = 'Y'
			AND PS.StaffStatus IN ('Physician Extender',
						'Hospitalist',
						'Employee', 'Visa Agency',
						'Visa Employee')
			AND PS.RecordStatus NOT LIKE 'Former%'

	UPDATE  ProviderMaster
		SET PartnershipLevel 		= RTRIM(LTRIM(PS.StaffStatus)), 
			PartnershipLevelDate 	= PS.PartnershipLevelDate,
			StaffStatus				= PS.RecordStatus,
			DateOfHire				= PS.[From],
			CurrentProviderFlag		= PS.Active,
			CurrentStaffFlag		= PS.Active,
			EmailAddress1			= CASE WHEN PS.ForwardingEmail IS NOT NULL
											THEN PS.ForwardingEmail
											ELSE Prov.EmailAddress1 END
			FROM ProviderStatusStaging AS PS
			INNER JOIN ProviderMaster	Prov
				 ON PS.SFID = Prov.SFID
			WHERE PS.Active = 'Y'
			AND PS.StaffStatus IN ('Full Partnership', 
						'Level 4 Partnership', 
						'Senior Partnership', 
						'Level 2 Partnership', 
						'Level 3 Partnership', 
						'Level 1 Partnership')
		    AND PS.RecordStatus NOT LIKE 'Former%'
						
						
	UPDATE  ProviderMaster
		SET CEPEmailAddress	= PMB.CEPEmail
			FROM ProviderStatusStaging AS PS
			INNER JOIN ProviderMaster	Prov
				 ON PS.SFID = Prov.SFID
			INNER JOIN ProviderMasterBase PMB
			     ON Prov.ProviderMasterID = PMB.ProviderMasterID
			WHERE PS.Active = 'Y'
			AND PS.StaffStatus IN ('Full Partnership', 
						'Level 4 Partnership', 
						'Senior Partnership', 
						'Level 2 Partnership', 
						'Level 3 Partnership', 
						'Level 1 Partnership', 
						'Physician Extender',
						'Hospitalist',
						'Employee',
						'Visa Agency',
						'Visa Employee')
			

			


	/*Not needed above will take care of it
	More than 1 staff group may cause a separation 
	if in SFDCDepartHistoryStaging as separated in one StaffGroup and
	Still active in another.  
	UPDATE ProviderMaster
		SET 	CurrentProviderFlag			= 'Y',
			CurrentStaffFlag			= 'Y',
			StaffStatus = S.StaffStatus1
		FROM ProviderMaster P, AppStaging.dbo.TempDoNotSeparate S
			WHERE P.ProviderMasterID = S.ProviderMasterID
			AND S.DoNotSeparate = 'Y' and ActiveFlag1 = 'Y'*/
			
	/* No Hire Date, Check On Sites */
	
	UPDATE ProviderMaster SET
		DateOfHire = 
		(SELECT MIN([From])
			FROM ProviderStatusStaging AS PS
			WHERE PS.SFID = Prov.SFID
			  AND PS.Active = 'Y')
		FROM ProviderMaster Prov
		WHERE Prov.DateOfHire IS NULL		
		  AND Prov.CurrentProviderFlag = 'Y'
		  
	/*Update Partnership level codes for web*/
	
	UPDATE ProviderMaster
	SET PartnershipLevelCode = PL.PartnershipLevelCode 
	FROM PartCodeLookup PL
	WHERE ProviderMaster.PartnershipLevel = PL.PartnershipLevel
	


	/*POPULATE PA EMPLOYMENT CATEGORY and EFFECTIVE DATE FROM LAWSON*/

	UPDATE ProviderMaster
	SET EmploymentCategory = CASE WHEN TEC.EmploymentCategory LIKE '%Full Time'
					THEN 'F'
					WHEN TEC.EmploymentCategory = 'Part Time'
					THEN 'P'
					WHEN TEC.EmploymentCategory = 'Per Diem' 
					THEN 'D' END,
	    EmploymentCategoryDate = Convert(Datetime, TEC.ADJ_HIRE_DATE)
	FROM ProviderMaster As Prov
	JOIN ApplicationIntegration.dbo.LawsonIDMatch 
		ON LawsonIDMatch.ProviderMasterID = Prov.ProviderMasterID
	JOIN ApplicationIntegration.dbo.TempEmploymentCategory TEC 
		ON LawsonIDMatch.LawsonEmpNo = TEC.Employee
	WHERE Prov.PartnershipLevel = 'Physician Extender'
	AND Prov.CurrentProviderFlag = 'Y'
	
	/*SET PA FLAG FOR ALL PAs*/
	UPDATE ProviderMaster
	SET PAFlag = 'Y'
	WHERE PartnershipLevel IN ('Physician Extender', 'Employee','Visa Agency',
						'Visa Employee')
	AND Title NOT LIKE '%M%D%'
	AND Title NOT LIKE '%D%O%'
	AND CurrentProviderFlag = 'Y'
	
	/*UNSET PA FLAG FOR ALL MDs*/
	UPDATE ProviderMaster
	SET PAFlag = 'N'
	WHERE PartnershipLevel NOT IN ('Physician Extender', 'Employee','Visa Agency',
						'Visa Employee')
	AND (Title LIKE '%M%D%'
	OR Title LIKE '%D%O%')
	AND CurrentProviderFlag = 'Y'
	AND PAFlag = 'Y'
	
	/* GET personal email from ProviderMaster*/
	UPDATE ProviderMasterBase
	SET EmailAddress = PM.EmailAddress1
	FROM ProviderMaster PM
	WHERE PM.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND (PM.EmailAddress1 <> '' AND PM.EmailAddress1 IS NOT NULL AND PM.EmailAddress1 NOT LIKE '%cep.com')
	
	/*Keep titles in Sync*/
	UPDATE ProviderMaster
	SET Title = PMB.Title
	FROM ProviderMasterBase PMB
	WHERE PMB.ProviderMasterID = ProviderMaster.ProviderMasterID
	AND ProviderMaster.Title <> PMB.Title
	AND PMB.Status = 0




END

