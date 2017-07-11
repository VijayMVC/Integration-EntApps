CREATE TABLE [dbo].[tblSlsJrn] (
    [SlsJrnID]            INT           IDENTITY (1, 1) NOT NULL,
    [SlsJrn_CtrID]        INT           NULL,
    [SlsJrn_CmpID]        INT           NULL,
    [SlsJrn_CntID]        INT           NULL,
    [SlsJrnContact]       VARCHAR (100) NULL,
    [SlsJrnContactNumber] VARCHAR (25)  NULL,
    [SlsJrnKey]           VARCHAR (150) NULL,
    [SlsJrnDate]          SMALLDATETIME NULL,
    [SlsJrnTopic]         TEXT          NULL,
    [SlsJrnCompleteYN]    BIT           CONSTRAINT [DF_tblSlsJrn_SlsJrnCompleteYN] DEFAULT (0) NOT NULL,
    [SlsJrnDateComplete]  SMALLDATETIME NULL,
    [SlsJrnComment]       TEXT          NULL,
    [SlsJrnFlagYN]        BIT           CONSTRAINT [DF_tblSlsJrn_SlsjrnFlagYN] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_tblSlsJrn] PRIMARY KEY NONCLUSTERED ([SlsJrnID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSlsJrn_tblCmp] FOREIGN KEY ([SlsJrn_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblSlsJrn_tblCnt] FOREIGN KEY ([SlsJrn_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [FK_tblSlsJrn_tblCtr] FOREIGN KEY ([SlsJrn_CtrID]) REFERENCES [dbo].[tblCtr] ([CtrID]),
    CONSTRAINT [SlsJrnKey] UNIQUE NONCLUSTERED ([SlsJrnKey] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [SlsJrn_CtrID]
    ON [dbo].[tblSlsJrn]([SlsJrn_CtrID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [SlsJrn_CmpID]
    ON [dbo].[tblSlsJrn]([SlsJrn_CmpID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [SlsJrn_CntID]
    ON [dbo].[tblSlsJrn]([SlsJrn_CntID] ASC) WITH (FILLFACTOR = 90);

