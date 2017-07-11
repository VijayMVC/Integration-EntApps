USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblBox33]    Script Date: 09/08/2016 10:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBox33](
	[Box33ID] [int] IDENTITY(1,1) NOT NULL,
	[Box33_CtrID] [int] NOT NULL,
	[Box33Name] [varchar](100) NOT NULL,
	[Box33Address1] [varchar](200) NULL,
	[Box33Address2] [varchar](200) NULL,
	[Box33City] [varchar](100) NULL,
	[Box33State] [char](2) NULL,
	[Box33Zip] [varchar](15) NULL,
	[Box33ZipPlus4] [varchar](4) NULL,
	[Box33NPI] [varchar](50) NULL,
	[Box33EffectiveDate] [datetime] NULL,
	[Box33ExpirationDate] [datetime] NULL,
	[Box33Comment] [varchar](500) NULL,
	[Box33TaxID] [varchar](20) NULL,
	[Box33Phone] [varchar](15) NULL,
 CONSTRAINT [PK_tblBox33] PRIMARY KEY CLUSTERED 
(
	[Box33ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
