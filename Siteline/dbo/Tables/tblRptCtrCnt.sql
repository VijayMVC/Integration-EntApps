CREATE TABLE [dbo].[tblRptCtrCnt] (
    [RptCtrCntID]         INT  IDENTITY (1, 1) NOT NULL,
    [RptCtrCnt_RptCtrID]  INT  NOT NULL,
    [RptCtrCnt_CntID]     INT  NOT NULL,
    [RptDstComment]       TEXT NULL,
    [RptCtrCntSuppressYN] BIT  CONSTRAINT [DF_tblRptCtrCnt_RptCtrCntSuppressYN] DEFAULT (0) NOT NULL,
    [RptCtrCntRTFYN]      BIT  CONSTRAINT [DF_tblRptCtrCnt_RptCtrCntRptOption] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_tblRptCtrCnt] PRIMARY KEY CLUSTERED ([RptCtrCnt_RptCtrID] ASC, [RptCtrCnt_CntID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblRptCtrCnt_tblCnt] FOREIGN KEY ([RptCtrCnt_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [FK_tblRptCtrCnt_tblRptCtr] FOREIGN KEY ([RptCtrCnt_RptCtrID]) REFERENCES [dbo].[tblRptCtr] ([RptCtrID])
);

