CREATE TABLE [dbo].[Galen_NCSiteCount] (
    [WeeksBack]        INT            NULL,
    [RunDate]          DATETIME       NULL,
    [Region]           VARCHAR (5)    NULL,
    [SiteCode]         VARCHAR (20)   NULL,
    [SiteName]         NVARCHAR (100) NULL,
    [TotalNCProviders] INT            NULL,
    [MDNCProviders]    INT            NULL,
    [PANCProviders]    INT            NULL
);

