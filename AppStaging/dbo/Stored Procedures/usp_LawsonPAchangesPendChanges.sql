



--exec usp_LawsonPAchangesPendChanges
--DROP Procedure usp_LawsonPAchangesPendChanges

/********************************************************************************************************************
Author: 	Jim Rogers  
Date: 		8/22/2011
Purpose:	This Routine is used to Extract/Transform/Load PA & NP changes from Lawson tables into 
		the following tables:
			LawsonPAaddSite
			LawsonPAbenDate2
			LawsonPAdropSite
			LawsonPAnewHire
			LawsonPApayChange
			LawsonPAposChange
			LawsonPAprimaryChange 
			LawsonPAreHire
			LawsonPAstatusChange
			LawsonPAterm

		The routine is called by DTS Package "Lawson - Report - Employee Changes - PA - New"


*******************************************************************************************************************/

CREATE PROCEDURE [dbo].[usp_LawsonPAchangesPendChanges] AS

DECLARE @lastProcessDate datetime
SET @lastProcessDate = (select max(cast(convert(varchar,date_stamp,101)as datetime)) as maxProcessDate 
			from LawsonPAhrhChanges)


/*for manual loads:  	Set @lastProcessDate to the last processed date
			All tables will reload will data processed after the @lastProcessDate*/
--SET @lastProcessDate = '7/04/2012'

BEGIN

SELECT 	

	hrh.DATE_STAMP, hrh.Beg_date, e.LAST_NAME, e.FIRST_NAME,
	pos.DESCRIPTION, jc.description as job_description, pr.name as site_name,
	pah.ACTION_CODE, d.ITEM_NAME, d.PERS_ACTION,hrh.FLD_NBR, hrh.SEQ_NBR, 
	hrh.N_VALUE, hrh.A_VALUE, hrh.D_VALUE, 
	ep.PAY_RATE, ep.FTE, ep.job_code, ep.r_position, ep.EMPLOYEE,
	pah.OBJ_ID, pah.ACTION_NBR, ep.process_level, ep.POS_LEVEL,
	ep.department, pah.REASON_01, pah.REASON_02,e.EMP_STATUS, e.DATE_HIRED, e.TERM_DATE,
	ep.EFFECT_DATE, ep.END_DATE, ep.POS_EFF_DT,pah.ANT_END_DATE, pae.BEN_DATE_1, pae.BEN_DATE_2, getDate() as lastRunDate
INTO #changes
FROM 	
	AppStaging.dbo.LawsonPAEMPPOS ep LEFT JOIN AppStaging.dbo.LawsonPERSACTHST as pah ON ep.employee = pah.employee 
		AND ep.pos_level = pah.pos_level
		AND (ep.date_stamp = pah.date_stamp or ep.effect_date = pah.effect_date)
	LEFT JOIN AppStaging.dbo.LawsonHRHISTORY as hrh ON pah.OBJ_ID = hrh.ACT_OBJ_ID
	LEFT JOIN AppStaging.dbo.LawsonPADICT as d ON d.FLD_NBR = hrh.FLD_NBR
	LEFT JOIN AppStaging.dbo.LawsonPAEMPLOYEE pae ON pah.employee = pae.employee

	INNER JOIN AppStaging.dbo.LawsonEmployee e ON e.employee = ep.employee
	INNER JOIN AppStaging.dbo.LawsonPAPOSITION pos ON pos.R_POSITION = ep.R_POSITION
	INNER JOIN AppStaging.dbo.LawsonJOBCODE jc ON jc.JOB_CODE = ep.JOB_CODE
	INNER JOIN AppStaging.dbo.LawsonPRSYSTEM pr ON pr.process_level = ep.process_level
WHERE 	(LEFT(ep.job_code,6)='EPHYAS' OR LEFT(ep.job_code,4)='ERNP'
			OR LEFT(ep.job_code,6)='EDIRPA' OR LEFT(ep.job_code,8)= 'ELSNPANP'
			OR LEFT(ep.job_code,6)='EPT000')
	AND ep.PROCESS_LEVEL < 8000
	--AND hrh.date_stamp > @lastProcessDate
	AND d.fld_nbr in (14,20,24,27,56,62,82,83,126,127,553,899)
;


