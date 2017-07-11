USE [MngCarDB]
GO
/****** Object:  Table [dbo].[ztblBllCmp_120911]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ztblBllCmp_120911](
	[BllCmpID] [int] NOT NULL,
	[BllCmpName] [varchar](100) NULL,
	[BllCmpIRSName] [varchar](100) NULL,
	[BllCmpAddress1] [varchar](50) NULL,
	[BllCmpAddress2] [varchar](50) NULL,
	[BllCmpCity] [varchar](50) NULL,
	[BllCmpState] [char](2) NULL,
	[BllCmpZip] [varchar](5) NULL,
	[BllCmpZipExt] [varchar](4) NULL,
	[BllCmpTaxID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
