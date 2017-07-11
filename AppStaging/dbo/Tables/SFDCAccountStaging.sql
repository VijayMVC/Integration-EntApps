CREATE TABLE [dbo].[SFDCAccountStaging] (
    [AccountId]            NCHAR (18)     NOT NULL,
    [ContractId]           NCHAR (18)     NOT NULL,
    [Name]                 NVARCHAR (255) NOT NULL,
    [BillingStreet]        NVARCHAR (255) NULL,
    [BillingCity]          NVARCHAR (40)  NULL,
    [BillingState]         NVARCHAR (80)  NULL,
    [BillingPostalCode]    NVARCHAR (20)  NULL,
    [BillingCountry]       NVARCHAR (80)  NULL,
    [Practice_Location__c] NVARCHAR (255) NULL
);