delete from #changes
where fld_nbr=899 
	and cast(n_value as decimal (15,2)) = cast(pay_rate as decimal (15,2))
;


delete from #changes
where fld_nbr=56
	and n_value = fte
;


delete from #changes
where fld_nbr=27 
	and d_value='1753-01-01 00:00:00.000'
;

-- move prior load data into history tables
insert into LawsonPApayChange_hist select * from LawsonPApayChange
insert into LawsonPAaddSite_hist select * from LawsonPAaddSite
insert into LawsonPAdropSite_hist select * from LawsonPAdropSite
insert into LawsonPAterm_hist select * from LawsonPAterm
insert into LawsonPAnewHire_hist select * from LawsonPAnewHire
insert into LawsonPAreHire_hist select * from LawsonPAreHire
insert into LawsonPAposchange_hist select * from LawsonPAposChange
insert into LawsonPAprimaryChange_hist select * from LawsonPAprimaryChange
insert into LawsonPAstatusChange_hist select * from LawsonPAstatusChange
insert into LawsonPAbenDate2_hist select * from LawsonPAbenDate2

--prepare tables for current change data
truncate table LawsonPApayChange
truncate table LawsonPAaddSite
truncate table LawsonPAdropSite
truncate table LawsonPAterm
truncate table LawsonPAnewHire
truncate table LawsonPAreHire
truncate table LawsonPAposChange
truncate table LawsonPAprimaryChange
truncate table LawsonPAstatusChange
truncate table LawsonPAbenDate2

truncate table LawsonPAhrhChanges;

insert into LawsonPAhrhChanges
select * 
from #changes;
--where date_stamp > @lastProcessDate


delete from LawsonPAaddsite_hist
where cast(processed_date as datetime) > @lastProcessDate;

-- Add Site
insert into LawsonPAaddSite
select 'ADD SITE' as changeType, convert(varchar,a.beg_date,101) as begin_date, 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)) as empName, a.employee, a.job_description, a.site_name,
	a.pos_level, 
	a.process_level, 
	pay_rate, fte, a.emp_status, convert(varchar,a.date_hired,101) as hire_date, 
	convert(varchar,a.ben_date_2,101) as ben_date2, convert(varchar,a.date_stamp,101) as processed_date
from #changes a 
where a.date_stamp > @lastProcessDate
and a.item_name='Process Level'
and a.action_code = 'JOBCHG'
and a.end_date < '1/1/1900'
and not exists
(
	select ep.employee
	from AppStaging.dbo.LawsonPAEMPPOS ep
	where a.employee = ep.employee
		AND a.process_level=ep.process_level
		AND (a.effect_date) -1 = ep.end_date
)
GROUP BY convert(varchar,a.beg_date,101), 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)), a.employee, a.job_description, a.site_name,
	a.pos_level, 
	a.process_level, 
	pay_rate, fte, a.emp_status, convert(varchar,a.date_hired,101) , 
	convert(varchar,a.ben_date_2,101), convert(varchar,a.date_stamp,101)
ORDER BY a.employee
;


delete from LawsonPAdropSite_hist
where cast(processed_date as datetime) > @lastProcessDate;

-- DRop Site
insert into LawsonPAdropSite
select 'DROP SITE' as changeType, convert(varchar,a.beg_date,101) as begin_date, 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)) as empName, a.employee, a.job_description, a.site_name,
	a.pos_level, 
	a.process_level, 
	pay_rate, fte, a.emp_status, convert(varchar,a.date_hired,101) as hire_date, 
	convert(varchar,a.ben_date_2,101) as ben_date2, convert(varchar,a.date_stamp,101) as processed_date
from #changes a 
	/*inner join AppStaging.dbo.lawsonPAEMPPOS ep 
		ON a.employee = ep.employee
		AND a.process_level=ep.process_level
		AND a.end_date = ep.end_date*/
where a.date_stamp > @lastProcessDate
and a.item_name IN ('Process Level', 'Stop Date')
and a.action_code = 'JOBCHG'
and a.end_date > '1/1/1900'
--and a.effect_date <> a.end_date
and not exists
(
	select ep.employee
	from AppStaging.dbo.LawsonPAEMPPOS ep
	where a.employee = ep.employee
		AND a.process_level=ep.process_level
		AND ep.end_date < '1/1/1900'
)
GROUP BY convert(varchar,a.beg_date,101), 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)), a.employee, a.job_description, a.site_name,
	a.pos_level, 
	a.process_level, 
	pay_rate, fte, a.emp_status, convert(varchar,a.date_hired,101) , 
	convert(varchar,a.ben_date_2,101), convert(varchar,a.date_stamp,101)
