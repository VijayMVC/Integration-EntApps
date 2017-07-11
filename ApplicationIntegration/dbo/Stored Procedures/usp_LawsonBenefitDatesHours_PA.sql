
CREATE PROCEDURE [dbo].[usp_LawsonBenefitDatesHours_PA] 
WITH RECOMPILE
AS

/********************************************************************************************************************

Author: 	Jim Rogers  
Date: 		7/30/2010
Purpose:	This Routine is used to Extract/Transform/Load Benefit Dates & Hours Worked/scheduled for
		PA/NP's from Lawson tables and ProviderHoursDetail into the table LawsonBenefitHoursDates_PA 
		
--	Jim Rogers	8/3/2010	Create cursor to retrieve and update 390 hour date per PA/NP
--	Jim Rogers	8/5/2010	Update table to include FirstWorkDate and MaxWorkDate
--	Jim Rogers	8/13/2010	Update LawsonBenefitDatesHours_PA to include HoursAtEligibleDate
					and HoursAtQualifyDate
-- 	Jim Rogers	8/11/2011	Added Other Hours to total (PTO, meeetings, sick, other)

*******************************************************************************************************************/


BEGIN

SELECT	x.lawson_id,
	x.providerMasterID,
	x.provider_name,
	x.position,
	x.benefit_date,
	x.ninety_day_date,
	x.eligible_date,
	'1/1/1900' as Date390Hours,
	cast(0 as decimal(10,2)) as HoursSinceEffectDate,
	cast(0 as decimal(10,2)) as HoursAtEligibleDate,
	cast(0 as decimal(10,2)) as HoursEffectDateToEligibleDate,
	cast(0 as decimal(10,2)) as HoursAfterEligibleDate,
	cast(0 as decimal(10,2)) as HoursAtQualifyDate,
	cast(0 as decimal(10,2)) as HoursAllDates,
	COALESCE(CONVERT(varchar,max(y.dateOfService),101),' ') as MaxWorkDate,
	COALESCE(CONVERT(varchar,min(y.dateOfService),101),' ') as FirstWorkDate,
	x.term_date,
	x.job_code
INTO #tmpPAbenefits
FROM
(
	select a.employee as lawson_id, lm.providerMasterID, 
		ltrim(rtrim(b.first_name)) + ' ' + ltrim(rtrim(b.last_name)) as provider_name,
		jc.description as position, 
		convert(varchar,a.ben_date_1,101) as benefit_date, 
		convert(varchar,a.ben_date_1 + 90,101) as ninety_day_date,
		CASE 
			WHEN day(a.ben_date_1 + 90) = 1  THEN 
				convert(varchar,a.ben_date_1 + 90,101)
			WHEN day(a.ben_date_1 + 90) > 15  THEN 
				CONVERT(varchar,
				cast(
					convert(varchar,month(a.ben_date_1 + 110)) + '/01/' + 
					convert(varchar,year(a.ben_date_1 + 110),101)
				 as datetime)
				,101)
			ELSE 	CONVERT(varchar,
				cast(
					convert(varchar,month(a.ben_date_1 + 120)) + '/01/' + 
					convert(varchar,year(a.ben_date_1 + 120),101)
				 as datetime)
				,101)
		END as eligible_date,
		
		CASE
			WHEN b.term_date < '1/1/1900' THEN
				''
			ELSE	convert(varchar,b.term_date,101)
		END as term_date,
		c.job_code, 
		convert(varchar,max(c.effect_date),101) as effective_date
	from AppStaging.dbo.LawsonPAEmployee a INNER JOIN AppStaging.dbo.LawsonEmployee b ON a.employee = b.employee
		INNER JOIN AppStaging.dbo.LawsonPAEMPPOS c ON b.employee = c.employee
		INNER JOIN AppStaging.dbo.LawsonJOBCODE jc ON jc.JOB_CODE = c.JOB_CODE
		LEFT OUTER JOIN ApplicationIntegration.dbo.LawsonIDMatch lm ON b.employee = lm.lawsonEmpNo
	where c.pos_level=1 
		AND (c.end_date < '1/1/1900' OR cast(convert(varchar,b.term_date, 101) as datetime) >= 
						cast(convert(varchar,getDate()-90,101) as datetime)
		) 
		AND (LEFT(c.job_code,6)='EPHYAS' OR LEFT(c.job_code,4)='ERNP'
			OR LEFT(c.job_code,6)='EDIRPA' OR LEFT(c.job_code,8)= 'ELSNPANP' )
		AND c.PROCESS_LEVEL < 8000
		group by a.employee, b.last_name, b.first_name,lm.providerMasterID,
		jc.description, a.ben_date_1, b.term_date, c.job_code
) x LEFT OUTER JOIN ApplicationIntegration.dbo.ProviderHoursDetail y ON x.providerMasterID = y.providerMasterID
	
