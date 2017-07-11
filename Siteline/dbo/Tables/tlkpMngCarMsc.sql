CREATE TABLE [dbo].[tlkpMngCarMsc] (
    [MngCarMscID]    SMALLINT     NOT NULL,
    [MngCarMscLabel] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_tlkpMngCarMsc] PRIMARY KEY CLUSTERED ([MngCarMscID] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1950, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscLabel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpMngCarMsc', @level2type = N'COLUMN', @level2name = N'MngCarMscLabel';

