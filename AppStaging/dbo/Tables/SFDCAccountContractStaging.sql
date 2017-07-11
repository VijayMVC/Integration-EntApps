CREATE TABLE [dbo].[SFDCAccountContractStaging] (
    [AccountId]                 NCHAR (18)      NOT NULL,
    [ContractId]                NCHAR (18)      NOT NULL,
    [WebCode]                   CHAR (20)       NULL,
    [Public_Name__c]            NVARCHAR (255)  NULL,
    [BillingStreet]             NVARCHAR (255)  NULL,
    [BillingCity]               NVARCHAR (40)   NULL,
    [BillingState]              NVARCHAR (80)   NULL,
    [BillingPostalCode]         NVARCHAR (20)   NULL,
    [BillingCountry]            NVARCHAR (80)   NULL,
    [Phone__c]                  NVARCHAR (1300) NULL,
    [Practice_Location__c]      NVARCHAR (255)  NULL,
    [Practice_Location_Code__c] NVARCHAR (255)  NULL
);

