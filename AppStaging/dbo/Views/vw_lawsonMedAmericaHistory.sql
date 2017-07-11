CREATE VIEW [dbo].[vw_lawsonMedAmericaHistory] AS
(
	SELECT hrh.date_stamp, 
	replace(convert(varchar,hrh.date_stamp,111),'/','') +
	CASE 
		WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
			'00' + CAST(hrh.time_stamp as varchar)
		WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
			'0' + CAST(hrh.time_stamp as varchar)
		ELSE CAST(hrh.time_stamp as varchar)
	END as date_time_stamp, 
	hrh.time_stamp,
	hrh.beg_date, pad.item_name, ep.job_code,
	CASE
		WHEN pad.data_type = 'A' THEN hrh.A_VALUE
		WHEN pad.data_type = 'D' THEN CONVERT(varchar,hrh.D_VALUE,101)
		WHEN pad.data_type = 'N' THEN CAST(hrh.N_VALUE as varchar)
	END as change_value, 
	ep.employee,
	hrh.pos_level
	FROM LawsonHRHISTORY hrh INNER JOIN LawsonPADICT pad ON hrh.fld_nbr = pad.fld_nbr 
		INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep ON ep.employee = hrh.employee 
			AND ep.pos_level = hrh.pos_level
			--AND ep.date_stamp = hrh.date_stamp
			AND ep.effect_date = hrh.beg_date
	WHERE 	process_level=9100
		-- Omit ACC
		AND ep.Department NOT IN ('065','093','094')
		AND hrh.fld_nbr in (14,19,20,24,56,62,899)
	GROUP BY
		hrh.date_stamp, 
		replace(convert(varchar,hrh.date_stamp,111),'/','') +
		CASE 
			WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
			'00' + CAST(hrh.time_stamp as varchar)
			WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
			'0' + CAST(hrh.time_stamp as varchar)
			ELSE CAST(hrh.time_stamp as varchar)
		END, 
		hrh.time_stamp,
		hrh.beg_date, pad.item_name, ep.job_code,
		CASE
			WHEN pad.data_type = 'A' THEN hrh.A_VALUE
			WHEN pad.data_type = 'D' THEN CONVERT(varchar,hrh.D_VALUE,101)
			WHEN pad.data_type = 'N' THEN CAST(hrh.N_VALUE as varchar)
		END, 
		ep.employee,
		hrh.pos_level
	
UNION ALL

-- Join Benefit Date 2 Changes to the view
	SELECT hrh.date_stamp, 
		replace(convert(varchar,hrh.date_stamp,111),'/','') +
		CASE 
			WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
				'00' + CAST(hrh.time_stamp as varchar)
			WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
				'0' + CAST(hrh.time_stamp as varchar)
			ELSE CAST(hrh.time_stamp as varchar)
		END as date_time_stamp, 
		hrh.time_stamp,
		hrh.beg_date, pad.item_name, ' ' as job_code,
		CONVERT(varchar,hrh.D_VALUE,101) as change_value, 
		ep.employee,
		hrh.pos_level
	FROM LawsonHRHISTORY hrh INNER JOIN LawsonPADICT pad ON hrh.fld_nbr = pad.fld_nbr 
		INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep ON ep.employee = hrh.employee 
			AND ep.pos_level = hrh.pos_level
	WHERE 	process_level=9100
		-- Omit ACC
		AND ep.Department NOT IN ('065','093','094')
		AND hrh.fld_nbr =83
		AND ep.employee IN
	(
		select employee
		from
		(
			select hrh.date_stamp, 
			replace(convert(varchar,hrh.date_stamp,111),'/','') +
			CASE 
				WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
					'00' + CAST(hrh.time_stamp as varchar)
				WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
					'0' + CAST(hrh.time_stamp as varchar)
				ELSE CAST(hrh.time_stamp as varchar)
			END as date_time_stamp, 
			hrh.time_stamp,
			hrh.beg_date, pad.item_name, ' ' as job_code,
			CONVERT(varchar,hrh.D_VALUE,101) as change_value, 
			ep.employee,
			hrh.pos_level
			FROM LawsonHRHISTORY hrh INNER JOIN LawsonPADICT pad ON hrh.fld_nbr = pad.fld_nbr 
				INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep ON ep.employee = hrh.employee 
					AND ep.pos_level = hrh.pos_level
					--AND ep.date_stamp = hrh.date_stamp
					--AND ep.effect_date = hrh.beg_date
			WHERE 	process_level=9100
				-- Omit ACC
				AND ep.Department NOT IN ('065','093','094')
				AND hrh.fld_nbr =83
			GROUP BY
				hrh.date_stamp, 
				replace(convert(varchar,hrh.date_stamp,111),'/','') +
				CASE 
					WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
						'00' + CAST(hrh.time_stamp as varchar)
					WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
						'0' + CAST(hrh.time_stamp as varchar)
					ELSE CAST(hrh.time_stamp as varchar)
				END, 
				hrh.time_stamp,
				hrh.beg_date, pad.item_name, 
				CONVERT(varchar,hrh.D_VALUE,101), 
				ep.employee,
				hrh.pos_level
		) x

		GROUP BY employee
		HAVING count(employee) > 1
	
	)
	GROUP BY
		hrh.date_stamp, 
		replace(convert(varchar,hrh.date_stamp,111),'/','') +
		CASE 
			WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
				'00' + CAST(hrh.time_stamp as varchar)
			WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
				'0' + CAST(hrh.time_stamp as varchar)
			ELSE CAST(hrh.time_stamp as varchar)
		END, 
		hrh.time_stamp,
		hrh.beg_date, pad.item_name, 
		CONVERT(varchar,hrh.D_VALUE,101), 
		ep.employee,
	hrh.pos_level
	
UNION ALL

-- Join Benefit Date 2 Changes for providers with effect_date of 1/1/2007
	SELECT hrh.date_stamp, 
		replace(convert(varchar,hrh.date_stamp,111),'/','') +
		CASE 
			WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
				'00' + CAST(hrh.time_stamp as varchar)
			WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
				'0' + CAST(hrh.time_stamp as varchar)
			ELSE CAST(hrh.time_stamp as varchar)
		END as date_time_stamp, 
		hrh.time_stamp,
		hrh.beg_date, pad.item_name, ' ' as job_code,
		CONVERT(varchar,hrh.D_VALUE,101) as change_value, 
		ep.employee,
		hrh.pos_level
	FROM LawsonHRHISTORY hrh INNER JOIN LawsonPADICT pad ON hrh.fld_nbr = pad.fld_nbr 
		INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep ON ep.employee = hrh.employee 
			AND ep.pos_level = hrh.pos_level
	WHERE 	process_level=9100
		-- Omit ACC
		AND ep.Department NOT IN ('065','093','094')
		AND hrh.fld_nbr =83
		AND ep.employee IN
	(
		select x.employee
		from
		(
			select hrh.date_stamp, 
			replace(convert(varchar,hrh.date_stamp,111),'/','') +
			CASE 
				WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
					'00' + CAST(hrh.time_stamp as varchar)
				WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
					'0' + CAST(hrh.time_stamp as varchar)
				ELSE CAST(hrh.time_stamp as varchar)
			END as date_time_stamp, 
			hrh.time_stamp,
			hrh.beg_date, pad.item_name, ' ' as job_code,
			CONVERT(varchar,hrh.D_VALUE,101) as change_value, 
			ep.employee,
			hrh.pos_level
			FROM LawsonHRHISTORY hrh INNER JOIN LawsonPADICT pad ON hrh.fld_nbr = pad.fld_nbr 
				INNER JOIN AppStaging.dbo.LawsonPAEMPPOS ep ON ep.employee = hrh.employee 
					AND ep.pos_level = hrh.pos_level
					--AND ep.date_stamp = hrh.date_stamp
					--AND ep.effect_date = hrh.beg_date
			WHERE 	process_level=9100
				-- Omit ACC
				AND ep.Department NOT IN ('065','093','094')AND hrh.fld_nbr =83
			GROUP BY
				hrh.date_stamp, 
				replace(convert(varchar,hrh.date_stamp,111),'/','') +
				CASE 
					WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
						'00' + CAST(hrh.time_stamp as varchar)
					WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
						'0' + CAST(hrh.time_stamp as varchar)
					ELSE CAST(hrh.time_stamp as varchar)
				END, 
				hrh.time_stamp,
				hrh.beg_date, pad.item_name, 
				CONVERT(varchar,hrh.D_VALUE,101), 
				ep.employee,
				hrh.pos_level
		) x
		
		GROUP BY x.employee
		HAVING count(x.employee) =1 
	
	)
	AND ep.employee IN
		(select ep.employee
		from AppStaging.dbo.LawsonPAEMPPOS ep
		WHERE 	process_level=9100
			-- Omit ACC
			AND ep.Department NOT IN ('065','093','094')
			AND ep.POS_LEVEL = 1
			AND ep.effect_date='1/1/2007'
			AND ep.employee IN
				(SELECT employee
				FROM AppStaging.dbo.LawsonPAEMPPOS
				WHERE fte=.25
				)
	)
	GROUP BY
		hrh.date_stamp, 
		replace(convert(varchar,hrh.date_stamp,111),'/','') +
		CASE 
			WHEN len(CAST(hrh.time_stamp as varchar)) =4  THEN 
				'00' + CAST(hrh.time_stamp as varchar)
			WHEN len(CAST(hrh.time_stamp as varchar)) =5   THEN 
				'0' + CAST(hrh.time_stamp as varchar)
			ELSE CAST(hrh.time_stamp as varchar)
		END, 
		hrh.time_stamp,
		hrh.beg_date, pad.item_name, 
		CONVERT(varchar,hrh.D_VALUE,101), 
		ep.employee,
		hrh.pos_level
)
