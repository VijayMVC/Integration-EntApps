CREATE TABLE [dbo].[SiteLocationSiteLineMatches] (
    [SLLSiteLineID]  INT           NOT NULL,
    [SiteLocationID] INT           NULL,
    [SiteLineCtrID]  INT           NULL,
    [SiteLineCtrKey] VARCHAR (100) NULL,
    [CreDate]        DATETIME      CONSTRAINT [DF_SiteLocationSiteLineMatches_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]        DATETIME      CONSTRAINT [DF_SiteLocationSiteLineMatches_UpdDate] DEFAULT (getdate()) NULL
);

