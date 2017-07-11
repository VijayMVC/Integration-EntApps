CREATE ROLE [Customizers]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'Customizers', @membername = N'Customizer';

