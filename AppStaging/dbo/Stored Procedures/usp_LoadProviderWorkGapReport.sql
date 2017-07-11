

CREATE                      PROCEDURE [dbo].[usp_LoadProviderWorkGapReport] 
AS

/* 	Author: 	Reetika Singh
	Date:		12/13/2011
	Purpose:	List of providers who have a work gap of more that 6 months
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
			INNER JOIN PMDBStaging.dbo.ProviderMasterBase PM 
						ON PM.WebID = s1.UID_N
			WHERE PM.Status = 0
			AND Year(Date) >= Year(GetDate())

--Get all active PA on the schedule
INSERT INTO #TWork
SELECT UID_N, date, Site
    FROM AppStaging.dbo.PA_CAL_schedule_slots s1 
		INNER JOIN PMDBStaging.dbo.ProviderMasterBase PM 
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
--INNER JOIN PMDBStaging.dbo.ProviderMasterBase PM 
--					ON PM.WebID = NW.UID_N
--JOIN PMDBStaging.dbo.Hospital_region HR
--					ON LTRIM(RTRIM(HR.Code)) = LTRIM(RTRIM(NW.Site))
--WHERE MonthNotWorked >= 6
--ORDER BY NW.MonthNotWorked


DROP TABLE #TWork
	
	

END


