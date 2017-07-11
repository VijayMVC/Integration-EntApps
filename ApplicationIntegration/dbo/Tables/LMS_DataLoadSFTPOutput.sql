USE [ApplicationIntegration]
GO

/****** Object:  Table [dbo].[LMS_DataLoadSFTPOutput]    Script Date: 08/24/2016 16:08:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LMS_DataLoadSFTPOutput]') AND type IN (N'U'))
DROP TABLE [dbo].[LMS_DataLoadSFTPOutput]
GO

USE [ApplicationIntegration]
GO

/****** Object:  Table [dbo].[LMS_DataLoadSFTPOutput]    Script Date: 08/24/2016 16:08:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LMS_DataLoadSFTPOutput](
	[LineNumber] [INT] IDENTITY(1,1) NOT NULL,
	[LineText] [VARCHAR](4000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


