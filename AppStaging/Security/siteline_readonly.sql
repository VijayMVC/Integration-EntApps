CREATE ROLE [siteline_readonly]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'siteline_readonly', @membername = N'MBSI\maskec';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_readonly', @membername = N'proffittj';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_readonly', @membername = N'update_people_module';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_readonly', @membername = N'update_contracts_module';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_readonly', @membername = N'update_sales_module';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_readonly', @membername = N'update_action_module';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_readonly', @membername = N'update_company_module';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_readonly', @membername = N'update_managed_care';

