CREATE PROCEDURE [dbo].[usp_LoadProviderMasterForBO]
AS

/* 	Author: 	Reetika	
	Date:		12/18/2014
	Purpose:	Load ProviderMaster Info for BO
	Revision:	Added Partnership History info for Provider Enrollment to be able to see
				providers on LOA


*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


		select Contact__c, Partnership_History__c, From__c, To__c
		into #Temp1
		from SalesForce...Department_History__c DH
		where (Partnership_History__c like 'Leave%'
		or Partnership_History__c like 'Sabbatical%')
		AND Year(From__c) >= YEAR(GetDate()) - 2
		AND Exists (select 1
					from SalesForce...Department_History__c DH2
					where (Partnership_History__c like 'Leave%'
					or Partnership_History__c like 'Sabbatical%')
					AND Year(From__c) >= YEAR(GetDate()) - 2 
					AND DH.Contact__c = DH2.Contact__c
					Group by Contact__c
					HAVING DH.From__c = MAX(From__c) AND DH.To__c = MAX(To__c))
		order by From__c


			
		TRUNCATE TABLE ProviderMasterForBO
		
		INSERT INTO ProviderMasterForBO
		select PM.*, T.Partnership_History__c, 
			Convert(varchar(10), T.From__c) + ' - ' + Convert(varchar(10),T.To__c) As LOADate
		from ProviderMaster PM
		left outer join #Temp1 T on T.Contact__c = PM.SFID
		order by PM.ProviderMasterID desc


			

	    --select * from ProviderMasterForBO

				
				
END
