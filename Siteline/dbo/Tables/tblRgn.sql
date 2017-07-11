CREATE TABLE [dbo].[tblRgn] (
    [RgnID]           INT          IDENTITY (1, 1) NOT NULL,
    [RgnDir_CntID]    INT          NULL,
    [RgnDirAss_CntID] INT          NULL,
    [RgnAss_CntID]    INT          NULL,
    [RgnName]         VARCHAR (50) NULL,
    [RgnTimeStamp]    ROWVERSION   NULL,
    CONSTRAINT [PK_tblRgn] PRIMARY KEY NONCLUSTERED ([RgnID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblRgn_tblCnt] FOREIGN KEY ([RgnDir_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [FK_tblRgn_tblCnt1] FOREIGN KEY ([RgnDirAss_CntID]) REFERENCES [dbo].[tblCnt] ([CntID]),
    CONSTRAINT [FK_tblRgn_tblCnt2] FOREIGN KEY ([RgnAss_CntID]) REFERENCES [dbo].[tblCnt] ([CntID])
);


GO
CREATE NONCLUSTERED INDEX [RgnDir_CntID]
    ON [dbo].[tblRgn]([RgnDir_CntID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [RgnDirAss_CntID]
    ON [dbo].[tblRgn]([RgnDirAss_CntID] ASC) WITH (FILLFACTOR = 90);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnDir_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnDirAss_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnDirAss_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnDirAss_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnAss_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnAss_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnAss_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 3060, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnTimeStamp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnTimeStamp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblRgn', @level2type = N'COLUMN', @level2name = N'RgnTimeStamp';

