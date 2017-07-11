USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblCmpDoc]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCmpDoc](
	[CmpDocID] [int] IDENTITY(1,1) NOT NULL,
	[CmpDoc_CmpID] [int] NOT NULL,
	[CmpDocName] [varchar](200) NULL,
	[CmpDocDescription] [varchar](2000) NULL,
	[CmpDocLink] [varchar](2000) NULL,
	[CmpDocLastEdit] [datetime] NULL,
	[CmpDocType] [varchar](50) NULL,
	[CmpDocDate] [date] NULL,
 CONSTRAINT [PK_tblCmpDoc] PRIMARY KEY CLUSTERED 
(
	[CmpDocID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
