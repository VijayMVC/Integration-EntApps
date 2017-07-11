EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'SinghR';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'SqlServices';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'FadelW';


GO
EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'MEDAMERICA\RafaelR';


GO
EXECUTE sp_addrolemember @rolename = N'db_ddladmin', @membername = N'PayrollTS';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'PayrollTS';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'MEDAMERICA\SACDC-SVRLAWAPP$';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'PayrollTS';


GO
EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'MEDAMERICA\SACDC-SVRLAWAPP$';

