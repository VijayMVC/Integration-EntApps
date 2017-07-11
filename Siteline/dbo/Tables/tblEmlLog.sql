CREATE TABLE [dbo].[tblEmlLog] (
    [EmlLogID]            INT           IDENTITY (1, 1) NOT NULL,
    [EmlLogBatchID]       VARCHAR (50)  NULL,
    [EmlLogDate]          DATETIME      NULL,
    [EmlLogTime]          SMALLDATETIME NULL,
    [EmlLogRecipient]     VARCHAR (300) NULL,
    [EmlLogRecipientName] VARCHAR (300) NULL,
    [EmlLogFile]          TEXT          NULL,
    [EmlLogFormat]        VARCHAR (50)  NULL,
    [EmlLogContract]      VARCHAR (175) NULL,
    [EmlLogSender]        VARCHAR (300) NULL,
    [EmlLogErrorYN]       BIT           CONSTRAINT [DF_tblEmlLog_EmlLogErrorYN] DEFAULT (0) NULL,
    [EmlLogErrorMsg]      VARCHAR (225) NULL,
    [EmlLogReport]        VARCHAR (200) NULL,
    [EmlLogReportDate]    DATETIME      NULL,
    CONSTRAINT [PK_tblEmlLog] PRIMARY KEY NONCLUSTERED ([EmlLogID] ASC) WITH (FILLFACTOR = 90)
);

