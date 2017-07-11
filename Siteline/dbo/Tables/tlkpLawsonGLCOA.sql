CREATE TABLE [dbo].[tlkpLawsonGLCOA] (
    [LawsonGLAct]     VARCHAR (50) NOT NULL,
    [LawsonGLActDesc] VARCHAR (50) NULL,
    [SummaryGLClass]  VARCHAR (50) NULL,
    CONSTRAINT [PK_tlkpLawsonGLCOA] PRIMARY KEY CLUSTERED ([LawsonGLAct] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lawson GL COA Descriptions', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_FilterOnLoad', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_HideNewField', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'[tlkpLawsonGLCOA].[LawsonGLAct], [tlkpLawsonGLCOA].[LawsonGLActDesc]', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOnLoad', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TotalsRow', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLAct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLAct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLAct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLAct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Lawson GL Number', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLAct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLAct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLAct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLAct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLAct';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLActDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLActDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLActDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 3465, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLActDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Account Description', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLActDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLActDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLActDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLActDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'LawsonGLActDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'SummaryGLClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'SummaryGLClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 3, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'SummaryGLClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2415, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'SummaryGLClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Summary Account Description', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'SummaryGLClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'SummaryGLClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'SummaryGLClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'SummaryGLClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpLawsonGLCOA', @level2type = N'COLUMN', @level2name = N'SummaryGLClass';

