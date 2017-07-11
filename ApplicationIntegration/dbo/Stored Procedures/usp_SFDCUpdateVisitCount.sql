
CREATE        PROCEDURE [dbo].[usp_SFDCUpdateVisitCount] 
AS

/* 	Author: 	Reetika Singh
	Date:	    10/17/2012
	Purpose:	UPDATE Patient Visits in SFDC (Quaterly)
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

		DROP TABLE SystemSiteLookup


		SELECT DISTINCT HR.Code, HR.HospitalName, HR.SFID, HR.TCstruct, LP.WebCode, 
		LP.ProcessLevel, TC.CtrKey, TC.CtrTin, TB.Bdg_CtrID, TB.BdgPatients, 
		LM.MARSPractice, TC.Ctr_CtrTypID, TC.CtrID
		into SystemSiteLookup
		from Hospital_region HR
		left outer join LS_pLevelLookup LP
			on HR.Code = LP.WebCode
		left outer join Siteline_TblCtr TC
			on TC.CtrTin = LP.ProcessLevel
		left outer join Siteline_TblBdg TB
			ON TC.CtrID = TB.Bdg_CtrID
		left outer join LocationCrossMapMARS LM
			ON LM.Site = HR.Code
		WHERE TB.BdgYear = YEAR(GetDate())


			
		--ED UPDATE	
		UPDATE Salesforce...[Contract]
			SET Visit_Count__c = SS.BdgPatients
		FROM SystemSiteLookup SS
		WHERE [Contract].Id = SS.TCstruct

		 
		 --Update ED visits on Account for CEP America sites
		 UPDATE Salesforce...Account
			SET vem__c = SS.BdgPatients
		 FROM SystemSiteLookup SS
		 WHERE [Account].Id = SS.SFID
		  AND SS.Ctr_CtrTypID = 'ED'
		 
		 

	
	

END

