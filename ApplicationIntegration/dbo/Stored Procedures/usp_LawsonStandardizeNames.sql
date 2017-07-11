
CREATE                     PROCEDURE [dbo].[usp_LawsonStandardizeNames] 
AS

/* 	Author: 	Reetika Singh
	Date:		4/4/2011
	Purpose:	Standardizes Name for New Hires for Positive Pay
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

	BEGIN
	
	--Clean NAME

		DECLARE @LastName varchar(255)
		DECLARE @CLLastName varchar(255)
		DECLARE @FirstName varchar(255)
		DECLARE @MI varchar(255)
		DECLARE @MIN varchar(255)
		DECLARE @PName varchar(255)
		DECLARE @Emp int
				
			/* Loop Through Last Name */
			DECLARE LastName_Cursor CURSOR FOR 
				SELECT DISTINCT ProviderMasterID, LastName, FirstName, 
							MiddleInit, MiddleNameOrInitial, PreferredName
				FROM LawsonNewHireEntry
				--WHERE LastName LIKE '%[^a-zA-Z ]%'
					FOR UPDATE 

			OPEN LastName_Cursor

			FETCH NEXT FROM LastName_Cursor 
				INTO @Emp, @LastName, @FirstName, @MI, @MIN, @PName

			WHILE @@FETCH_STATUS = 0
				BEGIN
					
					SET @CLLastName = UPPER((SELECT dbo.udf_GetNumeric(@LastName)))
					SET @FirstName = UPPER((SELECT dbo.udf_GetNumeric(@FirstName)))
					SET @MI = UPPER((SELECT dbo.udf_GetNumeric(@MI)))
					SET @MIN = UPPER((SELECT dbo.udf_GetNumeric(@MIN)))
					SET @PName = UPPER((SELECT dbo.udf_GetNumeric(@PName)))
					
					UPDATE LawsonNewHireEntry
					SET LastName = LTRIM(RTRIM(@CLLastName)),
						FirstName = LTRIM(RTRIM(@FirstName)),
						MiddleInit = LTRIM(RTRIM(@MI)),
						MiddleNameOrInitial = LTRIM(RTRIM(@MIN)),
						PreferredName = LTRIM(RTRIM(@PName))
					WHERE ProviderMasterID = @Emp
					AND LastName = @LastName
					AND FirstName = @FirstName

					FETCH NEXT FROM LastName_Cursor 
						INTO @Emp, @LastName, @FirstName, @MI, @MIN, @PName
				END

   			CLOSE LastName_Cursor
   			DEALLOCATE LastName_Cursor
		   	
		   	
		   	
   			UPDATE LawsonNewHireEntry
   			SET LastName = UPPER(LastName),
   			FirstName = UPPER(FirstName),
   			MiddleInit = UPPER(MiddleInit),
   			MiddleNameOrInitial = UPPER(MiddleNameOrInitial),
   			PreferredName = UPPER(PreferredName)













		

	END

