CREATE TABLE [dbo].[NCRegionCount] (
    [WeeksBack]        INT            NULL,
    [RunDate]          DATETIME       NULL,
    [Region]           VARCHAR (5)    NULL,
    [RegionName]       NVARCHAR (100) NULL,
    [TotalNCProviders] INT            NULL,
    [MDNCProviders]    INT            NULL,
    [PANCProviders]    INT            NULL
);

