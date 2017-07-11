CREATE TABLE [dbo].[PayrollReporting_MissingClockNbr] (
    [PMCN_ID]           INT          NOT NULL,
    [StaffGroup]        VARCHAR (50) NULL,
    [SiteLocationID]    INT          NULL,
    [YrMoPeriod]        CHAR (6)     NULL,
    [LastName]          VARCHAR (50) NULL,
    [FirstName]         VARCHAR (50) NULL,
    [CurrentPeriodFlag] CHAR (1)     NULL,
    [CreDate]           DATETIME     CONSTRAINT [DF_PayrollReporting_MissingClockNbr_CreDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_PayrollReporting_MissingClockNbr] PRIMARY KEY CLUSTERED ([PMCN_ID] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PayrollReporting_MissingClockNbr] TO [BernalA]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PayrollReporting_MissingClockNbr] TO [BernalA]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PayrollReporting_MissingClockNbr] TO [BernalA]
    AS [dbo];

