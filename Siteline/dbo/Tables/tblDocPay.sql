CREATE TABLE [dbo].[tblDocPay] (
    [DocPayID]               INT            IDENTITY (1, 1) NOT NULL,
    [DocPay_DatMonthlyID]    INT            NULL,
    [DocPayLbrMagic]         FLOAT (53)     NULL,
    [DocPayLbrFlxIDEb]       FLOAT (53)     NULL,
    [DocPayLbrFlxIDP2]       NVARCHAR (100) NULL,
    [DocPayLbrCRC]           NVARCHAR (100) NULL,
    [DocPayLbrSource]        FLOAT (53)     NULL,
    [DocPayLbrNote]          NVARCHAR (100) NULL,
    [DocPayLbrFlxID]         FLOAT (53)     NULL,
    [DocPayLbrDateAdd]       DATETIME       NULL,
    [DocPayLbrDateMod]       DATETIME       NULL,
    [DocPayLbrDateDel]       NVARCHAR (100) NULL,
    [DocPayLbrDateBeg]       NVARCHAR (100) NULL,
    [DocPayLbrDateEnd]       NVARCHAR (100) NULL,
    [DocPayLbrDateRBeg]      NVARCHAR (100) NULL,
    [DocPayLbrDateREnd]      NVARCHAR (100) NULL,
    [DocPayLbrUserName]      NVARCHAR (100) NULL,
    [DocPayLbrRecType]       NVARCHAR (100) NULL,
    [DocPayLbrArchive]       NVARCHAR (10)  NULL,
    [DocPayLbrPayPeriod]     FLOAT (53)     NULL,
    [DocPayLbrPSID]          NVARCHAR (100) NULL,
    [DocPayLbrDivDept]       NVARCHAR (100) NULL,
    [DocPayLbrDistCode]      FLOAT (53)     NULL,
    [DocPayLbrPayClass]      FLOAT (53)     NULL,
    [DocPayLbrRateCode]      FLOAT (53)     NULL,
    [DocPayLbrTotalHours]    FLOAT (53)     CONSTRAINT [DF_tblDocPay_DocPayLbrTotalHours] DEFAULT (0) NOT NULL,
    [DocPayLbrTotalEarnings] FLOAT (53)     NULL,
    [DocPayLbrRatePaid]      FLOAT (53)     NULL,
    [DocPayLbrChrgDivDept]   NVARCHAR (100) NULL,
    [DocPayLbrDistData]      NVARCHAR (100) NULL,
    [DocPayLbrAdjCode]       NVARCHAR (100) NULL,
    [DocPayLbrPayFreq]       NVARCHAR (100) NULL,
    [DocPayLbrSocNumber]     FLOAT (53)     NULL,
    [DocPayLbrEmpName]       NVARCHAR (100) NULL,
    [DocPayLbrMiscData]      NVARCHAR (100) NULL,
    [DocPayLbrMaritalStatus] NVARCHAR (100) NULL,
    [DocPayLbrSex]           NVARCHAR (100) NULL,
    [DocPayLbrUCState]       NVARCHAR (100) NULL,
    [DocPayLbrSecPayCode]    NVARCHAR (100) NULL,
    [DocPayLbrVoidManCode]   NVARCHAR (100) NULL,
    [DocPayLbrVacCode]       NVARCHAR (100) NULL,
    [DocPayLbrSickCode]      NVARCHAR (100) NULL,
    [DocPayLbrBaseRateDec]   NVARCHAR (100) NULL,
    [DocPayLbrBaseRate]      FLOAT (53)     NULL,
    [DocPayLbrDiv]           FLOAT (53)     NULL,
    [DocPayLbrChrgDiv]       FLOAT (53)     NULL,
    [DocPayLbrDept]          FLOAT (53)     NULL,
    [DocPayLbrChrgDept]      FLOAT (53)     NULL,
    [DocPayLbrUpsize_ts]     NVARCHAR (100) NULL,
    [DocPaySite]             NVARCHAR (100) NULL,
    [DocPayPaycode]          NVARCHAR (100) NULL,
    [DocPayPaytype]          NVARCHAR (100) NULL,
    [DocPayEditType]         CHAR (10)      NULL,
    [DocPayEditName]         VARCHAR (50)   NULL,
    [DocPayEditDate]         DATETIME       NULL,
    CONSTRAINT [PK_tblDocPay] PRIMARY KEY NONCLUSTERED ([DocPayID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IX_DocPay_DatMonthlyID]
    ON [dbo].[tblDocPay]([DocPay_DatMonthlyID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrFlxID]
    ON [dbo].[tblDocPay]([DocPayLbrFlxID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrPayPeriod]
    ON [dbo].[tblDocPay]([DocPayLbrPayPeriod] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrFlxIDEb]
    ON [dbo].[tblDocPay]([DocPayLbrFlxIDEb] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrFlxIDP2]
    ON [dbo].[tblDocPay]([DocPayLbrFlxIDP2] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrDivDept]
    ON [dbo].[tblDocPay]([DocPayLbrDivDept] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrPayClass]
    ON [dbo].[tblDocPay]([DocPayLbrPayClass] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrChrgDivDept]
    ON [dbo].[tblDocPay]([DocPayLbrChrgDivDept] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrSocNumber]
    ON [dbo].[tblDocPay]([DocPayLbrSocNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrEmpName]
    ON [dbo].[tblDocPay]([DocPayLbrEmpName] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrDiv]
    ON [dbo].[tblDocPay]([DocPayLbrDiv] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayLbrChrgDiv]
    ON [dbo].[tblDocPay]([DocPayLbrChrgDiv] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPaySite]
    ON [dbo].[tblDocPay]([DocPaySite] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayPaycode]
    ON [dbo].[tblDocPay]([DocPayPaycode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DocPayPaytype]
    ON [dbo].[tblDocPay]([DocPayPaytype] ASC);


GO
CREATE NONCLUSTERED INDEX [DocPayLbrDateAdd]
    ON [dbo].[tblDocPay]([DocPayLbrDateAdd] ASC);


GO
CREATE TRIGGER dbo.tblDocPay_Insert
ON dbo.tblDocPay
FOR INSERT
AS
Declare @DocPayID int
Select @DocPayID = DocPayID from Inserted

UPDATE    dbo.tblDocPay
SET              DocPayEditType = 'New', DocPayEditName = dbo.get_login_name(), DocPayEditDate = GETDATE()
WHERE     (DocPayID = @DocPayID)

	/* IF UPDATE (column_name) ...*/

GO
CREATE TRIGGER dbo.tblDocPay_Update
ON dbo.tblDocPay

FOR UPDATE
AS
Declare @DocPayID int
Select @DocPayID = DocPayID from Inserted

UPDATE    dbo.tblDocPay
SET              DocPayEditType = 'Edited', DocPayEditName = dbo.get_login_name(), DocPayEditDate = GETDATE()
WHERE     (DocPayID = @DocPayID)

	/* IF UPDATE (column_name) ...*/

GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = N'((DocPayLbrPayPeriod=2006100))', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPay_DatMonthlyID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPay_DatMonthlyID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPay_DatMonthlyID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrMagic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrMagic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrMagic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrFlxIDEb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrFlxIDEb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrFlxIDEb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrFlxIDP2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrFlxIDP2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrFlxIDP2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrCRC';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrCRC';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrCRC';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrFlxID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrFlxID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrFlxID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateAdd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateAdd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateAdd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateMod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateMod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateMod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateDel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateDel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateDel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateRBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateRBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateRBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateREnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateREnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDateREnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrUserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrUserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrUserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrRecType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrRecType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrRecType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrArchive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrArchive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrArchive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPayPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPayPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPayPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPSID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPSID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPSID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDistCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDistCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1935, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDistCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1980, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrRateCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrRateCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrRateCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrTotalHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrTotalHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrTotalHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrTotalEarnings';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrTotalEarnings';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2325, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrTotalEarnings';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrRatePaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrRatePaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1935, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrRatePaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrChrgDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrChrgDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2205, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrChrgDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDistData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDistData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDistData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDistData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDistData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDistData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrAdjCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrAdjCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1875, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrAdjCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPayFreq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPayFreq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1875, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrPayFreq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSocNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSocNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2160, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSocNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrEmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrEmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2490, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrEmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrMiscData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrMiscData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrMiscData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrMaritalStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrMaritalStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2055, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrMaritalStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSex';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSex';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1755, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSex';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrUCState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrUCState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrUCState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSecPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSecPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2835, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSecPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrVoidManCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrVoidManCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1800, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrVoidManCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrVacCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrVacCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1920, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrVacCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSickCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSickCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrSickCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrBaseRateDec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrBaseRateDec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2745, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrBaseRateDec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrBaseRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrBaseRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1995, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrBaseRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrChrgDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrChrgDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrChrgDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1665, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrChrgDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrChrgDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1950, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrChrgDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrUpsize_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrUpsize_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1890, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayLbrUpsize_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPaySite';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPaySite';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 4470, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPaySite';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayPaycode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayPaycode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1635, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayPaycode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayPaytype';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayPaytype';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 3060, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayPaytype';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'new;edit', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblDocPay', @level2type = N'COLUMN', @level2name = N'DocPayEditDate';

