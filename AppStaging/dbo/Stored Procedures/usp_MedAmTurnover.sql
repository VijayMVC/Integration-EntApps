/***************************************************************************************
HR Turnover Reporting:
	-- Created by J. Rogers on 2/21/2011
	-- Last update on 3/6/2012

***************************************************************************************/

CREATE PROCEDURE usp_MedAmTurnover AS


DECLARE @startDate datetime
DECLARE	@endDate datetime

SET @startDate = 
		CASE 
			WHEN month(getDate()) = 1 THEN '12/1/' + cast(year(getDate())-1 as varchar)
			ELSE cast(month(getDate()) -1 as varchar) + '/1/' + cast(year(getDate()) as varchar)
		END
SET @endDate = 	
		cast(month(getDate())  as varchar) + '/1/' + cast(year(getDate()) as varchar)
		


-- For Manual Loads
--SET @startDate = '2/1/2012'
--SET @endDate = '3/1/2012'

BEGIN
select cast(datepart(yyyy,@startDate)as varchar) + 
	
	CASE	WHEN len(datepart(mm,@startDate))=1  THEN
		'0' + cast(datepart(mm,@startDate) as varchar)
		ELSE cast(datepart(mm,@startDate) as varchar) 
	END as yrmth,
	a.employee, ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)) as emp_name,
	a.department,dc.name as dept_name, a.job_code,a.R_Position,
	--ep.supervisor ep_supervisor, ep.supervisor_ind, 
	a.supervisor,convert(varchar,a.date_hired,101) date_hired, a.salary_class,a.exempt_emp,
	CASE	WHEN convert(varchar,a.term_date,101) ='01/01/1753' THEN ' '
		ELSE convert(varchar,a.term_date,101) 
	END as term_date,
	pah.reason_01, pah.reason_02,
	a.fte_total, a.emp_status,	
	Left(ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)),charindex(',',ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)))+2) + ' - ' + a.emp_status 
	as emp_name_status,
	pa.sex, 
	CASE	WHEN pa.eeo_class = '' THEN 'NO ENTRY'
		ELSE pa.eeo_class
	END as eeo_class, 
	convert(varchar,pa.birthdate,101) as birthdate,
	CASE 	WHEN a.term_date <> '01/01/1753' AND a.term_date < @endDate THEN
			CASE	WHEN month(a.date_hired)<=month(a.term_date) THEN 
				datediff(yy,a.date_hired,a.term_date) * 12 + 
				datediff(mm,a.date_hired,a.term_date)% 12  
			ELSE 	(datediff(yy,a.date_hired,a.term_date)-1) * 12  + 
				datediff(mm,a.date_hired,a.term_date)% 12 
			END
		ELSE  
			CASE	WHEN month(a.date_hired)<=month(a.term_date) THEN 
				datediff(yy,a.date_hired,@endDate-1) * 12 + 
				datediff(mm,a.date_hired,@endDate-1)% 12  
			ELSE 	(datediff(yy,a.date_hired,@endDate-1)-1) * 12  + 
				datediff(mm,a.date_hired,@endDate-1)% 12 
			END
	END as LOS_current_months,

	CASE 	WHEN a.term_date <> '01/01/1753' AND a.term_date < @endDate THEN
			CASE	WHEN month(a.date_hired)<=month(a.term_date) THEN 
				datediff(yy,a.date_hired,a.term_date)  + 
				(datediff(mm,a.date_hired,a.term_date)% 12) /12  
			ELSE 	(datediff(yy,a.date_hired,a.term_date)-1)   + 
				(datediff(mm,a.date_hired,a.term_date)% 12)/12 
			END
		ELSE  
			CASE	WHEN month(a.date_hired)<=month(a.term_date) THEN 
				datediff(yy,a.date_hired,@endDate-1)  + 
				(datediff(mm,a.date_hired,@endDate-1)% 12) /12  
			ELSE 	(datediff(yy,a.date_hired,@endDate-1)-1)   + 
				(datediff(mm,a.date_hired,@endDate-1)% 12)/12 
			END
	END as LOS_current_years,
	
	'Unknown' as LOS_group,

	CASE WHEN a.term_date <> '01/01/1753' THEN
		CASE	WHEN month(a.date_hired)<=month(a.term_date) THEN 
			datediff(yy,a.date_hired,a.term_date) * 12 + 
			datediff(mm,a.date_hired,a.term_date)% 12  
		ELSE 	(datediff(yy,a.date_hired,a.term_date)-1) * 12  + 
			datediff(mm,a.date_hired,a.term_date)% 12 
		END
	--ELSE 0 
	END as LOS_term_months,
	
	CASE WHEN a.term_date <> '01/01/1753' AND a.term_date < @endDate THEN
		CASE	WHEN month(a.date_hired)<=month(a.term_date) THEN 
			datediff(yy,a.date_hired,a.term_date) + 
			(datediff(mm,a.date_hired,a.term_date)% 12)/12  
		ELSE 	(datediff(yy,a.date_hired,a.term_date)-1)  + 
			(datediff(mm,a.date_hired,a.term_date)% 12)/12 
		END
		--ELSE 0 
	END as LOS_term_years,

	CASE WHEN pa.birthdate <> '01/01/1753' THEN
		CASE	
		WHEN month(pa.birthdate)<=month(getDate()) THEN 
			datediff(yy,pa.birthdate,@endDate-1) * 12 + 
			datediff(mm,pa.birthdate,@endDate-1)% 12  
		ELSE 	(datediff(yy,pa.birthdate,@endDate-1) -1) * 12  +
			datediff(mm,pa.birthdate,@endDate-1)% 12 
		END
	ELSE 0 
	END / 12 as Age_current,
	
	'UNKNOWN' as LOS_AgeGroup,
	
	CASE WHEN a.date_hired <> '01/01/1753' THEN
		CASE	
		WHEN month(pa.birthdate)<=month(a.date_hired) THEN 
			datediff(yy,pa.birthdate,a.date_hired) * 12 + 
			datediff(mm,pa.birthdate,a.date_hired)% 12  
		ELSE 	(datediff(yy,pa.birthdate,a.date_hired) -1) * 12  +
			datediff(mm,pa.birthdate,a.date_hired)% 12 
		END
	ELSE 0 
	END / 12 as Age_hired,
	CASE WHEN a.term_date <> '01/01/1753' THEN
		CASE	
		WHEN month(pa.birthdate)<=month(a.term_date) THEN 
			datediff(yy,pa.birthdate,a.term_date) * 12 + 
			datediff(mm,pa.birthdate,a.term_date)% 12  
		ELSE 	(datediff(yy,pa.birthdate,a.term_date) -1) * 12  +
			datediff(mm,pa.birthdate,a.term_date)% 12 
		END
	--ELSE 0 
	END / 12 as Age_termed,
	CASE	WHEN a.date_hired >= @startDate THEN 'Y'
		ELSE 'N'
	END as newHire_flag,
	CASE 	WHEN a.date_hired < @startDate AND 
			(a.term_date >= @endDate or a.term_date < '1/1/1901') THEN 'Y'
		ELSE 'N'
	END as active_nonNewHire_flag,
	CASE	WHEN a.term_date >= @startDate AND a.term_date < @endDate THEN 'Y'
		ELSE 'N'
	END as termed_flag,
	getDate() as CreDate
	
