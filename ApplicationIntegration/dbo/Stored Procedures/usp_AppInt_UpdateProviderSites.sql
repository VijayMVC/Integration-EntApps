﻿





CREATE  PROCEDURE [dbo].[usp_AppInt_UpdateProviderSites]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @thisID INT,
			@thisSite VARCHAR(5),
			@lastSite VARCHAR(5),
			@lastProvider VARCHAR(4),
			@thisField VARCHAR(5),
			@thisValue VARCHAR(50),
			@startTime DATETIME,
			@tblRows INT

	TRUNCATE TABLE ProviderSiteStaging
	
	-- Moved to end of process and dependent on successful update of staging table (SG 7/17/2013)
	--TRUNCATE TABLE ProviderSites


	INSERT INTO ProviderSiteStaging (ProviderMasterID, LastName, FirstName, Title, CellPhoneNbr, PhoneNbr1, Status, Site1, Site2, Site3, Site4)
	SELECT m.ProviderMasterID, m.LastName, m.FirstName, m.Title, m.CellPhoneNbr, m.PhoneNbr1, m.Status, m.Site1, m.Site2, m.Site3, m.Site4
	FROM providermasterbase m
	JOIN physicianinfo p ON m.ProviderMasterID = p.MPID 
	WHERE m.status = 0 
	
-- 	UPDATED 3/17/2011 -RS - To include GALEN providers once 
-- 				GALEN goes live we can omit this part


	INSERT INTO ProviderSiteStaging (ProviderMasterID, LastName, FirstName, Title, CellPhoneNbr, PhoneNbr1, Status, Site1, Site2, Site3, Site4)
	SELECT m.ProviderMasterID, m.LastName, m.FirstName, m.Title, m.CellPhoneNbr, m.PhoneNbr1, m.Status, m.Site1, m.Site2, m.Site3, m.Site4
	FROM providermasterbasestaffgroup m
	JOIN physicianinfo p ON m.ProviderMasterID = p.MPID 
	WHERE m.status = 0
	AND m.StaffGroup = 'GALEN'
	AND m.ProviderMasterID not in (select ProviderMasterID 
					from ProviderSiteStaging)
	

		
	select m.ProviderMasterID, p.sitelist_tmp, 
	CASE 
		WHEN SUBSTRING(p.sitelist_tmp,1,1) = ',' THEN SUBSTRING(REPLACE(REPLACE(p.sitelist_tmp,',,',','),'.',','),2,len(p.sitelist_tmp))
		ELSE p.sitelist_tmp 
	END	AS sitelistCondition
	into #ProvSiteTmp 
	from providermasterbase m
	join physicianinfo p on m.ProviderMasterID = p.MPID 
	where m.status = 0
	and sitelist_tmp <> ''
	order by m.ProviderMasterID

	--update #ProvSiteTmp set sitelistCondition = 'SAN1,ROS1,' where ProviderMasterID = 1081
	--update #ProvSiteTmp set sitelistCondition = 'OLY1,STJ1,STJ2,' where ProviderMasterID = 2636	
	--delete from #ProvSiteTmp where ProviderMasterID = 2812
	--update #ProvSiteTmp set sitelistCondition = 'MCN1,SHE2,' where ProviderMasterID = 2924
	--update #ProvSiteTmp set sitelistCondition = 'JOH1,STJ2,' where ProviderMasterID = 4758	
	--update #ProvSiteTmp set sitelistCondition = 'PSM1,' where ProviderMasterID = 5352
	--update #ProvSiteTmp set sitelistCondition = 'SJH1,ARW1,FOL1,' where ProviderMasterID = 5548
	
