
CREATE        PROCEDURE [dbo].[usp_WebTimeCardMidLevel] 
AS

/* 	Author: 	Reetika Singh
	Date:		4/29/2014
	Purpose:	Load PA and Scribe into TimeCard with Differential Flag
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN

	
	TRUNCATE TABLE ScribeWebCode

	INSERT INTO ScribeWebCode
	  
	SELECT Code, HospitalName, 
	REPLACE(Code, RIGHT(LTRIM(RTRIM(Code)),1),
				 Char(64 + RIGHT(LTRIM(RTRIM(Code)),1) ) ) As ScribeCode
	FROM Hospital_region
	WHERE ISNumeric(RIGHT(LTRIM(RTRIM(Code)),1)) =1


	--PA TimeCard
	TRUNCATE TABLE WebTimeCardMidLevel
	
	INSERT INTO WebTimeCardMidLevel
	SELECT * FROM (
	SELECT P.flag, 'PA' AS Type, NULL AS LawsonID, WebTimecardPA.Site As WebCode, 
	WebTimecardPA.id, TCID, dat, Month, WebTimecardPA.site, SiteLocationName, 
	LastName, FirstName, NULL As Initial,
	ProviderMasterID, HoursDay, HoursNight, HoursWeekened, HoursBreak, HoursAdmin, 
	HoursMeeting, HoursOther, HoursPTO, HoursSicks, Comments, HoursTotal, HoursStraight, 
	HoursDayStraight, HoursNightStraight, HoursWeekendStraight, HoursOverTime, HoursDayOverTime, 
	HoursNightOverTime, HoursWeekendOverTime, HoursDoubleTime, HoursDayDoubleTime, 
	HoursNightDoubleTime, HoursWeekendDoubleTime,
	P.timestart_N As TimeStart, 
	P.timeend_N TimeEnd, P.hourNum As TotalHours, IsFTK
	FROM WebTimecardPA
	LEFT OUTER JOIN AppStaging.dbo.PA_CAL_schedule_slots P 
		ON WebTimecardPA.TCID = P.uid_N
		AND WebTimecardPA.dat = P.date
		AND WebTimecardPA.[site] = P.site
	WHERE ISNumeric(RIGHT(LTRIM(RTRIM(WebTimecardPA.[site])),1)) = 1
	--AND WebTimecardPA.dat >= '1/1/2013'
	AND WebTimecardPA.hourstotal > 0
	UNION 
	SELECT P.flag, 'Scribe' AS Type, NULL AS LawsonID, SW.Code As WebCode,
	WebTimecardPA.id, TCID, dat, Month, WebTimecardPA.site, SiteLocationName, 
	LastName, FirstName, NULL As Initial,
	ProviderMasterID, HoursDay, HoursNight, HoursWeekened, HoursBreak, HoursAdmin, 
	HoursMeeting, HoursOther, HoursPTO, HoursSicks, Comments, HoursTotal, HoursStraight, 
	HoursDayStraight, HoursNightStraight, HoursWeekendStraight, HoursOverTime, HoursDayOverTime, 
	HoursNightOverTime, HoursWeekendOverTime, HoursDoubleTime, HoursDayDoubleTime, 
	HoursNightDoubleTime, HoursWeekendDoubleTime,
	P.timestart_N As TimeStart, 
	P.timeend_N TimeEnd, P.hourNum As TotalHours, IsFTK
	FROM WebTimecardPA
	JOIN ScribeWebCode SW
		on SW.ScribeCode = WebTimecardPA.site
	LEFT OUTER JOIN AppStaging.dbo.PA_CAL_schedule_slots P 
		ON WebTimecardPA.TCID = P.uid_N
		AND WebTimecardPA.dat = P.date
		AND WebTimecardPA.[site] = P.site
	WHERE ISNumeric(RIGHT(LTRIM(RTRIM(WebTimecardPA.[site])),1)) <> 1
	--AND WebTimecardPA.dat > '5/1/2014'
	AND WebTimecardPA.hourstotal > 0) T
	ORDER BY T.WebCode 
				  
	
	--SELECT * FROM WebTimeCardMidLevel
	--order by LawsonID
	
	--UPDATE TIMECARD

	UPDATE WebTimeCardMidLevel
	SET LastName = PHYSICIANINFO.LASTNAME,
	 FirstName = PHYSICIANINFO.FIRSTNAME,
	 Initial = PhysicianInfo.MidName,
	 ProviderMasterID = PHYSICIANINFO.MPID
	FROM WebTimeCardMidLevel, PHYSICIANINFO
	WHERE WebTimeCardMidLevel.TCID = PHYSICIANINFO.ID

	UPDATE WebTimeCardMidLevel
	SET SITELOCATIONNAME = HR.HospitalName
	FROM WebTimeCardMidLevel, Hospital_region HR
	WHERE WebTimeCardMidLevel.WebCode = HR.CODE

	UPDATE WebTimeCardMidLevel
	SET [MONTH] = LEFT(CONVERT(char(10),[dat],112),6)

	UPDATE WebTimeCardMidLevel
	SET LawsonID = L.LawsonNum
	FROM LS_EmplLookup L
	WHERE L.ID = WebTimeCardMidLevel.TCID
	AND L.LawsonNum NOT LIKE '0%'
	
	UPDATE WebTimeCardMidLevel
	SET LawsonID = L.LawsonEmpNo
	FROM LawsonIDMatch L
	WHERE L.CEPWebID = WebTimeCardMidLevel.TCID

END

