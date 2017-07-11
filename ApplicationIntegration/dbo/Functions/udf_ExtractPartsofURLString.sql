CREATE FUNCTION [dbo].[udf_ExtractPartsofURLString]
(
   @URLString  VARCHAR(MAX)        -- the URL string to parse
)
RETURNS @Results TABLE 
       (
           SuppliedURLString       VARCHAR(MAX),  -- http://www.mssqltips.com/tip.asp?tip=1156 
           BaseURL                 VARCHAR(MAX),  -- www.mssqltips.com	
           PageName                VARCHAR(MAX),  -- tip.asp
           ParameterString         VARCHAR(MAX)   -- tip=1156
       )
AS

/**********************************************************
Purpose:   Parses a suppplied URL string and splits it into BaseURL, 
           Page Name and Parameter String components.
           
           If the suppplied URL contains mutliple parameters, then 
           the paraemter string contains them all
           
  ****************************/

BEGIN
   INSERT @Results
       (
           SuppliedURLString,
           BaseURL,
           PageName,
           ParameterString
       )

   SELECT 
       @URLString                                                                                              AS SuppliedURLString,
       
       SUBSTRING(@URLString,(CHARINDEX('//',@URLString,1) + 2), CHARINDEX('/', REVERSE (@URLString), 1) )     AS BaseURL,

       REVERSE(RTRIM(SUBSTRING(REVERSE (@URLString),(CHARINDEX('?', REVERSE (@URLString), 1)+1), 
       ((CHARINDEX('/', REVERSE (@URLString), 1)) - (CHARINDEX('?', REVERSE (@URLString), 1))- 1))))            AS PageName,

       REVERSE(RTRIM(SUBSTRING(REVERSE (@URLString), 1, CHARINDEX('?', REVERSE (@URLString), 1) - 1)))         AS ParameterString

   RETURN
END