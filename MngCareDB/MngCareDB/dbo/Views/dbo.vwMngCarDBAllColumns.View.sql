USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwMngCarDBAllColumns]    Script Date: 09/08/2016 10:07:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwMngCarDBAllColumns]

AS
SELECT     TOP (100) PERCENT sys.sysobjects.name AS table_name, sys.syscolumns.name AS column_name, 
                     sys.systypes.name AS datatype, sys.syscolumns.prec as length,
                          (SELECT     value
                            FROM         sys.extended_properties
                            WHERE      (name = N'MS_Description') AND (major_id = sys.syscolumns.id) AND (minor_id = sys.syscolumns.colid)) 
                      AS Description,sys.syscolumns.colid
FROM         sys.sysobjects INNER JOIN
                     sys.syscolumns ON sys.sysobjects.id = sys.syscolumns.id INNER JOIN
                      sys.systypes ON sys.syscolumns.xtype = sys.systypes.xtype
WHERE     (sys.sysobjects.xtype = 'U')
			and (sys.systypes.status =0)
ORDER BY table_name, sys.syscolumns.colid
GO
