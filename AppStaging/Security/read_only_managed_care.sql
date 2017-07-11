CREATE ROLE [read_only_managed_care]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'read_only_managed_care', @membername = N'MBSI\maskec';