ORDER BY a.employee
;


delete from LawsonPAbenDate2_hist
where cast(processed_date as datetime) > @lastProcessDate;

-- Benefit Date 2
insert into LawsonPAbenDate2
select 'BENEFIT DATE2' as changeType, convert(varchar,a.beg_date,101) as begin_date, 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)) as empName, a.employee, a.job_description, a.site_name,
	a.pos_level, 
	a.process_level, 
	a.emp_status, convert(varchar,a.date_hired,101) as hire_date, 
	convert(varchar,a.ben_date_2,101) as ben_date2, convert(varchar,max(a.old_value),101) as prev_ben_date2,
	convert(varchar,a.date_stamp,101) as processed_date
from 
(
select b.d_value as old_value, a.* 
from #changes a, (select c.d_value, c.employee, max(c.date_stamp) as lastDateStamp
			from AppStaging.dbo.LawsonHRHISTORY c
			Where  c.fld_nbr = 83
			and c.date_stamp <= @lastProcessDate
			group by c.d_value, c.employee) b
where a.date_stamp > @lastProcessDate
and a.item_name='Benefit Date 2'
and a.action_code in ('STATUS', 'BENEFIT')
and a.end_date < '1/1/1900'
and a.employee *= b.employee
) a
GROUP By convert(varchar,a.beg_date,101), 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)) , a.employee, a.job_description, a.site_name,
	a.pos_level, 
	a.process_level, 
	a.emp_status, convert(varchar,a.date_hired,101), 
	convert(varchar,a.ben_date_2,101),
	convert(varchar,a.date_stamp,101)
ORDER BY a.employee desc
;




delete from LawsonPApayChange_hist
where cast(processed_date as datetime) > @lastProcessDate;

-- Pay Change
insert into LawsonPApayChange
select 
	CASE 	WHEN cast(firstPayDate as datetime) < cast(processed_date as datetime) THEN 'PAY CHANGE - RETRO'
		ELSE 'PAY CHANGE'
	END as changeType,
	*
FROM
(
	select 
		--'PAY CHANGE' as changeType, 
		convert(varchar,beg_date,101) as begin_date, 
		ltrim(rtrim(last_name)) + ', ' + ltrim(rtrim(first_name)) as empName, employee, job_description, site_name, pos_level,
		cast(n_value as decimal (10,2)) as new_payRate, pay_rate as old_payRate, fte,
		emp_status, convert(varchar,date_hired,101) as hire_date, 
		convert(varchar,ben_date_2,101) as ben_date2, convert(varchar,date_stamp,101) as processed_date,
		CASE 
			WHEN day(beg_date) <= 15 THEN 
				cast(month(beg_date) as varchar) + '/22/' + cast(year(beg_date) as varchar) 
			WHEN day(beg_date) > 15 THEN  
				cast(month(beg_date + 20) as varchar)  + '/07/' + cast(year(beg_date + 20) as varchar) 
			ELSE ''
		END as FirstPayDate
	from #changes
	where date_stamp > @lastProcessDate
		and fld_nbr=899
		and action_code = 'PAY CHANGE'
) x
ORDER BY employee, cast(processed_date as datetime) desc
;

delete from LawsonPAstatusChange_hist
where cast(processed_date as datetime) > @lastProcessDate;

--FTE Change
insert into LawsonPAstatusChange
select 
'FTE CHANGE' as changeType, convert(varchar,beg_date,101) as begin_date, 
	ltrim(rtrim(last_name)) + ', ' + ltrim(rtrim(first_name)) as empName, employee, job_description, site_name,
	pos_level, cast(n_value as decimal (10,3)) as new_fte, cast(fte as decimal(10,3)) as old_fte,reason_02,
	emp_status, convert(varchar,date_hired,101) as hire_date, 
	convert(varchar,ben_date_1,101) as ben_date1,
	convert(varchar,ben_date_2,101) as ben_date2, 
	convert(varchar,date_stamp,101) as processed_date
