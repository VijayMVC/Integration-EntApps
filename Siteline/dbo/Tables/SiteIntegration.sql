CREATE TABLE [dbo].[SiteIntegration] (
    [SFAccountId]          NCHAR (18)     NOT NULL,
    [SFContractId]         NCHAR (18)     NOT NULL,
    [WebCode]              CHAR (20)      NULL,
    [Hospital_NPI__c]      NVARCHAR (50)  NULL,
    [MARSPractice]         CHAR (3)       NULL,
    [ProcessLevel]         FLOAT (53)     NULL,
    [SiteLineID]           INT            NULL,
    [Practice_Location__c] NVARCHAR (255) NULL,
    [SFDCPublicName]       NVARCHAR (255) NOT NULL,
    [SFDCLegalName]        NVARCHAR (200) NULL,
    [MBSISiteName]         VARCHAR (100)  NULL,
    [MBSISiteShortName]    VARCHAR (50)   NULL,
    [SitelineName]         VARCHAR (100)  NULL,
    [LawsonSiteName]       CHAR (30)      NULL,
    [BillingStreet]        NVARCHAR (255) NULL,
    [BillingCity]          NVARCHAR (40)  NULL,
    [BillingState]         NVARCHAR (80)  NULL,
    [BillingPostalCode]    NVARCHAR (20)  NULL,
    [BillingCountry]       NVARCHAR (80)  NULL,
    [HospitalPhone]        NVARCHAR (50)  NULL
);

