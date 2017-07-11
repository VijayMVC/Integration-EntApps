CREATE TABLE [dbo].[PayrollReporting_MissingClockNbrPA] (
    [PMCN_ID]           INT          NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [SiteLocationID]    INT          NULL,
    [YrMoPeriod]        CHAR (6)     NULL,
    [LastName]          VARCHAR (50) NULL,
    [FirstName]         VARCHAR (50) NULL,
    [CurrentPeriodFlag] CHAR (1)     NULL,
    [CreDate]           DATETIME     NULL
);

