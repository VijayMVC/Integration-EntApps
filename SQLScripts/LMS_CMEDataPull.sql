--For loading new lookup table:
--Import the lookup file into PatSatStaging DB and use Training ID to match the tables and update the values in LMSCMELookup table, then use the queries below:


USE physicianinfo
GO

--Training Lookup all years

SELECT DISTINCT TrainingID, [New TrainingID],--, [New TrainingID1],
                  CourseName, Credits, Sponsorship, Category,
                  CourseIMQcategory, accreditedBy, CreateDate, Location,
                  [Type of course], NewCategory, CreditCategory
FROM PATSATSTAGING.dbo.LMSCMELookup
WHERE CourseName <> 'Nurse Practitioner Standardized Procedures'
ORDER BY CourseName







--Training with person data all years

USE PhysicianInfo
GO

SELECT DISTINCT * FROM (

SELECT DISTINCT c.TrainingID, c.[New TrainingID],
            c.CourseName, SC.createDate AS CompleteDate, a.MPID EMP_No,  a.LastName, a.FirstName,
            LTRIM(RTRIM(a.FirstName)) + ' ' + LTRIM(RTRIM(a.LastName)) FullName,
            c.[Type of course], c.NewCategory, c.CreditCategory
FROM PATSATSTAGING.dbo.LMSCMELookup c
JOIN dbo.CME_siteTranscript         b  ON b.courseID = c.CourseId
JOIN dbo.CME_siteCourse             SC ON SC.ID = c.CourseId
JOIN dbo.PhysicianInfo              a  ON b.webid = a.ID
WHERE c.Location = 'on-site'
      --AND YEAR(c.CreateDate) >= 2010
      AND a.Status = 0
      AND c.CourseName <> 'Nurse Practitioner Standardized Procedures'

UNION

SELECT DISTINCT c.TrainingID, c.[New TrainingID],
            c.CourseName, b.ts completedDate, a.MPID EMP_No,  a.LastName, a.FirstName,
            LTRIM(RTRIM(a.FirstName)) + ' ' + LTRIM(RTRIM(a.LastName)) FullName,
            c.[Type of course], c.NewCategory, c.CreditCategory
FROM PATSATSTAGING.dbo.LMSCMELookup c
JOIN dbo.CME_transcript             b ON b.c_guid = c.CourseGuid
JOIN dbo.PhysicianInfo              a ON a.ID = b.uid
WHERE c.Location = 'online'
      --AND YEAR(c.CreateDate) >= 2010
      AND (b.uid NOT LIKE '%_SCR') AND (b.uid NOT LIKE '%_PA') AND (b.uid NOT LIKE '%_MD')
      AND a.Status = 0
      AND c.CourseName <> 'Nurse Practitioner Standardized Procedures'
) CMEAllYrs
ORDER BY completeDate

