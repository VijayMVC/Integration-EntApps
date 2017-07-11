CREATE TABLE [dbo].[tblCmpCnt] (
    [CmpCntID]     INT          IDENTITY (1, 1) NOT NULL,
    [CmpCnt_CmpID] INT          NOT NULL,
    [CmpCnt_CntID] INT          NOT NULL,
    [CmpCntRole]   VARCHAR (50) NULL,
    CONSTRAINT [PK_tblCmpCnt] PRIMARY KEY CLUSTERED ([CmpCnt_CmpID] ASC, [CmpCnt_CntID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCmpCnt_tblCmp] FOREIGN KEY ([CmpCnt_CmpID]) REFERENCES [dbo].[tblCmp] ([CmpID]),
    CONSTRAINT [FK_tblCmpCnt_tblCnt] FOREIGN KEY ([CmpCnt_CntID]) REFERENCES [dbo].[tblCnt] ([CntID])
);


GO
CREATE NONCLUSTERED INDEX [IX_CmpCntID]
    ON [dbo].[tblCmpCnt]([CmpCntID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CmpCntRole]
    ON [dbo].[tblCmpCnt]([CmpCntRole] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'tblCmpCnt.CmpCntRole', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCnt_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCnt_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCnt_CmpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCnt_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCnt_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCnt_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCntRole';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCntRole';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCmpCnt', @level2type = N'COLUMN', @level2name = N'CmpCntRole';

