USE [MngCarDB]
GO
/****** Object:  Table [dbo].[ztblMngCarDoc_backup]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ztblMngCarDoc_backup](
	[MngCarDocID] [int] NOT NULL,
	[MngCarDoc_MngCarID] [int] NOT NULL,
	[MngCarDocName] [varchar](200) NULL,
	[MngCarDocDescription] [varchar](2000) NULL,
	[MngCarDocLink] [varchar](2000) NULL,
	[MngCarDocLastEdit] [datetime] NULL,
	[MngCarDocType] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
