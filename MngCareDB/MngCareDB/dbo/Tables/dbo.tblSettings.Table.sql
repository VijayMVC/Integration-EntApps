USE [MngCarDB]
GO
/****** Object:  Table [dbo].[tblSettings]    Script Date: 09/08/2016 10:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSettings](
	[SetID] [tinyint] NOT NULL,
	[SetLogOffYN] [bit] NOT NULL,
	[SetLockDate] [datetime] NULL,
 CONSTRAINT [PK_tblSettings] PRIMARY KEY NONCLUSTERED 
(
	[SetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSettings]  WITH CHECK ADD  CONSTRAINT [CK_tblSettings] CHECK  (([SetLockDate] >= '12/1/2007'))
GO
ALTER TABLE [dbo].[tblSettings] CHECK CONSTRAINT [CK_tblSettings]
GO
ALTER TABLE [dbo].[tblSettings] ADD  CONSTRAINT [DF_tblSettings_SetLogOffYN]  DEFAULT (0) FOR [SetLogOffYN]
GO
