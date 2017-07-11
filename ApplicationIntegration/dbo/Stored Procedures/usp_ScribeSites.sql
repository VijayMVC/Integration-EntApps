


CREATE  PROCEDURE [dbo].[usp_ScribeSites]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @thisID INT,
			@thisSite VARCHAR(5),
			@lastSite VARCHAR(5),
			@thisField VARCHAR(5),
			@thisValue VARCHAR(50),
			@startTime DATETIME

	TRUNCATE TABLE EmployeeSiteStaging
	
	TRUNCATE TABLE EmployeeSites


	INSERT INTO EmployeeSiteStaging (ProviderMasterID, LastName, FirstName, Title, CellPhoneNbr, PhoneNbr1, Status, Site1, Site2, Site3, Site4)
	SELECT m.ProviderMasterID, m.LastName, m.FirstName, m.Title, m.CellPhoneNbr, m.PhoneNbr1, m.Status, m.Site1, m.Site2, m.Site3, m.Site4
	FROM EmployeeBase m
	JOIN physicianinfo p ON m.WebID = p.ID 
	WHERE m.StaffGroup1 = 'Scribe'
	
		
	select m.ProviderMasterID, p.sitelist_tmp, 
	CASE 
		WHEN SUBSTRING(LTRIM(RTRIM(p.sitelist_tmp)),1,1) = ',' THEN SUBSTRING(LTRIM(RTRIM(p.sitelist_tmp)),2,len(p.sitelist_tmp))
		ELSE p.sitelist_tmp 
	END	AS sitelistCondition
	into #ProvSiteTmp 
	from EmployeeBase m
	join physicianinfo p on m.WebID = p.ID 
	where sitelist_tmp <> ''
	and m.StaffGroup1 = 'Scribe'
	
	SET		@lastSite = ''
			
	SELECT	@thisID = min(ProviderMasterID) 
	FROM	#ProvSiteTmp

	WHILE @thisID IS NOT NULL
	BEGIN
		SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
		WHILE( LEN( @thisValue ) >= 4 )
		BEGIN
			SELECT @thisSite = left(sitelistCondition,4) FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
			WHILE ( SUBSTRING( @thisSite,1,1 ) = ',' )
			BEGIN
				select @thisSite = RIGHT( @thisSite,( LEN( @thisSite ) - 1 ) )
			END
			IF( @thisSite = @lastSite )
			BEGIN
				SELECT @lastSite = @thisSite
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
					CONTINUE
				END
				ELSE
					BREAK
			END
			SELECT @thisField = RTRIM( Site1 ) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site1 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM( Site2 ) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site2 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						--SELECT @thisID, @thisValue
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM( Site3 ) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site3 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM( Site4 ) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site4 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM( Site5 ) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site5 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM( Site6 ) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site6 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM( Site7 ) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site7 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN(sitelistCondition) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM( Site8 ) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site8 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						--SELECT @thisID, @thisValue
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM(Site9) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site9 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM( Site10 ) FROM EmployeeSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 4 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE EmployeeSiteStaging SET Site10 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @lastSite = @thisSite
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
					CONTINUE
				END
				ELSE
					BREAK
			END
		SELECT @thisID = MIN( ProviderMasterID ) FROM #ProvSiteTmp WHERE ProviderMasterID > @thisID
		SELECT @lastSite = ''
	END
	
	INSERT INTO EmployeeSites SELECT * FROM EmployeeSiteStaging

	DROP TABLE #ProvSiteTmp
	
END



