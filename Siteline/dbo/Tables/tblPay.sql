CREATE TABLE [dbo].[tblPay] (
    [PayID]             INT            IDENTITY (1, 1) NOT NULL,
    [Pay_CtrID]         INT            NULL,
    [Pay_CntID]         INT            NULL,
    [PayMonth]          DATETIME       NOT NULL,
    [PayPaidAmt]        MONEY          CONSTRAINT [DF_tblPayMD_PayMDPaidAmt] DEFAULT (0) NOT NULL,
    [PayHours]          FLOAT (53)     CONSTRAINT [DF_tblPayMD_PayMDHours] DEFAULT (0) NOT NULL,
    [PayPayType]        CHAR (1)       NULL,
    [PayPayCode]        NVARCHAR (50)  NULL,
    [PayPayCodeSummary] NVARCHAR (50)  NULL,
    [PayJobCode]        NVARCHAR (50)  NULL,
    [PayJobCodeSummary] NVARCHAR (50)  NULL,
    [PaySitelineClass]  NVARCHAR (15)  NULL,
    [PayFullName]       VARCHAR (200)  NULL,
    [PayGLPostDate]     DATETIME       NULL,
    [PayCheckDate]      DATETIME       NULL,
    [PayProcLevel]      NVARCHAR (50)  NULL,
    [PaySource]         NVARCHAR (50)  NULL,
    [PayFileName]       NVARCHAR (200) NULL,
    [PayImportDate]     DATETIME       CONSTRAINT [DF_tblPayMD_PayMDImportDate] DEFAULT (getdate()) NOT NULL,
    [PayDistCompany5]   VARCHAR (15)   NULL,
    [PayAccount3]       VARCHAR (15)   NULL,
    [PayAccountUnit]    VARCHAR (15)   NULL,
    [PayLastEditDate]   DATETIME       NULL,
    [PayLastEditName]   VARCHAR (50)   NULL,
    [PayTimeStamp]      ROWVERSION     NOT NULL,
    [PayChkNbr]         VARCHAR (50)   NULL,
    [PayLawsonID]       INT            NULL,
    CONSTRAINT [PK_tblPayMD] PRIMARY KEY NONCLUSTERED ([PayTimeStamp] ASC),
    CONSTRAINT [FK_tblPay_tblCnt] FOREIGN KEY ([Pay_CntID]) REFERENCES [dbo].[tblCnt] ([CntID])
);


GO
CREATE CLUSTERED INDEX [PayMDMonth]
    ON [dbo].[tblPay]([PayMonth] ASC);


GO
CREATE NONCLUSTERED INDEX [PayMD_CtrID]
    ON [dbo].[tblPay]([Pay_CtrID] ASC);


GO
CREATE NONCLUSTERED INDEX [PayMD_CntID]
    ON [dbo].[tblPay]([Pay_CntID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PayPayType]
    ON [dbo].[tblPay]([PayPayType] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PayPayCode]
    ON [dbo].[tblPay]([PayPayCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PayJobCode]
    ON [dbo].[tblPay]([PayJobCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PaySitelineClass]
    ON [dbo].[tblPay]([PaySitelineClass] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PayFileName]
    ON [dbo].[tblPay]([PayFileName] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PayChkNbr]
    ON [dbo].[tblPay]([PayChkNbr] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PayMonth]
    ON [dbo].[tblPay]([PayMonth] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_tblPay_PayAccountUnit]
    ON [dbo].[tblPay]([PayAccountUnit] ASC);


GO
CREATE TRIGGER dbo.tblPay_Edit
ON dbo.tblPay
FOR  UPDATE
AS
Declare @PayID int, @name varchar(30)
       ,@lenindex int
       ,@lenall int
       ,@username varchar(10)

Set NoCount ON

Select @PayID = PayID from Inserted

SELECT @name = suser_sname()
SELECT @lenall = Len(@name)
SELECT @lenindex = CHARINDEX('\', @name)
-- clean up the variables and return a field named NTUserName
SELECT @username= SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) 


Update dbo.tblPay
Set PayLastEditDate = GetDate(), PayLastEditName = @username 
Where PayID = @PayID


Set NoCount Off

return



GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'tblPay.PayMonth DESC', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CtrID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Allow nulls for individuals not in Siteline yet', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'Pay_CntID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayMonth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayMonth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayMonth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayMonth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayMonth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayMonth';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'$#,##0.00;($#,##0.00)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPaidAmt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'R = regular; O = overtime; P = PTO', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2310, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayPayCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2220, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayJobCodeSummary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2055, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySitelineClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFullName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFullName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFullName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFullName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFullName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFullName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayGLPostDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayGLPostDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayGLPostDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayGLPostDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayGLPostDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayGLPostDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayCheckDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayCheckDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayCheckDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayCheckDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayCheckDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayCheckDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayProcLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayProcLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayProcLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayProcLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayProcLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayProcLevel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PaySource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayFileName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayImportDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayImportDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayImportDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayImportDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayImportDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayImportDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayDistCompany5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayDistCompany5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayDistCompany5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayDistCompany5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayDistCompany5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayDistCompany5';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayAccount3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayAccount3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayAccount3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayAccount3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayAccount3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayAccount3';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayAccountUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayAccountUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayAccountUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayLastEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayLastEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayLastEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayLastEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayLastEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPay', @level2type = N'COLUMN', @level2name = N'PayLastEditName';

