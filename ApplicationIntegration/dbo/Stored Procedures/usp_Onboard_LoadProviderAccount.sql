
CREATE Procedure [dbo].[usp_Onboard_LoadProviderAccount]

AS

/* =====================================================================

Inserts new providers into ProviderAccount from PMB and PM for onboarding App

 =====================================================================
 */


SET NOCOUNT ON 

BEGIN

--Only those New Hires will go to the onboarding portal that have a webID
	
	
-----------------------------------------------------
--1. New Hires - first time in ProviderAccount table. Flag = 'NH'

	TRUNCATE TABLE ProviderAccount
	
	INSERT INTO ProviderAccount
	SELECT PM.ProviderMasterID,
		PM.WebID,
		PM.SFID,
		PMB.StaffGroup1,
		PMB.StaffGroup2,
		PM.LastName,
		PM.FirstName,
		PM.MiddleNameOrInitial,
		NULL,
		PM.PreferredName,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		PM.Title,
		NULL,
		NULL,
		PM.Gender,
		PM.DateOfBirth,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		PM.SSNFormatted,
		PM.NationalID,
		NULL,
		NULL,
		NULL,
		NULL,
		PMB.Gender,
		PM.SpouseName,
		PMB.Address1,
		NULL,
		PMB.City1,
		PMB.State1,
		PMB.ZipCode1,
		PMB.Country1,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		PMB.PhoneNbr1,
		NULL,
		PMB.FaxNbr1,
		PMB.CEPEmail,
		PMB.EmailAddress,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		PM.DateOfHire,
		NULL,
		'NH',
		'N',
		'New',
		GETDATE()
	FROM ProviderMaster AS PM
	JOIN ProviderMasterBase AS PMB ON PM.ProviderMasterID = PMB.ProviderMasterID
	WHERE PMB.Status = 2
	AND PMB.WebID IS NOT NULL
	AND PM.ProviderMasterID NOT IN (SELECT ProviderMasterID
									FROM AppStaging.dbo.OnboardProviderAccountForSFDC)


	
										
		
			  
END

