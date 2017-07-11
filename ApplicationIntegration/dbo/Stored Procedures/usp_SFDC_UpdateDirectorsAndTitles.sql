CREATE PROCEDURE [dbo].[usp_SFDC_UpdateDirectorsAndTitles] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Updates The Director Flags
	Revision:	Reetika - Added new title for KY - A.R.P.N.
*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


	UPDATE ProviderMaster
	SET PAFlag	= CASE WHEN Prov.Title LIKE '%M.D.%' 
						OR Prov.Title LIKE '%D.O.%' THEN 'N'
					ELSE 'Y' END	
	FROM ProviderMaster Prov
	WHERE Prov.CurrentProviderFlag = 'Y'

/* Need to updated flags */	
	UPDATE ProviderMaster
		SET BoardMember = 'N'
	WHERE BoardMember = 'Y'

	UPDATE ProviderMaster
	SET BoardMember = 'Y'
	WHERE EXISTS (SELECT 1
				FROM PhysicianInfo PI2
				WHERE ProviderMaster.WebID = PI2.ID
				  AND PI2.Code LIKE '%BD%')

	UPDATE ProviderMaster
	SET RegionalDirector = 'N'
	WHERE RegionalDirector = 'Y'

	UPDATE ProviderMaster
	SET RegionalDirector = 'Y'
	WHERE EXISTS
		(SELECT 1
			FROM ProviderTitleHistory PTH
			WHERE ProviderMaster.ProviderMasterID = PTH.ProviderMasterID
			  AND PTH.TitleCode = 'RD'
			  AND PTH.ActiveFlag = 'Y'
			  AND PTH.StaffGroup = 'CEP')

	UPDATE ProviderMaster
		SET MedicalDirector = 'N'
	WHERE MedicalDirector = 'Y'

	UPDATE ProviderMaster
		SET MedicalDirector = 'Y'
		WHERE EXISTS
		(SELECT 1
			FROM ProviderTitleHistory PTH
			WHERE ProviderMaster.ProviderMasterID = PTH.ProviderMasterID
			  AND PTH.TitleCode = 'MD'
			  AND PTH.ActiveFlag = 'Y'
			  AND PTH.StaffGroup = 'CEP')

	UPDATE ProviderMaster
		SET QIDirector = 'N'
		WHERE QIDirector = 'Y'

	UPDATE ProviderMaster
		SET QIDirector = 'Y'
		WHERE EXISTS
		(SELECT 1
			FROM ProviderTitleHistory PTH
			WHERE ProviderMaster.ProviderMasterID = PTH.ProviderMasterID
			  AND PTH.TitleCode IN ('QI1','QI2','QI3','QI4','QI5')
			  AND PTH.ActiveFlag = 'Y'
			  AND PTH.StaffGroup = 'CEP')

	UPDATE ProviderMaster
		SET AnyDirector = 'N'
		WHERE AnyDirector = 'Y'

	UPDATE ProviderMaster
		SET AnyDirector = 'Y'
			WHERE EXISTS
		(SELECT 1
			FROM ProviderTitleHistory PTH
			INNER JOIN PhysicianInfo PhI
				ON PTH.ProviderMasterID = PhI.MPID
			WHERE ProviderMaster.ProviderMasterID = PTH.ProviderMasterID
			  AND PhI.GroupCode = 'director'
			  AND PTH.ActiveFlag = 'Y'
			  AND PTH.StaffGroup = 'CEP')
			  

END
