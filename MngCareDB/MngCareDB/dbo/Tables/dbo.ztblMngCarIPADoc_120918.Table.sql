USE [MngCarDB]
GO
/****** Object:  Table [dbo].[ztblMngCarIPADoc_120918]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ztblMngCarIPADoc_120918](
	[MngCarIPADocID] [int] NOT NULL,
	[MngCarIPADoc_MngCarIPAID] [int] NOT NULL,
	[MngCarIPADocName] [varchar](200) NULL,
	[MngCarIPADocDescription] [varchar](2000) NULL,
	[MngCarIPADocLink] [varchar](2000) NULL,
	[MngCarIPADocLastEdit] [datetime] NULL,
	[MngCarIPADocType] [varchar](50) NULL,
	[MngCarIPADocDate] [date] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