into #tmpTurnover	
	
from lawsonEmployee a 
	inner join lawsonPAemployee pa ON a.employee = pa.employee
	inner join lawsonDeptCode dc ON a.company=dc.company
					And a.process_level = dc.process_level
					and a.department = dc.department
	left outer join lawsonPERSACTHST pah ON a.employee = pah.employee
		and pah.action_code = 'TERM PEND'
		and a.emp_status like 'T%'
		and pah.effect_date = a.term_date
	--inner join lawsonPAEMPPOS ep on a.employee = ep.employee
where a.process_level = 9100
	-- terminated employees who are unable to have a term date entered in Lawson
	and a.employee NOT IN (2738,2564,4053,2485,2164) 
	and a.date_hired < @endDate
	and (a.term_date >= @startDate OR a.term_date ='1/1/1753')
;

update #tmpTurnover
set LOS_group = a.los_group
FROM
(
	Select employee,
		CASE 	WHEN LOS_current_years < 1 Then '< 1'
			WHEN LOS_current_years < 2 Then '1-1.9'
			WHEN LOS_current_years < 3 Then '2-2.9'
			WHEN LOS_current_years < 4 Then '3-3.9'
			WHEN LOS_current_years < 5 Then '4-4.9'
			WHEN LOS_current_years < 10 Then '5-9.9'
			WHEN LOS_current_years < 15 Then '10-14.9'
			WHEN LOS_current_years < 20 Then '15-19.9'
			WHEN LOS_current_years >= 20 Then '20+'
			ELSE 'UNKNOWN'
		END as los_group
	from #tmpTurnover
)a
WHERE #tmpTurnover.employee = a.employee
;


update #tmpTurnover
set LOS_AgeGroup = a.ageGroup
FROM
	(
	Select employee,
		CASE	WHEN Age_current < 25 THEN '<25'
			WHEN Age_current < 30 THEN '25-29.9'
			WHEN Age_current < 35 THEN '30-34.9'
			WHEN Age_current < 40 THEN '35-39.9'
			WHEN Age_current < 45 THEN '40-44.9'
			WHEN Age_current < 50 THEN '45-49.9'
			WHEN Age_current < 55 THEN '50-54.9'
			WHEN Age_current < 60 THEN '55-59.9'
			WHEN Age_current >= 60 THEN '60+'
			ELSE 'UNKNOWN'	
		END as ageGroup
	From #tmpTurnover
	) a
WHERE #tmpTurnover.employee = a.employee
;


-- Refresh current month's data
Delete from LawsonMedAmericaTurnover
where Yrmth = cast(datepart(yyyy,@startDate)as varchar) + 	
			CASE	WHEN len(datepart(mm,@startDate))=1  THEN
				'0' + cast(datepart(mm,@startDate) as varchar)
				ELSE cast(datepart(mm,@startDate) as varchar) 
			END
;

Insert into LawsonMedAmericaTurnover 
select * from #tmpTurnover
--order by dept_name
;

update LawsonMedAmericaTurnover
set eeo_class=ltrim(rtrim(eeo_class))
;

update LawsonMedAmericaTurnover
set age_termed = NULL,
	los_term_months = NULL,
	term_date=' ',
	emp_status='A1'
where employee = 4601
and yrmth='201101'

update lawsonMedamericaTurnover
SET emp_status = 
	CASE	WHEN left(reason_01,5)='T-VOL' THEN 'T1'
			WHEN  left(reason_01,5)='T-INV' THEN 'T2'
			ELSE emp_status
	END
WHERE emp_status = 'T0'	

drop table #tmpTurnover
;
		

END
	