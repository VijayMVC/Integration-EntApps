USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblBllCmp]    Script Date: 09/08/2016 10:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBllCmp](
	[BllCmpID] [int] IDENTITY(1,1) NOT NULL,
	[BllCmpName] [varchar](100) NULL,
	[BllCmpIRSName] [varchar](100) NULL,
	[BllCmpAddress1] [varchar](50) NULL,
	[BllCmpAddress2] [varchar](50) NULL,
	[BllCmpCity] [varchar](50) NULL,
	[BllCmpState] [char](2) NULL,
	[BllCmpZip] [varchar](5) NULL,
	[BllCmpZipExt] [varchar](4) NULL,
	[BllCmpTaxID] [int] NULL,
 CONSTRAINT [PK_tblBllCmp] PRIMARY KEY CLUSTERED 
(
	[BllCmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
