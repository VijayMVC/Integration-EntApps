CREATE PROCEDURE [dbo].[usp_WebBiennialEvalHeadertoWebSource] AS

	/*12/27/06 Antonia Miller.  Loads Biennial Evaluation Header Data (who is to be evaluated and
	applicable web codes) into the web source table:  WEBSTAGING.DBO.WEBBIENNIALEVALHEADER*/

	TRUNCATE TABLE WEBSTAGING.DBO.WEBBIENNIALEVALHEADER
	INSERT WEBSTAGING.DBO.WEBBIENNIALEVALHEADER (
	DateOfEmployment,
	BoardStatus,
	BoardStatusExpDate,
	CurrentLevel,
	CurrentLevelDate,
	LastReviewDate,
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
	LastReviewDate,
	WebCodeSite1,
	RegionCode1,
	ProviderMasterID,
	ProviderMasterIDMD1,
	ProviderMasterIDRD1
	
		FROM WEBSTAGING.DBO.WEBBIENNIALEVALHEADERSTAGING
		WHERE WebCodeSite1 is not null


	INSERT WEBSTAGING.DBO.WEBBIENNIALEVALHEADER (
	DateOfEmployment,
	BoardStatus,
	BoardStatusExpDate,
	CurrentLevel,
	CurrentLevelDate,
	LastReviewDate,
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
	LastReviewDate,
	WebCodeSite2,
	RegionCode2,
	ProviderMasterID,
	ProviderMasterIDMD2,
	ProviderMasterIDRD2,
	'Y'
	
		FROM WEBSTAGING.DBO.WEBBIENNIALEVALHEADERSTAGING
		WHERE WebCodeSite2 is not null
