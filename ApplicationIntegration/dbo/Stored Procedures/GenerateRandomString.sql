/***************************************************************************
* Created By: 
* Date: 
* Purpose: Generate a random string of given length
*
* Comments: Right now max length is set to 100. So anything between 1
*  and 100 will work for a length.
*
*   If you specify a @charactersToUse,
*  the bit flags get ignored.
*
*   All spaces are stripped from the
*  @charactersToUse.
*
*   Characters can repeat. Will be
*  handled in a future version.
***************************************************************************/
CREATE procedure dbo.GenerateRandomString (
 @useNumbers bit,
 @useLowerCase bit,
 @useUpperCase bit,
 @charactersToUse as varchar(100),
 @passwordLength as smallint,
 @password varchar(100) OUT
)
As
Begin

if @passwordLength <= 0
 raiserror('Cannot generate a random string of zero length.',16,1)

declare @characters varchar(100)
declare @count int

set @characters = ''

if @useNumbers = 1
begin
 --load up numbers 0 – 9
 set @count = 48
 while @count <=57
 begin
     set @characters = @characters + Cast(CHAR(@count) as char(1))
     set @count = @count + 1
 end
end

if @useLowerCase = 1
begin
 -- load up uppercase letters A – Z
 set @count = 65
 while @count <=90
 begin
     set @characters = @characters + Cast(CHAR(@count) as char(1))
     set @count = @count + 1
 end
end

if @useUpperCase = 1
begin
 -- load up lowercase letters a – z
 set @count = 97
 while @count <=122
 begin
     set @characters = @characters + Cast(CHAR(@count) as char(1))
     set @count = @count + 1
 end
end

set @count = 0
set @password = ''

-- If you specify a character set to use, the bit flags get ignored.
if Len(@charactersToUse) > 0
begin
 while charindex(@charactersToUse,'') > 0
 begin
  set @charactersToUse = replace(@charactersToUse,'','')
 end

 if Len(@charactersToUse) = 0
  raiserror('Cannot use an empty character set.',16,1)

 while @count <= @passwordLength
 begin
    
set @password = @password +
SUBSTRING(@charactersToUse,CAST(ABS(CHECKSUM(NEWID()))*RAND(@count) as
int)%LEN(@charactersToUse)+1,1)
     set @count = @count + 1
 end
end
else
begin
 while @count <= @passwordLength
 begin
    
set @password = @password +
SUBSTRING(@characters,CAST(ABS(CHECKSUM(NEWID()))*RAND(@count) as
int)%LEN(@characters)+1,1)
     set @count = @count + 1
 end
end

end
