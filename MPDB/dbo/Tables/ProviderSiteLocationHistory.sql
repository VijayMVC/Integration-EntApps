CREATE TABLE [dbo].[ProviderSiteLocationHistory] (
    [PSLH_ID]                     INT           NOT NULL,
    [ProviderMasterID]            INT           NOT NULL,
    [SiteLocationID]              INT           NULL,
    [StaffGroup]                  VARCHAR (50)  NULL,
    [SiteLocationName]            VARCHAR (100) NULL,
    [RegionID]                    INT           NULL,
    [RegionName]                  VARCHAR (100) NULL,
    [ProviderSiteDatesEchoID]     INT           NULL,
    [EchoListOrder]               INT           NULL,
    [EchoStartDate]               DATETIME      NULL,
    [EchoEndDate]                 DATETIME      NULL,
    [EchoActiveFlag]              CHAR (1)      CONSTRAINT [DF_ProviderSiteLocationHistory_EchoActiveFlag] DEFAULT ('N') NULL,
    [EchoFlag]                    CHAR (1)      CONSTRAINT [DF_ProviderSiteLocationHistory_EchoFlag] DEFAULT ('N') NULL,
    [ProviderSiteDatesCeridianID] INT           NULL,
    [FirstWorkedDate]             DATETIME      NULL,
    [LastWorkedDate]              DATETIME      NULL,
    [CeridianFlag]                CHAR (1)      CONSTRAINT [DF_ProviderSiteLocationHistory_CeridianFlag] DEFAULT ('N') NULL,
    [ProviderSiteDatesPMDBID]     INT           NULL,
    [PMDBListOrder]               INT           NULL,
    [PMDBAddDate]                 DATETIME      NULL,
    [PMDBDropDate]                DATETIME      NULL,
    [PMDBFlag]                    CHAR (1)      CONSTRAINT [DF_ProviderSiteLocationHistory_PMDBFlag] DEFAULT ('N') NULL,
    [ActiveFlag]                  CHAR (1)      CONSTRAINT [DF_ProviderSiteLocationHistory_ActivFlag] DEFAULT ('Y') NULL,
    [CreDate]                     DATETIME      CONSTRAINT [DF_ProviderSitesHistory_CREDate] DEFAULT (getdate()) NULL,
    [UpdDate]                     DATETIME      CONSTRAINT [DF_ProviderSitesHistory_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ProviderSiteLocationHistory] PRIMARY KEY CLUSTERED ([PSLH_ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [PSLH_ProvSiteLocID_idx]
    ON [dbo].[ProviderSiteLocationHistory]([ProviderMasterID] ASC, [SiteLocationID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [PSLH_ProvSDCID_idx]
    ON [dbo].[ProviderSiteLocationHistory]([ProviderSiteDatesCeridianID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [PSLH_ProvSDPMDBID_idx]
    ON [dbo].[ProviderSiteLocationHistory]([ProviderSiteDatesPMDBID] ASC) WITH (FILLFACTOR = 90);

