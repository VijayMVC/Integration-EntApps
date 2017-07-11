USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpMngCarSrch]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpMngCarSrch](@MngCarID int)
AS SELECT     dbo.tblMngCar.*
FROM         dbo.tblMngCar
WHERE     (MngCarID = @MngCarID)
GO
