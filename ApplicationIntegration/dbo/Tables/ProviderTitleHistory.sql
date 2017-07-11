CREATE TABLE [dbo].[ProviderTitleHistory] (
    [TitleHistoryID]   INT           NOT NULL,
    [ProviderMasterID] INT           NULL,
    [StaffGroup]       VARCHAR (50)  NULL,
    [TitleCode]        CHAR (4)      NULL,
    [TitleDescr]       VARCHAR (100) NULL,
    [RegionID]         INT           NULL,
    [RegionName]       VARCHAR (100) NULL,
    [SiteLocationID]   INT           NULL,
    [SiteLocationName] VARCHAR (100) NULL,
    [StartDate]        DATETIME      NULL,
    [EndDate]          DATETIME      NULL,
    [ActiveFlag]       CHAR (1)      NULL,
    [SentFlag]         CHAR (1)      NULL,
    [SentDate]         DATETIME      NULL,
    [CreDate]          DATETIME      NULL,
    [UpdDate]          DATETIME      NULL
);

