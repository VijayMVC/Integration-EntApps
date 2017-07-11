CREATE ROLE [siteline_baseline]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'siteline_baseline', @membername = N'jagardg';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_baseline', @membername = N'SpearM';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_baseline', @membername = N'MEDAMERICA\VanAstroA';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_baseline', @membername = N'MEDAMERICA\WestB';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_baseline', @membername = N'MEDAMERICA\Siteline_Users';

