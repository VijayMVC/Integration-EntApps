
CREATE PROCEDURE [dbo].[usp_SFDC_StandardizeProviderPhones] 
AS

/* 	Author: 	Reetika Singh
	Date:		3/21/2012
	Purpose:	Standardize Provider Phone
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	DECLARE @ProviderMasterID	INT,
		@AddressListOrder	INT,
		@PagerNbr		VARCHAR(100),
		@CellPhoneNbr		VARCHAR(100),
		@PhoneNbr		VARCHAR(100),
		@PhoneNbr2		VARCHAR(100),
		@FaxNbr			VARCHAR(100),
		@PhoneIn1 		VARCHAR(100),
		@PhoneIn2		VARCHAR(100),
		@PhoneOut1 		VARCHAR(100),
		@PhoneOut2		VARCHAR(100),
		@AddressType	VARCHAR(50)
		
	/* Standardize Phones */
		/* Cell and Pager */
	DECLARE StandardizePhones_Cursor CURSOR FOR 
		SELECT  Prov.ProviderMasterID,
			Prov.PagerNbr,
			Prov.CellPhoneNbr			
			FROM ProviderMaster Prov
			WHERE (Prov.PagerNbr 	!= ' ' 
				OR  Prov.CellPhoneNbr	!= ' ')
			FOR UPDATE 

	OPEN StandardizePhones_Cursor

	FETCH NEXT FROM StandardizePhones_Cursor 
		INTO 	@ProviderMasterID,
			@PagerNbr,
			@CellPhoneNbr

	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @PhoneIn1 = @PagerNbr
			SET @PhoneIn2 = ' '

			EXEC usp_PhoneAndFaxConversion @PhoneIn1, @PhoneIn2, 
				@PhoneOut1 OUTPUT, @PhoneOut2 OUTPUT

			SET @PhoneOut1 = RTRIM(LTRIM(@PhoneOut1)) + ' ' + 
				@PhoneOut2

			UPDATE ProviderMaster
				SET PagerNbr = @PhoneOut1
				WHERE ProviderMasterID = @ProviderMasterID
				  AND PagerNbr != @PhoneOut1

			UPDATE ProviderMasterBase
				SET PagerNbr = @PhoneOut1
				WHERE ProviderMasterID = @ProviderMasterID
				  AND PagerNbr != @PhoneOut1

			SET @PhoneIn1 = @CellPhoneNbr
			SET @PhoneIn2 = ' '

			EXEC usp_PhoneAndFaxConversion @PhoneIn1, @PhoneIn2, 
				@PhoneOut1 OUTPUT, @PhoneOut2 OUTPUT

			SET @PhoneOut1 = RTRIM(LTRIM(@PhoneOut1)) + ' ' + 
				@PhoneOut2

			UPDATE ProviderMaster
				SET CellPhoneNbr = @PhoneOut1
				WHERE ProviderMasterID = @ProviderMasterID
				  AND CellPhoneNbr != @PhoneOut1

			UPDATE ProviderMasterBase
				SET CellPhoneNbr = @PhoneOut1
				WHERE ProviderMasterID = @ProviderMasterID
				  AND CellPhoneNbr != @PhoneOut1


			FETCH NEXT FROM StandardizePhones_Cursor 
				INTO 	@ProviderMasterID,
					@PagerNbr,
					@CellPhoneNbr
		END

   	CLOSE StandardizePhones_Cursor
   	DEALLOCATE StandardizePhones_Cursor

		/* Phone and Fax */
	DECLARE StandardizePhones2_Cursor CURSOR FOR 
		SELECT  Prov.ProviderMasterID,
			SA.[Type],
			SA.Phone,
			SA.Phone2,
			SA.Fax
			FROM ProviderMaster Prov
			INNER JOIN AddressStaging SA
				 ON Prov.ProviderMasterID = SA.ProviderMasterID
			WHERE  EXISTS
					(SELECT 1
						FROM ProviderMasterUpdateArchive PMUA
						WHERE PMUA.ProviderMasterID = Prov.ProviderMasterID
						  AND PMUA.SentFlag IS NULL)		  
			  AND 	   (SA.Phone != ' ' 
				OR  SA.Fax	!= ' '
				OR SA.Phone2 != ' ')
			FOR UPDATE 

	OPEN StandardizePhones2_Cursor

	FETCH NEXT FROM StandardizePhones2_Cursor 
		INTO 	@ProviderMasterID,
			@AddressType,
			@PhoneNbr,
			@PhoneNbr2,
			@FaxNbr

	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @PhoneIn1 = @PhoneNbr
			SET @PhoneIn2 = ' '

			EXEC usp_PhoneAndFaxConversion @PhoneIn1, @PhoneIn2, 
				@PhoneOut1 OUTPUT, @PhoneOut2 OUTPUT

			SET @PhoneOut1 = RTRIM(LTRIM(@PhoneOut1)) + ' ' + 
				@PhoneOut2

			UPDATE AddressStaging
				SET Phone = @PhoneOut1
				WHERE ProviderMasterID	= @ProviderMasterID
				  AND AddressListOrder	= @AddressListOrder
				  AND Phone 		!= @PhoneOut1
				  AND [Type]		= @AddressType
				  
			SET @PhoneIn1 = @PhoneNbr2
			SET @PhoneIn2 = ' '

			EXEC usp_PhoneAndFaxConversion @PhoneIn1, @PhoneIn2, 
				@PhoneOut1 OUTPUT, @PhoneOut2 OUTPUT

			SET @PhoneOut1 = RTRIM(LTRIM(@PhoneOut1)) + ' ' + 
				@PhoneOut2

			UPDATE AddressStaging
				SET Phone2 = @PhoneOut1
				WHERE ProviderMasterID	= @ProviderMasterID
				  AND AddressListOrder	= @AddressListOrder
				  AND Phone2 		!= @PhoneOut1
				  AND [Type]		= @AddressType
				  
			SET @PhoneIn1 = @FaxNbr
			SET @PhoneIn2 = ' '

			EXEC usp_PhoneAndFaxConversion @PhoneIn1, @PhoneIn2, 
				@PhoneOut1 OUTPUT, @PhoneOut2 OUTPUT

			SET @PhoneOut1 = RTRIM(LTRIM(@PhoneOut1)) + ' ' + 
				@PhoneOut2

			UPDATE AddressStaging
				SET Fax = @PhoneOut1
				WHERE ProviderMasterID 	= @ProviderMasterID
				  AND AddressListOrder 	= @AddressListOrder
				  AND Fax		!= @PhoneOut1
				  AND [Type]		= @AddressType

			FETCH NEXT FROM StandardizePhones2_Cursor 
				INTO 	@ProviderMasterID,
						@AddressType,
						@PhoneNbr,
						@PhoneNbr2,
						@FaxNbr

		END

   	CLOSE StandardizePhones2_Cursor
   	DEALLOCATE StandardizePhones2_Cursor
END

