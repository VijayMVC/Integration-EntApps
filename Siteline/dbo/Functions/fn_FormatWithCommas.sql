
CREATE FUNCTION [dbo].[fn_FormatWithCommas] 
(
    -- Add the parameters for the function here
    @value varchar(50)
)
RETURNS varchar(50)
AS

BEGIN
    -- Declare the return variable here
    DECLARE @WholeNumber varchar(50) , @Decimal varchar(10) , @CharIndex int 
set @WholeNumber = null
set @Decimal = ''
set @charIndex = charindex('.', @value)

    IF (@CharIndex > 0)
        SELECT @WholeNumber = SUBSTRING(@value, 1, @CharIndex-1), @Decimal = SUBSTRING(@value, @CharIndex, LEN(@value))
    ELSE
        SET @WholeNumber = @value

    IF(LEN(@WholeNumber) > 3)
        SET @WholeNumber = dbo.fn_FormatWithCommas(SUBSTRING(@WholeNumber, 1, LEN(@WholeNumber)-3)) + ',' + RIGHT(@WholeNumber, 3)



    -- Return the result of the function
    --RETURN @WholeNumber + @Decimal
	RETURN REPLACE ( @WholeNumber + @Decimal , '-,' , '-' )

END

