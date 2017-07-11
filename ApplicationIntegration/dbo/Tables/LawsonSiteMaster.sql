CREATE TABLE [dbo].[LawsonSiteMaster] (
    [SiteMasterID]       INT       NOT NULL,
    [ProcessLevel]       CHAR (5)  NOT NULL,
    [ProcessLevelName]   CHAR (30) NOT NULL,
    [SiteLineCmpID]      INT       NULL,
    [HospitalRegionID]   INT       NULL,
    [HospitalRegionCode] CHAR (20) NULL,
    [SiteLocationID]     INT       NULL,
    [EchoLink]           INT       NULL,
    [CreDate]            DATETIME  NULL
);

