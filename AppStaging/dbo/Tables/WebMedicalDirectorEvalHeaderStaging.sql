CREATE TABLE [dbo].[WebMedicalDirectorEvalHeaderStaging] (
    [ProviderMasterIDEvaluee] INT           NULL,
    [RegionID]                INT           NULL,
    [WebRegionCode]           VARCHAR (10)  NULL,
    [RegionName]              VARCHAR (100) NULL,
    [ProviderMasterIDRD]      INT           NULL,
    [SiteLocationName]        VARCHAR (100) NULL,
    [SiteLocationID]          INT           NULL,
    [SiteWebCode]             CHAR (4)      NULL,
    [LastNameEvaluee]         VARCHAR (50)  NULL,
    [FirstNameEvaluee]        VARCHAR (50)  NULL,
    [Credate]                 DATETIME      NULL
);

