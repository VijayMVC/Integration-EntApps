CREATE ROLE [contracts_read]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'contracts_read', @membername = N'curryw';


GO
EXECUTE sp_addrolemember @rolename = N'contracts_read', @membername = N'hays';


GO
EXECUTE sp_addrolemember @rolename = N'contracts_read', @membername = N'jagardg';


GO
EXECUTE sp_addrolemember @rolename = N'contracts_read', @membername = N'SpearM';


GO
EXECUTE sp_addrolemember @rolename = N'contracts_read', @membername = N'LeungE';

