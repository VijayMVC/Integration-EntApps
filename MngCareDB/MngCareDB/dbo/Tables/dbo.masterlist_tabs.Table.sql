USE [MngCarDB]
GO
/****** Object:  Table [dbo].[masterlist_tabs]    Script Date: 09/08/2016 10:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[masterlist_tabs](
	[SystemID] [varchar](50) NULL,
	[CEP Start Date] [varchar](50) NULL,
	[CEP Term Date] [varchar](50) NULL,
	[Active] [varchar](50) NULL,
	[Active Date] [varchar](50) NULL,
	[TIN #] [varchar](50) NULL,
	[Site Name] [varchar](100) NULL,
	[Site Addr1] [varchar](50) NULL,
	[Site Addr2] [varchar](50) NULL,
	[Site Phone] [varchar](50) NULL,
	[Site County] [varchar](50) NULL,
	[Billing Company] [varchar](100) NULL,
	[Billing Co ID] [varchar](50) NULL,
	[Box 32 Name] [varchar](100) NULL,
	[Box 32 Address Line 1] [varchar](50) NULL,
	[Box 32 City] [varchar](50) NULL,
	[Box 32 State] [varchar](50) NULL,
	[Box 32 Zip Code] [varchar](50) NULL,
	[Box 32 Zip+4] [varchar](50) NULL,
	[Box 32 NPI#] [varchar](50) NULL,
	[Box 33 Name] [varchar](100) NULL,
	[Box 33 Address Line 1] [varchar](50) NULL,
	[Box 33 City] [varchar](50) NULL,
	[Box 33 State] [varchar](50) NULL,
	[Box 33 Zip Code] [varchar](50) NULL,
	[Box 33 Zip+4] [varchar](50) NULL,
	[Billing Company Cus Svc Number] [varchar](50) NULL,
	[Box 33 NPI #] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
