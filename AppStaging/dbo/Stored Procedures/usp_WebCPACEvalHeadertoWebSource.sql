CREATE PROCEDURE [dbo].[usp_WebCPACEvalHeadertoWebSource] AS

	/*1/1/05 Antonia Miller.  Loads CPAC Evaluation Header Data (who is to be evaluated and
	applicable web codes) into the web source table:  WebStaging.dbo.WebCPACEvalHeader

	5/5/05 Antonia Miller.  Adjusted to run on new staging server.*/

	TRUNCATE TABLE WEBSTAGING.DBO.WEBCPACEVALHEADER
	INSERT WebStaging.dbo.WebCPACEvalHeader (
	DateOfEmployment,
	BoardStatus,
	BoardStatusExpDate,
	CurrentLevel,
	CurrentLevelDate,
	AdvanceLevel,
	TotalHours,
	AcceleratedAdvance,
	WebCodeSite,
	RegionCode,
	ProviderMasterID,
	ProviderMasterIDMD,
	ProviderMasterIDRD)

	SELECT 
	DateOfHire,
	BoardCertification,
	BoardCertificationExpDate,
	CurrentLevel,
	CurrentLevelDate,
	AdvanceLevel,
	TotalHours,
	AcceleratedAdv,
	WebCodeSite1,
	RegionCode1,
	ProviderMasterID,
	ProviderMasterIDMD1,
	ProviderMasterIDRD1
	
		FROM AppStaging.dbo.WebCPACEvalHeaderStaging
		WHERE WebCodeSite1 is not null


	INSERT WebStaging.dbo.WebCPACEvalHeader (
	DateOfEmployment,
	BoardStatus,
	BoardStatusExpDate,
	CurrentLevel,
	CurrentLevelDate,
	AdvanceLevel,
	TotalHours,
	AcceleratedAdvance,
	WebCodeSite,
	RegionCode,
	ProviderMasterID,
	ProviderMasterIDMD,
	ProviderMasterIDRD,
	EvalAtMoreThan1Site)


	SELECT 
	DateOfHire,
	BoardCertification,
	BoardCertificationExpDate,
	CurrentLevel,
	CurrentLevelDate,
	AdvanceLevel,
	TotalHours,
	AcceleratedAdv,
	WebCodeSite2,
	RegionCode2,
	ProviderMasterID,
	ProviderMasterIDMD2,
	ProviderMasterIDRD2,
	'Y'
	
		FROM AppStaging.dbo.WebCPACEvalHeaderStaging
		WHERE WebCodeSite2 is not null
