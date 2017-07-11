CREATE TABLE [dbo].[CBOData] (
    [Id]                    NCHAR (18)      NOT NULL,
    [CBOSpecialty]          NVARCHAR (1000) NULL,
    [Status__c]             NVARCHAR (255)  NULL,
    [AccountName]           NVARCHAR (380)  NULL,
    [StageName]             NVARCHAR (40)   NOT NULL,
    [Opportunity_Detail__c] NVARCHAR (255)  NULL,
    [Lead_Source_Detail__c] NVARCHAR (1500) NULL,
    [NextStep]              NVARCHAR (255)  NULL,
    [Volume]                NVARCHAR (4000) NULL,
    [Mon DD, YYY]           VARCHAR (29)    NULL
);

