CREATE PROCEDURE [dbo].[usp_PMDB_PostLoadStagingtoProdCleanup] 
AS

/* 	Author: 	Andrew Marsh
	Date:		2/24/2005
	Purpose:	Post Load Staging to Production Cleanup
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	UPDATE ProviderMaster SET
		 SSNFormatted			= Tprv.SSNFormatted,
		 SSNUnformatted			= Tprv.SSNUnformatted,
		 TaxIDIncorporated		= Tprv.TaxIDIncorporated,
		 LastName			= Tprv.LastName,
		 FirstName			= Tprv.FirstName,
		 MiddleNameOrInitial		= Tprv.MiddleNameOrInitial,
		 PreferredName			= Tprv.PreferredName,
		 IncorporatedName		= Tprv.IncorporatedName,
		 FormerLastName			= Tprv.FormerLastName,
		 FormerFirstName		= Tprv.FormerFirstName,
		 FormerMiddleName		= Tprv.FormerMiddleName,
		 Title				= Tprv.Title,
		 TitleCompare			= Tprv.TitleCompare,
		 Gender				= Tprv.Gender,
		 PartnershipLevel		= Tprv.PartnershipLevel,
		 EchoPartnershipLevelCode	= Tprv.EchoPartnershipLevelCode,
		 PartnershipLevelDate		= Tprv.PartnershipLevelDate,
		 PartnershipLevelCode		= Tprv.PartnershipLevelCode,
		 DateOfBirth			= Tprv.DateOfBirth,
		 DateOfHire			= Tprv.DateOfHire,
		 MaritalStatusCode		= Tprv.MaritalStatusCode,
		 MaritalStatus			= Tprv.MaritalStatus,
		 SpouseName			= Tprv.SpouseName,
		 CEPEmailAddress		= Tprv.CEPEmailAddress,
		 EmailAddress1			= Tprv.EmailAddress1,
		 EmailAddress2			= Tprv.EmailAddress2,
		 CellPhoneNbr			= Tprv.CellPhoneNbr,
		 PagerNbr			= Tprv.PagerNbr,
		 MedSchool			= Tprv.MedSchool,
		 WebID				= Tprv.WebID,
		 CeridianFlxID			= Tprv.CeridianFlxID,
		 CeridianClockNbr		= Tprv.CeridianClockNbr,
		 CeridianEbPSID			= Tprv.CeridianEbPSID,
		 SiteLineCntID			= Tprv.SiteLineCntID,
		 Echo_dr_no_ext			= Tprv.Echo_dr_no_ext,
		 Echo_dr_id			= Tprv.Echo_dr_id,
		 NationalID			= Tprv.NationalID,
		 ExchangeDirectoryName		= Tprv.ExchangeDirectoryName,
		 ExchangeContainer		= Tprv.ExchangeContainer,
		 ExchangeDirectoryName2		= Tprv.ExchangeDirectoryName2,
		 ExchangeContainer2		= Tprv.ExchangeContainer2,
		 EmploymentCategory		= Tprv.EmploymentCategory,
		 EmploymentCategoryDate		= Tprv.EmploymentCategoryDate,
		 CurrentlyNotComparedFlag	= Tprv.CurrentlyNotComparedFlag,
		 DuplicateOfProviderMasterID	= Tprv.DuplicateOfProviderMasterID,
		 StaffStatus			= Tprv.StaffStatus,
		 CurrentStaffFlag		= Tprv.CurrentStaffFlag,
		 CurrentProviderFlag		= Tprv.CurrentProviderFlag,
		 NeedToFix			= Tprv.NeedToFix,
		 CurrentlyIncorporatedFlag	= Tprv.CurrentlyIncorporatedFlag,
		 FormerlyIncorporatedFlag	= Tprv.FormerlyIncorporatedFlag,
		 EMANewJersey			= Tprv.EMANewJersey,
		 SSNIncorrectFlag		= Tprv.SSNIncorrectFlag,
		 LoadFlag			= Tprv.LoadFlag,
		 BatchNbrLoaded			= Tprv.BatchNbrLoaded,
		 Notes				= Tprv.Notes,
		 CEPPartnerFlag			= Tprv.CEPPartnerFlag,
		 MultipleClientFlag		= Tprv.MultipleClientFlag,
		 PAFlag				= Tprv.PAFlag,
		 BoardMember			= Tprv.BoardMember,
		 RegionalDirector		= Tprv.RegionalDirector,
		 MedicalDirector		= Tprv.MedicalDirector,
		 AsstMedicalDirector		= Tprv.AsstMedicalDirector,
		 QIDirector			= Tprv.QIDirector,
		 CommitteeMember		= Tprv.CommitteeMember,
		 AnyDirector			= Tprv.AnyDirector,
		 LatestWorkDate			= Tprv.LatestWorkDate,
		 CREDate			= Tprv.CREDate,
		 CREDate2			= Tprv.CREDate2,
		 UPDDate			= Tprv.UPDDate
		FROM TempProviderMaster TPRv
		INNER JOIN ProviderMaster Prov
			ON TPrv.ProviderMasterID = Prov.ProviderMasterID

		
END




