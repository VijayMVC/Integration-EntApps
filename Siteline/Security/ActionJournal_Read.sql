CREATE ROLE [ActionJournal_Read]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'ActionJournal_Read', @membername = N'curryw';


GO
EXECUTE sp_addrolemember @rolename = N'ActionJournal_Read', @membername = N'hays';


GO
EXECUTE sp_addrolemember @rolename = N'ActionJournal_Read', @membername = N'jagardg';


GO
EXECUTE sp_addrolemember @rolename = N'ActionJournal_Read', @membername = N'SpearM';


GO
EXECUTE sp_addrolemember @rolename = N'ActionJournal_Read', @membername = N'LeungE';

