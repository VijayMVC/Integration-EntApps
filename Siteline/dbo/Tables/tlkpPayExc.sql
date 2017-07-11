CREATE TABLE [dbo].[tlkpPayExc] (
    [PayExcID]                               VARCHAR (5)   NOT NULL,
    [PayExcActiveYN]                         SMALLINT      CONSTRAINT [DF_tlkpPayExc_PayExcActiveYN] DEFAULT (1) NOT NULL,
    [PayExcvwPaySttDocHourQty]               SMALLINT      CONSTRAINT [DF_tlkpPayExc_PayExcvwPaySttDocHourQty] DEFAULT (0) NOT NULL,
    [PayExcvwPaySttDocPaidAmt]               SMALLINT      CONSTRAINT [DF_tlkpPayExc_PayExcvwPaySttDocPaidAmt] DEFAULT (0) NOT NULL,
    [PayExcvwPaySttPACost]                   SMALLINT      CONSTRAINT [DF_tlkpPayExc_PayExcvwPaySttPACost] DEFAULT (0) NOT NULL,
    [PayExcvwPaySttPAHoursQty]               SMALLINT      CONSTRAINT [DF_tlkpPayExc_PayExcvwPaySttPAHoursQty] DEFAULT (0) NOT NULL,
    [PayExcvwPaySttBillSpecScribesAmt]       SMALLINT      CONSTRAINT [DF_tlkpPayExc_PayExcvwPaySttBillSpecScribesAmt] DEFAULT (0) NOT NULL,
    [PayExcvwPaySttBillSpecSitePersonnelAmt] SMALLINT      CONSTRAINT [DF_tlkpPayExc_PayExcvwPaySttBillSpecSitePersonnelAmt] DEFAULT (0) NOT NULL,
    [PayExcComment]                          VARCHAR (500) NULL,
    CONSTRAINT [PK_tlkpPayExc] PRIMARY KEY CLUSTERED ([PayExcID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcActiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcActiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcActiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcActiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcActiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcActiveYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2745, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocHourQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2775, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttDocPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2355, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPACost';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPAHoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPAHoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2775, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPAHoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPAHoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPAHoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttPAHoursQty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 3420, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecScribesAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 4215, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcvwPaySttBillSpecSitePersonnelAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2700, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcComment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tlkpPayExc', @level2type = N'COLUMN', @level2name = N'PayExcComment';

