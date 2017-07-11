CREATE PROCEDURE [dbo].[usp_SFDC_StandardizeProviderAddresses] 
AS

/* 	Author: 	Reetika Singh
	Date:		3/21/2012
	Purpose:	Standardize Provider Address
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	DECLARE 
		@Address1In  		VARCHAR(100), 
		@Address2In 		VARCHAR(100), 
		@AddressOut 		VARCHAR(100),
		@AddressCompareOut 	VARCHAR(100),
		@Type				VARCHAR(50),
		@ProviderMasterID	INT
		
--SELECT * FROM SFDCAddressStaging

	DECLARE Address_Cursor CURSOR FOR 
		SELECT 	
			ProviderMasterID, 
			[Type],  
			AddressLine1, 
			AddressNew, 
			AddressCompare
			FROM AddressStaging
			FOR UPDATE

	OPEN Address_Cursor

	FETCH NEXT FROM Address_Cursor
		INTO 	@ProviderMasterID, 
			@Type, 
			@Address1In, 
			@AddressOut, 
			@AddressCompareOut

	WHILE @@FETCH_STATUS = 0
		BEGIN
			EXEC usp_SFDC_AddressConversion @Address1In, @Address2In,
					@AddressOut OUTPUT, @AddressCompareOut OUTPUT		
		
		UPDATE AddressStaging SET
			AddressNew = @AddressOut, 
			AddressCompare = @AddressCompareOut
			WHERE ProviderMasterID  = @ProviderMasterID 
			  AND AddressLine1  = @Address1In
			  AND [Type] = @Type

	   -- Get the next address.
		FETCH NEXT FROM Address_Cursor
			INTO 	@ProviderMasterID, 
				@Type, 
				@Address1In, 
				@AddressOut, 
				@AddressCompareOut
	END

	CLOSE Address_Cursor
	DEALLOCATE Address_Cursor
END
