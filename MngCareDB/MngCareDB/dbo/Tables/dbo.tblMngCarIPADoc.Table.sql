USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblMngCarIPADoc]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMngCarIPADoc](
	[MngCarIPADocID] [int] IDENTITY(1,1) NOT NULL,
	[MngCarIPADoc_MngCarIPAID] [int] NOT NULL,
	[MngCarIPADocName] [varchar](200) NULL,
	[MngCarIPADocDescription] [varchar](2000) NULL,
	[MngCarIPADocLink] [varchar](2000) NULL,
	[MngCarIPADocLastEdit] [datetime] NULL,
	[MngCarIPADocType] [varchar](50) NULL,
	[MngCarIPADocDate] [date] NULL,
 CONSTRAINT [PK_tblMngCarIPADoc] PRIMARY KEY CLUSTERED 
(
	[MngCarIPADocID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
