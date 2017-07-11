

CREATE   PROCEDURE [dbo].[usp_SFDC_PartHistToProviderStatus]
AS
/* 	Author: 	Reetika
	Date:		12/19/2012
	Purpose:	In Salesforce:
					If Partnership History..PartnershipHistoryCategory 
					in (Level 1 Partnership, Level 2 Partnership, 
						Level 3 Partnership, Level 4 Partnership, Full Partnership, 
							Senior Partnership) and ‘To Date’ is null - 
					Then Update ProviderStatus..StaffStatus and StaffStatusDate		
					to match…

	Revision:	*/


SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN 




	--SELECT C.Name, PH.Contact__c, PH.From__c, PH.Partnership_History__c,
	--		Fac.Staff_Status1__c, Fac.Staff_Status_Date__c
	--FROM SalesforceSB...Department_History__c PH 
	--JOIN SalesforceSB...Facility__c Fac ON Fac.Contact__c = PH.Contact__c
	--JOIN SalesforceSB...Contact C ON C.Id = PH.Contact__c
	--WHERE PH.Partnership_History__c IN ('Level 2 Partnership',
	--								'Full Partnership',
	--								'Senior Partnership',
	--								'Level 1 Partnership',
	--								'Level 3 Partnership',
	--								'Level 4 Partnership')
	--AND PH.To__c IS NULL
	--AND PH.Entity__c = Fac.Facility__c
	
	
	
	UPDATE SalesForceSB...Facility__c
	SET Staff_Status1__c = PH.Partnership_History__c,
		Staff_Status_Date__c = PH.From__c
	FROM SalesforceSB...Department_History__c PH 
	JOIN SalesForceSB...Facility__c Fac ON Fac.Contact__c = PH.Contact__c
	WHERE PH.Partnership_History__c IN ('Level 2 Partnership',
									'Full Partnership',
									'Senior Partnership',
									'Level 1 Partnership',
									'Level 3 Partnership',
									'Level 4 Partnership')
	AND PH.To__c IS NULL 
	AND DIFFERENCE(PH.Entity__c , Fac.Facility__c) = 4





	--SELECT C.Name, PH.Contact__c, PH.From__c, PH.Partnership_History__c,
	--		Fac.Staff_Status1__c, Fac.Staff_Status_Date__c, 
	--		 PH.Entity__c , Fac.Facility__c
	--FROM SalesforcesB...Department_History__c AS PH 
	--JOIN SalesforcesB...Facility__c AS Fac ON Fac.Contact__c = PH.Contact__c
	--JOIN SalesforcesB...Contact C ON C.Id = PH.Contact__c
	--WHERE PH.Partnership_History__c IN ('Level 2 Partnership',
	--								'Full Partnership',
	--								'Senior Partnership',
	--								'Level 1 Partnership',
	--								'Level 3 Partnership',
	--								'Level 4 Partnership')
	--AND PH.To__c IS NULL
	--AND Fac.To__C IS NULL
	--AND PH.From__c IS NOT NULL 
	--AND PH.From__C IN (SELECT MAX(From__C)
	--					FROM Salesforce...Department_History__c PH1
	--					WHERE PH.Contact__c = PH1.Contact__c
	--					AND PH1.To__c IS NULL
	--					AND PH1.Partnership_History__c IN ('Level 2 Partnership',
	--								'Full Partnership',
	--								'Senior Partnership',
	--								'Level 1 Partnership',
	--								'Level 3 Partnership',
	--								'Level 4 Partnership'))
	--AND DIFFERENCE(PH.Entity__c , Fac.Facility__c) = 4
	--AND (PH.Partnership_History__c <> Fac.Staff_Status1__c
	--		OR Staff_Status_Date__c <> PH.From__c)
	



END


