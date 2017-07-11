CREATE TABLE [dbo].[PhysInfoMBSIInsert] (
    [StaffGroup1]      VARCHAR (50)   NULL,
    [LawsonID]         INT            NULL,
    [WebID]            INT            NULL,
    [ProviderMasterID] INT            NULL,
    [FirstName]        VARCHAR (50)   NULL,
    [PreferredName]    VARCHAR (50)   NULL,
    [LastName]         VARCHAR (50)   NULL,
    [SamAccountName]   NVARCHAR (255) NULL,
    [Title]            VARCHAR (100)  NULL,
    [EmailAddress]     VARCHAR (100)  NULL,
    [Site1]            VARCHAR (5)    NOT NULL,
    [Status]           CHAR (2)       NULL
);

