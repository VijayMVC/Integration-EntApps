USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tlkpMngCarDocType]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tlkpMngCarDocType](
	[MngCarDocType] [varchar](25) NOT NULL,
 CONSTRAINT [PK_tlkpMngCarDocType] PRIMARY KEY CLUSTERED 
(
	[MngCarDocType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
