CREATE TABLE [dbo].[LSTrack] (
    [SalesforceID]     NVARCHAR (255) NULL,
    [ProviderMasterID] FLOAT (53)     NULL,
    [LastName]         NVARCHAR (255) NULL,
    [FirstName]        NVARCHAR (255) NULL,
    [Date_From]        DATETIME       NULL,
    [Date_To]          DATETIME       NULL,
    [Title/Role]       NVARCHAR (255) NULL,
    [Details]          NVARCHAR (255) NULL,
    [AccountID]        NVARCHAR (255) NULL,
    [AccountName]      NVARCHAR (255) NULL,
    [Notes]            NVARCHAR (255) NULL
);

