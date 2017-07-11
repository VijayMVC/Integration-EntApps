CREATE Procedure dbo.stpIsMember
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/

/*Revised 4/10/02 to caputure CntID of Current User
As

DECLARE @name varchar(30)
       ,@lenindex int
       ,@lenall int
       ,@username varchar(10)
-- return the user logged into the SQL server
SELECT @name = suser_sname()
SELECT @lenall = Len(@name)
SELECT @lenindex = CHARINDEX('\', @name)
-- clean up the variables and return a field named NTUserName
---SELECT SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName


	IF IS_MEMBER ('db_datawriter') = 1
Select('Yes') as Role,SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName

ELSE IF IS_MEMBER ('db_datawriter') =0
Select ('No') as Role, SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName

ELSE IF IS_MEMBER ('db_datawriter') IS NULl
Select ('Null') as Role, SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName*/

/*
As

DECLARE @name varchar(30)
       ,@lenindex int
       ,@lenall int
       ,@username varchar(10),
        @CntID int
-- return the user logged into the SQL server
SELECT @name = suser_sname()
SELECT @lenall = Len(@name)
SELECT @lenindex = CHARINDEX('\', @name)
Select @CntID =  dbo.tblCnt.CntID 
		from dbo.tblCnt
		Where dbo.tblCnt.CntLoginName =  SUBSTRING(@name, @lenindex+1, @lenall-@lenindex)

-- clean up the variables and return a field named NTUserName
---SELECT SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName


	IF IS_MEMBER ('db_datawriter') = 1
Select('Yes') as Role,SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName, @CntID as CntID

ELSE IF IS_MEMBER ('db_datawriter') =0
Select ('No') as Role, SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName, @CntID as CntID

ELSE IF IS_MEMBER ('db_datawriter') IS NULl
Select ('Null') as Role, SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName, @CntID as CntID



return
*/
As

DECLARE @name varchar(30)
       ,@lenindex int
       ,@lenall int
       ,@username varchar(10),
        @CntID int,
        @SiteProfileRw int,
        @TermsRW int
	
-- return the user logged into the SQL server
SELECT @name = suser_sname()
SELECT @lenall = Len(@name)
SELECT @lenindex = CHARINDEX('\', @name)
Select @CntID =  dbo.tblCnt.CntID 
		from dbo.tblCnt
		Where dbo.tblCnt.CntLoginName =  SUBSTRING(@name, @lenindex+1, @lenall-@lenindex)

IF IS_MEMBER ('SiteProfileRW') = 1
	Select @SiteProfileRW = 1
Else
	Select @SiteProfileRW = 0

IF IS_MEMBER ('TermsRW') = 1
	Select @TermsRW = 1
Else
	Select @TermsRW = 0
-- clean up the variables and return a field named NTUserName
---SELECT SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName


	IF IS_MEMBER ('db_datawriter') = 1
Select('Yes') as Role,SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName, @CntID as CntID, @SiteProfileRW as SiteProfileRW, @TermsRW as TermsRW

ELSE IF IS_MEMBER ('db_datawriter') =0
Select ('No') as Role, SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName, @CntID as CntID, @SiteProfileRW as SiteProfileRW, @TermsRW as TermsRW

ELSE IF IS_MEMBER ('db_datawriter') IS NULl
Select ('Null') as Role, SUBSTRING(@name, @lenindex+1, @lenall-@lenindex) AS NTUserName, @CntID as CntID, @SiteProfileRW as SiteProfileRW, @TermsRW as TermsRW



return
