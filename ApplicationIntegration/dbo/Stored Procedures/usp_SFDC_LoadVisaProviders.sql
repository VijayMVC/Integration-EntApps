USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_SFDC_LoadVisaProviders]    Script Date: 01/05/2017 13:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[usp_SFDC_LoadVisaProviders] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Load Status, start Date, Transition and End date for H-1B Visa providers
	Revision:	

*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS ON 

BEGIN

	
		--advancements with Provider Status

		if object_id('dbo.#TempNewPS') is not null
		begin
		  drop table dbo.#TempNewPS
		end
		
		if object_id('dbo.#TempDH') is not null
		begin
		  drop table dbo.#TempNewPS
		end
		
		if object_id('dbo.#TempFac') is not null
		begin
		  drop table dbo.#TempNewPS
		end
		
		--Get SFDC data

		
		SELECT *
			INTO #TempFac
		FROM (SELECT * FROM OPENQUERY(SALESFORCE, 
					'SELECT * FROM Facility__c '))Fac
		
		
		
		SELECT *
			INTO #TempDH
		FROM (SELECT * FROM OPENQUERY(SALESFORCE, 
					'SELECT * FROM Department_History__c'))DH
		
		
		
		
		
		
		
		

		SELECT PMB.SFID Id, 
				PMB.ProviderMasterID Provider_Master_ID__c, 
				PMB.WebID, 
				PMB.LastName, 
				PMB.FirstName, 
				F.Facility__c,
				DH.Partnership_History__c, 
				DH.Partnership_History_Details_1__c, 
				DH.From__c, 
				DH.To__c, 
				F.Department__c,
				F.Record_Status__c, 
				DH.Id AS PartHistId--, F.Staff_Status1__c
			INTO #TempNewPS
		FROM ApplicationIntegration.dbo.ProviderMasterBase PMB
		JOIN #TempDH DH
				ON DH.Contact__c = PMB.SFID
		JOIN #TempFac F
				ON F.Contact__c = DH.Contact__c
				AND F.Staff_Status_Date__c = DH.From__c
		WHERE --DH.Contact__c = '003G000000zdgNpIAI'
			PMB.SFID IN (SELECT Contact__c 
						FROM #TempFac
						WHERE Staff_Status1__c LIKE 'Visa%')
			AND PMB.Status = 0
		ORDER BY DH.From__c


		--SELECT * FROM #TempNewPS

		----subsequent advancements

		TRUNCATE TABLE SFDCVisaProvidersForWeb

		INSERT INTO SFDCVisaProvidersForWeb

		SELECT Id SFID, LTRIM(RTRIM(Provider_Master_ID__c)) ProviderMasterID, WebID, LastName, FirstName,
		Partnership_History__c, Partnership_History_Details_1__c, From__c, To__c,
		Department__c--, Staff_Status1__c --INTO SFDCVisaProvidersForWeb
		FROM (

		SELECT * 
		FROM #TempNewPS

		UNION


		SELECT PMB.SFID Id, 
				PMB.ProviderMasterID Provider_Master_ID__c,
				PMB.WebID, 
				PMB.LastName, 
				PMB.FirstName, 
				F.Facility__c,
				Partnership_History__c, 
				Partnership_History_Details_1__c, 
				DH.From__c, 
				DH.To__c, 
				F.Department__c,
		F.Record_Status__c, DH.Id AS PartHistId--, F.Staff_Status1__c
		FROM ApplicationIntegration.dbo.ProviderMasterBase PMB
		JOIN #TempDH DH
				ON DH.Contact__c = PMB.SFID
		JOIN #TempFac F
				ON F.Contact__c = DH.Contact__c
		WHERE --DH.Contact__c = '003G000000zdgNpIAI'
			PMB.SFID IN (SELECT Contact__c 
						FROM #TempFac
						WHERE Staff_Status1__c LIKE 'Visa%')
			AND DH.Id NOT IN (SELECT PartHistId FROM #TempNewPS)
			AND DH.To__c IS NULL
			AND DH.Partnership_History__c LIKE '%Partnership%'
			AND F.To__c IS NULL
			AND PMB.Status = 0
		
		UNION --Getting Employees with fellowship
		
		SELECT PMB.SFID Id, 
				PMB.ProviderMasterID Provider_Master_ID__c,
				PMB.WebID, 
				PMB.LastName, 
				PMB.FirstName, 
				F.Facility__c,
				Partnership_History__c, 
				Partnership_History_Details_1__c, 
				DH.From__c, 
				DH.To__c, 
				F.Department__c,
				F.Record_Status__c, 
				DH.Id AS PartHistId--, F.Staff_Status1__c
		--//INTO #TempNewPS
		FROM ApplicationIntegration.dbo.ProviderMasterBase PMB
		JOIN #TempDH DH
				ON DH.Contact__c = PMB.SFID
		JOIN #TempFac F
				ON F.Contact__c = DH.Contact__c
				AND F.Staff_Status_Date__c = DH.From__c
		WHERE DH.Partnership_History_Details_1__c = 'Fellowship'
		AND DH.To__c IS NULL
		AND DH.Partnership_History__c = 'Employee'
		AND F.Staff_Status1__c = 'Employee'
		AND PMB.Status = 0
		) Visa
		ORDER BY ProviderMasterID



		DELETE FROM SFDCVisaProvidersForWeb
		WHERE Partnership_History__c LIKE '%Meeting%'

		/* 3/2/2016 -- SFDC-1105
						Filter out non-physicians in the H1-B visa history table */
						
		DELETE FROM SFDCVisaProvidersForWeb
		WHERE ProviderMasterID IN (SELECT ProviderMasterID FROM ProviderMasterBase
								WHERE Title NOT LIKE 'M%D%'
									AND Title NOT LIKE 'D%O%' )
								

		--SELECT * FROM SFDCVisaProvidersForWeb
		--ORDER BY ProviderMasterID, From__c

		--select * from ProvideRMaster
		--where LastName = 'Chopra'


END
