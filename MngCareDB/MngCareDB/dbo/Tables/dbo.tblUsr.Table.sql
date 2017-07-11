USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblUsr]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsr](
	[UsrName] [varchar](50) NOT NULL,
	[UsrAdminYN] [bit] NULL,
 CONSTRAINT [PK_tblUsr] PRIMARY KEY CLUSTERED 
(
	[UsrName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
