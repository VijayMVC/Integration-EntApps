USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpChangeOwner]    Script Date: 09/08/2016 10:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[stpChangeOwner]
@objname varchar (50),
@newowner  varchar (50)
AS
 exec sp_changeobjectowner @objname , @newowner 
return
GO
