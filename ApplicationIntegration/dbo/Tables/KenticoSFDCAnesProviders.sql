CREATE TABLE [dbo].[KenticoSFDCAnesProviders] (
    [ProviderMasterID]     INT            NULL,
    [LastName]             VARCHAR (255)  NULL,
    [FirstName]            VARCHAR (255)  NULL,
    [Title]                VARCHAR (100)  NULL,
    [EducationalInstitute] NVARCHAR (255) NULL,
    [Address1]             NVARCHAR (255) NULL,
    [Address2]             NVARCHAR (100) NULL,
    [City]                 NVARCHAR (100) NULL,
    [State]                NVARCHAR (255) NULL,
    [AccountName]          VARCHAR (255)  NULL,
    [Practice_Location__c] NVARCHAR (255) NULL,
    [BillingStreet]        NVARCHAR (255) NULL,
    [BillingCity]          NVARCHAR (40)  NULL,
    [BillingState]         NVARCHAR (80)  NULL,
    [BillingPostalCode]    NVARCHAR (20)  NULL
);

