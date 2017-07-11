USE [MngCarDB]
GO
/****** Object:  Table [dbo].[ztblMngCarCtr_BackUp20130318]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ztblMngCarCtr_BackUp20130318](
	[MngCarCtrID] [int] IDENTITY(1,1) NOT NULL,
	[MngCarCtr_CtrID] [int] NOT NULL,
	[MngCarCtr_MngCarID] [int] NOT NULL,
	[MngCarCtrStartDate] [datetime] NULL,
	[MngCarCtrEndDate] [datetime] NULL,
	[MngCarCtrComment] [varchar](244) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
