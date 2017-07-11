USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblMngCarNegDoc]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMngCarNegDoc](
	[MngCarNegDocID] [int] IDENTITY(1,1) NOT NULL,
	[MngCarNeg_MngCarID] [int] NOT NULL,
	[MngCarNegDocName] [varchar](200) NULL,
	[MngCarNegDocDescription] [varchar](2000) NULL,
	[MngCarNegDocLink] [varchar](2000) NULL,
	[MngCarNegDocLastEdit] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MngCarNegDocID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblMngCarNegDoc]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCarNegDoc_tblMngCar] FOREIGN KEY([MngCarNeg_MngCarID])
REFERENCES [dbo].[tblMngCar] ([MngCarID])
GO
ALTER TABLE [dbo].[tblMngCarNegDoc] CHECK CONSTRAINT [FK_tblMngCarNegDoc_tblMngCar]
GO
