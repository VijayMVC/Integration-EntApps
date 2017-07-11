

CREATE PROCEDURE [dbo].[usp_SFDC_InsertProcessLevel] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Insert process level for a new site in Ls_plevellookup
	Revision:	

*/



SET ANSI_WARNINGS ON 

BEGIN

	INSERT INTO LS_pLevelLookup
	SELECT HR.Code, NULL
	FROM Hospital_region HR
	LEFT OUTER JOIN LS_pLevelLookup LP
		 ON (HR.Code=LP.WebCode) 
	WHERE LP.WebCode IS NULL
		AND HR.status = 0
		AND HR.TCstruct IS NOT NULL
		AND HR.Code NOT IN ('DET2')
		
	
	--Update Process Level from SFDC
	
	UPDATE LS_pLevelLookup
	SET ProcessLevel = C.Process_Level__c
	FROM SalesForce...Contract C
	JOIN Hospital_region HR on HR.TCstruct = C.Id
	WHERE LS_pLevelLookup.WebCode = HR.Code
	AND LS_pLevelLookup.ProcessLevel IS NULL

	
--select * FROM LS_pLevelLookup,SalesForce...Contract C
--	JOIN Hospital_region HR on HR.TCstruct = C.Id
--	WHERE LS_pLevelLookup.WebCode = HR.Code
--	AND LS_pLevelLookup.ProcessLevel IS NULL




END


