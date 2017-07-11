CREATE TABLE [dbo].[FluAgeRegion] (
    [AgeGroup]         VARCHAR (20)    NULL,
    [RegionCode]       VARCHAR (20)    NULL,
    [RegionDescr]      VARCHAR (100)   NULL,
    [PercentFlu]       NUMERIC (10, 4) NULL,
    [PercentFluAdmits] NUMERIC (10, 4) NULL,
    [YearRange]        VARCHAR (20)    NULL,
    [WeekEnding]       DATETIME        NULL
);

