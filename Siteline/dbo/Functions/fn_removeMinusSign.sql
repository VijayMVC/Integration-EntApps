CREATE FUNCTION [dbo].[fn_removeMinusSign] 
(
    @value varchar(50)
)
RETURNS varchar(50)
AS

BEGIN

if @value like '-%' begin
	set @value  = '('+replace(@value,'-','')+')'
end
	--set @value  = case when  @value like '-%' then '('+replace(@value,'-','')+')' end
else if @value like '$-%' begin
set @value  = '('+replace(@value,'-','')+')'
	--set @value  = case when  @value like '$-%' then '('+replace(@value,'-','')+')' end
end


/*
set SttPstChgs  = '('+SttPstChgs.replace(SttPstChgs,'$-','$')+')'
where SttPstChgs like '$-%'
*/


return @value
END


