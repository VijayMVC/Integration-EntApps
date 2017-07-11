CREATE TABLE [dbo].[tblActJrn] (
    [ActJrnID]             INT           IDENTITY (1, 1) NOT NULL,
    [ActJrn_CtrID]         INT           NULL,
    [ActJrn_SbjID]         INT           NULL,
    [ActJrnCtrCnt]         VARCHAR (75)  NULL,
    [ActJrn_CntID]         INT           NULL,
    [ActJrnNotify1]        VARCHAR (75)  NULL,
    [ActJrnKey]            VARCHAR (150) NULL,
    [ActJrnDate]           SMALLDATETIME NULL,
    [ActJrnRequest]        TEXT          NULL,
    [ActJrnPriority]       TINYINT       NULL,
    [ActJrnCompleteYN]     BIT           CONSTRAINT [DF_tblActJrn_ActJrnCompleteYN] DEFAULT (0) NULL,
    [ActJrnDateComplete]   SMALLDATETIME NULL,
    [ActJrnNextActionDate] DATETIME      NULL,
    [ActJrnComment]        TEXT          NULL,
    [ActJrnTimeStamp]      ROWVERSION    NULL,
    CONSTRAINT [PK_tblActJrn] PRIMARY KEY NONCLUSTERED ([ActJrnID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblActJrn_tblCnt] FOREIGN KEY ([ActJrn_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [FK_tblActJrn_tblCtr] FOREIGN KEY ([ActJrn_CtrID]) REFERENCES [dbo].[tblCtr] ([CtrID]),
    CONSTRAINT [FK_tblActJrn_tlkpSbj] FOREIGN KEY ([ActJrn_SbjID]) REFERENCES [dbo].[tlkpSbj] ([SbjID])
);


GO
CREATE NONCLUSTERED INDEX [ActJrn_CntID]
    ON [dbo].[tblActJrn]([ActJrn_CtrID] ASC) WITH (FILLFACTOR = 90);

