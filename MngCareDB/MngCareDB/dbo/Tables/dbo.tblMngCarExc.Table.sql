USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblMngCarExc]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMngCarExc](
	[MngCarExcID] [int] IDENTITY(1,1) NOT NULL,
	[MngCarExc_MngCarID] [int] NOT NULL,
	[MngCarExcYesNo] [smallint] NOT NULL,
	[MngCarExcDescription] [varchar](100) NULL,
	[MngCarExcComment] [varchar](2000) NULL,
 CONSTRAINT [PK_tblMngCarExc] PRIMARY KEY CLUSTERED 
(
	[MngCarExcID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarExc', @level2type=N'COLUMN',@level2name=N'MngCarExc_MngCarID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarExc', @level2type=N'COLUMN',@level2name=N'MngCarExc_MngCarID'
GO
ALTER TABLE [dbo].[tblMngCarExc]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCarExc_tblMngCar] FOREIGN KEY([MngCarExc_MngCarID])
REFERENCES [dbo].[tblMngCar] ([MngCarID])
GO
ALTER TABLE [dbo].[tblMngCarExc] CHECK CONSTRAINT [FK_tblMngCarExc_tblMngCar]
GO
ALTER TABLE [dbo].[tblMngCarExc] ADD  CONSTRAINT [DF_tblMngCarExc_MngCarExcYesNo]  DEFAULT (0) FOR [MngCarExcYesNo]
GO
