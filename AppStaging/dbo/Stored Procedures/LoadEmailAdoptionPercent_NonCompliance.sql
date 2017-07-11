




-- =============================================
-- Author: Jay Santhan
-- Create date: 7/25/11
-- Description:	Email Adoption Report. Calculates the percent of providers 
--				who have accessed their email within the last four weeks.
-- Last Modified:9/13/2012
-- =============================================
CREATE PROCEDURE [dbo].[LoadEmailAdoptionPercent_NonCompliance] 
	@ParamRunDate	datetime	= NULL
AS
BEGIN

	SET NOCOUNT ON;


	-------------------------------
	--** VARIABLE DECLARATIONS **--
	-------------------------------

	-- Dates used to filter out records by week
	DECLARE @CurrDate datetime;
	
	--If no parameter is entered, pick the latest script run date from SSO_Email_count_log
	--this is because each script run covers a week back
	IF (@ParamRunDate IS NULL)
		BEGIN
			SET @CurrDate = (SELECT MIN(TS_scriptRun)
							FROM dbo.SSO_Email_Count_Log
							WHERE MONTH(TS_scriptRun) = MONTH(GETDATE())
							AND YEAR(TS_scriptRun) = YEAR(GETDATE())
							AND TS_scriptRun IS NOT NULL)
		END
	ELSE 
		BEGIN
			SET @CurrDate = @ParamRunDate;
		END
			
	--Reomve the time part of the RunDate since it will be used to do various filters		
	DECLARE @RunDate datetime;
    SET @RunDate = (SELECT Convert(datetime, Convert(varchar,Month(@CurrDate))+'/'+
											Convert(varchar,Day(@CurrDate))+'/'+
											Convert(varchar,Year(@CurrDate)))); 

	DECLARE @ClickDate datetime;
	DECLARE @TRDate datetime;
	DECLARE @ScriptDate datetime;

	-- Used by the While loop to calculate a percentage for different sets of Weeks Back data
	DECLARE @WeeksBackCounter int;
	SET @WeeksBackCounter = 4;

	-- Counts of the three different factors used in calculating the final percentage
	-- Will be used by every iteration of the while loop below
	DECLARE @ClickCountMD float;
	DECLARE @NoClickReadCountMD float;
	DECLARE @OnlyASUCountMD float;

	DECLARE @ClickCountPA float;
	DECLARE @NoClickReadCountPA float;
	DECLARE @OnlyASUCountPA float;

	-- Total count of Active MD and PA providers
	DECLARE @MDCount float;
	DECLARE @PACount float;

	-- The final percentages calculated and loaded into EmailAdoptionPercent by the stored procedure
	DECLARE @PercentMD float;
	DECLARE @PercentPA float;


	--------------------------
	--**DUPLICATION CHECK **--
	--------------------------
	-- Check if this run date has been loaded before
	DECLARE @AlreadyLoaded int;
	SET @AlreadyLoaded = (SELECT 1 
						WHERE EXISTS (SELECT 1 
									  FROM EmailAdoption_NonCompliance
									  WHERE Month(RunDate) = Month(@RunDate) AND
											Day(RunDate) = Day(@RunDate) AND
											Year(RunDate) = Year(@RunDate)));


	-- Only run the stored procedure if this rundate has not been loaded already.
	IF @AlreadyLoaded IS NULL
	BEGIN


		------------------------------------------------
		--** TRUNCATE TABLES **--
		------------------------------------------------
				
		TRUNCATE TABLE NoAdoptionProviders;
		
		--Make sure the source isn't an empty table when you update it.
		IF ((SELECT COUNT(*) FROM ActiveSync_Source) > 3)
			BEGIN
				TRUNCATE TABLE ActiveSyncUser;
			END
		-------------------------------------------------------
		--** #NoAdoptionPercent TEMP TABLE CREATION **--
		-------------------------------------------------------
		-- This table is used by the while loop to load percent data
		CREATE TABLE #NoAdoptionPercent
		(
			WeeksBack int,
			MDPercent float,
			PAPercent float,
			RunDate datetime
		)


		-------------------------------------------------------
		--** #ProviderMasterBaseActive TEMP TABLE CREATION **--
		-------------------------------------------------------
		-- Filter out only Active employees from ProviderMasterBase
		-- Label Provider as either 'MD' or "PA'

		SELECT  CASE WHEN PMB.Title NOT LIKE '%M.D.%' AND 
						  PMB.Title NOT LIKE '%D.O.%' 
					 THEN 'PA'
					 WHEN PMB.Title LIKE '%M.D.%' OR
						  PMB.Title LIKE '%D.O.%' 
					 THEN 'MD'
					 ELSE 'XX'
				END AS Ttl,
				*
		INTO #ProviderMasterBaseActive 
		FROM ApplicationIntegration.dbo.ProviderMasterBase AS PMB
		WHERE Status = 0 AND StaffGroup1 = 'CEP' AND Site1 <> ''; --added StaffGroup1 and SIte filter to bring only CEP, 9/13/12



		--------------------------------------
		--** #SSOPMID TEMP TABLE CREATION **--
		--------------------------------------
		-- Define the base table #SSOPMID that adds SSO_Email_Count_Log data to the #ProviderMasterBaseActive table
		-- and provides much of the data needed for the percentage calculation
			
		SELECT SSO.webID, PMBA.ProviderMasterID, PMBA.LastName, PMBA.FirstName, PMBA.MiddleNameOrInitial, PMBA.Title,
			   PMBA.Ttl, PMBA.Status, SSO.unReadEmailCount, SSO.totalEmailCount, SSO.TS_lastSSOclick, 
			   SSO.TS_scriptRun 
		INTO #SSOPMID
		FROM #ProviderMasterBaseActive AS PMBA
			 JOIN
			 dbo.SSO_Email_Count_Log AS SSO
			 ON SSO.webID = PMBA.WebID;

		--------------------------------------
		--** ActiveSyncUser TABLE INSERT **--
		--------------------------------------
		
		--Make sure the source isn't an empty table when you update it.
		IF ((SELECT COUNT(*) FROM ActiveSync_Source) > 3)
			BEGIN
				-- Refresh the Active Sync user list
				INSERT INTO ActiveSyncUser (MPID, Last_Success_Sync)
					SELECT CAST(mpid as int) MPID, CAST(MAX(Last_Success_Sync) as datetime) Last_Success_Sync 
					FROM dbo.ActiveSync_Source
					WHERE ISNUMERIC(mpid) = 1  AND 
						  Device_User_Agent IS NOT NULL AND
						  Last_Success_Sync >= (@RunDate - 60)
					GROUP BY mpid
			END

		---------------------------------------------------------
		--** EMAIL ADOPTION PERCENTAGE CALCULATION WHILE LOOP**--
		---------------------------------------------------------
		-- The code within the While loop below calculates the Email Adoption Percentage using data 
		-- from a specified number of weeks back

		-- The While loop itself does the above mentioned calculation four times, using four sets of data
		-- All Data in the last 1 week
		-- All Data in the last 2 weeks
		-- All Data in the last 3 weeks
		-- All Data in the last 4 weeks

		WHILE @WeeksBackCounter <> 0
			BEGIN 
				SET @ClickDate = @RunDate - (7 * @WeeksBackCounter);
				SET @TRDate = @RunDate - (7 * @WeeksBackCounter);
				SET @ScriptDate = (@RunDate - 1) - (7 * (@WeeksBackCounter - 1));


				-------------------------------------------------
				--** #ProvidersWithHours TEMP TABLE CREATION **--
				-------------------------------------------------		
				-- Contains all providers with atleast 1 hour logged in the time span in question

				SELECT *
				INTO #ProvidersWithHours 
				FROM 
					(SELECT PMBA.WebID, PMBA.ProviderMasterID, PMBA.LastName, PMBA.FirstName, PMBA.MiddleNameOrInitial, PMBA.Title,
						   PMBA.Ttl, PMBA.Status, sum(TotalHours) as TotalHrs
					FROM 
					#ProviderMasterBaseActive AS PMBA
					LEFT JOIN
					ApplicationIntegration.dbo.ProviderHoursDetail as PHD
					ON PMBA.ProviderMasterID = PHD.ProviderMasterID AND 
					   PHD.DateOfService >= @TRDate AND 
					   PHD.DateOfService < @RunDate
					GROUP BY PMBA.WebID, PMBA.ProviderMasterID, PMBA.LastName, PMBA.FirstName, PMBA.MiddleNameOrInitial, PMBA.Title,
							 PMBA.Ttl, PMBA.Status ) AS ProvidersHours
				WHERE TotalHrs IS NOT NULL



				----------------------------------------
				--** #SSO_Click TEMP TABLE CREATION **--
				----------------------------------------		
				-- Contains a distinct list of all providers that have clicked on SSO 
				-- within the @WeeksBackCounter period. This is the majority factory in 
				-- the adoption percentage calculation

				SELECT DISTINCT Ttl, webID, ProviderMasterID, TS_lastSSOclick
				INTO #SSO_Click
				FROM #SSOPMID AS SSOP
				WHERE TS_lastSSOclick IS NOT NULL AND
					  TS_lastSSOclick >= @ClickDate AND
					  EXISTS (SELECT 1 
								  FROM #ProvidersWithHours AS PWH
								  WHERE SSOP.ProviderMasterID = PWH.ProviderMasterID)

				----------------------------------------------
				--** #NoClickReadFlag TEMP TABLE CREATION **--
				----------------------------------------------		
				-- This table contains data that answer the question:
				-- Of those providers who did not click on SSO, which ones have the read flag?
				-- A read flag = 1 is given to a provider if their unread email count is less 
				-- than their total email count for the TS_ScriptRun dates that falls within 
				-- the @WeeksBackCounter period

				SELECT Ttl, webID, ProviderMasterID,
					   -- If any of the script runs within the date range is flagged as read
					   -- the provider is flagged as having read their email
					   MAX(CASE WHEN unReadEmailCount < totalEmailCount
								THEN CAST(1 as float)
								ELSE CAST(0 as float) 
						   END) AS ReadFlag
				INTO #NoClickReadFlag
				FROM #SSOPMID AS SSOP
				WHERE TS_scriptRun >= @ScriptDate AND
					  NOT EXISTS (SELECT 1 
								  FROM #SSO_Click AS SC
								  WHERE SSOP.ProviderMasterID = SC.ProviderMasterID) AND
					  EXISTS (SELECT 1 
								  FROM #ProvidersWithHours AS PWH
								  WHERE SSOP.ProviderMasterID = PWH.ProviderMasterID)

				GROUP BY ProviderMasterID, webID, Ttl
						


				--------------------------------------------
				--** #OnyActiveSync TEMP TABLE CREATION **--
				--------------------------------------------		
				-- Contains those people who did not click on SSO and didn't get the read flag
				-- but have Active Sync

				SELECT ASU.MPID, PMBA.LastName, PMBA.FirstName, PMBA.Ttl
				INTO #OnlyActiveSync
				FROM ActiveSyncUser AS ASU
					 JOIN
					 #ProviderMasterBaseActive AS PMBA
					 ON ASU.MPID = PMBA.ProviderMasterID
				WHERE NOT EXISTS (SELECT 1
								 FROM #SSO_Click AS SSO
								 WHERE ASU.MPID = SSO.ProviderMasterID)
					  AND
					  NOT EXISTS (SELECT 1
								 FROM #NoClickReadFlag AS NCRF
								 WHERE ASU.MPID = NCRF.ProviderMasterID AND
									   NCRF.ReadFlag = 1)
					  AND
					  EXISTS (SELECT 1 
								  FROM #ProvidersWithHours AS PWH
								  WHERE ASU.MPID = PWH.ProviderMasterID)


				------------------------------------------------------------------
				--** CALCULATE COUNTS AND PERCENTAGES FOR EACH OF THE FACTORS **--
				------------------------------------------------------------------

				-- MD Counts
				
				SET @MDCount = (SELECT Count(*)
								FROM #ProvidersWithHours AS PWH
								WHERE PWH.Ttl = 'MD');

				SET @ClickCountMD = (SELECT Count(*) 
									 FROM #SSO_Click
									 WHERE Ttl = 'MD');

				SET @NoClickReadCountMD = (SELECT Count(*) 
										   FROM #NoClickReadFlag
										   WHERE ReadFlag = 1 AND
												Ttl = 'MD');

				SET @OnlyASUCountMD =  (SELECT Count(*) 
										FROM #OnlyActiveSync
										WHERE Ttl = 'MD');

				-- PA counts
				SET @PACount = (SELECT Count(*)
								FROM #ProvidersWithHours AS PWH
								WHERE PWH.Ttl = 'PA');
					   
				SET @ClickCountPA = (SELECT Count(*) 
									 FROM #SSO_Click
									 WHERE Ttl = 'PA');

				SET @NoClickReadCountPA = (SELECT Count(*) 
										   FROM #NoClickReadFlag
										   WHERE ReadFlag = 1 AND
												 Ttl = 'PA');

				SET @OnlyASUCountPA =  (SELECT Count(*) 
										FROM #OnlyActiveSync
										WHERE Ttl = 'PA');

				-- Calculate percentages to instert into EmailAdoptionPercent table

				SET @PercentMD = 1 - ((@ClickCountMD + @NoClickReadCountMD + @OnlyASUCountMD)/ @MDCount)
				SET @PercentPA = 1 - ((@ClickCountPA+ @NoClickReadCountPA + @OnlyASUCountPA)/ @PACount) 



				-----------------------------------------------
				--** INSERT INTO ##NoAdoptionPercent TABLE **--
				-----------------------------------------------
				INSERT INTO #NoAdoptionPercent
				(WeeksBack, MDPercent, PAPercent, RunDate)
				VALUES
				(@WeeksBackCounter, @PercentMD, @PercentPA, @RunDate)


				
				------------------------------------------------
				--** INSERT INTO NOADOPTIONPROVIDERS TABLE **--
				------------------------------------------------
				--Inserts the list of providers that did not access their cep email, added on 12/7/11
				
				INSERT INTO NoAdoptionProviders (Ttl, ProviderMasterID, WebID, WeeksBack, RunDate, 
												 LastName, FirstName, Title, EmailAddress, CEPEmail, 
												 Site1, Site2, Site3, Site4, Status, CEPLevel, HireDate)
				SELECT  CASE 
						    WHEN PMB.Title NOT LIKE '%M.D.%' AND 
								 PMB.Title NOT LIKE '%D.O.%' 
							THEN 'PA'
							WHEN PMB.Title LIKE '%M.D.%' OR
		   						 PMB.Title LIKE '%D.O.%' 
							THEN 'MD'
							ELSE 'XX'
						END AS Ttl, 
						PMB.ProviderMasterID, PMB.WebID,
						@WeeksBackCounter,
						@RunDate, 
						PMB.LastName, PMB.FirstName, PMB.Title, 
						PMB.EmailAddress, PMB.CEPEmail, 
						PMB.Site1, PMB.Site2, PMB.Site3, PMB.Site4, 
						Status, CEPLevel, HireDate
				FROM ApplicationIntegration.dbo.ProviderMasterBase AS PMB
				WHERE Status = 0  AND StaffGroup1 = 'CEP' AND Site1 <> '' --added StaffGroup1 and SIte filter to bring only CEP, 9/13/12
					  AND NOT EXISTS (SELECT 1
									  FROM #SSO_Click AS SSO
									  WHERE PMB.ProviderMasterID = SSO.ProviderMasterID)
					  AND NOT EXISTS (SELECT 1
									  FROM #NoClickReadFlag AS NCRF
									  WHERE PMB.ProviderMasterID = NCRF.ProviderMasterID AND
											NCRF.ReadFlag = 1)
					  AND NOT EXISTS (SELECT 1
									  FROM #OnlyActiveSync AS ASU
									  WHERE PMB.ProviderMasterID = ASU.MPID)
					  AND
					  EXISTS (SELECT 1 
								  FROM #ProvidersWithHours AS PWH
								  WHERE PMB.ProviderMasterID = PWH.ProviderMasterID)

				---------------------------------------------------------------------------
				--** Summarize the non compliant providers, with site counts **--
				---------------------------------------------------------------------------
				-- Overall Site counts
				INSERT INTO NCSiteCount (WeeksBack, RunDate, Region, SiteCode, SiteName, TotalNCProviders)
					SELECT @WeeksBackCounter, @RunDate, HR.Region, Site1, HR.HospitalName, count(Site1) AS NumInSite 
					FROM (
							SELECT Site1 
							FROM NoAdoptionProviders
							WHERE WeeksBack = @WeeksBackCounter AND Site1 <> ''

						 ) AS UN
					LEFT JOIN 
						 ApplicationIntegration.dbo.Hospital_region AS HR 
					ON UN.Site1 = HR.Code 
					GROUP BY UN.Site1, HR.HospitalName, HR.Region
					
				--Update MD NH site counts
				UPDATE NCMD
				SET NCMD.MDNCProviders = MD.MDInSite
				FROM NCSiteCount AS NCMD
					 JOIN 
					(SELECT HR.Region, Site1, HR.HospitalName, count(Site1) AS MDInSite 
					 FROM (
							SELECT Site1 
							FROM NoAdoptionProviders
							WHERE WeeksBack = @WeeksBackCounter AND Site1 <> '' AND Ttl = 'MD' 
						   ) AS UN
					 LEFT JOIN 
						   ApplicationIntegration.dbo.Hospital_region AS HR 
					 ON UN.Site1 = HR.Code 
				     GROUP BY Site1, HR.HospitalName, HR.Region) AS MD
				ON NCMD.SiteCode = MD.Site1 AND NCMD.WeeksBack = @WeeksBackCounter AND NCMD.RunDate = @RunDate
				
				
				--Update PA NH site counts
				UPDATE NCPA
				SET NCPA.PANCProviders = PA.PAInSite
				FROM NCSiteCount AS NCPA
					 JOIN 
					(SELECT HR.Region, Site1, HR.HospitalName, count(Site1) AS PAInSite 
					 FROM (
							SELECT Site1 
							FROM NoAdoptionProviders
							WHERE WeeksBack = @WeeksBackCounter AND Site1 <> '' AND Ttl = 'PA' 
						   ) AS UN
					 LEFT JOIN 
						   ApplicationIntegration.dbo.Hospital_region AS HR 
					 ON UN.Site1 = HR.Code 
				     GROUP BY Site1, HR.HospitalName, HR.Region) AS PA
				ON NCPA.SiteCode = PA.Site1 AND NCPA.WeeksBack = @WeeksBackCounter AND NCPA.RunDate = @RunDate
				
				-----------------------------------------
				--** DROP ALL WHILE LOOP TEMP TABLES **--
				-----------------------------------------
				-- Drop all of the temp tables used in the while loop,
				-- before the next loop goaround.

				DROP TABLE #SSO_Click
				DROP TABLE #NoClickReadFlag
				DROP TABLE #OnlyActiveSync
				DROP TABLE #ProvidersWithHours

				-----------------------
				--** RESET COUNTER **--
				-----------------------
				SET @WeeksBackCounter = @WeeksBackCounter - 1;	

			END; /********-------------@@@@@@@@@ END WHILE LOOP @@@@@@@@@-------**********/

			----------------------------------------------------------------------
			--** COUNT REGION TOTALS **--
			----------------------------------------------------------------------

			INSERT INTO NCRegionCount (WeeksBack, RunDate, Region, RegionName, TotalNCProviders, MDNCProviders, PANCProviders)
				SELECT SC.WeeksBack, SC.RunDate, SC.Region, R.RegionName, 
					   Sum(TotalNCProviders) AS TotalProviders, Sum(MDNCProviders) AS MDNCProviders, 
					   Sum(PANCProviders) AS PANCProviders
				FROM NCSiteCount AS SC
					 JOIN
					 ApplicationIntegration.dbo.regions AS R 
					 ON SC.Region = R.RegionCode
				WHERE SC.RunDate = @RunDate
				GROUP BY SC.Region, R.RegionName, SC.WeeksBack, SC.RunDate

				
		----------------------------------------------------------------------
		--** TRANSPOSE AND INSERT INTO EmailAdoption_NonCompliance TABLE **--
		----------------------------------------------------------------------
		-- Reformat data for the EmailAdoption_NonCompliance table. This table is formated like this
		-- because Excel charts can read this better
		INSERT INTO EmailAdoption_NonCompliance
		(RunDate, MD1Wk, MD2Wk, MD3Wk, MD4Wk, PA1Wk, PA2Wk, PA3Wk, PA4Wk)
			SELECT A.RunDate, MD1Wk, MD2Wk, MD3Wk, MD4Wk, PA1Wk, PA2Wk, PA3Wk, PA4Wk
			FROM
				(SELECT RunDate, MDPercent AS MD1Wk, PAPercent AS PA1Wk
				 FROM #NoAdoptionPercent
				 WHERE WeeksBack = 1) AS A
				JOIN
				(SELECT RunDate, MDPercent AS MD2Wk, PAPercent AS PA2Wk
				 FROM #NoAdoptionPercent
				 WHERE WeeksBack = 2) AS B
				ON A.RunDate = B.RunDate
				JOIN
				(SELECT RunDate, MDPercent AS MD3Wk, PAPercent AS PA3Wk
				 FROM #NoAdoptionPercent
				 WHERE WeeksBack = 3) AS C
				ON A.RunDate = C.RunDate
				JOIN
				(SELECT RunDate, MDPercent AS MD4Wk, PAPercent AS PA4Wk
				 FROM #NoAdoptionPercent
				 WHERE WeeksBack = 4) AS D
				ON A.RunDate = D.RunDate
			ORDER BY A.RunDate DESC
			
		------------------------------
		--** DROP ALL TEMP TABLES **--
		------------------------------
		DROP TABLE #SSOPMID
		DROP TABLE #ProviderMasterBaseActive
		DROP TABLE #NoAdoptionPercent

	END-- @AlreadyLoaded Condition 
	ELSE
		PRINT 'This RunDate: ' + CAST(@RunDate AS varchar(11)) + ', was already loaded.
	Please delete it from the EmailAdoptionPercent table and re-run the stored procedure';  

END








