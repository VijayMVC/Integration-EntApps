CREATE ROLE [siteline_baseline]
    AUTHORIZATION [dbo];


GO
EXECUTE sp_addrolemember @rolename = N'siteline_baseline', @membername = N'MBSI\maskec';


GO
EXECUTE sp_addrolemember @rolename = N'siteline_baseline', @membername = N'proffittj';

