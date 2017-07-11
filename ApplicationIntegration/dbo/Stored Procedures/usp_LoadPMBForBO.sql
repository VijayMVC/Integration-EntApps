
CREATE        PROCEDURE [dbo].[usp_LoadPMBForBO] 
AS

/* 	Author: 	Reetika Singh
	Date:	    8/24/2011
	Purpose:	Populate PMB for BO and update site codes with full Site Name
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	TRUNCATE TABLE ProviderMasterBaseBO
	
	
	INSERT INTO ProviderMasterBaseBO
	SELECT * FROM ProviderMasterBase
	
	
	--select * from ProviderMasterBaseBO

	UPDATE ProviderMasterBaseBO
	SET Site1 = HR.HospitalName
	FROM Hospital_region HR
	WHERE HR.Code = ProviderMasterBaseBO.Site1

	UPDATE ProviderMasterBaseBO
	SET Site2 = HR.HospitalName
	FROM Hospital_region HR
	WHERE HR.Code = ProviderMasterBaseBO.Site2

	UPDATE ProviderMasterBaseBO
	SET Site3 = HR.HospitalName
	FROM Hospital_region HR
	WHERE HR.Code = ProviderMasterBaseBO.Site3

	UPDATE ProviderMasterBaseBO
	SET Site4 = HR.HospitalName
	FROM Hospital_region HR
	WHERE HR.Code = ProviderMasterBaseBO.Site4

	
	

END

