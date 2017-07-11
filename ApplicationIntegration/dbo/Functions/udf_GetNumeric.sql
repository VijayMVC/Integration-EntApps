CREATE FUNCTION [dbo].[udf_GetNumeric]
(@strAlphaNumeric VARCHAR(256))
RETURNS VARCHAR(256)
AS
BEGIN
SET @strAlphaNumeric = REPLACE(@strAlphaNumeric, '.', '')
DECLARE @intAlpha INT
SET @intAlpha = PATINDEX('%[^A-Za-z ]%', @strAlphaNumeric)
BEGIN
WHILE @intAlpha > 0
BEGIN
SET @strAlphaNumeric = STUFF(@strAlphaNumeric, @intAlpha, 1, ' ' )
SET @intAlpha = PATINDEX('%[^A-Za-z ]%', @strAlphaNumeric )
END
END
RETURN ISNULL(@strAlphaNumeric,0)
END
