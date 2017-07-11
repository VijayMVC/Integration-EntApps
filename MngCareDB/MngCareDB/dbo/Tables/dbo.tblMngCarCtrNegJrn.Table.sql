USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblMngCarCtrNegJrn]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMngCarCtrNegJrn](
	[MngCarCtrNegJrnID] [int] IDENTITY(1,1) NOT NULL,
	[MngCarCtrNegJrn_MngCarID] [int] NOT NULL,
	[MngCarCtrNegJrnType] [smallint] NOT NULL,
	[MngCarCtrNegJrnName] [varchar](100) NULL,
	[MngCarCtrNegJrnDate] [datetime] NULL,
	[MngCarCtrNegJrnComment] [varchar](3000) NULL,
	[MngCarCtrNegJrnSubject] [varchar](25) NULL,
 CONSTRAINT [PK_tblMngCarCtrNegJrn] PRIMARY KEY CLUSTERED 
(
	[MngCarCtrNegJrnID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarCtrNegJrn', @level2type=N'COLUMN',@level2name=N'MngCarCtrNegJrnSubject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarCtrNegJrn', @level2type=N'COLUMN',@level2name=N'MngCarCtrNegJrnSubject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarCtrNegJrn', @level2type=N'COLUMN',@level2name=N'MngCarCtrNegJrnSubject'
GO
ALTER TABLE [dbo].[tblMngCarCtrNegJrn]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCarCtrNegJrn_tblMngCar] FOREIGN KEY([MngCarCtrNegJrn_MngCarID])
REFERENCES [dbo].[tblMngCar] ([MngCarID])
GO
ALTER TABLE [dbo].[tblMngCarCtrNegJrn] CHECK CONSTRAINT [FK_tblMngCarCtrNegJrn_tblMngCar]
GO
