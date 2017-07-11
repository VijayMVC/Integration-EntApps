CREATE TABLE [dbo].[ProviderEmailChangeArchive] (
    [PMUA_PrimaryKey]       INT          NULL,
    [StaffGroup]            VARCHAR (50) NULL,
    [ProviderMasterID]      INT          NULL,
    [StaffGroupEmailSuffix] VARCHAR (50) NULL,
    [UpdatedFlag]           CHAR (1)     CONSTRAINT [DF_ProviderEmailChangeArchive_UpdatedFlag] DEFAULT ('N') NULL,
    [UpdatedDate]           DATETIME     NULL,
    [CREDATE]               DATETIME     CONSTRAINT [DF_ProviderEmailChangeArchive_CREDATE] DEFAULT (getdate()) NULL,
    [UPDDATE]               DATETIME     CONSTRAINT [DF_ProviderEmailChangeArchive_UPDDATE] DEFAULT (getdate()) NULL
);


GO
CREATE CLUSTERED INDEX [PECA_PMUA_PrimaryKey_idx]
    ON [dbo].[ProviderEmailChangeArchive]([PMUA_PrimaryKey] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [PECA_StaffGroup_ProviderMasterID_idx]
    ON [dbo].[ProviderEmailChangeArchive]([StaffGroup] ASC, [ProviderMasterID] ASC) WITH (FILLFACTOR = 90);

