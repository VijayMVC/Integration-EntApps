USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblTmpMngcar]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTmpMngcar](
	[tmpId] [int] IDENTITY(1,1) NOT NULL,
	[tmpMngCar_CtrID] [int] NULL,
	[tmpMngCarIPA_CmpID] [int] NULL,
	[tmpMngCar_CntID] [int] NULL,
	[tmpMngCar_RatTypID] [int] NULL,
	[tmpMngCar_LivTypID] [int] NULL,
	[tmpMngCar_McCtrTypID] [int] NULL,
	[tmpMngCarClientGroup] [varchar](50) NULL,
	[tmpMngCarEffectDate] [datetime] NULL,
	[tmpMngCarUnsignedYN] [bit] NULL,
	[tmpMngCarClientSignDate] [datetime] NULL,
	[tmpMngCarIPASignDate] [datetime] NULL,
	[tmpMngCarAutoRenewYN] [bit] NULL,
	[tmpMngCarTerminateDate] [datetime] NULL,
	[tmpMngCarRenewNoteDaysQty] [int] NULL,
	[tmpMngCarTermNoCauseDaysQt] [int] NULL,
	[tmpMngCarTermWithCauseDaysQty] [int] NULL,
	[tmpMngCarComment] [text] NULL,
	[tmpMngCarPMPMCapRateAmt] [money] NULL,
	[tmpMngCarChargePct] [float] NULL,
	[tmpMngCarCFPrimary] [float] NULL,
	[tmpMngCarCFMedicine] [float] NULL,
	[tmpMngCarCFSurgery] [float] NULL,
	[tmpMngCarMedicarePct] [float] NULL,
	[tmpMngCarMediCalPct] [float] NULL,
	[tmpMngCarCaseRate] [float] NULL,
 CONSTRAINT [PK_tblTmpMngcar] PRIMARY KEY NONCLUSTERED 
(
	[tmpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
