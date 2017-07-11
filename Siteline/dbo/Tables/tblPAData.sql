CREATE TABLE [dbo].[tblPAData] (
    [PaDataID]               INT            IDENTITY (1, 1) NOT NULL,
    [PaData_PaDataID]        INT            NULL,
    [PaDataLbrMagic]         FLOAT (53)     NULL,
    [PaDataLbrFlxIDEb]       FLOAT (53)     NULL,
    [PaDataLbrFlxIDP2]       NVARCHAR (255) NULL,
    [PaDataLbrCRC]           NVARCHAR (255) NULL,
    [PaDataLbrSource]        FLOAT (53)     NULL,
    [PaDataLbrNote]          NVARCHAR (255) NULL,
    [PaDataLbrFlxID]         FLOAT (53)     NULL,
    [PaDataLbrDateAdd]       SMALLDATETIME  NULL,
    [PaDataLbrDateMod]       SMALLDATETIME  NULL,
    [PaDataLbrDateDel]       NVARCHAR (255) NULL,
    [PaDataLbrDateBeg]       NVARCHAR (255) NULL,
    [PaDataLbrDateEnd]       NVARCHAR (255) NULL,
    [PaDataLbrDateRBeg]      NVARCHAR (255) NULL,
    [PaDataLbrDateREnd]      NVARCHAR (255) NULL,
    [PaDataLbrUserName]      NVARCHAR (255) NULL,
    [PaDataLbrRecType]       NVARCHAR (255) NULL,
    [PaDataLbrArchive]       NVARCHAR (255) NULL,
    [PaDataLbrPayPeriod]     FLOAT (53)     NULL,
    [PaDataLbrPSID]          NVARCHAR (255) NULL,
    [PaDataLbrDivDept]       NVARCHAR (255) NULL,
    [PaDataLbrDistCode]      FLOAT (53)     NULL,
    [PaDataLbrPayClass]      NVARCHAR (255) CONSTRAINT [DF_tblPAData_PaDataLbrPayClass] DEFAULT (0) NULL,
    [PaDataLbrRateCode]      FLOAT (53)     NULL,
    [PaDataLbrTotalHours]    FLOAT (53)     NULL,
    [PaDataLbrTotalEarnings] FLOAT (53)     NULL,
    [PaDataLbrRatePaid]      FLOAT (53)     NULL,
    [PaDataLbrChrgDivDept]   NVARCHAR (255) NULL,
    [PaDataLbrDistData]      FLOAT (53)     NULL,
    [PaDataLbrAdjCode]       NVARCHAR (255) NULL,
    [PaDataLbrPayFreq]       NVARCHAR (255) NULL,
    [PaDataLbrSocNumber]     FLOAT (53)     NULL,
    [PaDataLbrEmpName]       NVARCHAR (255) NULL,
    [PaDataLbrMiscData]      FLOAT (53)     NULL,
    [PaDataLbrMaritalStatus] NVARCHAR (255) NULL,
    [PaDataLbrSex]           NVARCHAR (255) NULL,
    [PaDataLbrUCState]       NVARCHAR (255) NULL,
    [PaDataLbrSecPayCode]    NVARCHAR (255) NULL,
    [PaDataLbrVoidManCode]   NVARCHAR (255) NULL,
    [PaDataLbrVacCode]       NVARCHAR (255) NULL,
    [PaDataLbrSickCode]      NVARCHAR (255) NULL,
    [PaDataLbrBaseRateDec]   FLOAT (53)     NULL,
    [PaDataLbrBaseRate]      FLOAT (53)     NULL,
    [PaDataLbrDiv]           FLOAT (53)     NULL,
    [PaDataLbrChrgDiv]       FLOAT (53)     CONSTRAINT [DF_tblPAData_PaDataLbrChrgDiv] DEFAULT (0) NULL,
    [PaDataLbrDept]          FLOAT (53)     NULL,
    [PaDataLbrChrgDept]      FLOAT (53)     NULL,
    [PaDataLbrUpsize_ts]     NVARCHAR (255) NULL,
    [PaDataSite]             NVARCHAR (255) NULL,
    [PaDataDate]             SMALLDATETIME  NULL,
    [PaDataUpdateSitelineYN] BIT            NULL,
    [PADataManualEditYN]     BIT            CONSTRAINT [DF_tblPAData_PADataManualEdit] DEFAULT (0) NOT NULL,
    [PADataEditName]         VARCHAR (50)   NULL,
    [PADataEditDate]         DATETIME       NULL,
    CONSTRAINT [PK_tblPAData] PRIMARY KEY NONCLUSTERED ([PaDataID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE TRIGGER dbo.tblPAData_Delete
ON dbo.tblPAData
FOR DELETE
AS
Declare @CtrID int,  @Date datetime, @Edit bit,  @PaDataLbrChrgDept float, @Hours float

Select @Edit = PADataManualEditYN,  @PaDataLbrChrgDept = PaDataLbrChrgDept, @Date = PaDataDate from Deleted

If @Edit = 1
Begin
                        SELECT @CtrID = CtrID
                        FROM dbo.tblCtr
		Where CtrPlatinumID = @PaDataLbrChrgDept

                        SELECT @Hours= SUM(dbo.tblPAData.PaDataLbrTotalHours) 
                        FROM dbo.tblPAData INNER JOIN
                       dbo.tblCtr ON dbo.tblPAData.PaDataLbrChrgDept = dbo.tblCtr.CtrPlatinumID
                      WHERE  (PaDataLbrChrgDiv <> 10) AND (PaDataLbrChrgDept <> 120) AND (PaDataLbrPayClass <> 3) AND (dbo.tblPAData.PaDataDate = @Date) AND (dbo.tblCtr.CtrID = @CtrID)
	
if exists(SELECT PATotalsID
FROM dbo.tblPATotalsCtr
WHERE (CtrID = @CtrID) AND (Date =@Date))      

                       exec stpUpdatePATotalsCtr @CtrID, @Date, @Hours
End

	/* IF UPDATE (column_name) ...*/



GO
CREATE TRIGGER dbo.tblPAData_UpdateManualEdit
ON dbo.tblPAData
FOR  INSERT, UPDATE
AS
Declare @CtrID int,  @Date datetime, @Edit bit,  @PaDataLbrChrgDept float, @Hours float, @PaDataID int

Select @Edit = PADataManualEditYN,  @PaDataLbrChrgDept = PaDataLbrChrgDept, @Date = PaDataDate, @PaDataID =PaDataID from Inserted

If @Edit = 1
Begin
                        SELECT @CtrID = CtrID
                        FROM dbo.tblCtr
		Where CtrPlatinumID = @PaDataLbrChrgDept

                        SELECT @Hours= SUM(dbo.tblPAData.PaDataLbrTotalHours) 
                        FROM dbo.tblPAData INNER JOIN
                       dbo.tblCtr ON dbo.tblPAData.PaDataLbrChrgDept = dbo.tblCtr.CtrPlatinumID
                      WHERE  (PaDataLbrChrgDiv <> 10) AND (PaDataLbrChrgDept <> 120) AND (PaDataLbrPayClass <> '3') AND (dbo.tblPAData.PaDataDate = @Date) AND (dbo.tblCtr.CtrID = @CtrID)
	
if exists(SELECT PATotalsID
FROM dbo.tblPATotalsCtr
WHERE (CtrID = @CtrID) AND (Date =@Date))      
    
             exec stpUpdatePATotalsCtr @CtrID, @Date, @Hours
else
	exec stpInsertPATotalsCtr @CtrID, @Date, @Hours


UPDATE    dbo.tblPAData
SET              PADataEditName = dbo.get_login_name(), PADataEditDate = GETDATE()
WHERE     (PADataID = @PADataID)

End

	/* IF UPDATE (column_name) ...*/






GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = N'((PaDataLbrPayPeriod=2008200))', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = N'tblPAData.PaDataLbrPayPeriod DESC', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaData_PaDataID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaData_PaDataID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaData_PaDataID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrMagic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrMagic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrMagic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrFlxIDEb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrFlxIDEb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrFlxIDEb';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrFlxIDP2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrFlxIDP2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrFlxIDP2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrCRC';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrCRC';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrCRC';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSource';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrFlxID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrFlxID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrFlxID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateAdd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateAdd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateAdd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateMod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateMod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateMod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateDel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateDel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateDel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateEnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateRBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateRBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateRBeg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateREnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateREnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDateREnd';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrUserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrUserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrUserName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrRecType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrRecType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrRecType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrArchive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrArchive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrArchive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPayPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPayPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPayPeriod';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPSID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPSID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPSID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDistCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDistCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDistCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1725, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPayClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrRateCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrRateCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrRateCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrTotalHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrTotalHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 2040, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrTotalHours';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrTotalEarnings';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrTotalEarnings';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrTotalEarnings';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrRatePaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrRatePaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrRatePaid';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrChrgDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrChrgDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrChrgDivDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDistData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDistData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDistData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrAdjCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrAdjCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrAdjCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPayFreq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPayFreq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrPayFreq';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSocNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSocNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSocNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrEmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrEmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1710, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrEmpName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrMiscData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrMiscData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrMiscData';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrMaritalStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrMaritalStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrMaritalStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSex';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSex';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSex';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrUCState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrUCState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrUCState';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSecPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSecPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSecPayCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrVoidManCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrVoidManCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrVoidManCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrVacCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrVacCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrVacCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSickCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSickCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrSickCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrBaseRateDec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrBaseRateDec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrBaseRateDec';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrBaseRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrBaseRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1785, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrBaseRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrChrgDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrChrgDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = 1770, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrChrgDiv';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrChrgDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrChrgDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrChrgDept';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrUpsize_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrUpsize_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataLbrUpsize_ts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataSite';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataSite';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataSite';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataUpdateSitelineYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataUpdateSitelineYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PaDataUpdateSitelineYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataManualEditYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataManualEditYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataManualEditYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataManualEditYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataManualEditYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataManualEditYN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnHidden', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnOrder', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_ColumnWidth', @value = -1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblPAData', @level2type = N'COLUMN', @level2name = N'PADataEditDate';

