--if you want it in a order by size you can use this proc.



CREATE procedure [dbo].[Proc_biggestables] @topcount int = 50
as
declare @pagesize bigint
declare @dbid int

select @pagesize = low
from master.dbo.spt_values
where number = 1
and type = 'E'

declare @spt_space table
(
objid int null,
rows int null,
reserved int null,
data int null,
indexp int null,
unused int null
)

insert into @spt_space
select objid = id,
rows = sum(case when indid in (0, 1) then rowcnt else 0 end),
reserved = sum(case when indid in (0, 1, 255)
then reserved
else 0
end) * @pagesize / 1024,
data = sum(case when indid in (0, 1) then dpages
when indid = 255 then used
else 0
end) * @pagesize / 1024,
indexp = sum(case when indid in (0, 1, 255)
then used
else 0
end) * @pagesize / 1024,
unused = sum(case when indid in (0, 1, 255)
then used
else 0
end) * @pagesize / 1024
from sysindexes
where rowcnt > 0
group
by id, indid
order
by reserved desc

set rowcount @topcount
select Table_Name = name,
rows,
reserved_KB = ltrim(str(reserved,15,0) + ' ' + 'KB'),
data_KB = ltrim(str(data,15,0) + ' ' + 'KB'),
index_size_KB = ltrim(str(indexp - data,15,0) + ' ' + 'KB'),
unused_KB = ltrim(str(reserved - unused,15,0) + ' ' + 'KB'),
idx_data_ratio = ltrim(str((indexp - data)*100 /data) + '%'),
unused_pct = ltrim(str((reserved - unused) * 100 /reserved) + '%')
from @spt_space s join sysobjects o on o.id = s.objid and xtype = 'U'
where data > 0
order
by reserved desc
set rowcount 0
