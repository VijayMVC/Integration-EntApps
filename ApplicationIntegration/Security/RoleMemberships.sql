EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'MEDAMERICA\SACDC-SVRLAWAPP$';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'MEDAMERICA\SinghR';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'APIConnect';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'MEDAMERICA\RafaelR';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'APIConnect';

