CREATE                      PROCEDURE [dbo].[usp_LawsonPayHistoryPA] 
AS

/* 	
	Purpose:	Generates a pay history report for PAs
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN


TRUNCATE TABLE LawsonPayHistory


INSERT INTO LawsonPayHistory
SELECT DISTINCT LID.ProviderMasterID, ep.PROCESS_LEVEL, ep.EMPLOYEE,
	UPPER(pr.name) as Site, 
	LTRIM(RTRIM(e.LAST_NAME)) + ', ' + LTRIm(RTRIM(e.FIRST_NAME)) AS FullName
	, ep.PAY_RATE, 
	ep.EFFECT_DATE As Effect_Date, NULL,
	e.DATE_HIRED,
	NULL AS JobStatus,
	CASE WHEN PMB.Status = '0' THEN 'Active'
		ELSE 'Terminated' END AS Status,
NULL
FROM AppStaging.dbo.LawsonPAEMPPOS ep 
	LEFT JOIN AppStaging.dbo.LawsonPERSACTHST as pah 
		ON ep.employee = pah.employee 
			AND ep.pos_level = pah.pos_level
			AND ep.date_stamp = pah.date_stamp
	LEFT JOIN AppStaging.dbo.LawsonHRHISTORY as hrh ON pah.OBJ_ID = hrh.ACT_OBJ_ID
	LEFT JOIN AppStaging.dbo.LawsonPADICT as d ON d.FLD_NBR = hrh.FLD_NBR
	LEFT JOIN AppStaging.dbo.LawsonPAEMPLOYEE pae ON pah.employee = pae.employee
	INNER JOIN AppStaging.dbo.LawsonEmployee e ON e.employee = ep.employee
	INNER JOIN AppStaging.dbo.LawsonJOBCODE jc ON jc.JOB_CODE = ep.JOB_CODE
	INNER JOIN AppStaging.dbo.LawsonPRSYSTEM pr ON pr.process_level = ep.process_level
	JOIN dbo.LawsonIDMatch AS LID ON LID.LawsonEmpNo = ep.employee
	JOIN ProviderMasterBase PMB ON PMB.ProviderMasterID = LID.ProviderMasterID
WHERE 	(LEFT(e.job_code,6)='EPHYAS' OR LEFT(e.job_code,4)='ERNP'
		OR LEFT(e.job_code,6)='EDIRPA' OR LEFT(e.job_code,8)= 'ELSNPANP'
		OR LEFT(e.job_code,6)='EPT000')
AND ep.PROCESS_LEVEL <'8000'
GROUP BY LID.ProviderMasterID, ep.PROCESS_LEVEL, ep.EMPLOYEE,
	pr.name, e.LAST_NAME, e.FIRST_NAME, ep.PAY_RATE, 
	e.EMP_STATUS, PMB.Status, e.DATE_HIRED, ep.EFFECT_DATE
ORDER BY site, FullName, Effect_Date, ep.PAY_RATE



update LawsonPayHistory
set JobStatus = CASE WHEN ep.FTE = '0.25'
		THEN 'Per Diem'
	     WHEN ep.FTE = '0.5' 
		THEN 'Part Time' 
	     WHEN ep.FTE = '1.0'
		THEN 'Full Time' END 
from AppStaging.dbo.LawsonPAEMPPOS ep 
where LawsonPayHistory.Employee = ep.Employee
and LawsonPayHistory.PROCESSLEVEL = ep.PROCESS_LEVEL
and LawsonPayHistory.EffectDate = ep.Effect_Date


UPDATE LawsonPayHistory
SET PLStatus = 'Inactive',
Status = 'Inactive'
FROM LawsonPayHistory As LH
WHERE LH.PROCESSLEVEL NOT IN ( SELECT PL.PROCESS_LEVEL
			FROM dbo.LawsonPositionsPLs PL
			WHERE PL.EMPLOYEE = LH.EMPLOYEE)


UPDATE LawsonPayHistory
SET PLStatus = 'Active'
FROM LawsonPayHistory As LH
WHERE LH.PROCESSLEVEL IN ( SELECT PL.PROCESS_LEVEL
			FROM dbo.LawsonPositionsPLs PL
			WHERE PL.EMPLOYEE = LH.EMPLOYEE)
AND LH.Status = 'Active'


UPDATE LawsonPayHistory
SET PLStatus = 'Inactive'
FROM LawsonPayHistory As LH
WHERE LH.Status = 'Terminated'







TRUNCATE TABLE LawsonPayHistory_Final

DECLARE @PMID1 int,
	@PL1 char(5),
	@Emp1 int,
	@Site1 varchar(30),
	@FName1 varchar(30),
	@PR1 decimal(13,4),
	@ED1 datetime,
	@HD1 datetime,
	@JS1 varchar(9),
	@Status1 varchar(10),
	@PLS1 varchar(50),

	@PMID2 int,
	@PL2 char(5),
	@Emp2 int,
	@Site2 varchar(30),
	@FName2 varchar(30),
	@PR2 decimal(13,4),
	@ED2 datetime,
	@HD2 datetime,
	@JS2 varchar(9),
	@Status2 varchar(10),
	@PLS2 varchar(50)

SET @PMID1 = 0

	
DECLARE PH CURSOR READ_ONLY
FOR
	SELECT ProviderMasterID, ProcessLevel, Employee, Site, FullName, 
		PayRate, EffectDate, HireDate, JobStatus, Status, PLStatus
	FROM LawsonPayHistory
	--WHERE ProviderMasterID = 4854
	ORDER BY site, FullName, EffectDate, PAYRATE


OPEN PH

FETCH NEXT FROM PH
INTO @PMID2, @PL2, @Emp2, @Site2, @FName2, @PR2, @ED2, @HD2, @JS2, @Status2, @PLS2

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT  @PMID1
	PRINT @PR2
	IF @PMID1 = 0
		BEGIN
			INSERT INTO LawsonPayHistory_Final
			VALUES(@PMID2, 
				@PL2, 
				@Emp2, 
				@Site2, 
				@FName2, 
				@PR2, 
				@ED2, 
				@HD2, 
				@JS2, 
				@Status2, 
				@PLS2,
				0,
				'0')
		END
	
	IF @PMID1 <> 0
		BEGIN
 			IF (@PL1 = @PL2) AND (@Emp1 = @Emp2) AND (@PR1 = @PR2)
				PRINT 'Test1'

			IF (@PL1 = @PL2) AND (@Emp1 = @Emp2) AND (@PR1 <> @PR2)
			     BEGIN  PRINT 'Test2' 
				INSERT INTO LawsonPayHistory_Final
				VALUES(@PMID2, 
					@PL2, 
					@Emp2, 
					@Site2, 
					@FName2, 
					@PR2, 
					@ED2, 
					@HD2, 
					@JS2, 
					@Status2, 
					@PLS2,
					(@PR2 - @PR1),
					CASE WHEN @PR1 > 0 THEN
					CAST(
						CAST((((@PR2 - @PR1)/@PR1)*100) AS numeric(10,2))
					     AS varchar(50)) + '%' ELSE '0%' END
						)  
			      END
			IF (@Emp1 <> @Emp2) OR (@PL1 <> @PL2)
				BEGIN  PRINT 'Test3' 
			 		INSERT INTO LawsonPayHistory_Final
					VALUES(@PMID2, 
						@PL2, 
						@Emp2, 
						@Site2, 
						@FName2, 
						@PR2, 
						@ED2, 
						@HD2, 
						@JS2, 
						@Status2, 
						@PLS2,
						0,
						'0')
				
				END

		END	


	SET @PMID1 = @PMID2 
	SET @PL1 = @PL2
	SET @Emp1 = @Emp2
	SET @Site1 = @Site2
	SET @FName1 = @FName2
	SET @PR1 = @PR2
	SET @ED1 = @ED2
	SET @HD1 = @HD2
	SET @JS1 = @JS2
	SET @Status1 = @Status2
	SET @PLS1 = @PLS2

	FETCH NEXT FROM PH
	INTO @PMID2, @PL2, @Emp2, @Site2, @FName2, @PR2, @ED2, @HD2, @JS2, @Status2, @PLS2

END

CLOSE PH
DEALLOCATE PH




UPDATE LawsonPayHistory_Final
SET JobStatus = ''
WHERE JobStatus IS NULL


UPDATE LawsonPayHistory_Final
SET PerIncrease = ''
WHERE PerIncrease = '0'

END
