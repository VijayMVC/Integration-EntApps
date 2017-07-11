USE physicianinfo;


--DROP TABLE #LMSCMELookup


-- Creating a table using NEWID for uniqueidentifier data type.  
CREATE TABLE #LMSCMELookup  
(  
 TrainingID uniqueidentifier NOT NULL  
   DEFAULT newid(), 
 CourseId  int NOT NULL,
 CourseGuid uniqueidentifier NULL,
 CourseName nvarchar(500) NULL, 
 Sponsorship nvarchar(100) NULL, 
 Category nvarchar(255) NULL,
 CourseIMQcategory nvarchar(100) NULL,
 accreditedBy nvarchar(100) NULL,
 CreateDate datetime, 
 Credits nvarchar(10) NULL, 
 Location nvarchar(255) NULL
);  
GO  

INSERT INTO #LMSCMELookup (TrainingID, CourseId, CourseGuid, CourseName, Sponsorship, Category, 
					CourseIMQcategory, accreditedBy, CreateDate, Credits, Location )


SELECT NEWID(), * 
FROM (
	SELECT DISTINCT c.Id, NULL CourseGuid, c.courseName, 
	c.sponsorship, c.courseCategory, c.courseIMQcategory,c.accreditedBy,
	c.createDate, 
	c.credits, 'on-site' loc
	FROM dbo.CME_siteTranscript b 
	JOIN dbo.CME_siteCourse c ON b.courseID = c.id  
	WHERE c.flag_comp<>'compliance'
	AND courseName NOT LIKE '%E/M%'

	UNION 

	SELECT DISTINCT c.id, c.c_guid, c.courseName,
	c.sponsorship, c.courseCat AS courseCategory, c.courseIMQCat, c.accreditedBy, c.DateEvent,
	c.credit,'online' loc
	FROM dbo.CME_transcript AS a 
	JOIN dbo.CME_course AS c ON a.c_guid = c.c_guid 
	WHERE  courseName NOT LIKE '%Compliance%' 
	AND courseName NOT LIKE '%Documentation%' 
	AND courseName NOT LIKE '%EMTALA%' 
	AND courseName NOT LIKE '%HIPAA%' 
	AND c.c_guid <> '{15889F31-91FE-4F9F-808D-505886F5B2D0}' 
	AND (c.QuizReady <> 'no') AND (a.uid NOT LIKE '%_SCR') AND (a.uid NOT LIKE '%_PA') AND (a.uid NOT LIKE '%_MD')


)CME
ORDER BY courseName


SELECT * 
FROM #LMSCMELookup


--Training Lookup 2 years
SELECT DISTINCT TrainingID, CourseName, Credits, Sponsorship, Category, CourseIMQcategory, accreditedBy, CreateDate, Location
FROM #LMSCMELookup
WHERE YEAR(CreateDate) >= 2014


--Training Lookup 6 years
SELECT DISTINCT TrainingID, CourseName, Credits, Sponsorship, Category, CourseIMQcategory, accreditedBy, CreateDate, Location
FROM #LMSCMELookup
WHERE YEAR(CreateDate) >= 2010







--Training with person data 2 years

SELECT DISTINCT c.TrainingID, c.CourseName, b.CompleteDate, a.MPID EMP_No,  LastName, FirstName
FROM #LMSCMELookup c
JOIN dbo.CME_siteTranscript b ON b.courseID = c.CourseId
JOIN dbo.PhysicianInfo a ON b.webid = a.ID 
WHERE Location = 'on-site'
AND YEAR(c.CreateDate) >= 2014

UNION 

SELECT DISTINCT c.TrainingID, c.CourseName, b.ts completedDate, a.MPID EMP_No,  LastName, FirstName
FROM #LMSCMELookup c
JOIN dbo.CME_transcript b ON b.c_guid = c.CourseGuid
JOIN dbo.PhysicianInfo a ON a.ID = b.uid
WHERE Location = 'online'
AND YEAR(c.CreateDate) >= 2014
AND (b.uid NOT LIKE '%_SCR') AND (b.uid NOT LIKE '%_PA') AND (b.uid NOT LIKE '%_MD')





--Training with person data 6 years

SELECT DISTINCT c.TrainingID, c.CourseName, b.CompleteDate, a.MPID EMP_No,  LastName, FirstName
FROM #LMSCMELookup c
JOIN dbo.CME_siteTranscript b ON b.courseID = c.CourseId
JOIN dbo.PhysicianInfo a ON b.webid = a.ID 
WHERE Location = 'on-site'
AND YEAR(c.CreateDate) >= 2010

UNION 

SELECT DISTINCT c.TrainingID, c.CourseName, b.ts completedDate, a.MPID EMP_No,  LastName, FirstName
FROM #LMSCMELookup c
JOIN dbo.CME_transcript b ON b.c_guid = c.CourseGuid
JOIN dbo.PhysicianInfo a ON a.ID = b.uid
WHERE Location = 'online'
AND YEAR(c.CreateDate) >= 2010
AND (b.uid NOT LIKE '%_SCR') AND (b.uid NOT LIKE '%_PA') AND (b.uid NOT LIKE '%_MD')