-- 	UPDATED 3/17/2011 -RS - To include GALEN providers once 
-- 				GALEN goes live we can omit this part
	insert into #ProvSiteTmp
	select m.ProviderMasterID, p.sitelist_tmp, 
	CASE 
		WHEN SUBSTRING(p.sitelist_tmp,1,1) = ',' THEN SUBSTRING(p.sitelist_tmp,2,len(p.sitelist_tmp))
		ELSE p.sitelist_tmp 
	END	AS sitelistCondition
	from providermasterbasestaffgroup m
	join physicianinfo p on m.ProviderMasterID = p.MPID 
	where m.status = 0
	and sitelist_tmp <> ''
	and m.StaffGroup = 'GALEN'
	and m.ProviderMasterID not in (select ProviderMasterID from #ProvSiteTmp)
	
	SET		@lastSite = ''
			
	SELECT	@thisID = min(ProviderMasterID) 
	FROM	#ProvSiteTmp

	WHILE @thisID IS NOT NULL
	BEGIN
		SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
		WHILE( LEN( @thisValue ) > 4 )
		BEGIN
			--IF ( SUBSTRING( @thisSite,1,1 ) = ',' )
			--BEGIN
			--	SELECT @thisSite = RIGHT( @thisSite, LEN( @thisSite ) -1 )
			--END
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
			SELECT @thisField = RTRIM( Site1 ) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField AND @thisID <> @lastProvider )
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site1 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						SELECT @lastProvider = @thisID
						CONTINUE
					END
					ELSE
						UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END
			SELECT @thisField = RTRIM( Site2 ) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site2 = @thisSite WHERE ProviderMasterID = @thisID
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
			SELECT @thisField = RTRIM( Site3 ) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site3 = @thisSite WHERE ProviderMasterID = @thisID
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
			SELECT @thisField = RTRIM( Site4 ) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site4 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						BEGIN TRY
							UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						END TRY
						BEGIN CATCH
							UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 4 ) ) WHERE ProviderMasterID = @thisID
						END CATCH
						SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
						CONTINUE
				END			
			SELECT @thisField = RTRIM( Site5 ) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )			
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site5 = @thisSite WHERE ProviderMasterID = @thisID
					SELECT @lastSite = @thisSite
					IF( LEN( @thisValue ) < 5 )
					BEGIN
						CONTINUE
					END
					ELSE
						BEGIN TRY
							UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 5 ) ) WHERE ProviderMasterID = @thisID
						END TRY
						BEGIN CATCH
							UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT( sitelistCondition,( LEN( sitelistCondition ) - 4 ) ) WHERE ProviderMasterID = @thisID
						END CATCH
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
					CONTINUE
				END			
			SELECT @thisField = RTRIM( Site6 ) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site6 = @thisSite WHERE ProviderMasterID = @thisID
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
			SELECT @thisField = RTRIM( Site7 ) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site7 = @thisSite WHERE ProviderMasterID = @thisID
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
			SELECT @thisField = RTRIM( Site8 ) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField AND @thisSite IS NOT NULL )
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site8 = @thisSite WHERE ProviderMasterID = @thisID
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
			SELECT @thisField = RTRIM(Site9) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site9 = @thisSite WHERE ProviderMasterID = @thisID
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
			SELECT @thisField = RTRIM( Site10 ) FROM ProviderSiteStaging WHERE ProviderMasterID = @thisID
			IF( @thisSite = @thisField )
			BEGIN
				IF( LEN( @thisValue ) > 5 )
				BEGIN
					UPDATE #ProvSiteTmp SET sitelistCondition = RIGHT(sitelistCondition,(LEN(sitelistCondition) - 5)) WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				END
				ELSE
					UPDATE #ProvSiteTmp SET sitelistCondition = '' WHERE ProviderMasterID = @thisID
					SELECT @thisValue = sitelistCondition FROM #ProvSiteTmp WHERE ProviderMasterID = @thisID
				CONTINUE
			END
			ELSE
				IF( ( @thisField = '' ) OR ( @thisField = NULL ) OR ( @thisField IS NULL ) )
				BEGIN
					UPDATE ProviderSiteStaging SET Site10 = @thisSite WHERE ProviderMasterID = @thisID
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
	
	SELECT @tblRows = COUNT(*) FROM ProviderSiteStaging

	IF( @tblRows = 0 )
	BEGIN
		RAISERROR (50042, 10, 1)
		SELECT 1/0
	END
	ELSE
	BEGIN
		TRUNCATE TABLE ProviderSites
		INSERT INTO ProviderSites SELECT * FROM ProviderSiteStaging order by ProviderMasterId
	END
	
	DROP TABLE #ProvSiteTmp
	
END






