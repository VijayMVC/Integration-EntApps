CREATE TABLE [dbo].[tlkpPayCode] (
    [PayCodeID]             INT            IDENTITY (1, 1) NOT NULL,
    [PayCodeName]           NVARCHAR (255) NULL,
    [PayCodeDesc]           NVARCHAR (255) NULL,
    [PayCodeSitelineClass]  NVARCHAR (15)  NULL,
    [PayCodeCompany]        NVARCHAR (15)  NULL,
    [PayCodeFinStmnt]       NVARCHAR (50)  NULL,
    [PayCodeLawsonGLDept]   NVARCHAR (50)  NULL,
    [PayCodeLawsonDeptName] NVARCHAR (50)  NULL,
    [PayCodeSummaryPayType] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_tlkpPayCode] PRIMARY KEY NONCLUSTERED ([PayCodeID] ASC) WITH (FILLFACTOR = 90)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_FilterOnLoad', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_HideNewField', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'[tlkpPayCode].[PayCodeName], [tlkpPayCode].[PayCodeCompany], tlkpPayCode.PayCodeFinStmnt', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOnLoad', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TotalsRow', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 900, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 765, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 3, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2475, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeDesc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AllowValueListEdits', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 4, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2265, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Corresponding Siteline field', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'111', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_LimitToList', @value = N'-1', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ListItemsEditForm', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_RowSource', @value = N'Administration;MD Stipend; PT;ER Profee; Surplus; Scribe;Executive;Mid-Level;On-Site; Non Current MD; RD;Finder Fee; Acquisition; NQ; Site Support; RDPY', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_RowSourceType', @value = N'Value List', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ShowOnlyRowSourceValues', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 5, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1740, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Company that uses paycode', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeFinStmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeFinStmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 6, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeFinStmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1290, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeFinStmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeFinStmnt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonGLDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonGLDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 7, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonGLDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1200, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonGLDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'New Lawson Dept', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonGLDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonGLDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonGLDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonGLDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonGLDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonDeptName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonDeptName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 8, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonDeptName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1170, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonDeptName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonDeptName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonDeptName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonDeptName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeLawsonDeptName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_AggregateType', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSummaryPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSummaryPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 9, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSummaryPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2760, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSummaryPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TextAlign', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayCode', @level2type = N'COLUMN', @level2name = N'PayCodeSummaryPayType';

