CREATE TABLE [dbo].[WebComplianceTrackingStaging] (
    [ID]                      INT           NOT NULL,
    [ProviderMasterID]        INT           NULL,
    [LastName]                VARCHAR (50)  NULL,
    [FirstName]               VARCHAR (30)  NULL,
    [Title]                   VARCHAR (100) NULL,
    [webcode]                 VARCHAR (10)  NULL,
    [RegionID]                INT           NULL,
    [RegionCode]              VARCHAR (10)  NULL,
    [ComplianceCompleted]     CHAR (1)      NULL,
    [ComplianceCompletedDate] DATETIME      NULL
);