GROUP BY x.lawson_id,
	x.providerMasterID,
	x.provider_name,
	x.position,
	x.benefit_date,
	x.ninety_day_date,
	x.eligible_date,
	x.term_date,
	x.job_code
;


select * 
into #tmpProvHrs 
from
       (select a.providerMasterID, b.dateOfService, 
       		coalesce(b.totalHours,0) 
       		+ coalesce(c.HoursPTO,0) + coalesce(c.HoursSicks,0) +
       		coalesce(c.HoursMeeting,0) + coalesce(c.HoursOther,0) 
       		as totalHours
              	from #tmpPAbenefits a INNER JOIN providerHoursDetail b
              			ON a.providerMasterID = b.providerMasterID
       		LEFT OUTER JOIN WebTimecardPA c
       			ON b.providerMasterID = c.providerMasterID
       			AND b.dateOfService = c.dat
       UNION
       
       select a.providerMasterID, c.dat as dateOfService,
       		coalesce(b.totalHours,0) 
       		+ coalesce(c.HoursPTO,0) + coalesce(c.HoursSicks,0) +
       		coalesce(c.HoursMeeting,0) + coalesce(c.HoursOther,0) 
       		as paHours
              	from #tmpPAbenefits a INNER JOIN WebTimecardPA c
              			ON a.providerMasterID = c.providerMasterID
       		LEFT OUTER JOIN providerHoursDetail b
       			ON b.providerMasterID = c.providerMasterID
       			AND b.dateOfService = c.dat
       )x
;


