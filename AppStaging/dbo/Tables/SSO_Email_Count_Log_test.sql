CREATE TABLE [dbo].[SSO_Email_Count_Log_test] (
    [ID]               INT       NOT NULL,
    [webID]            INT       NULL,
    [NumPastDays]      INT       NULL,
    [batchID]          CHAR (10) NULL,
    [unReadEmailCount] INT       NULL,
    [totalEmailCount]  INT       NULL,
    [TS_lastSSOclick]  DATETIME  NULL,
    [TS_scriptRun]     DATETIME  NULL
);

