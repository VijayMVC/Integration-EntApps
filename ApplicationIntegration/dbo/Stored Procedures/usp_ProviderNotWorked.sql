CREATE        PROCEDURE [dbo].[usp_ProviderNotWorked] 
AS

/* 	Author: 	Reetika Singh
	Date:		10/19/2011
	Purpose:	From User:
				We would like to request a report to be built that 
				pulls information from the schedules (and possibly other 
				resources if needed). 
				We need a report that will show us providers that have 
				not worked in more than 5 months for each site that they work. 
				We have an issue where Medicare will deactivate providers after 
				they don’t work for twelve months, so we need to catch this 
				before it happens. We have several providers that work at 
				multiple sites, and if there is one of their sites that they 
				don’t work for twelve months, then decide to go back to work 
				there, we are often stuck with almost a six month process of 
				getting their billing number reactivated, then getting that 
				number’s effective date retro-dated back to when they started 
				working, which we don’t always get granted.		
				This process is very lengthy, and slows our revenue coming in 
				from Medicare. Do you have any ideas for this report that would
				help? We had previously worked with MBSI with a report, 
				but theirs was based off of billing, and was very confusing 
				to understand the data being pulled. Cindy Addy had also 
				mentioned trying to do something similar with her midlevel 
				population, but we would really like to get this going, 
				since it is really slowing our revenue at times.

	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


	TRUNCATE TABLE AppStaging.dbo.ProviderNotWorked



	--Get all active MD on the schedule
	SELECT UID_N, date, Site
			INTO #TWork
			FROM AppStaging.dbo.WebCAL_schedule_slots s1 
				INNER JOIN ApplicationIntegration.dbo.ProviderMasterBase PM 
							ON PM.WebID = s1.UID_N
				WHERE PM.Status = 0
				AND Year(Date) >= Year(GetDate())

	--Get all active PA on the schedule
	INSERT INTO #TWork
	SELECT UID_N, date, Site
		FROM AppStaging.dbo.PA_CAL_schedule_slots s1 
			INNER JOIN ApplicationIntegration.dbo.ProviderMasterBase PM 
						ON PM.WebID = s1.UID_N
			WHERE PM.Status = 0
			AND Year(Date) >= Year(GetDate())

	--select * from #TWork
	--order by Site, date

	--Extracts Max and Second Max date on schedule

	INSERT INTO AppStaging.dbo.ProviderNotWorked
	SELECT		UID_N,
			MAX(CASE WHEN recID = 2 THEN [DATE] ELSE NULL END) AS SecondMaxDate,
			MAX(CASE WHEN recID = 1 THEN [DATE] ELSE NULL END) AS MaxDate,		
			Site, 0
	FROM		(
				SELECT	UID_N,
					[DATE],
					(SELECT COUNT(*) FROM #TWork WHERE UID_N = s1.UID_N AND [DATE] >= s1.[DATE] AND Site = s1.Site) AS recID,
					Site
				FROM #TWork s1
				--WHERE	[TYPE] = 'SUB'
			) AS d
	WHERE		recID <= 2
	GROUP BY	UID_N, Site

	--Calculates the months not worked

	UPDATE AppStaging.dbo.ProviderNotWorked
	SET MonthNotWorked = DateDiff(month, [2LastDateWorked], [LastDateWorked])


--Output Query
--SELECT PM.LastName + ', ' + PM.FirstName, PM.Title, 
--HR.HospitalName, NW.[2LastDateWorked] As SecondLastWorkedDate,
--NW.LastDateWorked, NW.MonthNotWorked
--FROM AppStaging.dbo.ProviderNotWorked NW
--INNER JOIN ApplicationIntegration.dbo.ProviderMasterBase PM 
--					ON PM.WebID = NW.UID_N
--JOIN ApplicationIntegration.dbo.Hospital_region HR
--					ON LTRIM(RTRIM(HR.Code)) = LTRIM(RTRIM(NW.Site))
--WHERE MonthNotWorked >= 6
--ORDER BY NW.MonthNotWorked

	
		DROP TABLE #TWork
	

END
