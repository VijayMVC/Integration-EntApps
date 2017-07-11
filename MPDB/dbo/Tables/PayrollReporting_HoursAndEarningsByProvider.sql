CREATE TABLE [dbo].[PayrollReporting_HoursAndEarningsByProvider] (
    [PSHEP_ID]          INT          IDENTITY (1, 1) NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [WebCode]           CHAR (20)    NULL,
    [ProviderMasterID]  INT          NULL,
    [EDorFastTrack]     VARCHAR (10) NULL,
    [YrMoPeriod]        CHAR (6)     NULL,
    [ClinicalHours]     MONEY        NULL,
    [ClinicalEarnings]  MONEY        NULL,
    [MeetingsHours]     MONEY        NULL,
    [MeetingsEarnings]  MONEY        NULL,
    [BonusPay]          MONEY        NULL,
    [OtherEarnings]     MONEY        NULL,
    [ProjectStipend]    MONEY        NULL,
    [CurrentPeriodFlag] CHAR (1)     CONSTRAINT [DF_PayrollReporting_HoursAndEarningsByP_CurrentPeriodFlag] DEFAULT ('N') NULL,
    [CreDate]           DATETIME     CONSTRAINT [DF_PayrollReporting_HoursAndEarningsByP_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]           DATETIME     CONSTRAINT [DF_PayrollReporting_HoursAndEarningsByP_UpdDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_PayrollReporting_HoursAndEarningsByProvider] PRIMARY KEY CLUSTERED ([PSHEP_ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [PRHEP_ProvID_idx]
    ON [dbo].[PayrollReporting_HoursAndEarningsByProvider]([ProviderMasterID] ASC) WITH (FILLFACTOR = 90);

