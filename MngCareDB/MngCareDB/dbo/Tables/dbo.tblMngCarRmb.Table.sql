USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblMngCarRmb]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMngCarRmb](
	[MngCarRmbID] [int] IDENTITY(1,1) NOT NULL,
	[MngCarRmb_MngCarID] [int] NOT NULL,
	[MngCarRmb_RmbID] [varchar](50) NOT NULL,
	[MngCarRmb_MngCarRatID] [int] NOT NULL,
	[MngCarRmbComment] [varchar](1000) NULL,
 CONSTRAINT [PK_tblMngCarRmb] PRIMARY KEY CLUSTERED 
(
	[MngCarRmbID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmb_MngCarID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmb_MngCarID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmb_MngCarID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmb_RmbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmb_RmbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmb_RmbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmb_MngCarRatID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmb_MngCarRatID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmb_MngCarRatID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmbComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmbComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb', @level2type=N'COLUMN',@level2name=N'MngCarRmbComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRmb'
GO
ALTER TABLE [dbo].[tblMngCarRmb]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCarRmb_tblMngCar] FOREIGN KEY([MngCarRmb_MngCarID])
REFERENCES [dbo].[tblMngCar] ([MngCarID])
GO
ALTER TABLE [dbo].[tblMngCarRmb] CHECK CONSTRAINT [FK_tblMngCarRmb_tblMngCar]
GO
ALTER TABLE [dbo].[tblMngCarRmb]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCarRmb_tlkpRmb] FOREIGN KEY([MngCarRmb_RmbID])
REFERENCES [dbo].[tlkpRmb] ([RmbID])
GO
ALTER TABLE [dbo].[tblMngCarRmb] CHECK CONSTRAINT [FK_tblMngCarRmb_tlkpRmb]
GO
