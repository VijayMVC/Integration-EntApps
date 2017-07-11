
CREATE VIEW [dbo].[vw_LawsonBenefitDatesHours_PA]
AS
SELECT TOP 5000 * FROM
(	SELECT 	CASE
			WHEN b.date_hired <> a.benefit_date  THEN 'X'
			ELSE ' '
		END as ben_flag,
		a.provider_name, a.lawson_id, a.position, c.name as Site,b.process_level,
		CONVERT(varchar, b.date_hired,101) as hire_date,
		CONVERT(varchar, a.benefit_date,101) as benefit_date,
		CONVERT(varchar, a.eligible_date,101) as eligible_date,
		a.HoursAtEligibleDate as EligibleDateHours,
		
		CASE 	
		WHEN
			CONVERT(varchar, 
			CASE
				--WHEN b.date_hired < a.benefit_date THEN 
					--b.date_hired
				WHEN a.Date390Hours <= a.eligible_date THEN
					CONVERT(varchar,a.eligible_date,101)
				WHEN a.Date390Hours > a.eligible_date AND day(a.eligible_date) > 15  THEN
					CONVERT(varchar,CAST(CAST(month(a.Date390Hours + 20) as varchar) + '/1/' + 
						CAST(year(a.Date390Hours + 20) as varchar) as datetime),101)
				WHEN a.Date390Hours > a.eligible_date AND day(eligible_date) <= 15  THEN
					CONVERT(varchar,CAST(cast(month(a.Date390Hours + 31) as varchar) + '/1/' + 
						CAST(year(a.Date390Hours + 31) as varchar) as datetime), 101)
				ELSE ' '
			END,101)= '01/01/1900' THEN ''
		ELSE CONVERT(varchar, 
			CASE
				--WHEN b.date_hired < a.benefit_date THEN 
					--b.date_hired
				WHEN a.Date390Hours <= a.eligible_date THEN
					CONVERT(varchar,a.eligible_date,101)
				WHEN a.Date390Hours > a.eligible_date AND day(a.eligible_date) > 15  THEN
					CONVERT(varchar,CAST(CAST(month(a.Date390Hours + 20) as varchar) + '/1/' + 
						CAST(year(a.Date390Hours + 20) as varchar) as datetime),101)
				WHEN a.Date390Hours > a.eligible_date AND day(eligible_date) <= 15  THEN
					CONVERT(varchar,CAST(cast(month(a.Date390Hours + 31) as varchar) + '/1/' + 
						CAST(year(a.Date390Hours + 31) as varchar) as datetime), 101)
				ELSE ' '
			END,101) 
		END as qualified_date,
		
		CASE 
			WHEN a.HoursAtEligibleDate > a.HoursAtQualifyDate THEN
				a.HoursAtEligibleDate
			ELSE a.HoursAtQualifyDate
		END as QualifiedDateHours,
		
		a.HoursAllDates as TotalHours,
		
		COALESCE(CONVERT(varchar,a.MaxWorkDate,101),' ') as LastScheduledDate,
		COALESCE(CONVERT(varchar,a.FirstWorkDate, 101),' ') as FirstWorkDate,
		CASE 
			WHEN b.nbr_fte = 1.0 THEN 'FULL TIME'
			WHEN b.nbr_fte = .5 THEN 'PART TIME'
			WHEN b.nbr_fte = .25 THEN 'PER DIEM'
			ELSE 'UNKNOWN'
		END as status,
		b.emp_status
	FROM LawsonBenefitDatesHours_PA a INNER JOIN AppStaging.dbo.LawsonEmployee b
			ON a.Lawson_id = b.employee
		INNER JOIN AppStaging.dbo.LawsonPRSYSTEM c
			ON b.process_level = c.process_level
) x

WHERE CAST(x.benefit_date as datetime) >= getDate() - 90
	OR (cast(x.eligible_date as datetime) >= cast(datepart(month,getDate()-28) as varchar) + '/1/' + cast(datepart(year,getDate()-28) as varchar)
		AND (cast(x.qualified_date as datetime) >= cast(datepart(month,getDate()-28) as varchar) + '/5/' + cast(datepart(year,getDate()-28) as varchar) 
			OR x.qualified_date = ' ') )
	OR (cast(x.qualified_date as datetime) >= cast(datepart(month,getDate()-28) as varchar) + '/5/' + cast(datepart(year,getDate()-28) as varchar))
ORDER BY CAST(x.eligible_date as datetime), CAST(x.benefit_date as datetime) desc

