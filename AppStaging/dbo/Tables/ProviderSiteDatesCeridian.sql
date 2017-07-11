CREATE TABLE [dbo].[ProviderSiteDatesCeridian] (
    [ProviderSiteDatesCeridianID] INT          IDENTITY (1, 1) NOT NULL,
    [ProviderMasterID]            INT          NULL,
    [StaffGroup]                  VARCHAR (50) NULL,
    [SiteLocationID]              INT          NULL,
    [FirstWorkedDate]             DATETIME     NULL,
    [LastWorkedDate]              DATETIME     NULL,
    [CreDate]                     DATETIME     CONSTRAINT [DF_MaxProviderSiteDate_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]                     DATETIME     CONSTRAINT [DF_MaxProviderSiteDate_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_MaxProviderSiteDate] PRIMARY KEY CLUSTERED ([ProviderSiteDatesCeridianID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [PSDC_ProviderMasterID_idx]
    ON [dbo].[ProviderSiteDatesCeridian]([ProviderMasterID] ASC, [SiteLocationID] ASC) WITH (FILLFACTOR = 90);

