CREATE TABLE [dbo].[PayrollReporting_HoursAndEarnings] (
    [PSHE_ID]           INT          NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [WebCode]           CHAR (20)    NULL,
    [EDorFastTrack]     VARCHAR (10) NULL,
    [YrMoPeriod]        CHAR (6)     NULL,
    [ClinicalHours]     MONEY        NULL,
    [ClinicalEarnings]  MONEY        NULL,
    [MeetingsHours]     MONEY        NULL,
    [MeetingsEarnings]  MONEY        NULL,
    [BonusPay]          MONEY        NULL,
    [OtherEarnings]     MONEY        NULL,
    [ProjectStipend]    MONEY        NULL,
    [CurrentPeriodFlag] CHAR (1)     CONSTRAINT [DF_PayrollReporting_HoursAndEarnings_CurrentPeriodFlag] DEFAULT ('N') NULL,
    [CreDate]           DATETIME     CONSTRAINT [DF_PayrollReporting_HoursAndEarnings_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME     CONSTRAINT [DF_PayrollReporting_HoursAndEarnings_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_PayrollReporting_HoursAndEarnings] PRIMARY KEY CLUSTERED ([PSHE_ID] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PayrollReporting_HoursAndEarnings] TO [BernalA]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PayrollReporting_HoursAndEarnings] TO [BernalA]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PayrollReporting_HoursAndEarnings] TO [BernalA]
    AS [dbo];

