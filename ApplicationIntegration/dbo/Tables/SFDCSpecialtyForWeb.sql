CREATE TABLE [dbo].[SFDCSpecialtyForWeb] (
    [SFID]                          NCHAR (18)     NULL,
    [ProviderMasterID]              INT            NULL,
    [LastName]                      VARCHAR (50)   NULL,
    [FirstName]                     VARCHAR (50)   NULL,
    [Specialty__c]                  NVARCHAR (255) NULL,
    [Board_Eligible__c]             NVARCHAR (255) NULL,
    [Certified__c]                  NVARCHAR (255) NULL,
    [Expiration_Date__c]            DATETIME2 (7)  NULL,
    [Initial_Certification_Date__c] DATETIME2 (7)  NULL,
    [Recertification_Date__c]       DATETIME2 (7)  NULL
);

