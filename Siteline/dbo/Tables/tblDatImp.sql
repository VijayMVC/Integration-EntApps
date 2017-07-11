CREATE TABLE [dbo].[tblDatImp] (
    [DatImpID]            INT           IDENTITY (1, 1) NOT NULL,
    [DatImpName]          VARCHAR (100) NULL,
    [DatImpTime]          DATETIME      CONSTRAINT [DF_tblDatImp_DatImpTime] DEFAULT (getdate()) NULL,
    [DatImpProcessedYN]   BIT           CONSTRAINT [DF_tblDatImp_DatImpProcessedYN] DEFAULT (0) NOT NULL,
    [DatImpProcessedTime] DATETIME      NULL,
    CONSTRAINT [PK_tblDatImp] PRIMARY KEY CLUSTERED ([DatImpID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'tblDatImp.DatImpProcessedYN', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 5790, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2205, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2205, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDatImp', @level2type = N'COLUMN', @level2name = N'DatImpProcessedTime';

