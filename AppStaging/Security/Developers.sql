CREATE ROLE [Developers]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'Developers', @membername = N'citrix';


GO
EXECUTE sp_addrolemember @rolename = N'Developers', @membername = N'Developer';

