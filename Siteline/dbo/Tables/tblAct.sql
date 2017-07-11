CREATE TABLE [dbo].[tblAct] (
    [ActID]        INT           IDENTITY (1, 1) NOT NULL,
    [Act_ActJrnID] INT           NULL,
    [Act_SlsJrnID] INT           NULL,
    [ActDate]      SMALLDATETIME NULL,
    [ActTime]      DATETIME      NULL,
    [ActAction]    TEXT          NULL,
    [ActFlagYN]    BIT           CONSTRAINT [DF_tblAct_ActFlagYN] DEFAULT (0) NULL,
    [ActTimeStamp] ROWVERSION    NULL,
    CONSTRAINT [PK_tblAct] PRIMARY KEY NONCLUSTERED ([ActID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblAct_tblActJrn] FOREIGN KEY ([Act_ActJrnID]) REFERENCES [dbo].[tblActJrn] ([ActJrnID]),
    CONSTRAINT [FK_tblAct_tblSlsJrn] FOREIGN KEY ([Act_SlsJrnID]) REFERENCES [dbo].[tblSlsJrn] ([SlsJrnID])
);


GO
CREATE NONCLUSTERED INDEX [Act_ActJrnID]
    ON [dbo].[tblAct]([Act_ActJrnID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Act_SlsJrnID]
    ON [dbo].[tblAct]([Act_SlsJrnID] ASC) WITH (FILLFACTOR = 90);

