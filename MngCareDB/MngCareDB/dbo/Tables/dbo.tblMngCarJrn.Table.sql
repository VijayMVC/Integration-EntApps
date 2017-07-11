USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblMngCarJrn]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMngCarJrn](
	[MngCarJrnID] [int] IDENTITY(1,1) NOT NULL,
	[MngCarJrn_MngCarID] [int] NOT NULL,
	[MngCarJrnType] [smallint] NOT NULL,
	[MngCarJrnName] [varchar](100) NULL,
	[MngCarJrnDate] [datetime] NULL,
	[MngCarJrnComment] [varchar](3000) NULL,
	[MngCarJrnSubject] [varchar](25) NULL,
 CONSTRAINT [PK_tblMngCarJrn] PRIMARY KEY CLUSTERED 
(
	[MngCarJrnID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarJrn', @level2type=N'COLUMN',@level2name=N'MngCarJrnSubject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarJrn', @level2type=N'COLUMN',@level2name=N'MngCarJrnSubject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarJrn', @level2type=N'COLUMN',@level2name=N'MngCarJrnSubject'
GO
ALTER TABLE [dbo].[tblMngCarJrn]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCarJrn_tblMngCar] FOREIGN KEY([MngCarJrn_MngCarID])
REFERENCES [dbo].[tblMngCar] ([MngCarID])
GO
ALTER TABLE [dbo].[tblMngCarJrn] CHECK CONSTRAINT [FK_tblMngCarJrn_tblMngCar]
GO
