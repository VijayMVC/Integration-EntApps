CREATE ROLE [update_sales_module]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'update_sales_module', @membername = N'jagardg';


GO
EXECUTE sp_addrolemember @rolename = N'update_sales_module', @membername = N'SpearM';

