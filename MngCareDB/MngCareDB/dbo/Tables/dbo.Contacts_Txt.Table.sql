USE [MngCarDB]
GO
/****** Object:  Table [dbo].[Contacts_Txt]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts_Txt](
	[FirstName] [nvarchar](255) NULL,
	[MiddleName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Suffix] [nvarchar](255) NULL,
	[Company] [nvarchar](255) NULL,
	[JobTitle] [nvarchar](255) NULL,
	[BusinessStreet] [nvarchar](255) NULL,
	[BusinessCity] [nvarchar](255) NULL,
	[BusinessState] [nvarchar](255) NULL,
	[BusinessPostalCode] [nvarchar](255) NULL,
	[BusinessCountryRegion] [nvarchar](255) NULL,
	[BusinessFax] [nvarchar](255) NULL,
	[BusinessPhone] [nvarchar](255) NULL,
	[BusinessPhone2] [nvarchar](255) NULL,
	[CompanyMainPhone] [nvarchar](255) NULL,
	[MobilePhone] [nvarchar](255) NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[WebPage] [nvarchar](255) NULL
) ON [PRIMARY]
GO
