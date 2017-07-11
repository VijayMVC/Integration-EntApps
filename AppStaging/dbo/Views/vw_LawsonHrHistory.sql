create view [dbo].[vw_LawsonHrHistory] as
select * from LawsonHRHISTORY a
where cast(a.pos_level as varchar)+'|'+ cast(a.fld_nbr as varchar)+'|'+ cast(a.seq_nbr as varchar) IN
(
	select cast(b.pos_level as varchar)+'|'+ cast(b.fld_nbr as varchar)+'|'+ cast(max(b.seq_nbr) as varchar)
	from LawsonHRHISTORY b
	where b.date_stamp=a.date_stamp
		and b.employee = a.employee
	group by b.pos_level, b.fld_nbr
)
--order by a.employee, a.date_stamp, a.beg_date, a.pos_level, a.fld_nbr