from #changes
where date_stamp > @lastProcessDate
and fld_nbr=56
and pos_level = 1
and cast(n_value as decimal (10,3)) > 0
and action_code = 'STATUS'
ORDER BY employee, date_stamp desc
;


delete from LawsonPAterm_hist
where cast(processed_date as datetime) > @lastProcessDate;

-- TERM
insert into LawsonPAterm
select 'TERM' as changeType, convert(varchar,a.term_date,101) as term_date, 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)) as empName, a.employee, a.job_description, a.site_name,
	a.process_level, a.pos_level, 
	--b.name as department, 
	a.fte, a.emp_status, a.reason_01, a.reason_02, convert(varchar,a.date_hired,101) as hire_date, 
	convert(varchar,a.ben_date_2,101) as ben_date2, convert(varchar,a.date_stamp,101) as processed_date
from #changes a 
--INNER JOIN AppStaging.dbo.LawsonDEPTCODE b on b.department = a.department
where a.date_stamp > @lastProcessDate
	and a.fld_nbr=20
	and a.action_code like 'TERM%'
	--and b.process_level=a.process_level
ORDER BY a.employee, a.date_stamp desc
;


delete from LawsonPAposChange_hist
where cast(processed_date as datetime) > @lastProcessDate;

-- Position Change
insert into LawsonPAposChange
select 
'POSITION CHANGE' as changeType, convert(varchar,a.beg_date,101) as begin_date, 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)) as empName, a.employee, 
	--a.description,ltrim(rtrim(a.A_VALUE)) as new_position, ltrim(rtrim(a.r_position)) as old_position,
	--b.name as department, 
	a.site_name, a.process_level, a.pos_level, c.description as position, d.description as old_position, 
	a.fte,	a.emp_status, convert(varchar,a.date_hired,101) as hire_date, 
	convert(varchar,a.ben_date_2,101) as ben_date2, convert(varchar,a.date_stamp,101) as processed_date
from #changes a 
	--INNER JOIN AppStaging.dbo.LawsonDEPTCODE b on b.department = a.department
	INNER JOIN AppStaging.dbo.LawsonPAPOSITION c on c.r_position = a.a_value	
	INNER JOIN AppStaging.dbo.LawsonPAPOSITION d on d.r_position = a.r_position
where a.fld_nbr=126
and a.date_stamp > @lastProcessDate
and a.a_value <> a.r_position
and right(rtrim(ltrim(a.a_value)),4) = right(rtrim(ltrim(a.r_position)),4)

ORDER BY a.employee, a.date_stamp desc
;


delete from LawsonPAprimaryChange_hist
where cast(processed_date as datetime) > @lastProcessDate;

-- Primary Change
select 'PRIMARY SITE CHANGE' as changeType,
convert(varchar,a.effect_date,101) as begin_date, 
ltrim(rtrim(e.last_name)) + ', ' + ltrim(rtrim(e.first_name)) as empName, 
a.employee, jc.description as job_description, c.name as new_site, d.name as old_site, 
'               ' as reason_02,
a.fte, e.emp_status,
convert(varchar, e.date_hired,101) as date_hired, 
convert(varchar,pae.ben_date_1,101) as benDate1, 
convert(varchar,pae.ben_date_2,101) as benDate2,
convert(varchar,a.date_stamp,101) as processed_date
into #tmpPrimary
from AppStaging.dbo.lawsonPAEMPPOS a inner join AppStaging.dbo.lawsonPAEMPPOS b on a.employee = b.employee and a.process_level <> b.process_level
	inner join AppStaging.dbo.lawsonEmployee e on a.employee = e.employee
	INNER JOIN AppStaging.dbo.LawsonPRSYSTEM c on c.process_level = a.process_level
	INNER JOIN AppStaging.dbo.LawsonPRSYSTEM d on d.process_level = b.process_level
	INNER JOIN AppStaging.dbo.LawsonJOBCODE jc ON jc.job_code = a.job_code
	INNER JOIN #changes ch on ch.employee = a.employee
		AND ch.pos_level = a.pos_level
		AND ch.process_level = a.process_level
	/*LEFT JOIN AppStaging.dbo.LawsonPERSACTHST as pah ON a.employee = pah.employee 
		AND a.pos_level = pah.pos_level
		AND (a.date_stamp = pah.date_stamp or a.effect_date = pah.effect_date)*/
	LEFT JOIN AppStaging.dbo.LawsonPAEMPLOYEE pae ON a.employee = pae.employee
