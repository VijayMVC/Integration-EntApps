
CREATE PROCEDURE [dbo].[usp_PAretention] AS
BEGIN

select 	e.employee,
	ltrim(rtrim(e.first_name)) + ' ' + ltrim(rtrim(e.last_name)) as emp_name,
	convert(varchar, e.date_hired, 101) date_hired,
	CASE
		WHEN e.term_date = '1/1/1753' THEN ''
		ELSE convert(varchar, e.term_date,101)
	END as term_date,
	'UNK' as hire_status,
	'UNK' as cur_status,
	'0000' as hire_process_level,
	'                               ' as hire_site,
	'0000' as cur_process_level,
	'                               ' as cur_site,
	'                ' as reason_01,
	'                ' as reason_02,
	convert(varchar, min(ep.effect_date),101) as effect_date,
	'00/00/0000' as hire_process_date, 
	'00/00/0000' as cur_process_date	
into #tmpRetention
from AppStaging.dbo.LawsonPAEMPPOS ep INNER JOIN AppStaging.dbo.LawsonEMPLOYEE e ON ep.employee = e.employee
where ep.pos_level = 1
and (LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP' 
				OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP' )
group by e.date_hired, e.term_date, e.employee, ltrim(rtrim(e.first_name)) + ' ' + ltrim(rtrim(e.last_name))
order by e.employee
;

update #tmpRetention
set hire_process_date = a.date_stamp
from
(
	select tr.date_hired, tr.effect_date, tr.term_date, tr.employee, 
		convert(varchar, max(ep.date_stamp), 101) as date_stamp
	from #tmpRetention tr INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep
	 	ON tr.employee = ep.employee AND tr.effect_date = ep.effect_date
	where ep.pos_level=1
	group by tr.date_hired, tr.effect_date, tr.term_date, tr.employee
) a
where #tmpRetention.employee = a.employee
;

update #tmpRetention
set cur_process_date = a.date_stamp
from
(
	select tr.employee, ep.pos_level,
		convert(varchar, max(ep.date_stamp), 101) as date_stamp
	from #tmpRetention tr INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep
	 	ON tr.employee = ep.employee 
	where ep.pos_level=1
	group by tr.employee, ep.pos_level
) a
where #tmpRetention.employee = a.employee
and a.pos_level = 1
;

update #tmpRetention
set hire_status = a.fte,
	hire_process_level = a.process_level	
from
(
	select tr.date_hired, tr.effect_date, tr.term_date, tr.employee, 
		CASE
			WHEN ep.fte = 1 THEN 'A1'
			WHEN ep.fte = .5 THEN 'A2'
			WHEN ep.fte = .25 THEN 'A6'
			ELSE 'UNK' 
		END as fte,
		cast(ep.process_level as varchar) as process_level
	from #tmpRetention tr INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep
	 	ON tr.employee = ep.employee 
		AND tr.effect_date = ep.effect_date
		AND tr.hire_process_date = ep.date_stamp
	where ep.pos_level=1
	group by tr.date_hired, tr.effect_date, tr.term_date, tr.employee, ep.fte, ep.process_level
) a
where #tmpRetention.employee = a.employee
;

update #tmpRetention
set cur_status = a.emp_status,
	cur_process_level = a.process_level	
from
(
	select tr.date_hired, tr.effect_date, tr.term_date, tr.employee, 
		e.emp_status,
		cast(ep.process_level as varchar) as process_level
	from #tmpRetention tr 
	INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep
	 	ON tr.employee = ep.employee 
		AND tr.cur_process_date = ep.date_stamp
	INNER JOIN AppStaging.dbo.LawsonEMPLOYEE e
	 	ON tr.employee = e.employee 
	where ep.pos_level=1
	group by tr.date_hired, tr.effect_date, tr.term_date, tr.employee, e.emp_status, ep.process_level
) a
where #tmpRetention.employee = a.employee
;

update #tmpRetention
set term_date = a.term_date	
from
(
	select employee, convert(varchar, max(effect_date), 101) as term_date
	from AppStaging.dbo.LawsonPERSACTHST
	where pos_level=1
	and action_code = 'TERM'
	group by employee
) a
where #tmpRetention.employee = a.employee
and #tmpRetention.term_date=''
and left(#tmpRetention.cur_status,1) = 'T'
;


update #tmpRetention
set hire_site = upper(a.name)
from
(
	select process_level, name
	from AppStaging.dbo.LawsonPRSYSTEM	
) a
where #tmpRetention.hire_process_level = a.process_level
;


update #tmpRetention
set cur_site = upper(a.name)
from
(
	select process_level, name
	from AppStaging.dbo.LawsonPRSYSTEM	
) a
where #tmpRetention.cur_process_level = a.process_level
;

update #tmpRetention
set reason_01 = a.reason_01,
	reason_02 = a.reason_02
from
(
	select employee, reason_01, reason_02, date_stamp, effect_date
	from AppStaging.dbo.LawsonPERSACTHST
	where action_code LIKE 'TERM%'
) a
where #tmpRetention.employee = a.employee
and #tmpRetention.term_date = a.effect_date
;

update #tmpRetention
set reason_01 = a.reason_01
from
(
	select employee, reason_01, reason_02, date_stamp, max(effect_date) as effect_date
	from AppStaging.dbo.LawsonPERSACTHST
	where action_code = 'TERM'
	group by employee, reason_01, reason_02, date_stamp
) a
where #tmpRetention.employee = a.employee
and ltrim(rtrim(#tmpRetention.reason_01)) = ''
;

update #tmpRetention
set reason_02 = a.reason_02
from
(
	select employee, reason_01, reason_02, date_stamp, max(effect_date) as effect_date
	from AppStaging.dbo.LawsonPERSACTHST
	where action_code = 'TERM'
	group by employee, reason_01, reason_02, date_stamp
) a
where #tmpRetention.employee = a.employee
and ltrim(rtrim(#tmpRetention.reason_02)) = ''
;


truncate table LawsonPAretention
;


insert into LawsonPAretention
select * 
from #tmpRetention
;

drop table #tmpRetention

END

