USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblCnt]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCnt](
	[CntKey] [varchar](100) NULL,
	[CntID] [int] IDENTITY(1,1) NOT NULL,
	[Cnt_CmpID] [int] NULL,
	[Cnt_HonID] [varchar](10) NULL,
	[CntLbrFlxIDEb] [int] NULL,
	[CntTitle] [varchar](100) NULL,
	[CntNameFirst] [varchar](30) NULL,
	[CntNameMiddle] [varchar](20) NULL,
	[CntNameLast] [varchar](30) NULL,
	[CntNameSuffix] [varchar](10) NULL,
	[CntAddress1] [varchar](50) NULL,
	[CntAddress2] [varchar](50) NULL,
	[CntCity] [varchar](30) NULL,
	[CntState] [char](2) NULL,
	[CntZip] [varchar](10) NULL,
	[CntCountry] [varchar](25) NULL,
	[CntEmail] [varchar](100) NULL,
	[CntPhonePref] [varchar](21) NULL,
	[CntPhonePrefSelect] [smallint] NULL,
	[CntPhoneHome] [varchar](21) NULL,
	[CntPhoneWork] [varchar](21) NULL,
	[CntPhoneExt] [varchar](10) NULL,
	[CntPhoneCell] [varchar](20) NULL,
	[CntPhoneAlt] [varchar](20) NULL,
	[CntPager] [varchar](20) NULL,
	[CntFaxHome] [varchar](20) NULL,
	[CntFaxWork] [varchar](20) NULL,
	[CntPhoneVoicemail] [varchar](20) NULL,
	[CntCALicNo] [varchar](50) NULL,
	[CntDocNo] [varchar](50) NULL,
	[CntSSN] [varchar](11) NULL,
	[CntDOB] [smalldatetime] NULL,
	[CntDateCreate] [smalldatetime] NULL,
	[CntDateEdit] [smalldatetime] NULL,
	[CntDateInactive] [smalldatetime] NULL,
	[CntInactiveYN] [bit] NULL,
	[CntFlagYN] [bit] NULL,
	[CntComment] [text] NULL,
	[CntDocYN] [bit] NOT NULL,
	[CntPAYN] [bit] NOT NULL,
	[CntCAMYN] [bit] NOT NULL,
	[CntRegDirYN] [bit] NOT NULL,
	[CntRegAssYN] [bit] NOT NULL,
	[CntRegAssDirYN] [bit] NOT NULL,
	[CntMedDirYN] [bit] NOT NULL,
	[CntNurseMgrYN] [bit] NOT NULL,
	[CntQIDirYN] [bit] NOT NULL,
	[CntAdminYN] [bit] NOT NULL,
	[CntDirEd] [bit] NOT NULL,
	[CntMAMarketingYN] [bit] NOT NULL,
	[CntLoginName] [varchar](50) NULL,
	[CntCorpName] [varchar](100) NULL,
	[CntCorpTaxID] [int] NULL,
	[CntCorpLbrFlxIDEb] [int] NULL,
	[zMCID] [int] NULL,
	[zCntSSN] [varchar](11) NULL,
	[CntLawsonNumber] [varchar](15) NULL,
	[CntCompany] [varchar](255) NULL,
	[CntCompanyAddress] [varchar](255) NULL,
	[CntEmail2] [varchar](100) NULL,
	[CntPhoneWork2] [varchar](21) NULL,
	[CntPhoneExt2] [varchar](10) NULL,
	[CntPhoneAltComment] [varchar](255) NULL,
 CONSTRAINT [PK_tblCnt] PRIMARY KEY NONCLUSTERED 
(
	[CntID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [CntKey] UNIQUE CLUSTERED 
(
	[CntID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [Cnt_CmpID] ON [dbo].[tblCnt] 
(
	[Cnt_CmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CntCALicNo] ON [dbo].[tblCnt] 
(
	[CntCALicNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CntCorpLbrFlxIDEb] ON [dbo].[tblCnt] 
(
	[CntCorpLbrFlxIDEb] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CntCorpName] ON [dbo].[tblCnt] 
(
	[CntCorpName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CntCorpTaxID] ON [dbo].[tblCnt] 
(
	[CntCorpTaxID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CntDocNo] ON [dbo].[tblCnt] 
(
	[CntDocNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CntLbrFlxIDEb] ON [dbo].[tblCnt] 
(
	[CntLbrFlxIDEb] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CntSSN] ON [dbo].[tblCnt] 
(
	[CntSSN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCnt]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCnt_tlkpHon] FOREIGN KEY([Cnt_HonID])
REFERENCES [dbo].[tlkpHon] ([HonID])
GO
ALTER TABLE [dbo].[tblCnt] CHECK CONSTRAINT [FK_tblCnt_tlkpHon]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntPhonePrefSelect]  DEFAULT (2) FOR [CntPhonePrefSelect]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntInactiveYN]  DEFAULT (0) FOR [CntInactiveYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntFlagYN]  DEFAULT (0) FOR [CntFlagYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntDocYN]  DEFAULT (0) FOR [CntDocYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntPAYN]  DEFAULT (0) FOR [CntPAYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntCAMYN]  DEFAULT (0) FOR [CntCAMYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntRegDirYN]  DEFAULT (0) FOR [CntRegDirYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntRegAssYN]  DEFAULT (0) FOR [CntRegAssYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntRegAssDirYN]  DEFAULT (0) FOR [CntRegAssDirYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntMedDirYN]  DEFAULT (0) FOR [CntMedDirYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntNurseMgrYN]  DEFAULT (0) FOR [CntNurseMgrYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntQIDirYN]  DEFAULT (0) FOR [CntQIDirYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntAdminYN]  DEFAULT (0) FOR [CntAdminYN]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntDirEd]  DEFAULT (0) FOR [CntDirEd]
GO
ALTER TABLE [dbo].[tblCnt] ADD  CONSTRAINT [DF_tblCnt_CntMAMarketingYN]  DEFAULT (0) FOR [CntMAMarketingYN]
GO
