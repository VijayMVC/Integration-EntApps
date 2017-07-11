

CREATE PROCEDURE [dbo].[usp_SFDC_GenerateCorporateEmailForNewHires] 
AS

/* 	Author: 	
	Date:		
	Purpose:	This SP generates corporate email based on the staff group.
				The record has already been added to PMB. First and Last Names are used.
				If there is duplicate then a number is added to create a unique Email
	Revision:	8/29/2012 - Reetika - Modified the procedure to use the list from Active 
								Directory refreshed nightly to make sure no duplicates exist.
*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN 

		/* Clean AdEmail table*/
	DELETE FROM AdEmail
	WHERE SMTPEmail = ''
	
	/*Load exchange info before generating the email addresses*/
	EXECUTE usp_LoadExchangeInfo
	

		/* Make Sure Obtain A Unique Corporate Email Address */
	--Case 1 - New Hires
	UPDATE ApplicationIntegration.dbo.ProviderMasterBase
		SET CEPEmail =  RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(PMB.FirstName, '.', ''), '''', ''), '-', ''),' ',''), ',', ''))) + 
						RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(PMB.LastName, '.', ''), '''', ''), '-', ''),' ',''), ',', '')))  + 
				 		'@cep.com'
		FROM ApplicationIntegration.dbo.ProviderMasterBase PMB
		WHERE PMB.Status = 2
		AND (CEPEmail NOT LIKE '%@cep%' OR CEPEmail IS NULL OR CEPEmail = '')
		AND ProviderMasterID IN (SELECT PM.ProviderMasterID 
									FROM ProviderMaster PM
									WHERE PM.ExchangeDirectoryName = ''
									OR PM.ExchangeDirectoryName IS NULL)
									
	--Case 2 - ReHires
	
	/*For Rehires with email like @aep.com we need to fix them so that they get CEP email address*/
	
	UPDATE ProviderMasterBase
	SET CEPEmail = Left(CEPEmail, CHARINDEX('@', CEPEmail)-1)+ '@cep.com'
	FROM ProviderMaster PM
	WHERE PM.ProviderMasterID = ProviderMasterBase.ProviderMasterID
	AND ProviderMasterBase.Status = 0
	AND (PM.ExchangeDirectoryName = ''
		OR PM.ExchangeDirectoryName IS NULL)
	AND (ProviderMasterBase.CEPEmail NOT LIKE '%@cep.com%')
	
	
	/*if a rehire did not have an email then generate on for them */
	UPDATE ApplicationIntegration.dbo.ProviderMasterBase
		SET CEPEmail =  RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(PMB.FirstName, '.', ''), '''', ''), '-', ''),' ',''), ',', ''))) + 
						RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(PMB.LastName, '.', ''), '''', ''), '-', ''),' ',''), ',', '')))  + 
				 		'@cep.com'
		FROM ApplicationIntegration.dbo.ProviderMasterBase PMB
		WHERE PMB.Status = 0
		AND (CEPEmail NOT LIKE '%@cep%' OR CEPEmail IS NULL OR CEPEmail = ''
		OR CHARINDEX(RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LastName, 'Sr', ''), 'Jr', ''), '.', ''), '''', ''), '-', ''),' ',''), ',', ''))), CEPEmail, 1) = 0)
		AND ProviderMasterID IN (SELECT PM.ProviderMasterID 
									FROM ProviderMaster PM
									WHERE PM.ExchangeDirectoryName = ''
									OR PM.ExchangeDirectoryName IS NULL)
		
	--Pull all userids from PMB including the newly generated one	
	SELECT ProviderMasterID,
			StaffGroup1,
			StaffGroup2,
			FirstName,
			LastName,
			Left(CEPEmail, CHARINDEX('@', CEPEmail)-1) AS CEPEmail,
			Status
		INTO #TempEmail
	FROM ProviderMasterBase
	WHERE CHARINDEX('@', CEPEmail) > 1
	
	--Create complete list of provider emails from AD and PMB
	SELECT DISTINCT T.*  
	INTO #TempAllEmails
	FROM (
	SELECT DISTINCT LTRIM(RTRIM(Left(SMTPEmail, CHARINDEX('@', SMTPEmail)-1))) AS UserName
	FROM AdEmail
	UNION 
	SELECT DISTINCT LTRIM(RTRIM(Left(CEPEmail, CHARINDEX('@', CEPEmail)-1))) AS UserName
	FROM ProviderMasterBase
	WHERE CHARINDEX('@', CEPEmail) > 1) T
	
 --DROP TABLE #TempAllEmails
 --DROP TABLE #TempEmail

	DECLARE @Count			INT,
		@PMID				INT,
		@StaffGroup		VARCHAR(50),
		@LastName		VARCHAR(50),
		@FirstName		VARCHAR(50),
		@CorporateEmail		VARCHAR(100),
		@EmailSuffix		INT
		
	
	DECLARE CorporateEmailCursor CURSOR FOR
			--the below query pulls all newly created userids that already exist so 
			--that the below cursor can make then unique
			SELECT  ProviderMasterID,
				CASE WHEN StaffGroup1 = 'CEP'
					THEN 'CEP'
					ELSE 'GALEN' END AS StaffGroup,
				FirstName,
				LastName,
				CEPEmail
			FROM #TempEmail
			WHERE Status IN (2,0)
			AND (CEPEmail IN (SELECT Left(SMTPEmail, CHARINDEX('@', SMTPEmail)-1)
								FROM AdEmail)
				or CEPEmail IN (SELECT Left(CEPEmail, CHARINDEX('@', CEPEmail)-1)
								FROM ProviderMasterBase PMB
								WHERE CHARINDEX('@', CEPEmail) > 1
								AND PMB.ProviderMasterID <> #TempEmail.ProviderMasterID))
			AND ProviderMasterID IN (SELECT PM.ProviderMasterID 
									FROM ProviderMaster PM
									WHERE PM.ExchangeDirectoryName = ''
									OR PM.ExchangeDirectoryName IS NULL)
			FOR UPDATE

	OPEN CorporateEmailCursor

	FETCH NEXT FROM CorporateEmailCursor
		INTO @PMID,
			@StaffGroup,
			@FirstName,
			@LastName,
			@CorporateEmail	

	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @Count = 1
			SET @EmailSuffix = 2
			WHILE @Count <> 0
				BEGIN
					IF 	NOT EXISTS
							(SELECT 1 FROM #TempAllEmails
								WHERE UserName = LTRIM(RTRIM(@CorporateEmail)))
								 
						
					BREAK

					SELECT @CorporateEmail = @CorporateEmail + RTRIM(LTRIM(CAST(@EmailSuffix AS CHAR(1)))) 
										 
												
					SET @EmailSuffix = @EmailSuffix + 1
												
					IF 	NOT EXISTS
							(SELECT 1 FROM #TempAllEmails
								 WHERE UserName = LTRIM(RTRIM(@CorporateEmail)))
						
					BREAK
				END 
				

			UPDATE ProviderMasterBase 			SET CEPEmail = @CorporateEmail + '@cep.com'
				WHERE ProviderMasterID  = @PMID
				  --AND CEPEmail != @CorporateEmail

			FETCH NEXT FROM CorporateEmailCursor
				INTO 	@PMID,
					@StaffGroup,
					@FirstName,
					@LastName,
					@CorporateEmail	
		END

	CLOSE CorporateEmailCursor
	DEALLOCATE CorporateEmailCursor


	DROP TABLE #TempEmail
	

	
	
	--Once emails are all set update ProviderMaster

	UPDATE ProviderMaster
	SET CEPEmailAddress = PMB.CEPEmail
	FROM ProviderMasterBase PMB
	WHERE ProviderMaster.ProviderMasterID = PMB.ProviderMasterID
	AND PMB.Status IN (0, 2)
	

	
	
	
	
END