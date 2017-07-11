USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwUserGroups]    Script Date: 09/08/2016 10:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwUserGroups]
AS
SELECT     sysusers_1.name AS UserName, dbo.sysusers.name AS GroupName
FROM         dbo.sysusers INNER JOIN
                      dbo.sysmembers ON dbo.sysusers.uid = dbo.sysmembers.groupuid INNER JOIN
                      dbo.sysusers sysusers_1 ON dbo.sysmembers.memberuid = sysusers_1.uid
GO
