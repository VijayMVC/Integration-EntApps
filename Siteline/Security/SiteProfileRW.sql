CREATE ROLE [SiteProfileRW]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'SiteProfileRW', @membername = N'SearF';

