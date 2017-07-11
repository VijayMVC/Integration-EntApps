

create view [dbo].[vw_LawsonPApendingChanges] 
as
select top 1000
	CASE WHEN provider_action = 'JOB CHANGE' THEN
		CASE WHEN new_site_id <> prev_site_id THEN 'PRIMARY CHANGE'
			WHEN new_position <> prev_position THEN 'POSITION CHANGE'
		ELSE provider_action
		END
	ELSE provider_action 
	END as provider_action,
	CONVERT(varchar,effective_date,101) as effective_date,
	provider_name,lawson_id,pos_level,
	CASE WHEN new_site <> prev_site THEN new_site
		ELSE ''
	END as new_site,
	CASE WHEN new_site_id <> prev_site_id THEN new_site_id
		ELSE ''
	END as new_site_id,
	prev_site,prev_site_id,	
	CASE WHEN new_position <> prev_position THEN new_position
		ELSE ''
	END as new_position,
	prev_position,
	new_status,prev_status,new_rate,prev_pay_rate,
	reason_01 ,reason_02,
	CONVERT(varchar,ben_date_1,101) as ben_date_1,
	CONVERT(varchar,ben_date_2,101) as ben_date_2
from LawsonPApendingChanges 
group by 
		CASE WHEN provider_action = 'JOB CHANGE' THEN
		CASE WHEN new_site_id <> prev_site_id THEN 'PRIMARY CHANGE'
			WHEN new_position <> prev_position THEN 'POSITION CHANGE'
		ELSE provider_action
		END
	ELSE provider_action 
	END,
	CONVERT(varchar,effective_date,101),
	provider_name,lawson_id,pos_level,
	CASE WHEN new_site <> prev_site THEN new_site
		ELSE ''
	END ,
	CASE WHEN new_site_id <> prev_site_id THEN new_site_id
		ELSE ''
	END ,
	prev_site,prev_site_id,	
	CASE WHEN new_position <> prev_position THEN new_position
		ELSE ''
	END ,
	prev_position,
	new_status,prev_status,new_rate,prev_pay_rate,
	reason_01 ,reason_02,
	CONVERT(varchar,ben_date_1,101) ,
	CONVERT(varchar,ben_date_2,101)
order by lawson_id, pos_level


