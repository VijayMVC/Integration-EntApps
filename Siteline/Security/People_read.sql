CREATE ROLE [People_read]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'People_read', @membername = N'curryw';


GO
EXECUTE sp_addrolemember @rolename = N'People_read', @membername = N'hays';


GO
EXECUTE sp_addrolemember @rolename = N'People_read', @membername = N'jagardg';


GO
EXECUTE sp_addrolemember @rolename = N'People_read', @membername = N'MunknerJ';


GO
EXECUTE sp_addrolemember @rolename = N'People_read', @membername = N'SpearM';


GO
EXECUTE sp_addrolemember @rolename = N'People_read', @membername = N'LeungE';