UPDATE #tmpPAbenefits
SET HoursSinceEffectDate = 
	(SELECT SUM(ph.totalHours)
	FROM #tmpProvHrs ph
	WHERE #tmpPAbenefits.ProviderMasterID = ph.ProviderMasterID
		AND ph.DateOfService >= cast(#tmpPAbenefits.benefit_date as datetime) 
	)
WHERE providerMasterID in
	(select providerMasterID
	from #tmpProvHrs
	)
;


UPDATE #tmpPAbenefits
SET HoursEffectDateToEligibleDate = 
	(SELECT COALESCE(SUM(ph.totalHours),0)
	FROM #tmpProvHrs ph
	WHERE #tmpPAbenefits.ProviderMasterID = ph.ProviderMasterID
		AND ph.DateOfService >= cast(#tmpPAbenefits.benefit_date as datetime)
		AND ph.DateOfService <= cast(#tmpPAbenefits.eligible_date as datetime) 
	)
WHERE providerMasterID in
	(select providerMasterID
	from #tmpProvHrs
	)
;


UPDATE #tmpPAbenefits
SET HoursAfterEligibleDate = 
	(SELECT COALESCE(SUM(ph.totalHours),0)
	FROM #tmpProvHrs ph
	WHERE #tmpPAbenefits.ProviderMasterID = ph.ProviderMasterID
		AND ph.DateOfService > cast(#tmpPAbenefits.eligible_date as datetime) )
WHERE providerMasterID in
	(select providerMasterID
	from #tmpProvHrs
	)
;



UPDATE #tmpPAbenefits
SET HoursAllDates = 
	(SELECT COALESCE(SUM(ph.totalHours),0)
	FROM #tmpProvHrs ph
	WHERE #tmpPAbenefits.ProviderMasterID = ph.ProviderMasterID)
WHERE providerMasterID in
	(select providerMasterID
	from #tmpProvHrs
	)
;


UPDATE #tmpPAbenefits
SET HoursAtEligibleDate = 
	(SELECT COALESCE(SUM(ph.totalHours),0)
	FROM #tmpProvHrs ph
	WHERE #tmpPAbenefits.ProviderMasterID = ph.ProviderMasterID
		AND ph.DateOfService <= cast(#tmpPAbenefits.eligible_date as datetime) )
WHERE providerMasterID in
	(select providerMasterID
	from #tmpProvHrs
	)
;


TRUNCATE TABLE ApplicationIntegration.dbo.LawsonBenefitDatesHours_PA
;


INSERT INTO ApplicationIntegration.dbo.LawsonBenefitDatesHours_PA
SELECT *, getDate() as LoadDate 
FROM #tmpPAbenefits
;


/*** Cursor return the first date where the PA/NP worked 390 hours or more
	and update the LawsonBenefitDatesHours table with the result	***/

SET Nocount ON

DECLARE @Runningtotals TABLE (pa_id INT, eligible_date	datetime, total_hours DECIMAL(10,2))
DECLARE @paID INT, @nextPaID INT, @elDate datetime, @totHours DECIMAL (10,2), @totalHours DECIMAL (10,2)
--Declare the cursor
--declare current_line  cursor -- SQL-92 syntax--only scroll forward 
DECLARE current_line CURSOR fast_forward--SQL Server only--only scroll forward 
FOR 
	select * 
	from #tmpProvHrs
	where totalHours > 0
	order by providerMasterID, dateOfService
FOR READ ONLY

OPEN current_line
--fetch the first row
FETCH NEXT FROM current_line
INTO @paID,@elDate,@totHours
SET @nextPaID = @paID
SET @totalHours = 0	

WHILE @@FETCH_STATUS = 0 --while records exist	
BEGIN
	WHILE @nextPaID = @paID AND @totalHours < 390   -- while the paID for the current record = paID of last record....
	BEGIN	
		SET @totalHours = @totalHours + COALESCE(@totHours,0)	
		INSERT INTO @Runningtotals (pa_id, eligible_date, total_hours)
               	VALUES (@paID,@elDate,@totalHours) 	

		-- This is executed as long as the previous fetch succeeds 
		FETCH NEXT FROM current_line
        	INTO @paID,@elDate,@totHours			
   	END 
INSERT INTO @Runningtotals (pa_id, eligible_date, total_hours)
       VALUES (@paID,@elDate,@totHours) 	
-- This is executed as long as records still exist AND @paID <> @nextPaID.	
FETCH NEXT FROM current_line
INTO @paID,@elDate,@totHours

SET @nextPaID = @paID
SET @totalHours=COALESCE(@totHours,0)	
END

--update the 390HourDate field 
UPDATE LawsonBenefitDatesHours_PA
SET Date390Hours = cur.eligible_date
FROM	(SELECT  pa_id, min(eligible_date) as eligible_date, min(total_hours) as total_hours
	FROM @Runningtotals 
	WHERE total_hours >= 390
	GROUP BY pa_id) cur
WHERE LawsonBenefitDatesHours_PA.ProviderMasterID = cur.pa_id
	AND LawsonBenefitDatesHours_PA.HoursAllDates >= 390
	
CLOSE current_line
DEALLOCATE current_line
;
/*** End Cursor		***/

update LawsonBenefitDatesHours_PA
set Date390Hours = NULL
where date390HOurs = '1/1/1900'
;

update LawsonBenefitDatesHours_PA
set MaxWorkDate = NULL
where MaxWorkDate = '1/1/1900'
;

update LawsonBenefitDatesHours_PA
set FirstWorkDate = NULL
where FirstWorkDate = '1/1/1900'
;



UPDATE LawsonBenefitDatesHours_PA
SET HoursAtQualifyDate = 
	(SELECT COALESCE(SUM(ph.totalHours),0)
	FROM #tmpProvHrs ph
	WHERE LawsonBenefitDatesHours_PA.ProviderMasterID = ph.ProviderMasterID
		AND ph.DateOfService <= 
			CAST
			(
			CASE 	WHEN LawsonBenefitDatesHours_PA.Date390Hours <= LawsonBenefitDatesHours_PA.eligible_date THEN
					CONVERT(varchar,LawsonBenefitDatesHours_PA.eligible_date,101)
				WHEN LawsonBenefitDatesHours_PA.Date390Hours > LawsonBenefitDatesHours_PA.eligible_date AND day(LawsonBenefitDatesHours_PA.eligible_date) > 15  THEN
					CONVERT(varchar,CAST(CAST(month(LawsonBenefitDatesHours_PA.Date390Hours + 20) as varchar) + '/1/' + 
					CAST(year(LawsonBenefitDatesHours_PA.Date390Hours + 20) as varchar) as datetime),101)
				WHEN LawsonBenefitDatesHours_PA.Date390Hours > eligible_date AND day(LawsonBenefitDatesHours_PA.eligible_date) <= 15  THEN
					CONVERT(varchar,CAST(cast(month(LawsonBenefitDatesHours_PA.Date390Hours + 31) as varchar) + '/1/' + 
					CAST(year(LawsonBenefitDatesHours_PA.Date390Hours + 31) as varchar) as datetime), 101) 
				ELSE '1/1/1951'
			END
			as datetime
			)
	)
WHERE providerMasterID in
	(select providerMasterID
	from #tmpProvHrs
	)
;


drop table #tmpProvHrs
drop table #tmpPAbenefits

END

