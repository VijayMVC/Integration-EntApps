CREATE TABLE [dbo].[RecruitingNotification_Archive] (
    [LastName]      VARCHAR (50)   NULL,
    [FirstName]     VARCHAR (50)   NULL,
    [ScheduledDate] DATETIME       NULL,
    [SiteName]      VARCHAR (255)  NULL,
    [RecruiterName] NVARCHAR (121) NOT NULL,
    [Email]         VARCHAR (100)  NOT NULL,
    [CreDate]       DATE           CONSTRAINT [DF_RecruitingNotification_Archive_CreDate] DEFAULT (getdate()) NOT NULL
);

