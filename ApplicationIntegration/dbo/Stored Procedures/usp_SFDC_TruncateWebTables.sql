CREATE PROCEDURE [dbo].[usp_SFDC_TruncateWebTables] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Truncate SFDC Tables for Web Portal
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	TRUNCATE TABLE SFDCLicensesForWeb

	TRUNCATE TABLE SFDCSocietiesForWeb

	TRUNCATE TABLE SFDCMasterForWeb

	TRUNCATE TABLE SFDCInsuranceForWeb

	TRUNCATE TABLE SFDCEducationForWeb

	TRUNCATE TABLE SFDCCommitteesForWeb

	TRUNCATE TABLE SFDCAffiliationsForWeb

	TRUNCATE TABLE SFDCAddressForWeb
	                 
END
