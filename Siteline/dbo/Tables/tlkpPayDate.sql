CREATE TABLE [dbo].[tlkpPayDate] (
    [PayDateID]       INT        NOT NULL,
    [PayDatePeriod]   FLOAT (53) NULL,
    [PayDateChgMonth] DATETIME   NULL,
    [PayDatePayDate]  DATETIME   NULL,
    [PayCodePayYear]  INT        NULL,
    [PayCodeTaxYear]  INT        NULL,
    CONSTRAINT [PK_tlkpPayDate] PRIMARY KEY NONCLUSTERED ([PayDateID] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'tlkpPayDate.PayDateChgMonth', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDateID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDateID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDateID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDatePeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDatePeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDatePeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDateChgMonth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDateChgMonth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2370, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDateChgMonth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDatePayDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDatePayDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2205, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayDatePayDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayCodePayYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayCodePayYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1845, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayCodePayYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayCodeTaxYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayCodeTaxYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayCodeTaxYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayCodeTaxYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayCodeTaxYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayDate', @level2type = N'COLUMN', @level2name = N'PayCodeTaxYear';

