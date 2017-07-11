USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblBox32]    Script Date: 09/08/2016 10:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBox32](
	[Box32ID] [int] IDENTITY(1,1) NOT NULL,
	[Box32_CtrID] [int] NOT NULL,
	[Box32Name] [varchar](100) NOT NULL,
	[Box32Address] [varchar](200) NULL,
	[Box32City] [varchar](100) NULL,
	[Box32State] [char](2) NULL,
	[Box32Zip] [varchar](15) NULL,
	[Box32ZipPlus4] [varchar](4) NULL,
	[Box32NPI] [varchar](50) NULL,
	[Box32EffectiveDate] [datetime] NULL,
	[Box32ExpirationDate] [datetime] NULL,
	[Box32Comment] [varchar](500) NULL,
 CONSTRAINT [PK_tblBox32] PRIMARY KEY CLUSTERED 
(
	[Box32ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
