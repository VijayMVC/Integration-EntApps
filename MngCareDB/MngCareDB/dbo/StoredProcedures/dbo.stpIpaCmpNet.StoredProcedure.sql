USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpIpaCmpNet]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpIpaCmpNet](@CmpID int)
AS SELECT     dbo.tblIPACmp.*
FROM         dbo.tblIPACmp
WHERE     (IPACmpIPA_CmpID = @CmpID) AND (IPACmpType = 2)
GO
