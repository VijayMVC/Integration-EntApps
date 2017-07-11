USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblMngCar]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMngCar](
	[MngCarID] [int] IDENTITY(1,1) NOT NULL,
	[MngCarKey] [varchar](255) NULL,
	[MngCar_CtrID] [int] NULL,
	[MngCarIPA_CmpID] [int] NULL,
	[MngCarBill_CmpID] [int] NULL,
	[MngCar_CntID] [int] NULL,
	[MngCar_RatTypID] [varchar](50) NULL,
	[MngCar_LivTypID] [int] NULL,
	[MngCar_McCtrTypID] [int] NULL,
	[MngCar_FeeSchRgnID] [int] NULL,
	[MngCar_FeeSchYrID] [int] NULL,
	[MngCar_MngCarRgnID] [varchar](20) NULL,
	[MngCarPayer_CmpID] [int] NULL,
	[MngCarOther_CmpID] [int] NULL,
	[MngCarAppealPDR_CmpID] [int] NULL,
	[MngCarContracting_CmpID] [int] NULL,
	[MngCarBilling_CmpID] [int] NULL,
	[MngCarOvPayRfnd_CmpID] [int] NULL,
	[MngCarAlternativeName] [varchar](150) NULL,
	[MngCarContractType] [varchar](150) NULL,
	[MngCarPHO_CmpID] [int] NULL,
	[MngCarMSO_CmpID] [int] NULL,
	[MngCarEffectDate] [datetime] NULL,
	[MngCarUnsignedYN] [bit] NULL,
	[MngCarClientSignDate] [datetime] NULL,
	[MngCarIPASignDate] [datetime] NULL,
	[MngCarAutoRenewYN] [tinyint] NULL,
	[MngCarTerminateDate] [datetime] NULL,
	[MngCarRateExpireDate] [datetime] NULL,
	[MngCarRenewNoteDaysQty] [int] NOT NULL,
	[MngCarTermNoCauseDaysQt] [int] NOT NULL,
	[MngCarTermWithCauseDaysQty] [int] NOT NULL,
	[MngCarComment] [text] NULL,
	[MngCarInactiveYN] [bit] NULL,
	[MngCarFlagYN] [bit] NULL,
	[MngCarCaseRateLesserYN] [bit] NULL,
	[MngCarPctChargeLesserYN] [bit] NULL,
	[MngCarHoldHarmlessYN] [bit] NULL,
	[MngCarCMSYN] [bit] NULL,
	[MngCarCPTYN] [bit] NULL,
	[MngCarReimbGuideOtherYN] [bit] NULL,
	[MngCarInPatientRateYN] [bit] NULL,
	[MngCarUCRateYN] [bit] NULL,
	[MngCarContractURL] [varchar](250) NULL,
	[MngCarAnniversaryDate] [datetime] NOT NULL,
	[MngCarCID] [varchar](15) NULL,
	[MngCarTIN] [varchar](15) NULL,
	[MngCarInPatientRateDesc] [varchar](250) NULL,
	[MngCarUCRateDesc] [varchar](250) NULL,
	[MngCarReciprocityYN] [bit] NULL,
	[MngCarTerminatedYN] [tinyint] NOT NULL,
	[MngCarClmSubDayQty] [int] NOT NULL,
	[MngCarNoticeDate] [datetime] NULL,
	[MngCarReviewDate] [datetime] NULL,
	[MngCarMedicaidMedicalYN] [bit] NOT NULL,
	[MngCarAmmendmentDaysQty] [int] NOT NULL,
	[MngCarMBSIContractID] [varchar](50) NULL,
	[MngCarOvrPay] [int] NOT NULL,
	[MngCarPymnt] [int] NOT NULL,
	[MngCarCoPayYN] [bit] NULL,
	[MngCarPrAthYN] [bit] NULL,
	[MngCarCrdReqYN] [bit] NULL,
	[MngCarDlgCrdYN] [bit] NULL,
	[MngCarBillingProblemYN] [bit] NULL,
	[MngCarPayerName] [varchar](70) NULL,
	[MngCarPayerEmail] [varchar](100) NULL,
	[MngCarOtherName] [varchar](70) NULL,
	[MngCarOtherEmail] [varchar](50) NULL,
	[MngCarAppealPDRName] [varchar](70) NULL,
	[MngCarAppealPDREmail] [varchar](50) NULL,
	[MngCarContractingName] [varchar](70) NULL,
	[MngCarContractingEmail] [varchar](50) NULL,
	[MngCarBillingName] [varchar](70) NULL,
	[MngCarBillingEmail] [varchar](50) NULL,
	[MngCarOvPayRfndName] [varchar](70) NULL,
	[MngCarOvPayRfndEmail] [varchar](50) NULL,
	[MngCarCntNegDateRange] [varchar](50) NULL,
	[MngCarCntNegAnnualVisits] [int] NULL,
	[MngCarCntNegAvgAcuity] [float] NULL,
	[MngCarCntNegAvgAllowable] [money] NULL,
	[MngCarCntNegAvgCharges] [money] NULL,
	[MngCarCntNegExpReimb] [money] NULL,
	[MngCarCntNegFinImpact] [money] NULL,
	[MngCarCntNegLstReviewed] [datetime] NULL,
	[MngCarPAReductionYN] [tinyint] NOT NULL,
	[MngCarExecutedOnFileYN] [tinyint] NOT NULL,
	[MngCarContractedYN] [tinyint] NOT NULL,
	[MngCarApplDsptDays] [int] NOT NULL,
	[MngCarPayerCmpAddress1] [varchar](100) NULL,
	[MngCarPayerCmpAddress2] [varchar](100) NULL,
	[MngCarPayerCmpCity] [varchar](30) NULL,
	[MngCarPayerCmpState] [char](2) NULL,
	[MngCarPayerCmpZip] [varchar](10) NULL,
	[MngCarPayerCmpPhone] [varchar](15) NULL,
	[MngCarPayerCmpPhoneExt] [varchar](10) NULL,
	[MngCarPayerCmpFax] [varchar](15) NULL,
	[MngCarPayerCntPhone] [varchar](15) NULL,
	[MngCarOtherCmpAddress1] [varchar](100) NULL,
	[MngCarOtherCmpCity] [varchar](30) NULL,
	[MngCarOtherCmpState] [char](2) NULL,
	[MngCarOtherCmpZip] [varchar](10) NULL,
	[MngCarOtherCmpPhone] [varchar](15) NULL,
	[MngCarOtherCmpFax] [varchar](15) NULL,
	[MngCarOtherCntPhone] [varchar](15) NULL,
	[MngCarOtherCntPhoneExt] [varchar](10) NULL,
	[MngCarAppealPDRCmpAddress1] [varchar](100) NULL,
	[MngCarAppealPDRCmpCity] [varchar](30) NULL,
	[MngCarAppealPDRCmpState] [char](2) NULL,
	[MngCarAppealPDRCmpZip] [varchar](10) NULL,
	[MngCarAppealPDRCmpPhone] [varchar](15) NULL,
	[MngCarAppealPDRCmpFax] [varchar](15) NULL,
	[MngCarAppealPDRCntPhone] [varchar](15) NULL,
	[MngCarAppealPDRCntPhoneExt] [varchar](15) NULL,
	[MngCarContractingCmpAddress1] [varchar](100) NULL,
	[MngCarContractingCmpCity] [varchar](30) NULL,
	[MngCarContractingCmpState] [char](2) NULL,
	[MngCarContractingCmpZip] [varchar](10) NULL,
	[MngCarContractingCmpPhone] [varchar](15) NULL,
	[MngCarContractingCmpFax] [varchar](15) NULL,
	[MngCarContractingCntPhone] [varchar](15) NULL,
	[MngCarContractingCntPhoneExt] [varchar](10) NULL,
	[MngCarBillingCmpAddress1] [varchar](100) NULL,
	[MngCarBillingCmpCity] [varchar](30) NULL,
	[MngCarBillingCmpState] [char](2) NULL,
	[MngCarBillingCmpZip] [varchar](10) NULL,
	[MngCarBillingCmpPhone] [varchar](15) NULL,
	[MngCarBillingCmpFax] [varchar](15) NULL,
	[MngCarBillingCntPhone] [varchar](15) NULL,
	[MngCarBillingCntPhoneExt] [varchar](10) NULL,
	[MngCarOvPayRfndCmpAddress1] [varchar](100) NULL,
	[MngCarOvPayRfndCmpCity] [varchar](30) NULL,
	[MngCarOvPayRfndCmpState] [char](2) NULL,
	[MngCarOvPayRfndCmpZip] [varchar](10) NULL,
	[MngCarOvPayRfndCmpPhone] [varchar](15) NULL,
	[MngCarOvPayRfndCmpFax] [varchar](15) NULL,
	[MngCarOvPayRfndCntPhone] [varchar](15) NULL,
	[MngCarOvPayRfndCntPhoneExt] [varchar](10) NULL,
	[MngCarSpecialty] [varchar](50) NULL,
	[MngCarSpecialty2] [varchar](50) NULL,
	[MngCarDBA] [varchar](50) NULL,
 CONSTRAINT [PK_tblMngCar] PRIMARY KEY NONCLUSTERED 
(
	[MngCarID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [MngCar_CtrID] ON [dbo].[tblMngCar] 
(
	[MngCar_CtrID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MngCar_LivTypID] ON [dbo].[tblMngCar] 
(
	[MngCar_LivTypID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MngCar_RatTypID] ON [dbo].[tblMngCar] 
(
	[MngCar_RatTypID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MngCarBill_CmpID] ON [dbo].[tblMngCar] 
(
	[MngCarBill_CmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MngCarKey] ON [dbo].[tblMngCar] 
(
	[MngCarKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPayer_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPayer_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPayer_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOther_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOther_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOther_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAppealPDR_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAppealPDR_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAppealPDR_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContracting_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContracting_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContracting_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBilling_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBilling_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBilling_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvPayRfnd_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvPayRfnd_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvPayRfnd_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAlternativeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAlternativeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAlternativeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=national; 2 = statewide; 3 = regional; 4 = PHO; 5 = Hospital, 6= Government; 7=0ther' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPHO_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPHO_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPHO_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarMSO_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarMSO_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarMSO_CmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAutoRenewYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAutoRenewYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarTerminatedYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarTerminatedYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAmmendmentDaysQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAmmendmentDaysQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAmmendmentDaysQty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarMBSIContractID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarMBSIContractID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarMBSIContractID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvrPay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvrPay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvrPay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPymnt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPymnt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPymnt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCoPayYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCoPayYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCoPayYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPrAthYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPrAthYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPrAthYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCrdReqYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCrdReqYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCrdReqYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarDlgCrdYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarDlgCrdYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarDlgCrdYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBillingProblemYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBillingProblemYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBillingProblemYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPayerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPayerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPayerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPayerEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPayerEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPayerEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOtherName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOtherName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOtherName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOtherEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOtherEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOtherEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAppealPDRName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAppealPDRName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAppealPDRName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAppealPDREmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAppealPDREmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarAppealPDREmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractingName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractingName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractingName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractingEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractingEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractingEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBillingName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBillingName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBillingName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBillingEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBillingEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarBillingEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvPayRfndName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvPayRfndName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvPayRfndName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvPayRfndEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvPayRfndEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarOvPayRfndEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegDateRange'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegDateRange'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegDateRange'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAnnualVisits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAnnualVisits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAnnualVisits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgAcuity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgAcuity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgAcuity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgAcuity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgAllowable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'$#,##0.00;($#,##0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgAllowable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgAllowable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgCharges'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'$#,##0.00;($#,##0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgCharges'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegAvgCharges'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegExpReimb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'$#,##0.00;($#,##0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegExpReimb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegExpReimb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegFinImpact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'$#,##0.00;($#,##0.00)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegFinImpact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegFinImpact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegLstReviewed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegLstReviewed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarCntNegLstReviewed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPAReductionYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPAReductionYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarPAReductionYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarExecutedOnFileYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarExecutedOnFileYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarExecutedOnFileYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractedYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractedYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarContractedYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarApplDsptDays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarApplDsptDays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarApplDsptDays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarSpecialty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarSpecialty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCar', @level2type=N'COLUMN',@level2name=N'MngCarSpecialty'
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCar_tblCmp] FOREIGN KEY([MngCarIPA_CmpID])
REFERENCES [dbo].[tblCmp] ([CmpID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tblCmp]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCar_tblCmp1] FOREIGN KEY([MngCarBill_CmpID])
REFERENCES [dbo].[tblCmp] ([CmpID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tblCmp1]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCar_tblCmp2] FOREIGN KEY([MngCarPHO_CmpID])
REFERENCES [dbo].[tblCmp] ([CmpID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tblCmp2]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCar_tblCnt] FOREIGN KEY([MngCar_CntID])
REFERENCES [dbo].[tblCnt] ([CntID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tblCnt]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH CHECK ADD  CONSTRAINT [FK_tblMngCar_tblCtr] FOREIGN KEY([MngCar_CtrID])
REFERENCES [dbo].[tblCtr] ([CtrID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tblCtr]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCar_tlkpFeeSchRgn] FOREIGN KEY([MngCar_FeeSchRgnID])
REFERENCES [dbo].[tlkpFeeSchRgn] ([FeeSchRgnID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tlkpFeeSchRgn]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCar_tlkpFeeSchYr] FOREIGN KEY([MngCar_FeeSchYrID])
REFERENCES [dbo].[tlkpFeeSchYr] ([FeeSchYrID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tlkpFeeSchYr]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCar_tlkpLiv] FOREIGN KEY([MngCar_LivTypID])
REFERENCES [dbo].[tlkpLiv] ([LivTypID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tlkpLiv]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCar_tlkpMcCtrTyp] FOREIGN KEY([MngCar_McCtrTypID])
REFERENCES [dbo].[tlkpMcCtrTyp] ([McCtrTypID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tlkpMcCtrTyp]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCar_tlkpMngCarRgn] FOREIGN KEY([MngCar_MngCarRgnID])
REFERENCES [dbo].[tlkpMngCarRgn] ([MngCarRgnID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCar_tlkpMngCarRgn]
GO
ALTER TABLE [dbo].[tblMngCar]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCarPHO_tblCmpID] FOREIGN KEY([MngCarPHO_CmpID])
REFERENCES [dbo].[tblCmp] ([CmpID])
GO
ALTER TABLE [dbo].[tblMngCar] CHECK CONSTRAINT [FK_tblMngCarPHO_tblCmpID]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarUnsignedYN]  DEFAULT ((0)) FOR [MngCarUnsignedYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarAutoRenewYN]  DEFAULT ((0)) FOR [MngCarAutoRenewYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarRenewNoteDaysQty]  DEFAULT ((0)) FOR [MngCarRenewNoteDaysQty]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarTermNoCauseDaysQt]  DEFAULT ((0)) FOR [MngCarTermNoCauseDaysQt]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarTermWithCauseDaysQty]  DEFAULT ((0)) FOR [MngCarTermWithCauseDaysQty]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarInactiveYN]  DEFAULT ((0)) FOR [MngCarInactiveYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarFlagYN]  DEFAULT ((0)) FOR [MngCarFlagYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarCMSYN]  DEFAULT ((0)) FOR [MngCarCMSYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarCPTYN]  DEFAULT ((0)) FOR [MngCarCPTYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarReimbGuideOtherYN]  DEFAULT ((0)) FOR [MngCarReimbGuideOtherYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarInPatientRateYN]  DEFAULT ((0)) FOR [MngCarInPatientRateYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarUCRateYN]  DEFAULT ((0)) FOR [MngCarUCRateYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarAnniversaryDate]  DEFAULT (getdate()) FOR [MngCarAnniversaryDate]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarReciprocityYN]  DEFAULT ((0)) FOR [MngCarReciprocityYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarTerminatedYN]  DEFAULT ((0)) FOR [MngCarTerminatedYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarClmSubDayQty]  DEFAULT ((0)) FOR [MngCarClmSubDayQty]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarMedicaidMedicalYN]  DEFAULT ((0)) FOR [MngCarMedicaidMedicalYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarAmmendmentDaysQty]  DEFAULT ((0)) FOR [MngCarAmmendmentDaysQty]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarOvrPay]  DEFAULT ((0)) FOR [MngCarOvrPay]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarPymnt]  DEFAULT ((0)) FOR [MngCarPymnt]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_PAReductionYN]  DEFAULT ((0)) FOR [MngCarPAReductionYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_ExecutedOnFileYN]  DEFAULT ((0)) FOR [MngCarExecutedOnFileYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarContractedYN]  DEFAULT ((0)) FOR [MngCarContractedYN]
GO
ALTER TABLE [dbo].[tblMngCar] ADD  CONSTRAINT [DF_tblMngCar_MngCarApplDspt]  DEFAULT ((0)) FOR [MngCarApplDsptDays]
GO
