
-- =============================================
-- Author:		Owen Kennedy
-- Create date: 
-- Description:	Find text in stp
--			Can also use new stp:    stpFindTextInDB 'SearchText'
-- =============================================

CREATE Procedure [dbo].[mtrcFindTextInStoredProcedure] (@Search varchar(255))
  --   [mtrcFindTextInStoredProcedure]  'tblDocStar'
as


--DECLARE @Search varchar(255)
--SET @Search='tblDocStar'

SELECT DISTINCT     o.name AS Object_Name,o.type_desc    
FROM sys.sql_modules        m         INNER JOIN sys.objects  o ON m.object_id=o.object_id
WHERE m.definition Like '%'+@Search+'%'
ORDER BY 2,1
