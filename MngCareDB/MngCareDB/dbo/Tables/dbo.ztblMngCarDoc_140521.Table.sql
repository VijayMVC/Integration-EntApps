USE [MngCarDB]
GO
/****** Object:  Table [dbo].[ztblMngCarDoc_140521]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ztblMngCarDoc_140521](
	[MngCarDocID] [int] NOT NULL,
	[zMngCarDoc_MngCarID] [int] NULL,
	[MngCarDoc_CmpID] [int] NOT NULL,
	[MngCarDocName] [varchar](200) NULL,
	[MngCarDocDescription] [varchar](2000) NULL,
	[MngCarDocLink] [varchar](2000) NULL,
	[MngCarDocLastEdit] [datetime] NULL,
	[MngCarDocType] [varchar](50) NULL,
	[MngCarDocDate] [date] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
