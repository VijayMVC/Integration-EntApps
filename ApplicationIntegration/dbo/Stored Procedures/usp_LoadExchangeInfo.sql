CREATE PROCEDURE [dbo].[usp_LoadExchangeInfo] 
AS

/* 	Author: 	Reetika	
	Date:		11/05/2012
	Purpose:	Load provider exchange info
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

		
		UPDATE ExchangeDataImport
		SET SamAccountName = LEFT(LTRIM(RTRIM(SamAccountName)), 
										CHARINDEX('@',LTRIM(RTRIM(SamAccountName)))-1)
		WHERE CHARINDEX('@',LTRIM(RTRIM(SamAccountName))) > 1
		
		UPDATE ExchangeDataImportEmployee
		SET SamAccountName = LEFT(LTRIM(RTRIM(SamAccountName)), 
										CHARINDEX('@',LTRIM(RTRIM(SamAccountName)))-1)
		WHERE CHARINDEX('@',LTRIM(RTRIM(SamAccountName))) > 1
			
			/*MATCH ON Email */
		update PROVIDERMASTER
		set exchangedirectoryname = LTRIM(RTRIM(SamAccountName))
		FROM PROVIDERMASTER, ExchangeDataImport O
		WHERE O.Email = LTRIM(RTRIM(PROVIDERMASTER.CEPEmailAddress))
		AND (PROVIDERMASTER.EXCHANGEDIRECTORYNAME IS NULL 
		OR PROVIDERMASTER.EXCHANGEDIRECTORYNAME = '')
		AND STAFFSTATUS <> 'Former Medical Staff'
		
		
		update PROVIDERMASTER
		set exchangedirectoryname = LTRIM(RTRIM(SamAccountName))
		FROM PROVIDERMASTER, ExchangeDataImport O
		WHERE O.Email = LTRIM(RTRIM(PROVIDERMASTER.CEPEmailAddress))
		AND o.MPID = PROVIDERMASTER.ProviderMasterID
		AND ISNUMERIC(o.MPID) = 1
		
		
		
		update PROVIDERMASTER
		set exchangedirectoryname = LEFT(LTRIM(RTRIM(exchangedirectoryname)), 
							CHARINDEX('@',LTRIM(RTRIM(exchangedirectoryname)))-1)
		where CHARINDEX('@',LTRIM(RTRIM(exchangedirectoryname))) > 1
		
		
	

	
	
END
