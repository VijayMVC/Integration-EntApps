USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tlkpMngCarRgn]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tlkpMngCarRgn](
	[MngCarRgnID] [varchar](20) NOT NULL,
	[MngCarRgnNote] [varchar](500) NULL,
 CONSTRAINT [PK_tlkpMngCarRgn] PRIMARY KEY CLUSTERED 
(
	[MngCarRgnID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn', @level2type=N'COLUMN',@level2name=N'MngCarRgnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn', @level2type=N'COLUMN',@level2name=N'MngCarRgnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=2250 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn', @level2type=N'COLUMN',@level2name=N'MngCarRgnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn', @level2type=N'COLUMN',@level2name=N'MngCarRgnNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn', @level2type=N'COLUMN',@level2name=N'MngCarRgnNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1605 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn', @level2type=N'COLUMN',@level2name=N'MngCarRgnNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tlkpMngCarRgn'
GO
