
CREATE PROCEDURE [dbo].[LoadGLInterface]
AS
BEGIN
SET NOCOUNT ON;

/*Revision : From GABY:
		Could you please change the time interval of SiteLine payroll import? 
		The new payroll import interval should start on the 17th and 
		end on the 16th of each month.  
		February will be a transition month with the following time interval: 
		1/18/2013 through 2/16/2013  
	*/




--the program will run after November 17th to capture October 18th to November 17th 
--and it will be the October run

--The code below is to run exactly between the Payroll Dates.
	--DECLARE @Date datetime
	--DECLARE @sDate datetime
	--DECLARE @eDate datetime
	--DECLARE @Month integer
	
	--SET @Date = GetDate()
	--SET @Month = 9 --MONTH(GetDate())
	
	--SET @sDate = CASE WHEN @Month = 8
	--					THEN CONVERT(Datetime, '7/18/2012')
	--				  WHEN @Month = 9
	--					THEN CONVERT(Datetime, '8/21/2012')
	--				  WHEN @Month = 10
	--					THEN CONVERT(Datetime, '9/21/2012')
	--				  WHEN @Month = 11
	--					THEN CONVERT(Datetime, '10/21/2012')
	--				  WHEN @Month = 12
	--					THEN CONVERT(Datetime, '11/20/2012')
	--				  END
						
	--SET @eDate = CASE WHEN @Month = 8
	--					THEN CONVERT(Datetime, '8/20/2012')
	--				  WHEN @Month = 9
	--					THEN CONVERT(Datetime, '9/19/2012')
	--				  WHEN @Month = 10
	--					THEN CONVERT(Datetime, '10/20/2012')
	--				  WHEN @Month = 11
	--					THEN CONVERT(Datetime, '11/19/2012')
	--				  WHEN @Month = 12
	--					THEN CONVERT(Datetime, '12/19/2012')
	--				  END



	--PRINT @sDate
	--PRINT @eDate
	
	
	DECLARE @Date datetime
	SET @Date = GETDATE()


	DECLARE @sDate datetime
	DECLARE @eDate datetime

	SET @eDate = DATEADD(dd,0,DATEADD(mm, DATEDIFF(mm,0,@Date),18)) 
	SET @sDate = DATEADD(mm, -1, @eDate) -2 
	SET @eDate = @eDate - 3

	--PRINT @sDate
	--PRINT @eDate



	TRUNCATE TABLE LAWDATASTAGE.dbo.GLInterface

	INSERT INTO LAWDATASTAGE.dbo.GLInterface
	SELECT D.COMPANY,
			D.CHECK_ID,
			D.CHECK_TYPE,
			D.DED_CODE,
			CASE WHEN C.PAY_CODE IS NULL THEN '' ELSE RTRIM(C.PAY_CODE) END as PAY_CODE,
			D.DIST_AMT,
			D.DIST_COMPANY,
			D.DST_ACCOUNT,
			D.DST_SUB_ACCT,
			D.DST_ACCT_UNIT,
			D.EMPLOYEE,
			D.GL_DATE,
			D.HOURS,
			RTRIM(D.JOB_CODE) as JOB_CODE,
			D.R_POSITION,
			D.PER_END_DATE,
			D.TR_DATE,
			D.RUN_DATE,
			D.PAY_UNITS,
			D.PROCESS_LEVEL,
			LEFT(convert(varchar, @sDate, 112), 6) AS DATA_MONTH,
			LTRIM(RTRIM(E.LAST_NAME)) + ', ' + LTRIM(RTRIM(E.FIRST_NAME))
	FROM PROD.dbo.PRDISTRIB D
	LEFT OUTER JOIN PROD.dbo.EMPLOYEE E
		ON D.EMPLOYEE = E.EMPLOYEE
	LEFT OUTER JOIN PROD.dbo.PRPAYCODE C
	ON D.PCD_SEQ_NBR = C.SEQ_NBR
	WHERE D.RUN_DATE BETWEEN @sDate AND @eDate
	AND D.PROCESS_LEVEL BETWEEN 1000 AND 8999




		
END


