CREATE TABLE [dbo].[PayrollReporting_BaseRates] (
    [PSBR_ID]           INT          NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [SiteLocationID]    INT          NULL,
    [YrMoPeriod]        CHAR (6)     NULL,
    [BaseRate]          MONEY        NULL,
    [CountBaseRate]     MONEY        NULL,
    [NiteDiffRate]      MONEY        NULL,
    [CountNiteDiffRate] MONEY        NULL,
    [MeetingRate]       MONEY        NULL,
    [CountMeetingRate]  MONEY        NULL,
    [CurrentPeriodFlag] CHAR (1)     CONSTRAINT [DF_PayrollReporting_BaseRates_CurrentPeriodFlag] DEFAULT ('N') NULL,
    [CreDate]           DATETIME     CONSTRAINT [DF_PayrollReporting_BaseRates_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME     CONSTRAINT [DF_PayrollReporting_BaseRates_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_PayrollReporting_BaseRates] PRIMARY KEY CLUSTERED ([PSBR_ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [PBR_YrMoPeriod_idx]
    ON [dbo].[PayrollReporting_BaseRates]([YrMoPeriod] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PayrollReporting_BaseRates] TO [BernalA]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PayrollReporting_BaseRates] TO [BernalA]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PayrollReporting_BaseRates] TO [BernalA]
    AS [dbo];

