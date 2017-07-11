USE [MngCarDB]
GO
/****** Object:  Table [dbo].[ztblMngCar_130711]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ztblMngCar_130711](
	[MngCarID] [int] NOT NULL,
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
	[MngCarDBA] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
