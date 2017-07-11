
CREATE PROCEDURE [dbo].[usp_LoadProviderHoursDetailsWebImport]
WITH RECOMPILE
AS

/* 	Author: 	
	Date:		
	Purpose:	Stored Procedure is called by DTS Package - MARS - Provider Hours - Details
			(Web Import) to load the ProviderHours table from the web.

	Revison:	9/1/2005 Mohamed Mahmoud: Added logic to include all data available
			10/12/2005 Antonia Miller:  Changed join to ProviderMaster database to use ProviderMasterBase
			as WebIDs are sometimes null in ProviderMaster.  Also, added WebID to the table for validation.
			Changed join to webcal_schedule_slots to UID_N instead of UID.  UID_N is the correct one to use
			for the join.  Added Site Name.
			10/17/2005 Antonia Miller:  Revised program to extract data from pa_cal_schedule_slots.  Prior
			to this, the program was using the wrong table to get this information (pa_tcpip_details is the
			wrong table to get shift start time, end time and total hours.
			
			8/30/2007 Mohamed Mahmoud: Modified to include ShiftFlag as per Derrick Fong's request.
			10/26/2007 Mohamed Mahmoud: Modified to replace UNION with INSERT INTO
			12/18/2008 Mohamed Mahmoud: Modified to add isFTK flag (for Dr. Tamayo-Sarver)
			05/04/2011 Reetika Singh: Modified to update SiteName from Hospital_Region
*/

TRUNCATE TABLE ApplicationIntegration.dbo.ProviderHoursDetail

INSERT INTO ApplicationIntegration.dbo.ProviderHoursDetail
SELECT 	Site,
	'',
	PM.ProviderMasterID,
	PM.LastName,
	PM.FirstName,
	PM.WebID,
	Date as DateOfService,
	LEFT(CONVERT(char(10),date,112),6) AS Month,
	timestart_N as TimeStart,
	timeend_N as TimeEnd,
	hournum as TotalHours,
	'N' as PAFlag,
	Flag as ShiftFlag,
	IsFTK,
	GETDATE() AS CreDate,
	GETDATE() AS UpdDate
	FROM AppStaging.dbo.WebCAL_schedule_slots WCSS 
	INNER JOIN ApplicationIntegration.dbo.ProviderMasterBase PM 
	ON PM.WebID = WCSS.UID_N


INSERT INTO ApplicationIntegration.dbo.ProviderHoursDetail
SELECT 	Site,
	'',
	PM.ProviderMasterID,
	PM.LastName,
	PM.FirstName,
	PM.WebID,
	[Date] as DateOfService,
	LEFT(CONVERT(char(10),[date],112),6) AS Month,
	Timestart_N as TimeStart,
	Timeend_N as TimeEnd,
	HourNum as TotalHours,
	'Y' as PAFlag,
	Flag as ShiftFlag,
	IsFTK,
	GETDATE() AS CreDate,
	GETDATE() AS UpdDate
	FROM AppStaging.dbo.PA_cal_schedule_slots PATCPIP 
	INNER JOIN ApplicationIntegration.dbo.ProviderMasterBase PM 
	ON PM.WebID = PATCPIP.UID_N order by dateofservice

	/*Remove data with Total Hours of 0, and data prior to go-live of all sites*/

	DELETE FROM ProviderHoursDetail WHERE TotalHours < = 0
	--PAs
	DELETE FROM ProviderHoursDetail WHERE PAFlag = 'Y' and DateOfService < '6/1/05'
	--MDs
	DELETE FROM ProviderHoursDetail WHERE PAFlag = 'N' and DateOfService < '1/1/05'
	

/*Populate Site Name*/
-- 	UPDATE ProviderHoursDetail	
-- 	SET SITENAME = S.SiteLocationName
-- 	FROM SiteLocationLookup S, ProviderHoursDetail
-- 	WHERE S.WebCode = ProviderHoursDetail.Site


	UPDATE ProviderHoursDetail	
	SET SITENAME = H.HospitalName
	FROM Hospital_region H, ProviderHoursDetail
	WHERE H.Code = ProviderHoursDetail.Site
	AND H.HospitalName NOT LIKE '%?%'

