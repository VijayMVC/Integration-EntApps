CREATE TABLE [dbo].[tblCnt] (
    [CntKey]             VARCHAR (100) NULL,
    [CntID]              INT           IDENTITY (1, 1) NOT NULL,
    [Cnt_CmpID]          INT           NULL,
    [Cnt_HonID]          VARCHAR (10)  NULL,
    [CntLbrFlxIDEb]      INT           NULL,
    [CntTitle]           VARCHAR (100) NULL,
    [CntNameFirst]       VARCHAR (30)  NULL,
    [CntNameMiddle]      VARCHAR (20)  NULL,
    [CntNameLast]        VARCHAR (30)  NULL,
    [CntNameSuffix]      VARCHAR (10)  NULL,
    [CntAddress1]        VARCHAR (50)  NULL,
    [CntAddress2]        VARCHAR (50)  NULL,
    [CntCity]            VARCHAR (30)  NULL,
    [CntState]           CHAR (2)      NULL,
    [CntZip]             VARCHAR (10)  NULL,
    [CntCountry]         VARCHAR (25)  NULL,
    [CntEmail]           VARCHAR (100) NULL,
    [CntPhonePref]       VARCHAR (20)  NULL,
    [CntPhonePrefSelect] SMALLINT      CONSTRAINT [DF_tblCnt_CntPhonePrefSelect] DEFAULT (2) NULL,
    [CntPhoneHome]       VARCHAR (20)  NULL,
    [CntPhoneWork]       VARCHAR (20)  NULL,
    [CntPhoneExt]        VARCHAR (10)  NULL,
    [CntPhoneCell]       VARCHAR (20)  NULL,
    [CntPhoneAlt]        VARCHAR (20)  NULL,
    [CntPager]           VARCHAR (20)  NULL,
    [CntFaxHome]         VARCHAR (20)  NULL,
    [CntFaxWork]         VARCHAR (20)  NULL,
    [CntPhoneVoicemail]  VARCHAR (20)  NULL,
    [CntCALicNo]         VARCHAR (50)  NULL,
    [CntDocNo]           VARCHAR (50)  NULL,
    [CntSSN]             VARCHAR (11)  NULL,
    [CntDOB]             SMALLDATETIME NULL,
    [CntDateCreate]      SMALLDATETIME NULL,
    [CntDateEdit]        SMALLDATETIME NULL,
    [CntDateInactive]    SMALLDATETIME NULL,
    [CntInactiveYN]      BIT           CONSTRAINT [DF_tblCnt_CntInactiveYN] DEFAULT (0) NULL,
    [CntFlagYN]          BIT           CONSTRAINT [DF_tblCnt_CntFlagYN] DEFAULT (0) NULL,
    [CntComment]         TEXT          NULL,
    [CntDocYN]           BIT           CONSTRAINT [DF_tblCnt_CntDocYN] DEFAULT (0) NOT NULL,
    [CntPAYN]            BIT           CONSTRAINT [DF_tblCnt_CntPAYN] DEFAULT (0) NOT NULL,
    [CntCAMYN]           BIT           CONSTRAINT [DF_tblCnt_CntCAMYN] DEFAULT (0) NOT NULL,
    [CntRegDirYN]        BIT           CONSTRAINT [DF_tblCnt_CntRegDirYN] DEFAULT (0) NOT NULL,
    [CntRegAssYN]        BIT           CONSTRAINT [DF_tblCnt_CntRegAssYN] DEFAULT (0) NOT NULL,
    [CntRegAssDirYN]     BIT           CONSTRAINT [DF_tblCnt_CntRegAssDirYN] DEFAULT (0) NOT NULL,
    [CntMedDirYN]        BIT           CONSTRAINT [DF_tblCnt_CntMedDirYN] DEFAULT (0) NOT NULL,
    [CntNurseMgrYN]      BIT           CONSTRAINT [DF_tblCnt_CntNurseMgrYN] DEFAULT (0) NOT NULL,
    [CntQIDirYN]         BIT           CONSTRAINT [DF_tblCnt_CntQIDirYN] DEFAULT (0) NOT NULL,
    [CntAdminYN]         BIT           CONSTRAINT [DF_tblCnt_CntAdminYN] DEFAULT (0) NOT NULL,
    [CntDirEd]           BIT           CONSTRAINT [DF_tblCnt_CntDirEd] DEFAULT (0) NOT NULL,
    [CntMAMarketingYN]   BIT           CONSTRAINT [DF_tblCnt_CntMAMarketingYN] DEFAULT (0) NOT NULL,
    [CntLoginName]       VARCHAR (50)  NULL,
    [CntCorpName]        VARCHAR (100) NULL,
    [CntCorpTaxID]       INT           NULL,
    [CntCorpLbrFlxIDEb]  INT           NULL,
    [zMCID]              INT           NULL,
    [zCntSSN]            VARCHAR (11)  NULL,
    [CntLawsonNumber]    VARCHAR (15)  NULL,
    CONSTRAINT [PK_tblCnt] PRIMARY KEY NONCLUSTERED ([CntID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCnt_tlkpHon] FOREIGN KEY ([Cnt_HonID]) REFERENCES [dbo].[tlkpHon] ([HonID]),
    CONSTRAINT [CntKey] UNIQUE CLUSTERED ([CntID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [Cnt_CmpID]
    ON [dbo].[tblCnt]([Cnt_CmpID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_CntLbrFlxIDEb]
    ON [dbo].[tblCnt]([CntLbrFlxIDEb] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CntCALicNo]
    ON [dbo].[tblCnt]([CntCALicNo] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CntDocNo]
    ON [dbo].[tblCnt]([CntDocNo] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CntSSN]
    ON [dbo].[tblCnt]([CntSSN] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CntCorpName]
    ON [dbo].[tblCnt]([CntCorpName] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CntCorpTaxID]
    ON [dbo].[tblCnt]([CntCorpTaxID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CntCorpLbrFlxIDEb]
    ON [dbo].[tblCnt]([CntCorpLbrFlxIDEb] ASC);


GO
CREATE TRIGGER dbo.tblCnt_CheckLawsonNumber
ON dbo.tblCnt
FOR INSERT, UPDATE
AS
Declare @LawsonNumber varchar(15), @CntID int, @LawsonCount int

select @LawsonNumber = CntLawsonNumber, @CntID = CntID from Inserted


SELECT      @LawsonCount = COUNT(CntID) 
FROM         dbo.tblCnt
GROUP BY CntLawsonNumber
HAVING      (CntLawsonNumber = @LawsonNumber)


if @LawsonCount >1
       
Begin
        RaisError ( 'That Lawson ID is already in the database', 16,1)
ROLLBACK TRANSACTION 

        
        --Update tblCnt Set CntLawsonNumber = 'aaa' Where CntID = @CntID



End

	/* IF UPDATE (column_name) ...*/



GO
CREATE TRIGGER dbo.tblCnt_UpdateKey
ON dbo.tblCnt
FOR INSERT, UPDATE
AS
Declare @CntKey Varchar(100), @CntNameFirst Varchar(30), @CntNameMiddle Varchar(20), @CntNameLast varchar(30), @CntID int


Select @CntID = CntID, @CntNameFirst=isnull(CntNameFirst,''), @CntNameMiddle = isnull(CntNameMiddle,''), @CntNamelast = isnull(CntNameLast,'') from Inserted

If @CntNameMiddle = ''
	Set @CntKey = rtrim(@CntNameLast + ', ' + @CntNameFirst + ' (' + rtrim(cast(@CntID as varchar(6))) + ')')
Else

Set @CntKey = rtrim(@CntNameLast + ', ' + @CntNameFirst + ' ' + @CntNameMiddle + ' (' + rtrim(cast(@CntID as varchar(6))) + ')')

Update tblCnt Set CntKey = @CntKey Where CntID = @CntID

	/* IF UPDATE (column_name) ...*/






GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCnt', @level2type = N'COLUMN', @level2name = N'CntSSN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCnt', @level2type = N'COLUMN', @level2name = N'CntSSN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCnt', @level2type = N'COLUMN', @level2name = N'CntSSN';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DisplayControl', @value = N'109', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCnt', @level2type = N'COLUMN', @level2name = N'CntLawsonNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Format', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCnt', @level2type = N'COLUMN', @level2name = N'CntLawsonNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_IMEMode', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tblCnt', @level2type = N'COLUMN', @level2name = N'CntLawsonNumber';

