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
    [CurrentPeriodFlag] CHAR (1)     NULL,
    [CreDate]           DATETIME     NULL,
    [UpdDate]           DATETIME     NULL
);

