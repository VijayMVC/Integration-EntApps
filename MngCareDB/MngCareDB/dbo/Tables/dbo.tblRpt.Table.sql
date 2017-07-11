USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblRpt]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRpt](
	[RptID] [varchar](50) NOT NULL,
	[RptTitle] [varchar](75) NOT NULL,
	[RptCmpYN] [bit] NULL,
	[RptCntYN] [bit] NULL,
	[RptCtrYN] [bit] NULL,
	[RptBdgYN] [bit] NULL,
	[RptSttYN] [bit] NULL,
	[RptRptYN] [bit] NULL,
	[RptActJrnYN] [bit] NULL,
	[RptDistYN] [bit] NULL,
	[RptMCYN] [bit] NULL,
	[RptDetailYN] [bit] NULL,
	[RptListYN] [bit] NULL,
	[RptSampleCriteria] [varchar](200) NULL,
	[RptDateCreate] [smalldatetime] NULL,
	[RptDateEdit] [smalldatetime] NULL,
	[RptComment] [text] NULL,
	[RptTimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_tblRpt] PRIMARY KEY CLUSTERED 
(
	[RptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3840 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=3600 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCmpYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCmpYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCmpYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCmpYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCmpYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCntYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCntYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCntYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCntYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCntYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCtrYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCtrYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCtrYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCtrYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptCtrYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptBdgYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptBdgYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptBdgYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptBdgYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptBdgYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSttYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSttYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSttYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSttYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSttYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptRptYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptRptYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptRptYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptRptYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptRptYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptActJrnYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptActJrnYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptActJrnYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptActJrnYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptActJrnYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDistYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDistYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDistYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDistYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDistYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptMCYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptMCYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptMCYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptMCYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptMCYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDetailYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDetailYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDetailYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDetailYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDetailYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptListYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptListYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptListYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptListYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptListYN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSampleCriteria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSampleCriteria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSampleCriteria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSampleCriteria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptSampleCriteria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateCreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateCreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateCreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateCreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateCreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptDateEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTimeStamp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTimeStamp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTimeStamp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTimeStamp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt', @level2type=N'COLUMN',@level2name=N'RptTimeStamp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[tblRpt].[RptID], [tblRpt].[RptTitle]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblRpt'
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptCmpYN]  DEFAULT (0) FOR [RptCmpYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptCntYN]  DEFAULT (0) FOR [RptCntYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptCtrYN]  DEFAULT (0) FOR [RptCtrYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptBdgYN]  DEFAULT (0) FOR [RptBdgYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptSttYN]  DEFAULT (0) FOR [RptSttYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptRptYN]  DEFAULT (0) FOR [RptRptYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptActJrnYN]  DEFAULT (0) FOR [RptActJrnYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptDistYN]  DEFAULT (0) FOR [RptDistYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptMCYN]  DEFAULT (0) FOR [RptMCYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptDetailYN]  DEFAULT (0) FOR [RptDetailYN]
GO
ALTER TABLE [dbo].[tblRpt] ADD  CONSTRAINT [DF_tblRpt_RptListYN]  DEFAULT (0) FOR [RptListYN]
GO
