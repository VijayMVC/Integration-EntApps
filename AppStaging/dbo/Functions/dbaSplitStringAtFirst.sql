CREATE FUNCTION [dbo].[dbaSplitStringAtFirst] (
--ALTER FUNCTION [maSplitStringAtFirst] (
    @InString nvarchar(1024), 
    @DelimiterString nvarchar(1024), 
    @GetLeftOrRight nvarchar(1024) = 'LEFT')
RETURNS nvarchar(1024)
AS
BEGIN
    
    DECLARE @DelimiterLocation int, @OutString nvarchar(1024);
	
    SET @DelimiterLocation = CHARINDEX(@DelimiterString, @InString);
    
    IF ( @DelimiterLocation > 0 ) BEGIN

        IF ( upper(@GetLeftOrRight) = 'RIGHT') 
        BEGIN
            SELECT @OutString = right( @InString, len(@InString) - (@DelimiterLocation + len(@DelimiterString)) + 1 );
        END ELSE BEGIN
	        -- If not Right assume LEFT
            SELECT @OutString = left( @InString, @DelimiterLocation - 1);
        END
    END ELSE BEGIN
        SELECT @OutString = @InString;
    END

    RETURN(@OutString)
END
