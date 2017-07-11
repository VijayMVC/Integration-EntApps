

CREATE        PROCEDURE [dbo].[usp_RetentionNotification] 
AS

/* 	Author: 	Reetika Singh
	Date:		10/1/2014
	Purpose:	Reruiting is requesting a notification, "New Hire Scheduled" 
				that looks at new hires that were added on the schedule for the day and sends the 
				information to the Recruiter who created the placement in Salesforce. 
				This notification would be sent daily to the Recruiter.
				This notification is needed for the Retention program project 
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN



	TRUNCATE TABLE RecruitingNotification

	INSERT INTO RecruitingNotification
	SELECT DISTINCT PMB.LastName,
				PMB.FirstName,
				MIN(PD.DateOfService) ScheduledDate,
				HR.SFDCName SiteName, 
				U.Name AS RecruiterName, U.Email As Email
	FROM  ProviderHoursDetail PD
	JOIN ProviderMasterBase PMB
		ON PMB.ProviderMasterID = PD.ProviderMasterID
	JOIN Hospital_region HR
		ON HR.Code = PD.Site
	JOIN SalesForce...ts2__Placement__c P
		ON P.ts2__Employee__c = PMB.SFID
		AND P.ts2__Client__c = HR.SFID
	JOIN Salesforce...[User] U
		ON U.Id = P.CreatedById
	WHERE P.Poeple_Status__c = 'Hired'
	GROUP BY PMB.SFID, HR.SFDCName, PMB.LastName,
				PMB.FirstName, U.Name, U.Email, P.ID
	HAVING MIN(PD.DateOfService) >= DATEADD(d,-1,GETDATE())
	AND MIN(PD.DateOfService) <= GETDATE()





	DECLARE @Email varchar(100)


	DECLARE db_cursor CURSOR FOR  
		SELECT DISTINCT Email 
		FROM RecruitingNotification
		WHERE Email IS NOT NULL

	OPEN db_cursor   
	FETCH NEXT FROM db_cursor INTO @Email 

	WHILE @@FETCH_STATUS = 0   
	BEGIN   
	    
		DECLARE @thequery nvarchar(max) = 'SELECT Convert(varchar(50),(LastName + " " + FirstName)) AS ContactName,
								 LEFT(ScheduledDate, 12) ScheduledDate,LTRIM(RTRIM(SiteName)) SiteName
								 FROM ApplicationIntegration.dbo.RecruitingNotification
								 WHERE Email = ''' + @Email + '''';
	    
		PRINT @Email
		EXEC msdb.dbo.sp_send_dbmail
		@recipients= @Email,
		@copy_recipients = 'PletanN@medamerica.com;FitzgeraldL@medamerica.com',
		@blind_copy_recipients = 'singhr@medamerica.com',
		@query = @thequery,
		@subject=N'Recruiting Notification',
    		@body=N'Hi,

	Attached are the new hires that were scheduled yesterday.	',

		@attach_query_result_as_file = 1 ;


	    
	    
	FETCH NEXT FROM db_cursor INTO @Email 
	END   

	CLOSE db_cursor   
	DEALLOCATE db_cursor
	
	
	
	--SELECT DATEADD(week,-1,GetDate())
	
	--Archive table with CreDate to create a monthly report.
	
	
	INSERT INTO RecruitingNotification_Archive
	SELECT LastName, FirstName, ScheduledDate, SiteName, RecruiterName, Email, GETDATE() 
	FROM RecruitingNotification



	INSERT INTO RecruitingNotification_Archive
	SELECT DISTINCT PMB.LastName,
				PMB.FirstName,
				MIN(PD.DateOfService) ScheduledDate,
				HR.SFDCName SiteName, 
				U.Name AS RecruiterName, U.Email As Email, GETDATE()
	FROM  ProviderHoursDetail PD
	JOIN ProviderMasterBase PMB
		ON PMB.ProviderMasterID = PD.ProviderMasterID
	JOIN Hospital_region HR
		ON HR.Code = PD.Site
	JOIN SalesForce...ts2__Placement__c P
		ON P.ts2__Employee__c = PMB.SFID
		AND P.ts2__Client__c = HR.SFID
	JOIN Salesforce...[User] U
		ON U.Id = P.CreatedById
	WHERE P.Poeple_Status__c = 'Hired'
	AND NOT EXISTS(SELECT * FROM RecruitingNotification_Archive RA
					WHERE RA.LastName = PMB.LastName
					AND RA.FirstName = PMB.FirstName
					AND RA.SiteName = HR.SFDCName)
	GROUP BY PMB.SFID, HR.SFDCName, PMB.LastName,
				PMB.FirstName, U.Name, U.Email, P.ID
	HAVING MIN(PD.DateOfService) >= GETDATE() - 7
	AND MIN(PD.DateOfService) <= GETDATE() 
	
	--DECLARE @SOW varchar(100);
	
	--SET @SOW = LEFT(CAST(DATEADD(week,-1,GetDate()-1) as Datetime), 12) 


	--PRINT @SOW
	
	
	
	--DECLARE @Today VARCHAR(100)
	--SET @Today = LEFT(Cast(LTRIM(RTRIM(CONVERT(CHAR(10),'11/20/2014',112))) as datetime), 12)
	
	--PRINT @Today
	
	--SELECT dateadd(week, datediff(week, 0, @Today), 0)
	
	--select datename(dw,getdate())
	
	IF LTRIM(RTRIM(datename(dw,getdate()))) = 'Monday'

	BEGIN
	
		DECLARE @tab char(1) = CHAR(9)
	
		DECLARE @WeeklyQuery nvarchar(max) = 'SELECT Convert(varchar(50),(LastName + " " + FirstName)) AS ContactName,
									 LEFT(ScheduledDate, 12) ScheduledDate,LTRIM(RTRIM(SiteName)) SiteName,
									 LTRIM(RTRIM(RecruiterName)) RecruiterName
									 FROM ApplicationIntegration.dbo.RecruitingNotification_Archive
									 WHERE CreDate > LEFT(CAST(DATEADD(week,-1,GetDate()-1) as Datetime), 12) 
											AND CreDate < LEFT(CAST(GETDATE() as Datetime), 12)'
		    
		EXEC msdb.dbo.sp_send_dbmail
		@recipients= 'PletanN@medamerica.com;SantiagoL@medamerica.com;FitzgeraldL@medamerica.com',
		@blind_copy_recipients = 'singhr@medamerica.com',
		@query = @WeeklyQuery,
		@subject=N'Weekly Recruiting Notification',
			@body=N'Hi,

		Attached are the new hires that were scheduled this week.	',

			@attach_query_result_as_file = 1 ,
			@query_attachment_filename='filename.csv',
			@query_result_separator=@tab,
			@query_result_no_padding=1;
	
	
	
	END


END


