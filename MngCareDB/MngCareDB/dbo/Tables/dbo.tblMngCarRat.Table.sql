USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblMngCarRat]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMngCarRat](
	[MngCarRatID] [int] IDENTITY(1,1) NOT NULL,
	[MngCarRat_MngCarID] [int] NOT NULL,
	[MngCarRat_RatTypID] [varchar](50) NOT NULL,
	[MngCarRatRate] [float] NOT NULL,
	[MngCarRatRateType] [smallint] NOT NULL,
	[MngCarRatComment] [varchar](1000) NULL,
	[MngCarRatLesserBilledYN] [smallint] NOT NULL,
	[MngCarRatFeeScheduleFileYN] [smallint] NOT NULL,
	[MngCarRatConversionFactorYN] [smallint] NOT NULL,
	[MngCarRatStartDate] [datetime] NULL,
	[MngCarRatEndDate] [datetime] NULL,
 CONSTRAINT [PK_tblMngCarRat] PRIMARY KEY CLUSTERED 
(
	[MngCarRatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatLesserBilledYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatLesserBilledYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatLesserBilledYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatFeeScheduleFileYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatFeeScheduleFileYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatFeeScheduleFileYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatConversionFactorYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatConversionFactorYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatConversionFactorYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblMngCarRat', @level2type=N'COLUMN',@level2name=N'MngCarRatEndDate'
GO
ALTER TABLE [dbo].[tblMngCarRat]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCarRat_tblMngCar] FOREIGN KEY([MngCarRat_MngCarID])
REFERENCES [dbo].[tblMngCar] ([MngCarID])
GO
ALTER TABLE [dbo].[tblMngCarRat] CHECK CONSTRAINT [FK_tblMngCarRat_tblMngCar]
GO
ALTER TABLE [dbo].[tblMngCarRat]  WITH NOCHECK ADD  CONSTRAINT [FK_tblMngCarRat_tlkpRatTyp] FOREIGN KEY([MngCarRat_RatTypID])
REFERENCES [dbo].[tlkpRatTyp] ([RatTypID])
GO
ALTER TABLE [dbo].[tblMngCarRat] CHECK CONSTRAINT [FK_tblMngCarRat_tlkpRatTyp]
GO
ALTER TABLE [dbo].[tblMngCarRat] ADD  CONSTRAINT [DF_tblMngCarRat_MngCarRatRate]  DEFAULT (0) FOR [MngCarRatRate]
GO
ALTER TABLE [dbo].[tblMngCarRat] ADD  CONSTRAINT [DF_tblMngCarRat_MngCarRatRateType]  DEFAULT (1) FOR [MngCarRatRateType]
GO
ALTER TABLE [dbo].[tblMngCarRat] ADD  CONSTRAINT [DF_tblMngCarRat_MngCarRatLesserBilledYN]  DEFAULT (0) FOR [MngCarRatLesserBilledYN]
GO
ALTER TABLE [dbo].[tblMngCarRat] ADD  CONSTRAINT [DF_tblMngCarRat_MngCarRatFeeScheduleFileYN]  DEFAULT (0) FOR [MngCarRatFeeScheduleFileYN]
GO
ALTER TABLE [dbo].[tblMngCarRat] ADD  CONSTRAINT [DF_tblMngCarRat_MngCarRatConversionFactorYN]  DEFAULT (0) FOR [MngCarRatConversionFactorYN]
GO
