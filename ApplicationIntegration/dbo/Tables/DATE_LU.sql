CREATE TABLE [dbo].[DATE_LU] (
    [DATE_LUPrimeKey]       INT      NOT NULL,
    [DateMMDDYYYY]          DATETIME NULL,
    [MonthName]             CHAR (3) NULL,
    [Qtr]                   CHAR (6) NULL,
    [Qtr2]                  CHAR (5) NULL,
    [YearYYYY]              CHAR (4) NULL,
    [DayName]               CHAR (3) NULL,
    [WE_WD]                 CHAR (7) NULL,
    [YrMoPeriod]            CHAR (6) NULL,
    [MonthEnd]              DATETIME NULL,
    [MonthForZeroedAccount] CHAR (6) NULL
);

