CREATE TABLE [dbo].[ProviderSiteDatesPMDB] (
    [ProviderSiteDatesPMDBID] INT          IDENTITY (1, 1) NOT NULL,
    [PMUA_PrimaryKeyAdd]      INT          NULL,
    [PMUA_PrimaryKeyDelete]   INT          NULL,
    [ProviderMasterID]        INT          NULL,
    [StaffGroup]              VARCHAR (50) NULL,
    [SiteLocationID]          INT          NULL,
    [PMDBListOrder]           INT          NULL,
    [PMDBStartDate]           DATETIME     NULL,
    [PMDBEndDate]             DATETIME     NULL,
    [PMDBActiveFlag]          CHAR (1)     CONSTRAINT [DF_ProviderSiteDatesPMDB_PMDBActiveFlag] DEFAULT ('Y') NULL,
    [CreDate]                 DATETIME     CONSTRAINT [DF_ProviderSiteDatesPMDB_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]                 DATETIME     CONSTRAINT [DF_ProviderSiteDatesPMDB_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ProviderSiteDatesPMDB] PRIMARY KEY CLUSTERED ([ProviderSiteDatesPMDBID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [PMSB_PMstID_SLLID_Order_idx]
    ON [dbo].[ProviderSiteDatesPMDB]([ProviderMasterID] ASC, [SiteLocationID] ASC, [PMDBListOrder] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [PSDP_PMUA_PrimaryKey_idx]
    ON [dbo].[ProviderSiteDatesPMDB]([PMUA_PrimaryKeyAdd] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [PSDP_PMUA_PrimaryKeyDelete_idx]
    ON [dbo].[ProviderSiteDatesPMDB]([PMUA_PrimaryKeyDelete] ASC) WITH (FILLFACTOR = 90);

