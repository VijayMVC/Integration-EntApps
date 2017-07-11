CREATE TABLE [dbo].[FluWeekRegion] (
    [RegionCode]  VARCHAR (20)    NULL,
    [RegionDescr] VARCHAR (100)   NULL,
    [Week]        INT             NULL,
    [MonthName]   VARCHAR (20)    NULL,
    [MonthNbr]    INT             NULL,
    [PercentFlu]  NUMERIC (10, 4) NULL,
    [YearRange]   VARCHAR (20)    NULL
);

