
CREATE PROCEDURE [dbo].[usp_SFDC_Matching] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Matching Algorithms for Other Systems Such as Web, Siteline
	Revision:	

*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	/* Ceridian Matchings */
		/* For new matchings for same provider - DO WE STILL NEED ALL THE CERIDIAN CODE?? */


			/* Web */
	INSERT INTO ProviderMaster
		(WebID, 
		 LastName,  
		 FirstName,  
		 MiddleNameOrInitial,   
		 Title, 
		 PartnerShipLevelCode,  
		 DateOfHire,
		 EmailAddress1,	 
		 PagerNbr,  
		 CurrentlyNotComparedFlag)
	SELECT 	 PIWC.ID, 
		 PIWC.LastName,
		 PIWC.FirstName,
		 PIWC.MidName,
		 PIWC.Title, 
		 PIWC.LevelNum,
		 PIWC.DateHire,
		 PIWC.Email,
		 PIWC.Pager, 
		 CASE 	WHEN PIWC.Title In ('MA', 'MBSI') THEN 'Y' 
			ELSE 'N' END
		FROM ProviderInfoWebCurrent PIWC
			WHERE NOT EXISTS 
				(SELECT 1 
					FROM ProviderMaster Prov
					WHERE PIWC.ID = Prov.WebID)
			  AND NOT EXISTS
				(SELECT 1 
					FROM ProviderMasterDuplicates PMD
					WHERE PIWC.ID = PMD.WebID)
			  AND PIWC.Title In ('MA', 'MBSI')

	/* SiteLine */
		UPDATE ProviderMaster
		SET SitelineCntID 	= TbC.CntID, 
			UpdDate 	= GETDATE()
		FROM Siteline_TblCnt TbC--, ProviderMaster Prov
		WHERE (	
				(TbC.CntNameFirst = Prov.FirstName 
					AND TbC.CntNameLast = Prov.LastName)
				OR TbC.zcntssn = Prov.SSNFormatted)
			AND NOT EXISTS
				(SELECT 1 
					FROM ProviderMaster Prov2
					WHERE TbC.CntID = Prov2.SitelineCntID)
		    AND Prov.SitelineCntID IS NULL
			AND Prov.CurrentProviderFlag = 'Y'



END

