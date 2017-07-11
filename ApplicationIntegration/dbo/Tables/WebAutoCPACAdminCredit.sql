CREATE TABLE [dbo].[WebAutoCPACAdminCredit] (
    [ProviderMasterID]                INT            NULL,
    [LastName]                        VARCHAR (50)   NULL,
    [FirstName]                       VARCHAR (50)   NULL,
    [Title]                           VARCHAR (100)  NULL,
    [Administrative_Credit_Tier__c]   NVARCHAR (255) NULL,
    [Administrative_Credit_Amount__c] FLOAT (53)     NULL,
    [Unit__c]                         NVARCHAR (255) NULL,
    [FromDate]                        DATETIME2 (7)  NULL,
    [ToDate]                          DATETIME2 (7)  NULL,
    [Comments__c]                     NTEXT          NULL
);

