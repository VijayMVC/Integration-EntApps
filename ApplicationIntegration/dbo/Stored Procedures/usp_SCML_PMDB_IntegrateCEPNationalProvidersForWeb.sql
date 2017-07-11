
CREATE PROCEDURE [dbo].[usp_SCML_PMDB_IntegrateCEPNationalProvidersForWeb] AS

/* 5/27/2005 Antonia Miller - 
	Stored Procedure created to load out of state CEP providers and sites into 
	areas of the ProviderMaster database to allow automatic loading of physicians into web 
	source data tables (ProviderMasterBase) and also other tables needed for processing 
	of web-based provider profile updates
6/17/2005 Added Insert into StaffHistory for Physician Extenders (DEP)
7/12/2005 Added Update to StaffHistory to change all DEP physician extenders to 
	StaffSubGroup = 'DEP Physician Extenders
4/26/2006 Added AEP staff group for physicians and physician extenders
8/13/2007 - Antonia Miller - Added TXP
11/29/2007 - Mohamed Mahmoud - modified TXP physician extenders insert
query to use 'CEP' in the where not exists to make sure CEP records are added to StaffHistory for PAs
2/12/2009 - Antonia Miller - Added ILP
5/14/2009 - Antonia Miller - Added WAP
12/04/2009 - Reetika Singh - Added WEP 
5/11/2011  - Reetika singh - Added KYP*/

--IS THIS NEEDED???
	

	/*UPDATE ARIZONA SITES TO MATCH WEB NEEDS, INFO COMES FROM ECHO THIS WAY*/
	UPDATE PROVIDERMASTERBASE
	SET 	SITE1 = CASE 	WHEN SITE1 = 'DEL3' THEN 'DEL1' 
				WHEN SITE1 = 'BOS3' THEN 'BOS1' ELSE SITE1 END,
		SITE2 = CASE 	WHEN SITE2 = 'DEL3' THEN 'DEL1' 
				WHEN SITE2 = 'BOS3' THEN 'BOS1' ELSE SITE2 END,
		SITE3 = CASE 	WHEN SITE3 = 'DEL3' THEN 'DEL1' 
				WHEN SITE3 = 'BOS3' THEN 'BOS1' ELSE SITE3 END,
		SITE4 = CASE 	WHEN SITE4 = 'DEL3' THEN 'DEL1' 
				WHEN SITE4 = 'BOS3' THEN 'BOS1' ELSE SITE4 END
	/*UPDATE SITE PRIMARY SITE FOR OREGON - ADVENTIST*/ 
	UPDATE PROVIDERMASTERBASE
	SET PRIMARYSITE = SL.SITELOCATIONNAME
	FROM PROVIDERMASTERBASE, SITELOCATIONLOOKUP SL
	WHERE PROVIDERMASTERBASE.SITE1 = SL.WEBCODE AND 
	PROVIDERMASTERBASE.SITE1 = 'ADV1'

	/*UPDATE SITE PRIMARY SITE FOR GEORGIA - DEKLAB MEDICAL CENTERS*/ 
	UPDATE PROVIDERMASTERBASE
	SET PRIMARYSITE = SL.SITELOCATIONNAME
	FROM PROVIDERMASTERBASE, SITELOCATIONLOOKUP SL
	WHERE PROVIDERMASTERBASE.SITE1 = SL.WEBCODE AND 
	PROVIDERMASTERBASE.SITE1 IN( 'DEK3', 'DEK5')


	/*UPDATE SITE PRIMARY SITE FOR ARIZONA */ 
	UPDATE PROVIDERMASTERBASE
	SET PRIMARYSITE = SL.SITELOCATIONNAME
	FROM PROVIDERMASTERBASE, SITELOCATIONLOOKUP SL
	WHERE PROVIDERMASTERBASE.SITE1 = SL.WEBCODE AND 
	PROVIDERMASTERBASE.SITE1 IN('DEL1', 'BOS1')

