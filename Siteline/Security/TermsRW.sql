CREATE ROLE [TermsRW]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'TermsRW', @membername = N'huertak';

