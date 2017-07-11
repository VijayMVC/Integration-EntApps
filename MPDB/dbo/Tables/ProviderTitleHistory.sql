CREATE TABLE [dbo].[ProviderTitleHistory] (
    [TitleHistoryID]   INT           NOT NULL,
    [ProviderMasterID] INT           NULL,
    [StaffGroup]       VARCHAR (50)  NULL,
    [TitleCode]        CHAR (4)      NULL,
    [TitleDescr]       VARCHAR (100) NULL,
    [RegionID]         INT           NULL,
    [RegionName]       VARCHAR (100) CONSTRAINT [DF_ProviderTitleHistory_RegionName] DEFAULT (' ') NULL,
    [SiteLocationID]   INT           NULL,
    [SiteLocationName] VARCHAR (100) CONSTRAINT [DF_ProviderTitleHistory_SiteName] DEFAULT (' ') NULL,
    [StartDate]        DATETIME      CONSTRAINT [DF_TitleHistory_StartDate] DEFAULT (getdate()) NULL,
    [EndDate]          DATETIME      NULL,
    [ActiveFlag]       CHAR (1)      CONSTRAINT [DF_TitleHistory_ActiveFlag] DEFAULT ('Y') NULL,
    [SentFlag]         CHAR (1)      CONSTRAINT [DF_ProviderTitleHistory_SentFlag] DEFAULT ('N') NULL,
    [SentDate]         DATETIME      NULL,
    [CreDate]          DATETIME      CONSTRAINT [DF_TitleHistory_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]          DATETIME      CONSTRAINT [DF_TitleHistory_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_TitleHistory] PRIMARY KEY CLUSTERED ([TitleHistoryID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [TitleHistory_ProviderMasterID_idx]
    ON [dbo].[ProviderTitleHistory]([ProviderMasterID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TitleHistory_SiteID_idx]
    ON [dbo].[ProviderTitleHistory]([SiteLocationID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TitleHistory_ActiveFlag_idx]
    ON [dbo].[ProviderTitleHistory]([ActiveFlag] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [ProviderTitleHistory_TitleCode_idx]
    ON [dbo].[ProviderTitleHistory]([TitleCode] ASC) WITH (FILLFACTOR = 90);

