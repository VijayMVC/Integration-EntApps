CREATE TABLE [dbo].[WebComplianceTrackingCalcTemp] (
    [Region]           INT             NULL,
    [RegionCode]       VARCHAR (10)    NULL,
    [WebCode]          VARCHAR (10)    NULL,
    [CountRegionYes]   DECIMAL (10)    NULL,
    [CountSiteYes]     DECIMAL (10)    NULL,
    [CountTotalRegion] DECIMAL (10)    NULL,
    [CountTotalSite]   DECIMAL (10)    NULL,
    [RegionFlag]       CHAR (1)        NULL,
    [SiteFlag]         CHAR (1)        NULL,
    [PercentComplete]  DECIMAL (10, 2) NULL,
    [NumberIncomplete] DECIMAL (10)    NULL
);

