CREATE TABLE [dbo].[tlkpPAPayClass] (
    [PAPayClassID]   NVARCHAR (4)  NOT NULL,
    [PAPayClassDesc] NVARCHAR (50) NULL,
    CONSTRAINT [PK_tlkpPAPayClass] PRIMARY KEY CLUSTERED ([PAPayClassID] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 675, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'lbrPayClass field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2205, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'description of ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPAPayClass', @level2type = N'COLUMN', @level2name = N'PAPayClassDesc';

