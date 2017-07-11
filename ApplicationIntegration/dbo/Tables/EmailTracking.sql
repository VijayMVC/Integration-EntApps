CREATE TABLE [dbo].[EmailTracking] (
    [ProviderMasterID]                INT           NULL,
    [ProviderMasterIDActiveDirectory] INT           NULL,
    [WebID]                           INT           NULL,
    [Lastname]                        VARCHAR (50)  NULL,
    [Preferredname]                   VARCHAR (50)  NULL,
    [Title]                           VARCHAR (100) NULL,
    [LastEmailLoginDate]              DATETIME      NULL,
    [UnreadEmailMessageCount]         INT           NULL
);