where a.date_stamp > @lastProcessDate and (b.end_date) + 1 = a.effect_date
and a.pos_level =1
and b.pos_level = 1
and a.end_Date < '1/1/1900'
and ch.fld_nbr = 14
--and (pah.reason_02 is not null and pah.reason_02 <> ' ')
and 	(LEFT(a.job_code,6)='EPHYAS' OR LEFT(a.job_code,4)='ERNP'
			OR LEFT(a.job_code,6)='EDIRPA' OR LEFT(a.job_code,8)= 'ELSNPANP'
			OR LEFT(a.job_code,6)='EPT000')
	AND a.PROCESS_LEVEL < 8000
;

update #tmpPrimary
set reason_02 = a.reason_02
from (select b.reason_02, b.employee, b.date_stamp, b.effect_date, b.pos_level from AppStaging.dbo.LawsonPERSACTHST b) a
	where a.employee = #tmpPrimary.employee
	and a.pos_level=1
	and (a.date_stamp = #tmpPrimary.processed_date  or a.effect_date = #tmpPrimary.begin_date)
	and a.reason_02 <> ' '
	and a.reason_02 is not null


insert into LawsonPAprimaryChange
select *  from #tmpPrimary
group by changeType,
	begin_date, 
	empName, 
	employee, job_description, new_site, old_site, 
	reason_02,
	fte, emp_status,
	date_hired, 
	benDate1, 
	benDate2,
	processed_date
order by employee;


delete from LawsonPAnewHire_hist
where cast(processed_date as datetime) > @lastProcessDate;

-- New Hire
insert into LawsonPAnewHire
select 'NEW HIRE' as changeType, convert(varchar,a.beg_date,101) as begin_date, 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)) as empName, a.employee, a.job_description, a.site_name,
	--b.name as department, 
	a.process_level, 
	pay_rate, fte, a.emp_status, convert(varchar,a.date_hired,101) as hire_date, 
	--convert(varchar,a.ben_date_1,101) as ben_date1, 
	convert(varchar,a.ben_date_2,101) as ben_date2, convert(varchar,a.date_stamp,101) as processed_date
from #changes a 
	--INNER JOIN AppStaging.dbo.LawsonDEPTCODE b on b.department = a.department
	where a.date_stamp > @lastProcessDate
	and a.fld_nbr=126
	and a.action_code = 'HIRE'
	--and b.process_level=a.process_level
ORDER BY a.employee, a.date_stamp desc
;


delete from LawsonPArehire_hist
where cast(processed_date as datetime) > @lastProcessDate;

-- RE Hire
insert into LawsonPArehire
select 'RE-HIRE' as changeType, convert(varchar,a.beg_date,101) as begin_date, 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)) as empName, a.employee, a.job_description, a.site_name,
	--b.name as department, 
	a.process_level, 
	a.emp_status, a.pay_rate,convert(varchar,a.date_hired,101) as hire_date, 
	convert(varchar,a.ben_date_1,101) as ben_date1,
	convert(varchar,a.ben_date_2,101) as ben_date2, convert(varchar,a.date_stamp,101) as processed_date
from #changes a 
	--INNER JOIN AppStaging.dbo.LawsonDEPTCODE b on b.department = a.department
where 	a.action_code = 'REHIRE'
	and a.pos_level=1
	--and b.process_level=a.process_level	
	--and fld_nbr=126
	and a.date_stamp > @lastProcessDate
GROUP BY convert(varchar,a.beg_date,101), 
	ltrim(rtrim(a.last_name)) + ', ' + ltrim(rtrim(a.first_name)), a.employee, a.job_description, a.site_name,
	--ltrim(rtrim(A_VALUE)) as new_position,
	--b.name,
	a.process_level, 
	a.emp_status, a.pay_rate, convert(varchar,a.date_hired,101),
	convert(varchar,a.ben_date_1,101), 
	convert(varchar,a.ben_date_2,101), convert(varchar,a.date_stamp,101)
ORDER BY a.employee, a.processed_date desc
;

drop table #tmpPrimary;
drop table #changes;


END







