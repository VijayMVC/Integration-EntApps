CREATE TABLE [dbo].[CEPMismatch] (
    [ProviderMasterID]    INT            NULL,
    [LawsonID]            INT            NULL,
    [LastName]            VARCHAR (50)   NULL,
    [FirstName]           VARCHAR (50)   NULL,
    [PMLevel]             VARCHAR (5)    NULL,
    [LawsonLevel]         VARCHAR (3)    NULL,
    [LawsonLevelEffDate]  VARCHAR (11)   NULL,
    [SFDCPartLevel]       VARCHAR (1)    NULL,
    [SFDCPartLevelFrom]   VARCHAR (11)   NULL,
    [SFDCStaffStatus]     NVARCHAR (255) NULL,
    [SFDCStaffStatusDate] VARCHAR (11)   NULL,
    [Status]              CHAR (1)       NULL
);

