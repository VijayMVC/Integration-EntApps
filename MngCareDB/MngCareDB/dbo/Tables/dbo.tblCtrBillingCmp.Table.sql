USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblCtrBillingCmp]    Script Date: 09/08/2016 10:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCtrBillingCmp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CtrBillingCmpID] [varchar](3) NULL,
	[CtrBillingCmp_CtrID] [int] NOT NULL,
	[CtrBillingCmpName] [varchar](255) NULL,
	[CtrBillingCmpEffectiveDate] [datetime] NULL,
	[CtrBillingCmpExpirationDate] [datetime] NULL,
 CONSTRAINT [PK_CtrBillingCmp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
