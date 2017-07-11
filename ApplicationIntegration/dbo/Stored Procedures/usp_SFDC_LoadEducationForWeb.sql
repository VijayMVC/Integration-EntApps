
CREATE PROCEDURE [dbo].[usp_SFDC_LoadEducationForWeb]
AS
	
	TRUNCATE TABLE SFDCEducationForWeb

	INSERT INTO SFDCEducationForWeb
	SELECT Prov.SFID,
	Prov.ProviderMasterID,
	Prov.WebID,
	SFEDU.Education_Type__c,
	SFSchool.Name,
	SFEDU.From__c,
	SFEDU.To__c,
	GETDATE(),
	GETDATE()
	FROM ProviderMaster Prov
	JOIN AppStaging.dbo.SFDCEducationStaging SFEDU 
			ON SFEDU.Contact__c = Prov.SFID
	JOIN SalesforceSB...E_T_Institution__c SFSchool  
			ON SFSchool.Id = SFEDU.Institution_1__c
	ORDER BY ProviderMasterID
	
	
