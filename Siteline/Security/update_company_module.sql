CREATE ROLE [update_company_module]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'update_company_module', @membername = N'baldwinj';


GO
EXECUTE sp_addrolemember @rolename = N'update_company_module', @membername = N'jagardg';


GO
EXECUTE sp_addrolemember @rolename = N'update_company_module', @membername = N'SpearM';


GO
EXECUTE sp_addrolemember @rolename = N'update_company_module', @membername = N'LeungE';


GO
EXECUTE sp_addrolemember @rolename = N'update_company_module', @membername = N'KuoP';

