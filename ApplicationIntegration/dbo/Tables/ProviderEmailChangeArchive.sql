CREATE TABLE [dbo].[ProviderEmailChangeArchive] (
    [PMUA_PrimaryKey]       INT          NULL,
    [StaffGroup]            VARCHAR (50) NULL,
    [ProviderMasterID]      INT          NULL,
    [StaffGroupEmailSuffix] VARCHAR (50) NULL,
    [UpdatedFlag]           CHAR (1)     NULL,
    [UpdatedDate]           DATETIME     NULL,
    [CREDATE]               DATETIME     NULL,
    [UPDDATE]               DATETIME     NULL
);

