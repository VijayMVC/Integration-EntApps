CREATE FUNCTION [dbo].[dbaSplitStringAtLast] (
--ALTER FUNCTION [dbaSplitStringAtLast] (
    @InString nvarchar(1024), 
    @DelimiterString nvarchar(1024), 
    @GetLeftOrRight nvarchar(1024) = 'LEFT')
RETURNS nvarchar(1024)
AS
BEGIN
    
    DECLARE @DelimiterSearch int, @DelimiterLocation int, @OutString nvarchar(1024);
	DECLARE @KeepLooking bit, @NewLoc int;

    SET @DelimiterLocation = CHARINDEX(@DelimiterString, @InString);
    
    IF ( @DelimiterLocation > 0 ) BEGIN
			
		SET @KeepLooking = 1;
		WHILE (@KeepLooking = 1) BEGIN

			SET @NewLoc = CHARINDEX(@DelimiterString, @InString, @DelimiterLocation + len(@DelimiterString) );
			IF ( @NewLoc > 0) BEGIN
				SET @DelimiterLocation = @NewLoc;
				SET @KeepLooking = 1;
			END ELSE BEGIN
				SET @KeepLooking = 0;
			END
		END
			
        IF ( upper(@GetLeftOrRight) = 'RIGHT') BEGIN
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
