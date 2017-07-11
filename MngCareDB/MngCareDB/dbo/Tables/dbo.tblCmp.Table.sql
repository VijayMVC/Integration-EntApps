USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblCmp]    Script Date: 09/08/2016 10:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCmp](
	[CmpKey] [varchar](200) NULL,
	[CmpID] [int] IDENTITY(1,1) NOT NULL,
	[CmpSys_CmpID] [int] NULL,
	[CmpName] [varchar](100) NULL,
	[CmpCode] [varchar](10) NULL,
	[CmpAddress1] [varchar](50) NULL,
	[CmpAddress2] [varchar](50) NULL,
	[CmpCity] [varchar](30) NULL,
	[CmpState] [char](2) NULL,
	[CmpZip] [varchar](10) NULL,
	[CmpCountry] [varchar](20) NULL,
	[CmpPhone] [varchar](15) NULL,
	[CmpFax] [varchar](15) NULL,
	[CmpWeb] [varchar](255) NULL,
	[CmpSiteBedNo] [int] NOT NULL,
	[CmpPhyGrpYN] [bit] NULL,
	[CmpSysYN] [bit] NULL,
	[CmpSiteYN] [bit] NULL,
	[CmpBillAgentYN] [bit] NULL,
	[CmpMalCarYN] [bit] NULL,
	[CmpOtherYN] [bit] NULL,
	[CmpTranscriptYN] [bit] NULL,
	[CmpIPAYN] [bit] NOT NULL,
	[CmpContractingYN] [bit] NOT NULL,
	[CmpComment] [text] NULL,
	[CmpDateCreate] [smalldatetime] NULL,
	[CmpDateEdit] [smalldatetime] NULL,
	[CmpDateInactive] [smalldatetime] NULL,
	[CmpInactiveYN] [bit] NULL,
	[CmpFlagYN] [bit] NULL,
	[CmpIPAContact] [varchar](100) NULL,
	[CmpIPA_CntID] [int] NULL,
	[CmpIPAEmail] [varchar](150) NULL,
	[CmpIPAComment] [varchar](200) NULL,
	[CmpCompanyNameBilling] [varchar](100) NULL,
	[CmpAddressBilling] [varchar](100) NULL,
	[CmpCityBilling] [varchar](50) NULL,
	[CmpStateBilling] [char](2) NULL,
	[CmpZipBilling] [char](10) NULL,
	[CmpPhoneBilling] [char](10) NULL,
	[CmpFaxBilling] [char](10) NULL,
	[CmpContactBilling] [varchar](100) NULL,
	[CmpEmailBilling] [varchar](150) NULL,
	[CmpCommentBilling] [varchar](200) NULL,
	[CmpCompanyNameRefund] [varchar](100) NULL,
	[CmpAddressRefund] [varchar](100) NULL,
	[CmpCityRefund] [varchar](50) NULL,
	[CmpStateRefund] [char](2) NULL,
	[CmpZipRefund] [char](10) NULL,
	[CmpPhoneRefund] [char](10) NULL,
	[CmpFaxRefund] [char](10) NULL,
	[CmpContactRefund] [varchar](100) NULL,
	[CmpEmailRefund] [varchar](150) NULL,
	[CmpCommentRefund] [varchar](200) NULL,
	[CmpCompanyNameAppeal] [varchar](100) NULL,
	[CmpAddressAppeal] [varchar](100) NULL,
	[CmpCityAppeal] [varchar](50) NULL,
	[CmpStateAppeal] [char](2) NULL,
	[CmpZipAppeal] [char](10) NULL,
	[CmpPhoneAppeal] [char](10) NULL,
	[CmpFaxAppeal] [char](10) NULL,
	[CmpContactAppeal] [varchar](100) NULL,
	[CmpEmailAppeal] [varchar](150) NULL,
	[CmpCommentAppeal] [varchar](200) NULL,
	[CmpCompanyNameContracting] [varchar](100) NULL,
	[CmpContracting_CmpID] [int] NULL,
	[CmpContracting_CntID] [int] NULL,
	[CmpAddressContracting] [varchar](100) NULL,
	[CmpCityContracting] [varchar](50) NULL,
	[CmpStateContracting] [char](2) NULL,
	[CmpZipContracting] [char](10) NULL,
	[CmpPhoneContracting] [char](10) NULL,
	[CmpFaxContracting] [char](10) NULL,
	[CmpContactContracting] [varchar](100) NULL,
	[CmpEmailContracting] [varchar](150) NULL,
	[CmpCommentContracting] [varchar](200) NULL,
	[CmpNameAlternative] [varchar](100) NULL,
	[CmpPhoneExt] [varchar](10) NULL,
	[CmpEmail] [varchar](125) NULL,
	[CmpHospitalYN] [bit] NOT NULL,
	[CmpGovtYN] [bit] NOT NULL,
	[CmpTypeIPAMGYN] [bit] NOT NULL,
	[CmpType2BillAgentYN] [bit] NOT NULL,
	[CmpHlthPlnYN] [bit] NOT NULL,
	[CmpTPAYN] [bit] NOT NULL,
	[CmpZip4] [varchar](4) NULL,
	[CmpSitelineType] [varchar](10) NULL,
	[CmpCounty] [varchar](25) NULL,
 CONSTRAINT [PK_tblCmp] PRIMARY KEY NONCLUSTERED 
(
	[CmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [CmpKey] ON [dbo].[tblCmp] 
(
	[CmpKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CmpCity] ON [dbo].[tblCmp] 
(
	[CmpCity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CmpName] ON [dbo].[tblCmp] 
(
	[CmpName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CmpPhone] ON [dbo].[tblCmp] 
(
	[CmpPhone] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CmpState] ON [dbo].[tblCmp] 
(
	[CmpState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CmpZip] ON [dbo].[tblCmp] 
(
	[CmpZip] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCmp] ON [dbo].[tblCmp] 
(
	[CmpKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCmp', @level2type=N'COLUMN',@level2name=N'CmpNameAlternative'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCmp', @level2type=N'COLUMN',@level2name=N'CmpNameAlternative'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCmp', @level2type=N'COLUMN',@level2name=N'CmpNameAlternative'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Created to hold type IPA.  Originally IPA became Payer then  wanted separate IPA Type field.  Ddidn''t want to change all the code associated with the Payee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCmp', @level2type=N'COLUMN',@level2name=N'CmpTypeIPAMGYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Same as Type2IPA.  Names got changed around and needed new field for BillAgent separate from MSO.  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblCmp', @level2type=N'COLUMN',@level2name=N'CmpType2BillAgentYN'
GO
ALTER TABLE [dbo].[tblCmp]  WITH NOCHECK ADD  CONSTRAINT [FK_tblCmp_tblCmp] FOREIGN KEY([CmpContracting_CmpID])
REFERENCES [dbo].[tblCmp] ([CmpID])
GO
ALTER TABLE [dbo].[tblCmp] CHECK CONSTRAINT [FK_tblCmp_tblCmp]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpSiteBedNo]  DEFAULT ((0)) FOR [CmpSiteBedNo]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpPhyGrpYN]  DEFAULT ((0)) FOR [CmpPhyGrpYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpSysYN]  DEFAULT ((0)) FOR [CmpSysYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpSiteYN]  DEFAULT ((0)) FOR [CmpSiteYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpBillAgentYN]  DEFAULT ((0)) FOR [CmpBillAgentYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpMalCarYN]  DEFAULT ((0)) FOR [CmpMalCarYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpOtherYN]  DEFAULT ((0)) FOR [CmpOtherYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpTranscriptYN]  DEFAULT ((0)) FOR [CmpTranscriptYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpIPAYN]  DEFAULT ((0)) FOR [CmpIPAYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpContractingYN]  DEFAULT ((0)) FOR [CmpContractingYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpInactiveYN]  DEFAULT ((0)) FOR [CmpInactiveYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpFlagYN]  DEFAULT ((0)) FOR [CmpFlagYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpHospitalYN]  DEFAULT ((0)) FOR [CmpHospitalYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpHovernemntlYN]  DEFAULT ((0)) FOR [CmpGovtYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpType2IPAYN]  DEFAULT ((0)) FOR [CmpTypeIPAMGYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpType2BillAgentYN]  DEFAULT ((0)) FOR [CmpType2BillAgentYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpHlthPlnYN]  DEFAULT ((0)) FOR [CmpHlthPlnYN]
GO
ALTER TABLE [dbo].[tblCmp] ADD  CONSTRAINT [DF_tblCmp_CmpTPAYN]  DEFAULT ((0)) FOR [CmpTPAYN]
GO
