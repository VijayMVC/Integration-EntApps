CREATE TABLE [dbo].[WebSiteLineHourly] (
    [SiteName]         VARCHAR (100) NULL,
    [WebCode]          VARCHAR (20)  NULL,
    [MARSPracticeCode] VARCHAR (10)  NULL,
    [SiteLineHourly]   MONEY         NULL,
    [Credate]          DATETIME      CONSTRAINT [DF_WebSiteLineHourly_Credate] DEFAULT (getdate()) NULL
);

