USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadLMSData]    Script Date: 11/16/2016 16:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[usp_LoadLMSData]
AS


BEGIN

  SET NOCOUNT ON;
SET XACT_ABORT ON;
	BEGIN TRY
		BEGIN TRANSACTION;


		/* 6/16/2016 -- Feedback from Sri:

			Changes for Now:
			1. Employee File
				- The Active Flag should be an integer. 1 for Yes, 0 for No.
				- The Primary Domain would always be CEPAmerica
			2. Employee-Job File
				- The Domain will  always be CEPAmerica
			3. Employee-Org File
				- The Primary Column should contain Integer Value (1 for Yes, 0 for No)
			4. Job File
				- The Domain will be CEPAmerica.


		7/8/2016

		The Org Structure is now in the System and the Jobs except the below duplicates are in the System.

		1.	Org File
			a.	The Org Code for MBSI is O-MBSI, MedAmerica is O-MedAmerica and CEPAmerica is O-CEPAmerica.
			I made these changes manually in the Org file. But we need to update the master, so the Parent Codes Refer to these codes. Attached the ModifiedFIle.

		2.	Job File
			a.	The Below Records have Duplicate Job Codes. These need to be fixed. I had removed them from the Job File and hence
				these were not loaded along with the Employee-Job Associations for these.
				i.	Skipping duplicate record for 2BILL01212. Record on line 297 will be imported instead.
				ii.	Skipping duplicate record for 2CDPOLA1142. Record on line 377 will be imported instead.
				iii.	Skipping duplicate record for 2MAILCK125. Record on line 509 will be imported instead.
				iv.	Skipping duplicate record for AUCCLAST1093. Record on line 596 will be imported instead.
				v.	Skipping duplicate record for AUCMEDAS1065. Record on line 602 will be imported instead.
				vi.	Skipping duplicate record for AUCMEDAS1093. Record on line 605 will be imported instead.
				vii.	Skipping duplicate record for AUCMEDAS1094. Record on line 607 will be imported instead.
				viii.	Skipping duplicate record for AUCMEDRC1065. Record on line 610 will be imported instead.
				ix.	Skipping duplicate record for ESCRIBE01331. Record on line 730 will be imported instead.

				Attached the Modified File.

		3.	Employee File
			1.	The Employee Status is “Leave of Absence” while we have it in the system as “Leave of Absence”.
			2.	Certain Organization Codes do not Exist in the Organization File
				a.	GOR1, INL1, RCH2, MZA1, MUM1, SFV1,RCH2, WTB1, AXM1, VNM1
			3.	Employee ‘3324’, ‘5249’,‘5048’ has been duplicated (This is not an issue as the records look same and the last duplicate will be processed).
			4.	The primary Job should contain the Job Code. Certain Records have the names like ‘Sr Manager Human Resources’, ‘Reimbursement Manager’,
				Associate Program Manager. The Log file has details.
			5.	The Manager Reference Errors can be ignored for now as they refer to the Employees within the same file.


	RS NOTE : For Sites issues we have providers associated with Sites in transition. For now not passing the Provider Sites if they have not been fully activated.
	Will have to be resolved with business about how to take care of this issue

        8/26/2016 Richard Myers
        Changed FirstName to PrefferedName for employee
        
        9/19/2016 -- 1. Changed PreferredName back to First Name and added New field PreferredName and Memo
					2. Changed manager heirarchy for MA/MBSI to be pulled from LawsonHRSuper
					3. Update PA/NP to Advanced Provider
					
		10/3/2016 -- Added code to capture inactive employees
		
		10/5/2016 -- As per Mina Miller - We need to pass the tags in the Memo field in the LMS employee file.  
										  One for each Practice Line that a person works in.  
											This is an urgent need for reporting.
		*/
		
		
			--Extract LMS Security roles from AD
			
			EXEC usp_LoadLMSSecurityRoles
			
			

			--Load LMS Org data
			
			EXEC usp_LoadLMSOrg			
			

			--Load LMS PERSON data--

			EXEC usp_LoadLMSEmployee
			

			--JOB Lookup--

			EXEC usp_LoadLMSJOb
			

			---Emp-Org--
			
			EXEC usp_LoadLMSEmpOrg
			

			--Employee Job File--

			EXEC usp_LoadLMSEmpJob
			

			--LMS Managed Org--
			
			EXEC usp_LoadLMSManagedOrg			
			
			
			--LMS Exceptions			
			
			EXEC usp_LoadLMSExceptions
	

			



		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF (XACT_STATE()) = -1
			ROLLBACK TRANSACTION;

		-- test if the transaction is committable
		IF (XACT_STATE()) = 1
			COMMIT TRANSACTION;


END CATCH;


END

