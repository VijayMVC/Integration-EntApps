CREATE TABLE [dbo].[ReportStartDtMisMatch] (
    [MPID]                NVARCHAR (255) NULL,
    [FirstName]           NVARCHAR (121) NULL,
    [LastName]            NVARCHAR (121) NULL,
    [Title]               NVARCHAR (255) NULL,
    [SiteName]            NVARCHAR (255) NOT NULL,
    [SalesforceStartDate] DATE           NULL,
    [WebSchedule]         DATE           NULL,
    [Record_Status__c]    NVARCHAR (255) NULL,
    [Rehire__c]           VARCHAR (5)    NULL
);

