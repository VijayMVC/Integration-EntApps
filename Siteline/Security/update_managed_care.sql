CREATE ROLE [update_managed_care]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'update_managed_care', @membername = N'brummerr';


GO
EXECUTE sp_addrolemember @rolename = N'update_managed_care', @membername = N'jagardg';


GO
EXECUTE sp_addrolemember @rolename = N'update_managed_care', @membername = N'SpearM';


GO
EXECUTE sp_addrolemember @rolename = N'update_managed_care', @membername = N'KuoP';


GO
EXECUTE sp_addrolemember @rolename = N'update_managed_care', @membername = N'FlemingL';

