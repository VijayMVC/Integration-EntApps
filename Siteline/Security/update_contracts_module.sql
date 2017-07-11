CREATE ROLE [update_contracts_module]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'update_contracts_module', @membername = N'huertak';


GO
EXECUTE sp_addrolemember @rolename = N'update_contracts_module', @membername = N'jagardg';


GO
EXECUTE sp_addrolemember @rolename = N'update_contracts_module', @membername = N'SpearM';


GO
EXECUTE sp_addrolemember @rolename = N'update_contracts_module', @membername = N'LeungE';

