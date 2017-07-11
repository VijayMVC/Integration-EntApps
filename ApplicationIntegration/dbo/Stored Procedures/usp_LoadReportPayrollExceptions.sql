
CREATE PROCEDURE [dbo].[usp_LoadReportPayrollExceptions] AS


/*Stored Procedure will load data for Business Ojects report to identify common exceptions with online payroll.
Antonia Miller - 7/13/2007*/
	TRUNCATE TABLE ApplicationIntegration.dbo.ReportPayrollExceptions

	/*New PAs that have a timecard but aren't on the schedule, they may have worked admin hours 
	or went to training and need to be hired in payroll system*/
	INSERT INTO ApplicationIntegration.dbo.ReportPayrollExceptions
	(AuditMessage, 
	LastName,
	FirstName,
	TimecardDate,
	PAorMD,
	TCOrphanFlag)
 
	SELECT DISTINCT
	'PA HAS TIMECARD BUT NOT ON SCHEDULE', 
	LastName, 
	FirstName,
	dat,
	'PA',
	'Y'
	FROM AppStaging.dbo.PA_TCPIP_details, ApplicationIntegration.dbo.physicianinfo
		WHERE AppStaging.dbo.PA_TCPIP_details.tcid = ApplicationIntegration.dbo.physicianinfo.id 
			AND NOT EXISTS (SELECT 1 FROM AppStaging.dbo.PA_CAL_schedule_slots 
				WHERE tcid =  uid_n and date >= getdate() -20) AND dat > = getdate() - 20
					ORDER BY LastName, dat DESC


	INSERT INTO ApplicationIntegration.dbo.ReportPayrollExceptions
	(AuditMessage, 
	PAorMD,
	TCOrphanFlag)
	SELECT
	'THERE ARE CURRENTLY NO PAs WITH A TIMECARD BUT NO SCHEDULE HOURS',
	'PA',
	'N'
		WHERE NOT EXISTS 
			(SELECT 1 FROM ApplicationIntegration.dbo.ReportPayrollExceptions 
				WHERE AuditMessage = 'PA HAS TIMECARD BUT NOT ON SCHEDULE')



	/*Who is on the schedule but not in ProviderMasterBase?? - MDs.*/
	INSERT INTO ReportPayrollExceptions
	(AuditMessage,
	LastName,
	FirstName,
	Title,
	ScheduleYear,
	ScheduleMonth,
	SiteLocationName,
	PAorMD)

	SELECT DISTINCT 
	'PHYSICIAN ON SCHEDULE BUT NOT IN MPDB',
	lastname, 
	firstname, 
	title, 
	year(date) as year, 
	month(date) as month, 
	HospitalName,
	'MD'
	FROM AppStaging.dbo.webcal_schedule_slots A , 
		ApplicationIntegration.DBO.physicianinfo B, 
		ApplicationIntegration.DBO.Hospital_region H
	WHERE uid_N = B.id AND A.Site = H.Code
	AND uid_N <> 0 
	AND [date] > = getdate() - 30 
	AND NOT EXISTS (SELECT 1 FROM providermasterbase 
	WHERE webid = A.uid_N) 
	ORDER BY lastname, firstname, month(date)


/*Who is on the schedule but not in ProviderMasterBase?? - PAs.*/
	INSERT INTO ReportPayrollExceptions
	(AuditMessage,
	LastName,
	FirstName,
	Title,
	ScheduleYear,
	ScheduleMonth,
	SiteLocationName)

	SELECT DISTINCT 
	'PA ON SCHEDULE BUT NOT IN MPDB',
	lastname, 
	firstname, 
	title, 
	year(date) as year, 
	month(date) as month, 
	HospitalName 
		FROM AppStaging.dbo.pa_cal_schedule_slots A, 
		ApplicationIntegration.DBO.physicianinfo B, 
		ApplicationIntegration.DBO.Hospital_region S
			WHERE uid_N = B.id AND A.Site = S.Code
			AND uid_N <> 0 
			AND [date] > = getdate() - 30 
			AND NOT EXISTS (SELECT 1 FROM providermasterbase 
			WHERE webid = A.uid_N)
			ORDER BY lastname, firstname, month(date)

