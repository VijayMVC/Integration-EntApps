CREATE TABLE [dbo].[RecruitingNotification] (
    [LastName]      VARCHAR (50)   NULL,
    [FirstName]     VARCHAR (50)   NULL,
    [ScheduledDate] DATETIME       NULL,
    [SiteName]      VARCHAR (255)  NULL,
    [RecruiterName] NVARCHAR (121) NOT NULL,
    [Email]         VARCHAR (100)  NOT NULL
);

