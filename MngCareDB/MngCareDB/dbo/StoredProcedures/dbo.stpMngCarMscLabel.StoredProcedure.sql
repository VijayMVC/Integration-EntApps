USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpMngCarMscLabel]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpMngCarMscLabel]
(@MngCarMscID smallint, @MngCarMscLabel Varchar(20) OUTPUT)
AS 
SELECT    @MngCarMscLabel =  MngCarMscLabel
FROM         dbo.tlkpMngCarMsc
WHERE     (MngCarMscID = @MngCarMscID)
GO
