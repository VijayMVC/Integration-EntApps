CREATE PROCEDURE stpChangeOwner

@objname varchar (50),
@newowner  varchar (50)

AS
 exec sp_changeobjectowner @objname , @newowner 

return

