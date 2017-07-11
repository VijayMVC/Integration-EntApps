CREATE TABLE [dbo].[PayrollReporting_BaseRates] (
    [PSBR_ID]           INT          IDENTITY (1, 1) NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [WebCode]           VARCHAR (10) NULL,
    [SiteLocationID]    INT          NULL,
    [YrMoPeriod]        CHAR (6)     NULL,
    [BaseRate]          MONEY        NULL,
    [CountBaseRate]     MONEY        NULL,
    [NiteDiffRate]      MONEY        NULL,
    [CountNiteDiffRate] MONEY        NULL,
    [MeetingRate]       MONEY        NULL,
    [CountMeetingRate]  MONEY        NULL,
    [CurrentPeriodFlag] CHAR (1)     NULL,
    [CreDate]           DATETIME     NULL,
    [UpdDate]           DATETIME     NULL
);

