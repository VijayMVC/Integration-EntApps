CREATE PROCEDURE stpIsMemberRole
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/

@GroupID varchar(30)

As

DECLARE @name varchar(30)
       ,@lenindex int
       ,@lenall int
       ,@username varchar(10)
       ,@NTUserName varchar(30)
-- return the user logged into the SQL server
SELECT @name = suser_sname()
SELECT @lenall = Len(@name)
SELECT @lenindex = CHARINDEX('\', @name)
-- clean up the variables and return a field named NTUserName
SELECT @NTUserName = SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) 



If Exists(Select dbo.vwUserGroups.* from vwUserGroups Where GroupName = @GroupID And UserName = @NTUserName)
	Select ('True') as IsMemberYN
Else
	Select ('False') as IsmemberYN


return
