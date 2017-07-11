CREATE PROCEDURE [dbo].[usp_PMDB_LoadProviderMasterIDForReferentialIntegrity] 
AS

/* 	Author: 	Andrew Marsh
	Date:		2/24/2005
	Purpose:	Load ProviderMasterID first, otherwise foreign key constraints will cause errors.
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	INSERT INTO ProviderMaster 
		(ProviderMasterID)
	SELECT 	TPrv.ProviderMasterID
		FROM TempProviderMaster TPrv
		WHERE NOT EXISTS
			(SELECT 1
				FROM ProviderMaster Prov
				WHERE TPrv.ProviderMasterID = Prov.ProviderMasterID)
END


