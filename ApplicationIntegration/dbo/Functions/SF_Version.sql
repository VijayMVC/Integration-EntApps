CREATE FUNCTION  dbo.SF_Version ()
RETURNS nvarchar(20)
As
Begin
	declare @current_version nvarchar(20)
	set @current_version = 'V3.1.6'
	RETURN @current_version
END
