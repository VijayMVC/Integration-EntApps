CREATE TABLE [dbo].[WebSiteLineHourlyStaging] (
    [CtrID]            INT           NULL,
    [SiteLocationID]   INT           NULL,
    [CtrBseHour]       MONEY         NULL,
    [CtrKey]           VARCHAR (100) NULL,
    [SiteLocationName] VARCHAR (100) NULL,
    [WebCode]          VARCHAR (10)  NULL,
    [MARSPracticeCode] VARCHAR (10)  NULL,
    [Credate]          DATETIME      CONSTRAINT [DF_WebSiteLineHourlyStaging_Credate] DEFAULT (getdate()) NULL
);

