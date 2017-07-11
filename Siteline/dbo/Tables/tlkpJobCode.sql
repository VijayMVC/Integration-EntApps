CREATE TABLE [dbo].[tlkpJobCode] (
    [JobCodeID]             NVARCHAR (25)  NOT NULL,
    [JobCodeJBCDescription] NVARCHAR (100) NULL,
    [JobCodeSitelineClass]  NVARCHAR (15)  NULL,
    [JobCodeJCLDescription] NVARCHAR (100) NULL,
    [JobCodeCompany]        NVARCHAR (50)  NULL,
    CONSTRAINT [PK_tlkpJobCode] PRIMARY KEY CLUSTERED ([JobCodeID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_AlternateBackThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetForeThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DatasheetGridlinesThemeColorIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_FilterOnLoad', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_HideNewField', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'[tlkpJobCode].[JobCodeID], [tlkpJobCode].[JobCodeJBCDescription], tlkpJobCode.JobCodeSitelineClass', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOnLoad', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ThemeFontIndex', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TotalsRow', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJBCDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJBCDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJBCDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 3750, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJBCDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJBCDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJBCDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2040, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJCLDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJCLDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJCLDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2925, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJCLDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJCLDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeJCLDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2130, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_CurrencyLCID', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpJobCode', @level2type = N'COLUMN', @level2name = N'JobCodeCompany';

