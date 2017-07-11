

CREATE PROCEDURE [dbo].[usp_LoadCEPSecurePasswordList] AS

	TRUNCATE TABLE CEPSecurePasswordList
	
	INSERT INTO CEPSecurePasswordList
	SELECT Name, mail, Initials 
	FROM OPENQUERY
		( ADSI,'SELECT name, mail, Initials
				FROM ''LDAP://maw-svrdc5/DC=maw,DC=medamerica,DC=local'' 
				WHERE memberOf=''CN=zzSecureCEPPasswords,OU=CEP - Distribution Lists,OU=CEPA,OU=MEDAMERICA,DC=maw,DC=medamerica,DC=local''  
				AND objectCategory=''Person'' AND objectClass = ''User''')



