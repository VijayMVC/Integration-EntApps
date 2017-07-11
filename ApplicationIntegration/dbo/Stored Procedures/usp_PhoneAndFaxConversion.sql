CREATE PROCEDURE [dbo].[usp_PhoneAndFaxConversion] 
	@PhoneIn1  	VARCHAR(100), 
	@PhoneIn2  	VARCHAR(100),
	@PhoneOut1 	VARCHAR(100) OUTPUT,
	@PhoneOut2	VARCHAR(100) OUTPUT
AS

/* 	Author: 	
	Date:		
	Purpose:	Stored Procedure is called to take a phone or fax number and convert to
				standard format
			
	Revision:

*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 
BEGIN
	DECLARE @PhoneTemp1 	VARCHAR(100),
		@PhoneTemp2 	VARCHAR(100),
		@PhoneTemp1A 	VARCHAR(100),
		@PhoneTemp2A 	VARCHAR(100),
		@VoiceMail	CHAR(1) ,
		@CallHomeFirst 	CHAR(1) 
	
	SELECT @PhoneTemp1 = @PhoneIn1
	SELECT @PhoneTemp2 = @PhoneIn2
	SELECT @VoiceMail = 'Y'
		WHERE @PhoneTemp1 LIKE '%Voice%'
		  AND @PhoneTemp1 LIKE '%Mail%'

	SELECT @VoiceMail = 'Y'
		WHERE @PhoneTemp2 LIKE '%Voice%'
		  AND @PhoneTemp2 LIKE '%Mail%'

	SELECT @CallHomeFirst = 'Y'
		WHERE @PhoneTemp1 LIKE '%Call Home First%'

	SELECT @CallHomeFirst = 'Y'
		WHERE @PhoneTemp2 LIKE '%Call Home First%'

	IF @VoiceMail = 'Y'
		BEGIN
			SELECT @PhoneIn1 = REPLACE(REPLACE(@PhoneIn1, 'Voice',''),'Mail', '')
			SELECT @PhoneTemp1 = REPLACE(REPLACE(@PhoneTemp1, 'Voice',''),'Mail', '')
			SELECT @PhoneTemp2 = REPLACE(REPLACE(@PhoneTemp2, 'Voice',''),'Mail', '')
		END

	SELECT @PhoneTemp1 = REPLACE(REPLACE(REPLACE(REPLACE(@PhoneTemp1,'(',''),')',''),' ',''),'.','')
	SELECT @PhoneTemp1 = REPLACE(REPLACE(REPLACE(REPLACE(@PhoneTemp1,'/',''),'\)',''), '-',''), '+1','')
	SELECT @PhoneTemp1 = REPLACE(REPLACE(@PhoneTemp1,'[',''),'])','')

	IF ISNUMERIC(SUBSTRING (@PhoneTemp1,1,10)) = 1
		AND LEN(@PhoneTemp1) < 11
		BEGIN
			SELECT @PhoneTemp1A =
				'(' 	+ SUBSTRING(@PhoneTemp1,1,3) + ') ' + SUBSTRING(@PhoneTemp1,4,3) +
				'-'	+ SUBSTRING(@PhoneTemp1,7,4)
				WHERE @PhoneTemp1 != ' '

			SELECT @PhoneTemp1A = ' ' 
				WHERE @PhoneTemp1 = ' '

			SELECT @PhoneOut1 = @PhoneTemp1A

			SET @PhoneOut2 = NULL
			SELECT @PhoneTemp2 = ' '
				WHERE @PhoneTemp2 IS NULL

			IF @PhoneTemp2 != ' '
				BEGIN
					IF (SELECT LEN(@PhoneTemp1)) > 10 
						BEGIN
							SELECT @PhoneTemp2 = 
								RTRIM(LTRIM(SUBSTRING(@PhoneTemp1,11,50))) +
								RTRIM(LTRIM(@PhoneTemp2))
						END
					ELSE 
						BEGIN
							SELECT @PhoneTemp2 = RTRIM(LTRIM(@PhoneTemp2))
						END
				END
			ELSE
				BEGIN
					SELECT @PhoneTemp2 = RTRIM(LTRIM(SUBSTRING(@PhoneTemp1,11,50)))
				END

			IF @VoiceMail = 'Y'
				BEGIN
					SELECT @PhoneTemp2 = 'Voice Mail ' + RTRIM(LTRIM(@PhoneTemp2))
				END

			IF (SELECT LEN(@PhoneTemp2)) = 1
				BEGIN
					SELECT @PhoneTemp2 = ' '
				END

			SELECT 	@PhoneOut2 = @PhoneTemp2
		END
	ELSE
		BEGIN
			IF @PhoneIn2 = ' '
				BEGIN
					SELECT @PhoneOut1 = RTRIM(LTRIM(SUBSTRING(@PhoneIn1,1,14)))
				END
			ELSE
				BEGIN
					SELECT @PhoneOut1 = @PhoneIn1
				END
			IF @PhoneIn2 = ' '
				BEGIN
					SELECT @PhoneOut2 = RTRIM(LTRIM(SUBSTRING(@PhoneIn1,15,20)))
				END
			ELSE
				BEGIN
					SELECT @PhoneOut2 = @PhoneIn2
				END
		END
END

SET QUOTED_IDENTIFIER ON 
SET ANSI_NULLS ON
