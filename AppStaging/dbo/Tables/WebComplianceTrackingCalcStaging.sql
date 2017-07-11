CREATE TABLE [dbo].[WebComplianceTrackingCalcStaging] (
    [RegionID]         INT             NULL,
    [RegionCode]       VARCHAR (10)    NULL,
    [WebCode]          VARCHAR (10)    NULL,
    [PercentComplete]  DECIMAL (10, 2) NULL,
    [NumberIncomplete] DECIMAL (10)    NULL,
    [RegionFlag]       CHAR (1)        NULL,
    [SiteFlag]         CHAR (1)        NULL
);

