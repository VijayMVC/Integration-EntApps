CREATE TABLE [dbo].[tblRptCtr] (
    [RptCtrID]      INT          IDENTITY (1, 1) NOT NULL,
    [RptCtr_RptID]  VARCHAR (50) NOT NULL,
    [RptCtr_CtrID]  INT          NOT NULL,
    [RptDstComment] TEXT         NULL,
    CONSTRAINT [PK_tblRptCtr] PRIMARY KEY NONCLUSTERED ([RptCtr_RptID] ASC, [RptCtr_CtrID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblRptCtr_tblCtr] FOREIGN KEY ([RptCtr_CtrID]) REFERENCES [dbo].[tblCtr] ([CtrID]),
    CONSTRAINT [FK_tblRptCtr_tblRpt] FOREIGN KEY ([RptCtr_RptID]) REFERENCES [dbo].[tblRpt] ([RptID]),
    CONSTRAINT [IX_tblRptCtr] UNIQUE NONCLUSTERED ([RptCtrID] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'tblRptCtr.RptCtrID DESC', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptCtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptCtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptCtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptCtr_RptID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptCtr_RptID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptCtr_RptID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptCtr_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptCtr_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptCtr_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptDstComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptDstComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRptCtr', @level2type = N'COLUMN', @level2name = N'RptDstComment';

