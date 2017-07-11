





/* 11/13/2008:
	VERSION THAT INCLUDES THE ISSUES DISCUSSED:
	1.  IMPLEMENT VOIDED CHECKS TO ALL CATEGORY FLAGS 
	2.  IMPLEMENT IMPACT OF CATEGORY S TO CATEGORY A FOR NON-SPECIAL DIST PAYCODE AND SPECIAL DIST PAYCODE IN ONE CHECKNO
	3.  IMPLEMENT HOURLYRATE = 0 FOR PAYCODES WITH CALC_TYPE = A
   11/14/2008:
	1.  CHANGE CATEGORY FLAG A AND D TO POINT THE PROCESS LEVEL FILTER TO THE PAYMASTR TABLE.
   11/19/2008:
	1.  IMPLEMENT DEDREFUND FIX
			AFFECTED CATEGORY: A, D
   12/15/2008:  ADDED LINK CHECKID FOR CATEGORY D,E.
   6/17/2009: Mohamed Mahmoud Added ILP & WAP.
*/

CREATE PROCEDURE [dbo].[LoadCurrWebEarningsMD_ANES]
AS
BEGIN
SET NOCOUNT ON;
SET XACT_ABORT ON;
	BEGIN TRY
		BEGIN TRANSACTION;
				-- this sp is dependent on the LawsonIDMatchSFDC table for ProviderMasterID
				
				TRUNCATE TABLE YTDEarningsStatementMD
				TRUNCATE TABLE YTDEarningsStatementStagingMD
				

				-- LOAD CATEGORY A1 
				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
								LastName,FirstName,MiddleName,FullName,	CalendarYear,SumOfCurrentHours, CsdFlxID)
						SELECT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(10))) + '.9' 
												WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
												ELSE CAST(PYM.CHECK_NBR AS VARCHAR(10)) END
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME 
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME						
									, PRT.PAYROLL_YEAR
									, SumOfCurrentHours = ISNULL(SUM(PRT.HOURS),0)
									, PYM.CHECK_ID
						FROM		dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo							 
						JOIN		dbo.PAYMASTR PYM ON PYM.COMPANY = EMP.COMPANY 
											AND PYM.EMPLOYEE = EMP.EMPLOYEE
						LEFT JOIN	dbo.PRTIME PRT ON PYM.COMPANY = PRT.COMPANY
											AND PYM.EMPLOYEE = PRT.EMPLOYEE
											AND PYM.CHECK_ID = PRT.CHECK_ID
						WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE())
						AND EMP.PAY_FREQUENCY = 4 
						AND (PRT.PROCESS_LEVEL BETWEEN '1000' AND '1999'
						OR PRT.PROCESS_LEVEL BETWEEN '2100' AND '7999')	
						AND PAY_SUM_GRP <> 'PAD'							
						GROUP BY EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, PYM.CHECK_NBR, PYM.CHECK_TYPE
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME 
									, PRT.PAYROLL_YEAR, PYM.CHECK_ID						
						ORDER BY EMP.EMPLOYEE, PYM.CHECK_DATE, PYM.CHECK_ID
				

				UPDATE YTDEarningsStatementStagingMD
				SET EarningsStatmentCategory = 'SumOfYTDHours', CategoryFlag = 'A1'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				UPDATE MD
				SET MD.SumOfYTDHours = B.SumOfYTDHours
				FROM YTDEarningsStatementStagingMD MD
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 							
							, A.CalendarYear 	 
							, A.CsdFlxID 									
							, SumOfYTDHours = SUM(A.SumOfYTDHours)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 									
									, A.CalendarYear 	 
									, A.CsdFlxID 	
									, SumOfYTDHours = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.SumOfYTDHours END				
							FROM YTDEarningsStatementStagingMD AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CalendarYear
												,t1.CsdFlxID
												,Sum(t1.SumOfCurrentHours) AS SumOfYTDHours
										FROM dbo.YTDEarningsStatementStagingMD t1
										WHERE t1.CategoryFlag = 'A1'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CsdFlxID
												,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate																					
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'A1') A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 											
											, A.CalendarYear 	 
											, A.CsdFlxID) B
						ON MD.CsuFlxIDeb = B.CsuFlxIDeb
						AND MD.CheckDate = B.CheckDate
						AND MD.CheckNo = B.CheckNo		
						AND MD.CsdFlxID = B.CsdFlxID 
						AND MD.CalendarYear = B.CalendarYear						
				WHERE MD.CategoryFlag = 'A1' 

				UPDATE YTDEarningsStatementStagingMD
				SET SumOfCurrentHours = NULL
				WHERE SumOfCurrentHours = 0
				
				
				--********************************************************************************
				--LOAD CATEGORY A2
				
				
				INSERT INTO YTDEarningsStatementStagingMD_ANES (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
								LastName,FirstName,MiddleName,FullName,	CalendarYear,SumOfCurrentHours, CsdFlxID)
						SELECT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(10))) + '.9' 
												WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
												ELSE CAST(PYM.CHECK_NBR AS VARCHAR(10)) END
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME 
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME						
									, PRT.PAYROLL_YEAR
									, SumOfCurrentHours = ISNULL(SUM(PRT.HOURS),0)
									, PYM.CHECK_ID
						FROM		PROD.dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo							 
						JOIN		PROD.dbo.PAYMASTR PYM ON PYM.COMPANY = EMP.COMPANY 
											AND PYM.EMPLOYEE = EMP.EMPLOYEE
						LEFT JOIN	PROD.dbo.PRTIME PRT ON PYM.COMPANY = PRT.COMPANY
											AND PYM.EMPLOYEE = PRT.EMPLOYEE
											AND PYM.CHECK_ID = PRT.CHECK_ID
						WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE())
						AND EMP.PAY_FREQUENCY = 4 
						AND (PRT.PROCESS_LEVEL BETWEEN '1000' AND '1999'
						OR PRT.PROCESS_LEVEL BETWEEN '2100' AND '7999')	
						--AND LAST_NAME LIKE 'NOSE%'
						AND PAY_SUM_GRP = 'PAD'								
						GROUP BY EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, PYM.CHECK_NBR, PYM.CHECK_TYPE
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME 
									, PRT.PAYROLL_YEAR, PYM.CHECK_ID						
						ORDER BY EMP.EMPLOYEE, PYM.CHECK_DATE, PYM.CHECK_ID
				

				UPDATE YTDEarningsStatementStagingMD_ANES
				SET EarningsStatmentCategory = 'SumOfYTDDays', CategoryFlag = 'A2'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				UPDATE MD
				SET MD.SumOfYTDHours = B.SumOfYTDHours
				FROM YTDEarningsStatementStagingMD_ANES MD
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 							
							, A.CalendarYear 	 
							, A.CsdFlxID 									
							, SumOfYTDHours = SUM(A.SumOfYTDHours)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 									
									, A.CalendarYear 	 
									, A.CsdFlxID 	
									, SumOfYTDHours = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.SumOfYTDHours END				
							FROM YTDEarningsStatementStagingMD_ANES AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CalendarYear
												,t1.CsdFlxID
												,Sum(t1.SumOfCurrentHours) AS SumOfYTDHours
										FROM dbo.YTDEarningsStatementStagingMD_ANES t1
										WHERE t1.CategoryFlag = 'A2'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CsdFlxID
												,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate																					
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'A2') A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 											
											, A.CalendarYear 	 
											, A.CsdFlxID) B
						ON MD.CsuFlxIDeb = B.CsuFlxIDeb
						AND MD.CheckDate = B.CheckDate
						AND MD.CheckNo = B.CheckNo		
						AND MD.CsdFlxID = B.CsdFlxID 
						AND MD.CalendarYear = B.CalendarYear						
				WHERE MD.CategoryFlag = 'A2' 

				UPDATE YTDEarningsStatementStagingMD_ANES
				SET SumOfCurrentHours = NULL
				WHERE SumOfCurrentHours = 0
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				--**************************************************************************
				
											
				-- LOAD CATEGORY A	
				-- 11/13/2008:  included in this insert statement the impact of Special Distribution Paycode to GrossPay
				-- 11/14/2008:  changed the PRT.PROCESS_LEVEL to PYM.PROCESS_LEVEL filter to capture all the checks in the PAYMASTR table
				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo, CheckAmt,LastName,FirstName,MiddleName,FullName,
									CalendarYear,ClockNo,CurrentGrossPay,CurrentNetPay,CsdFlxID)
						SELECT DISTINCT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.PER_END_DATE
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(10))) + '.9' 
												WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
												ELSE CAST(PYM.CHECK_NBR AS VARCHAR(10)) END
									, PYM.NET_PAY_AMT AS CheckAmt
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
									, CalendarYear = YEAR(PYM.CHECK_DATE)
									, EMP.EMPLOYEE
									, GrossPay = CASE WHEN PYM.CHECK_ID <> SPDIST.CHECK_ID THEN PYM.GROSS_PAY ELSE SPDIST.WageAmt END
									, PYM.NET_PAY_AMT as NetPay
									, PYM.CHECK_ID
						FROM		dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
						JOIN		dbo.PAYMASTR PYM ON EMP.EMPLOYEE = PYM.EMPLOYEE
											AND EMP.COMPANY = PYM.COMPANY										
						LEFT JOIN	dbo.PAYDEDUCTN PYD ON PYM.EMPLOYEE = PYD.EMPLOYEE
											AND PYM.COMPANY = PYD.COMPANY
											AND PYM.CHECK_ID = PYD.CHECK_ID	
						LEFT JOIN	dbo.PRTIME PRT ON PYM.EMPLOYEE = PRT.EMPLOYEE
											AND PYM.COMPANY = PRT.COMPANY
											AND PYM.CHECK_ID = PRT.CHECK_ID	
						LEFT JOIN	(SELECT DISTINCT SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, 
												SP.PAYROLL_YEAR, SUM(SP.WAGE_AMOUNT) WageAmt 
											 FROM	dbo.PRTIME SP 											 
											WHERE	SP.PAY_SUM_GRP NOT IN (SELECT PAY_SUM_GRP FROM dbo.PSGRELATE WHERE PAY_CLASS = 'SPL')
											GROUP BY SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAYROLL_YEAR
											 ) SPDIST
											 ON SPDIST.COMPANY = PYM.COMPANY 
												AND SPDIST.EMPLOYEE = PYM.EMPLOYEE 
												AND SPDIST.CHECK_ID = PYM.CHECK_ID
						WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
						AND EMP.PAY_FREQUENCY = 4
						AND ((PRT.PROCESS_LEVEL BETWEEN '1000' AND '1999' OR PRT.PROCESS_LEVEL BETWEEN '2100' AND '7999')
							OR (PYD.PROCESS_LEVEL BETWEEN '1000' AND '1999' OR PYD.PROCESS_LEVEL BETWEEN '2100' AND '7999'))
						

				UPDATE YTDEarningsStatementStagingMD
				SET EarningsStatmentCategory = 'CheckAmtGrossPayNetPayYTD', CategoryFlag = 'A'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL

				-- Load Category S (Special Distribution)
				
				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo,LastName,FirstName,MiddleName,FullName,
									CalendarYear,PayCode, PayCodeDescr, TotalEarnings, CsdFlxID)
						SELECT DISTINCT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.PER_END_DATE
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(10))) + '.9' 
												WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
												ELSE CAST(PYM.CHECK_NBR AS VARCHAR(10)) END								
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
									, PRT.PAYROLL_YEAR
									, SPDIST.PAY_SUM_GRP
									, SPDIST.PayCodeDescr
									, SPDIST.WAGE_AMOUNT
									, PYM.CHECK_ID
						FROM		dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo								
					    LEFT JOIN   dbo.PAYDEDUCTN PYD ON  EMP.EMPLOYEE =  PYD.EMPLOYEE
                                            AND  EMP.COMPANY = PYD.COMPANY
						LEFT JOIN   dbo.PRTIME PRT ON EMP.EMPLOYEE = PRT.EMPLOYEE
											AND EMP.COMPANY = PRT.COMPANY
						LEFT JOIN	dbo.PAYMASTR PYM ON PYM.EMPLOYEE = PRT.EMPLOYEE
											AND PYM.COMPANY = PRT.COMPANY
											AND (PYM.CHECK_ID = PRT.CHECK_ID OR PYM.CHECK_ID = PYD.CHECK_ID)
											AND EMP.EMPLOYEE = PYM.EMPLOYEE 
							 JOIN	(SELECT SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAY_SUM_GRP, SP.WAGE_AMOUNT, PYG.DESCRIPTION AS PayCodeDescr
									 FROM	dbo.PRTIME SP 
									 JOIN   dbo.PAYSUMGRP PYG ON PYG.PAY_SUM_GRP = SP.PAY_SUM_GRP
									 JOIN   dbo.PSGRELATE PSR ON PYG.PAY_SUM_GRP = PSR.PAY_SUM_GRP
									 WHERE PSR.PAY_CLASS = 'SPL' 
									 ) SPDIST
									 ON SPDIST.COMPANY = EMP.COMPANY 
										AND SPDIST.EMPLOYEE = EMP.EMPLOYEE 
										AND SPDIST.CHECK_ID = PYM.CHECK_ID
						WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
						AND EMP.PAY_FREQUENCY = 4 
						AND (PRT.PROCESS_LEVEL BETWEEN '1000' AND '1999'
						OR PRT.PROCESS_LEVEL BETWEEN '2100' AND '7999')							
					

				UPDATE YTDEarningsStatementStagingMD
				SET EarningsStatmentCategory = 'SpecialDistribution', CategoryFlag = 'S'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- carry over the paycodes on the previous months for the YTD computation			
				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo,LastName,FirstName,MiddleName,FullName,
									CalendarYear,PayCode, PayCodeDescr, TotalEarnings, CsdFlxID)
							SELECT C.CsuFlxIDeb
									, C.ProviderMasterID
									, C.PeriodEnding	
									, C.CheckDate
									, C.CheckNo
									, C.LastName, C.FirstName, C.MiddleName, C.FullName
									, C.CalendarYear
									, C.PayCode, C.PayCodeDescr
									, TotalEarnings = 0
									, C.CsdFlxID
								FROM (SELECT DISTINCT B.CsuFlxIDeb, B.ProviderMasterID
											, B.PeriodEnding, B.CheckDate, B.CheckNo
											, B.LastName, B.FirstName, B.MiddleName, B.FullName	
											, A.PayCode, A.PayCodeDescr				
											, B.CalendarYear, B.CsdFlxID			
									  FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
													, PeriodEnding, CheckDate, CheckNo
													, LastName,FirstName,MiddleName,FullName										
													, PayCode, PayCodeDescr	
													, CalendarYear, CsdFlxID					
											FROM YTDEarningsStatementStagingMD
											WHERE CategoryFlag = 'S') A
											CROSS JOIN (SELECT DISTINCT A.CsuFlxIDeb, A.ProviderMasterID
																		, A.PeriodEnding, A.CheckDate, A.CheckNo
																		, A.LastName,A.FirstName,A.MiddleName,A.FullName										
																		, S.PayCode, S.PayCodeDescr	
																		, A.CalendarYear, A.CsdFlxID
														FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																		, PeriodEnding, CheckDate, CheckNo
																		, LastName,FirstName,MiddleName,FullName										
																		, PayCode, PayCodeDescr	
																		, CalendarYear, CsdFlxID					
																FROM YTDEarningsStatementStagingMD
																WHERE CategoryFlag = 'S') S
														LEFT JOIN (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																		, PeriodEnding, CheckDate, CheckNo
																		, LastName,FirstName,MiddleName,FullName										
																		, CalendarYear, CsdFlxID						
																	FROM YTDEarningsStatementStagingMD
																	WHERE CategoryFlag = 'A') A
																ON	A.CsuFlxIDeb = S.CsuFlxIDeb) B
									  WHERE A.CsuFlxIDeb = B.CsuFlxIDeb 
									  AND A.CheckDate <= B.CheckDate									  
									  ) C
							  LEFT JOIN 
									(SELECT CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, CheckNo,
											LastName,FirstName,MiddleName,FullName, PayCode, PayCodeDescr, CalendarYear
									 FROM YTDEarningsStatementStagingMD 
									 WHERE CategoryFlag = 'S') MD
								ON  C.CsuFlxIDeb = MD.CsuFlxIDeb
								AND C.CheckDate = MD.CheckDate
								AND C.CheckNo = MD.CheckNo
								AND C.PayCode = MD.PayCode
								AND C.CalendarYear = MD.CalendarYear		 
								WHERE MD.PayCode IS NULL 
							ORDER BY C.CheckDate, C.CheckNo, C.PayCode

				
				UPDATE YTDEarningsStatementStagingMD
				SET EarningsStatmentCategory = 'SpecialDistribution', CategoryFlag = 'S'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- YTD COMPUTATION FOR CATEGORY S

				UPDATE MD
				SET MD.YTDNetPay = B.YTDNetPay			
				FROM YTDEarningsStatementStagingMD MD
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 
							, A.PayCode	
							, A.CalendarYear 	 
							, A.CsdFlxID 	
							, A.TotalEarnings	
							, YTDNetPay = SUM(A.YTDNetPay)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 
									, A.PayCode	
									, A.CalendarYear 	 
									, A.CsdFlxID 	
									, A.TotalEarnings	
									, YTDNetPay = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDNetPay END				
							FROM YTDEarningsStatementStagingMD AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.PayCode
												,t1.CalendarYear
												,t1.CsdFlxID
												,Sum(t1.TotalEarnings) AS YTDNetPay
										FROM dbo.YTDEarningsStatementStagingMD t1
										WHERE t1.CategoryFlag = 'S'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.PayCode
												,t1.CsdFlxID
												,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate 							
											AND t1.PayCode = A.PayCode 												
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'S') A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 
											, A.PayCode	
											, A.CalendarYear 	 
											, A.CsdFlxID 	
											, A.TotalEarnings) B
						ON MD.CsuFlxIDeb = B.CsuFlxIDeb
						AND MD.CheckDate = B.CheckDate
						AND MD.CheckNo = B.CheckNo		
						AND MD.CsdFlxID = B.CsdFlxID 
						AND MD.CalendarYear = B.CalendarYear
						AND MD.PayCode = B.PayCode
				WHERE MD.CategoryFlag = 'S' 


				DELETE 
				FROM YTDEarningsStatementStagingMD
				WHERE CategoryFlag = 'S' AND YTDNetPay IS NULL


				UPDATE YTDEarningsStatementStagingMD
				SET TotalEarnings = NULL
				WHERE CategoryFlag = 'S' AND TotalEarnings = 0

							
				-- implement impact of Category S to A
--				UPDATE M
--				SET CurrentGrossPay = 0
--				FROM YTDEarningsStatementStagingMD M
--				JOIN (SELECT CsuFlxIDeb 
--							,CheckDate 
--							,CheckNo 	
--							,CalendarYear 							
--					  FROM YTDEarningsStatementStagingMD
--					  WHERE TotalEarnings IS NOT NULL 
--							AND CategoryFlag = 'S') S							
--					ON M.CsuFlxIDeb = S.CsuFlxIDeb
--					AND M.CheckDate = S.CheckDate
--					AND M.CheckNo = S.CheckNo
--					AND M.CalendarYear = S.CalendarYear
--				WHERE M.CategoryFlag = 'A' 
				

				-- YTD Computation for Category A
				UPDATE MD
				SET MD.YTDGrossPay = B.YTDGrossPay,
					MD.YTDNetPay = B.YTDNetPay
				FROM YTDEarningsStatementStagingMD MD
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 							
							, A.CalendarYear 	 
							, A.CsdFlxID							
							, YTDGrossPay = SUM(A.YTDGrossPay)
							, YTDNetPay = SUM(A.YTDNetPay)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 
									, A.CalendarYear 	 
									, A.CsdFlxID 
									, t1.CheckDate as t1ChkDate
									, t1.CheckNo as t1ChkNo
									, t1.CsdFlxID as t1ChkID
									, YTDGrossPay = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDGrossPay END
									, YTDNetPay = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDNetPay END
							FROM YTDEarningsStatementStagingMD AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CalendarYear
												,t1.CsdFlxID												
												,t1.CurrentGrossPay AS YTDGrossPay
												,t1.CurrentNetPay AS YTDNetPay
										FROM dbo.YTDEarningsStatementStagingMD t1
										WHERE t1.CategoryFlag = 'A' 
										) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate	
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'A' 
							) A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 											
											, A.CalendarYear 	 
											, A.CsdFlxID 	
											) B
						ON MD.CsuFlxIDeb = B.CsuFlxIDeb
						AND MD.CheckDate = B.CheckDate
						AND MD.CheckNo = B.CheckNo		
						AND MD.CsdFlxID = B.CsdFlxID 
						AND MD.CalendarYear = B.CalendarYear						
				WHERE MD.CategoryFlag = 'A' 

				UPDATE YTDEarningsStatementStagingMD
				SET CurrentGrossPay = NULL
				WHERE CategoryFlag = 'A' AND CurrentGrossPay = 0

				UPDATE YTDEarningsStatementStagingMD
				SET CurrentNetPay = NULL
				WHERE CategoryFlag = 'A' AND CurrentNetPay = 0

				UPDATE YTDEarningsStatementStagingMD
				SET YTDGrossPay = NULL
				WHERE CategoryFlag = 'A' AND YTDGrossPay = 0


				-- Load Category B

				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
							LastName,FirstName,MiddleName,FullName,Dept, DeptDescr, PayCode, PayCodeDescr, 
							HourlyRate, TotalHoursbyPayCode,TotalEarnings, CalendarYear,CsdFlxID)				
					SELECT DISTINCT EMP.EMPLOYEE
								, MP.ProviderMasterID
								, PYM.CHECK_DATE
								, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(10))) + '.9' 
											WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
											ELSE CAST(PYM.CHECK_NBR AS VARCHAR(10)) END
								, PYM.PER_END_DATE
								, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
								, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
								, SPDIST.PROCESS_LEVEL
								, PRS.[NAME] AS DeptDescr
								, SPDIST.PAY_SUM_GRP
								, SPDIST.PayCodeDescr
								, SPDIST.RATE AS HourlyRate
								, TotalHoursbyPayCode = SUM(SumOfCurrentHours)
								, TotalEarnings = SUM(WageAmt)
								, SPDIST.PAYROLL_YEAR
								, PYM.CHECK_ID				
					FROM		dbo.EMPLOYEE EMP
					JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
					LEFT JOIN	dbo.PAYMASTR PYM ON EMP.EMPLOYEE = PYM.EMPLOYEE
										AND EMP.COMPANY = PYM.COMPANY
					LEFT JOIN	(SELECT DISTINCT SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAY_SUM_GRP, 
												PYG.DESCRIPTION AS PayCodeDescr, SP.PROCESS_LEVEL, SP.RATE, SP.PAYROLL_YEAR, 
												SUM(SP.HOURS) SumOfCurrentHours, SUM(SP.WAGE_AMOUNT) WageAmt 
											 FROM	dbo.PRTIME SP 
											 JOIN   dbo.PAYSUMGRP PYG ON PYG.PAY_SUM_GRP = SP.PAY_SUM_GRP										
											WHERE	SP.PAY_SUM_GRP NOT IN (SELECT PAY_SUM_GRP FROM dbo.PSGRELATE WHERE PAY_CLASS = 'SPL')
											GROUP BY SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAY_SUM_GRP, 
												PYG.DESCRIPTION, SP.PROCESS_LEVEL, SP.RATE, SP.PAYROLL_YEAR
									 ) SPDIST
									 ON SPDIST.COMPANY = PYM.COMPANY 
										AND SPDIST.EMPLOYEE = PYM.EMPLOYEE 
										AND SPDIST.CHECK_ID = PYM.CHECK_ID
					JOIN		dbo.PRSYSTEM PRS ON SPDIST.COMPANY = PRS.COMPANY
										AND SPDIST.PROCESS_LEVEL = PRS.PROCESS_LEVEL					
					WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE())
					AND EMP.PAY_FREQUENCY = 4 
					AND (SPDIST.PROCESS_LEVEL BETWEEN '1000' AND '1999'
					OR SPDIST.PROCESS_LEVEL BETWEEN '2100' AND '7999')
					GROUP BY EMP.EMPLOYEE, MP.ProviderMasterID, PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.PER_END_DATE, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME,
								SPDIST.PROCESS_LEVEL, PRS.[NAME], SPDIST.PAY_SUM_GRP, SPDIST.PayCodeDescr, SPDIST.RATE, SPDIST.PAYROLL_YEAR, PYM.CHECK_ID, PYM.CHECK_TYPE


				-- FLAG TEMPORARY DATA
				UPDATE YTDEarningsStatementStagingMD
				SET CategoryFlag = 'B_TMP'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- UPDATE HOURLY RATE AND SET IT TO NULL FOR PAYCODES IN PRPAYCODE WITH CALC_TYPE = 'A'
				UPDATE MD
				SET HourlyRate = 0
				FROM YTDEarningsStatementStagingMD MD
				JOIN (SELECT MD.CsuFlxIDeb, MD.CheckDate, MD.CheckNo, MD.PayCode, MD.HourlyRate, MD.CalendarYear
						FROM YTDEarningsStatementStagingMD MD
						WHERE MD.CategoryFlag = 'B_TMP'
						AND MD.PayCode IN (SELECT PAY_SUM_GRP FROM dbo.PRPAYCODE WHERE CALC_TYPE = 'A')
						AND MD.HourlyRate IS NOT NULL
						) TMP
						ON MD.CsuFlxIDeb = TMP.CsuFlxIDeb
						AND MD.CheckDate = TMP.CheckDate
						AND MD.CheckNo = TMP.CheckNo
						AND MD.PayCode = TMP.PayCode						
						AND MD.CalendarYear = TMP.CalendarYear
				WHERE MD.CategoryFlag = 'B_TMP'


				-- INSERT THE GROUPED CATEGORY B WITH HOURLY RATE = NULL FOR PAYCODES WITH CALC_TYPE = 'A'
				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
							LastName,FirstName,MiddleName,FullName,Dept, DeptDescr, PayCode, PayCodeDescr, 
							HourlyRate, TotalHoursbyPayCode,TotalEarnings, CalendarYear,CsdFlxID)	
					SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
							LastName,FirstName,MiddleName,FullName,Dept, DeptDescr, PayCode, PayCodeDescr, 
							HourlyRate, SUM(TotalHoursbyPayCode),SUM(TotalEarnings), CalendarYear,CsdFlxID
					FROM YTDEarningsStatementStagingMD
					WHERE CategoryFlag = 'B_TMP'
					GROUP BY CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
							LastName,FirstName,MiddleName,FullName,Dept, DeptDescr, PayCode, PayCodeDescr, 
							HourlyRate, CalendarYear,CsdFlxID


				-- SET CATEGORY FLAG 				
				UPDATE YTDEarningsStatementStagingMD
				SET EarningsStatmentCategory = 'TotalHoursTotalEarningsBySite', CategoryFlag = 'B'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- CLEANUP TEMPORARY DATA FOR CATEGORY B
				DELETE FROM YTDEarningsStatementStagingMD
				WHERE CategoryFlag = 'B_TMP'


				UPDATE YTDEarningsStatementStagingMD
				SET TotalHoursbyPayCode = NULL, HourlyRate = NULL
				WHERE TotalHoursbyPayCode  = 0

				UPDATE YTDEarningsStatementStagingMD
				SET HourlyRate = NULL
				WHERE HourlyRate  = 0

				-- Load Category C: added the exclusion of SPL requirement (like CategoryFlag P in PA script)
				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,PeriodEnding,
									LastName,FirstName,MiddleName,FullName,
									CalendarYear,SumOfTotalHours,SumOfTotalEarnings)
						SELECT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(10))) + '.9' 
												WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
												ELSE CAST(PYM.CHECK_NBR AS VARCHAR(10)) END
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME									
									, SPDIST.PAYROLL_YEAR
									, SumOfTotalHours = SUM(SPDIST.SumOfTotalHours)
									, SumOfTotalEarnings = SUM(SPDIST.WageAmt) 
						FROM		dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
						JOIN		dbo.PAYMASTR PYM ON EMP.EMPLOYEE = PYM.EMPLOYEE
											AND EMP.COMPANY = PYM.COMPANY
						LEFT JOIN	(SELECT DISTINCT SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAY_SUM_GRP, 
												PYG.DESCRIPTION AS PayCodeDescr, SP.PROCESS_LEVEL, SP.RATE, SP.PAYROLL_YEAR, 
												SUM(SP.HOURS) SumOfTotalHours, SUM(SP.WAGE_AMOUNT) WageAmt 
											 FROM	dbo.PRTIME SP 
											 JOIN   dbo.PAYSUMGRP PYG ON PYG.PAY_SUM_GRP = SP.PAY_SUM_GRP										
											WHERE	SP.PAY_SUM_GRP NOT IN (SELECT PAY_SUM_GRP FROM dbo.PSGRELATE WHERE PAY_CLASS = 'SPL')
											GROUP BY SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAY_SUM_GRP, 
												PYG.DESCRIPTION, SP.PROCESS_LEVEL, SP.RATE, SP.PAYROLL_YEAR
											 ) SPDIST
											 ON SPDIST.COMPANY = PYM.COMPANY 
												AND SPDIST.EMPLOYEE = PYM.EMPLOYEE 
												AND SPDIST.CHECK_ID = PYM.CHECK_ID
						WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 					
						AND EMP.PAY_FREQUENCY = 4 
						AND (SPDIST.PROCESS_LEVEL BETWEEN '1000' AND '1999'
						OR SPDIST.PROCESS_LEVEL BETWEEN '2100' AND '7999')
						AND PAY_SUM_GRP <> 'PAD'						
						GROUP BY EMP.EMPLOYEE, MP.ProviderMasterID, PYM.CHECK_DATE,PYM.CHECK_NBR, PYM.PER_END_DATE, 
						EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME,SPDIST.PAYROLL_YEAR, PYM.CHECK_TYPE, PYM.CHECK_ID

			
				UPDATE YTDEarningsStatementStagingMD
				SET EarningsStatmentCategory = 'SUMOFTotalHoursTotalEarnings', CategoryFlag = 'C'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL
			
				
				-- set SumOfCurrentEarnings field to NULL when zero
				UPDATE YTDEarningsStatementStagingMD
				SET SumOfTotalEarnings = NULL
				WHERE CategoryFlag = 'C' and SumOfTotalEarnings = 0

				-- set SumOfCurrentEarnings field to NULL when zero
				UPDATE YTDEarningsStatementStagingMD
				SET SumOfTotalHours = NULL
				WHERE CategoryFlag = 'C' and SumOfTotalHours = 0

				-- Load Category D				
				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
									LastName,FirstName,MiddleName,FullName, LbrPayPeriod --(used as temp field for DedCodes)
									, DeductDescr,CurrDeductAmt,CalendarYear,CsdFlxID)
						SELECT DISTINCT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, T_TAX1.CHECK_DATE
									, CheckNo = CASE WHEN T_TAX1.CHECK_TYPE = 'R' THEN RTRIM(CAST(T_TAX1.CHECK_NBR AS VARCHAR(10))) + '.9' 
												WHEN T_TAX1.CHECK_TYPE = 'J' THEN CAST(T_TAX1.CHECK_ID AS VARCHAR(20)) + '.5'
												ELSE CAST(T_TAX1.CHECK_NBR AS VARCHAR(10)) END
									, T_TAX1.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
									, T_TAX1.DED_CODE
									, T_TAX1.CHECK_DESC
									, T_TAX1.DED_AMT
									, CalendarYear = YEAR(T_TAX1.CHECK_DATE)
									, T_TAX1.CHECK_ID
							FROM	dbo.EMPLOYEE EMP			
							JOIN    dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo					   
					   LEFT JOIN	dbo.PAYDEDUCTN PYD ON EMP.EMPLOYEE = PYD.EMPLOYEE
											AND EMP.COMPANY = PYD.COMPANY
							JOIN   (SELECT	PYD.COMPANY, PYD.EMPLOYEE, PYD.DED_CODE, DED.CHECK_DESC, SUM(PYD.DED_AMT) AS DED_AMT, 
											PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.CHECK_TYPE											
									FROM		dbo.DEDCODE DED
									JOIN		dbo.PAYDEDUCTN PYD ON DED.DED_CODE = PYD.DED_CODE				
									LEFT JOIN	dbo.PAYMASTR PYM ON PYM.EMPLOYEE = PYD.EMPLOYEE
													  AND PYM.COMPANY = PYD.COMPANY
													  AND PYM.CHECK_ID = PYD.CHECK_ID
									WHERE DED.CALC_TYPE <> 'T' AND DED.ADJUST_PAY <> 'C'
											AND (DED.TAX_STATUS NOT BETWEEN '01' AND '12' 
												OR DED.TAX_STATUS <> 'X') 
											AND YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
									GROUP BY PYD.COMPANY, PYD.EMPLOYEE, PYD.DED_CODE, DED.CHECK_DESC, PYM.CHECK_DATE,  
											 PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.CHECK_TYPE
											 ) T_TAX1
										ON EMP.EMPLOYEE = T_TAX1.EMPLOYEE AND EMP.COMPANY = T_TAX1.COMPANY
										AND PYD.CHECK_ID = T_TAX1.CHECK_ID
						WHERE YEAR(T_TAX1.CHECK_DATE) = YEAR(GETDATE()) 
								AND EMP.PAY_FREQUENCY = 4 
								AND (PYD.PROCESS_LEVEL BETWEEN '1000' AND '1999'
								OR PYD.PROCESS_LEVEL BETWEEN '2100' AND '7999')
								
				
				UPDATE YTDEarningsStatementStagingMD
				SET EarningsStatmentCategory = 'DeductionsCurrentYTD', CategoryFlag = 'D'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- carry over the deductions on the previous months for the YTD computation
				-- LbrPayPeriod is used as temp field for DedCodes
				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
									LastName,FirstName,MiddleName,FullName, LbrPayPeriod, 
									DeductDescr,CurrDeductAmt,CalendarYear,CsdFlxID)
							SELECT C.CsuFlxIDeb
									, C.ProviderMasterID
									, C.CheckDate	
									, C.CheckNo
									, C.PeriodEnding
									, C.LastName, C.FirstName, C.MiddleName, C.FullName
									, C.LbrPayPeriod, C.DeductDescr									
									, CurrDeductAmt = 0
									, C.CalendarYear, C.CsdFlxID													
								FROM (SELECT DISTINCT B.CsuFlxIDeb, B.ProviderMasterID
											, B.CheckDate, B.CheckNo, B.PeriodEnding
											, B.LastName, B.FirstName, B.MiddleName, B.FullName	
											, A.LbrPayPeriod, A.DeductDescr
											, B.CalendarYear, B.CsdFlxID
									  FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
													, CheckDate, CheckNo, PeriodEnding
													, LastName,FirstName,MiddleName,FullName										
													, LbrPayPeriod, DeductDescr
													, CalendarYear,CsdFlxID	
											FROM YTDEarningsStatementStagingMD
											WHERE CalendarYear = YEAR(GETDATE())
												AND CategoryFlag = 'D') A
											CROSS JOIN (SELECT DISTINCT A.CsuFlxIDeb, A.ProviderMasterID
																		, A.PeriodEnding, A.CheckDate, A.CheckNo
																		, A.LastName,A.FirstName,A.MiddleName,A.FullName										
																		, D.LbrPayPeriod, D.DeductDescr
																		, A.CalendarYear, A.CsdFlxID
														FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																		, PeriodEnding, CheckDate, CheckNo
																		, LastName,FirstName,MiddleName,FullName										
																		, LbrPayPeriod, DeductDescr
																		, CalendarYear, CsdFlxID					
																FROM YTDEarningsStatementStagingMD
																WHERE CategoryFlag = 'D') D
														LEFT JOIN (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																		, PeriodEnding, CheckDate, CheckNo
																		, LastName,FirstName,MiddleName,FullName										
																		, CalendarYear, CsdFlxID						
																	FROM YTDEarningsStatementStagingMD
																	WHERE CategoryFlag = 'A') A
																ON	A.CsuFlxIDeb = D.CsuFlxIDeb) B
									  WHERE A.CsuFlxIDeb = B.CsuFlxIDeb 
									  AND A.CheckDate <= B.CheckDate	
									  ) C
							  LEFT JOIN 
									(SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
											LastName,FirstName,MiddleName,FullName, LbrPayPeriod, DeductDescr, CalendarYear,CsdFlxID
									 FROM YTDEarningsStatementStagingMD 
									 WHERE CategoryFlag = 'D') MD
								ON  C.CsuFlxIDeb = MD.CsuFlxIDeb
								AND C.CheckDate = MD.CheckDate
								AND C.CheckNo = MD.CheckNo
								AND C.LbrPayPeriod = MD.LbrPayPeriod 
								AND C.CalendarYear = MD.CalendarYear									 
								WHERE MD.DeductDescr IS NULL 
							ORDER BY C.CheckDate, C.CheckNo, C.DeductDescr


				UPDATE YTDEarningsStatementStagingMD
				SET EarningsStatmentCategory = 'DeductionsCurrentYTD', CategoryFlag = 'D'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL
				

				UPDATE MD
				SET MD.YTDDeductAmt = B.YTDDeductAmt
				FROM YTDEarningsStatementStagingMD MD
				JOIN (SELECT DISTINCT A.CsuFlxIDeb 
								, A.CheckDate 
								, A.CheckNo 	
								, A.CalendarYear
								, A.LbrPayPeriod 
								, A.DeductDescr								  
								, A.CsdFlxID
								, YTDDeductAmt = SUM(A.YTDDeductAmt)		
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 
									, A.CalendarYear 
									, A.LbrPayPeriod
									, A.DeductDescr	 
									, A.CurrDeductAmt
									, A.CsdFlxID										
									, YTDDeductAmt = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDDeductAmt END				
							FROM YTDEarningsStatementStagingMD AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.CalendarYear
												,t1.LbrPayPeriod
												,t1.DeductDescr
												,t1.CsdFlxID
												,Sum(t1.CurrDeductAmt) AS YTDDeductAmt
										FROM dbo.YTDEarningsStatementStagingMD t1
										WHERE t1.CategoryFlag = 'D'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.CalendarYear
												,t1.LbrPayPeriod
												,t1.DeductDescr
												,t1.CsdFlxID) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate 							
											AND t1.LbrPayPeriod = A.LbrPayPeriod 												
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'D') A
							GROUP BY A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 
									, A.CalendarYear 
									, A.LbrPayPeriod
									, A.DeductDescr	 									
									, A.CsdFlxID	) B
						ON MD.CsuFlxIDeb = B.CsuFlxIDeb
						AND MD.CheckDate = B.CheckDate
						AND MD.CheckNo = B.CheckNo		
						AND MD.CsdFlxID = B.CsdFlxID 
						AND MD.CalendarYear = B.CalendarYear
						AND MD.LbrPayPeriod = B.LbrPayPeriod
				WHERE MD.CategoryFlag = 'D' 

				UPDATE YTDEarningsStatementStagingMD
				SET CurrDeductAmt = NULL
				WHERE CategoryFlag = 'D' AND CurrDeductAmt = 0		

			
				-- Load Category E

				INSERT INTO YTDEarningsStatementStagingMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
							PeriodEnding, LastName,FirstName,MiddleName,FullName,
							BankAcctNo,ABARoutingNo, EFTAmount,AccountType,CalendarYear)
					SELECT DISTINCT   EMP.EMPLOYEE 
									, MP.ProviderMasterID
									, TEMP.CHECK_DATE
									, CheckNo = CASE WHEN TEMP.CHECK_TYPE = 'R' THEN RTRIM(CAST(TEMP.CHECK_NBR AS VARCHAR(10))) + '.9' 
												WHEN TEMP.CHECK_TYPE = 'J' THEN CAST(TEMP.CHECK_ID AS VARCHAR(20)) + '.5'
												ELSE CAST(TEMP.CHECK_NBR AS VARCHAR(10)) END
									, TEMP.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME					
									, TEMP.BankAcctNo
									, TEMP.ABARoutingNo
									, TEMP.EFTAmount
									, TEMP.AcctType
									, PRT.PAYROLL_YEAR
							FROM	dbo.EMPLOYEE EMP
						LEFT JOIN	dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
						LEFT JOIN	dbo.PRTIME PRT ON EMP.EMPLOYEE = PRT.EMPLOYEE
											AND EMP.COMPANY = PRT.COMPANY	
							JOIN	(SELECT Y.COMPANY, Y.EMPLOYEE, Y.PER_END_DATE, Y.CHECK_DATE, Y.CHECK_TYPE, Y.CHECK_NBR, 
											Y.CHECK_ID, Y.CheckAmount, Y.BankAcctNo, Y.ABARoutingNo, Y.AcctType, Y.ACHDistAmt,
											(CASE WHEN Y.ACHDistNo > 0 THEN Y.ACHDistAmt ELSE Y.CheckAmount END) EFTAmount								
									 FROM (SELECT PYM.COMPANY, PYM.EMPLOYEE, PYM.PER_END_DATE, PYM.CHECK_DATE, PYM.CHECK_TYPE
												, PYM.CHECK_NBR, PYM.CHECK_ID 
												, BankAcctNo = ISNULL(DEP.EBNK_ACCT_NBR,'') 
												, ABARoutingNo = ISNULL(DEP.EBANK_ID,'') 
												, ACHDistNo = ISNULL(EADT.ACH_DIST_NBR,0)
												, AcctType = ISNULL(EADT.ACCOUNT_TYPE,'') 						
												, PYM.NET_PAY_AMT AS CheckAmount 										 
												, ACHDistAmt = ISNULL((CASE WHEN EADT.RECON_AMOUNT >= EADT.DIST_AMOUNT THEN EADT.RECON_AMOUNT ELSE EADT.DIST_AMOUNT END),0)
											FROM  dbo.PAYMASTR PYM 
											JOIN  dbo.EMPACHDIST EADT ON PYM.CHECK_ID = EADT.CHECK_ID 
														AND PYM.EMPLOYEE = EADT.EMPLOYEE
														AND PYM.COMPANY = EADT.COMPANY
											LEFT JOIN dbo.EMACHDEPST DEP ON EADT.COMPANY = DEP.COMPANY -- ADDED 10/30/2008
														AND EADT.EMPLOYEE = DEP.EMPLOYEE
														AND EADT.ACH_DIST_NBR = DEP.ACH_DIST_NBR
											WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) AND PYM.CHECK_NBR <> 0) Y )TEMP
									ON TEMP.EMPLOYEE = EMP.EMPLOYEE AND TEMP.COMPANY = EMP.COMPANY
									AND TEMP.CHECK_ID = PRT.CHECK_ID
						WHERE YEAR(TEMP.CHECK_DATE) = YEAR(GETDATE())	
						AND EMP.PAY_FREQUENCY = 4 
						AND (PRT.PROCESS_LEVEL BETWEEN '1000' AND '1999'
						OR PRT.PROCESS_LEVEL BETWEEN '2100' AND '7999')
						

				UPDATE YTDEarningsStatementStagingMD
				SET EarningsStatmentCategory = 'EFTBankingInfo', CategoryFlag = 'E'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL

				

				-- update Fullname to PEM-SPOUSE-EMP if said field is not empty or not null
				
				UPDATE MD
				SET FullName = CASE WHEN PEM.SPOUSE_EMP = '' OR PEM.SPOUSE_EMP IS NULL
									 THEN MD.FullName ELSE PEM.SPOUSE_EMP END							   
				FROM YTDEarningsStatementStagingMD MD
				JOIN dbo.PAEMPLOYEE PEM
				ON PEM.EMPLOYEE = MD.CsuFlxIDeb


				-- UPDATE ActivityIn field 
				
				UPDATE MD
				SET ActivityIn = '12/' + Cast(Year(CheckDate)-1 as char(4)) 
				FROM YTDEarningsStatementStagingMD MD
				WHERE CheckDate IN
					(SELECT CheckDate FROM YTDEarningsStatementStagingMD
					 GROUP BY CheckDate
					 HAVING MONTH(CheckDate) = 1)

				UPDATE MD
				SET ActivityIn = RTRIM(Cast(Month(CheckDate)-1 as char(4))) + '/' + Cast(Year(CheckDate) as char(4))
				FROM YTDEarningsStatementStagingMD MD
				WHERE CheckDate IN
					(SELECT CheckDate FROM YTDEarningsStatementStagingMD
					 GROUP BY CheckDate
					 HAVING MONTH(CheckDate) <> 1)


				-- update EBPSID column
				
				UPDATE MD
				SET CsuPSID =
					CASE WHEN PRT.PROCESS_LEVEL > CAST('999' AS INT) AND PRT.PROCESS_LEVEL < CAST('2000' AS INT)
							THEN 'CEP' 
						WHEN PRT.PROCESS_LEVEL >= CAST('2100' AS INT) AND PRT.PROCESS_LEVEL < CAST('2200' AS INT)
							THEN 'WEP' 
						WHEN PRT.PROCESS_LEVEL >= CAST('2200' AS INT) AND PRT.PROCESS_LEVEL < CAST('2300' AS INT)
							THEN 'DEP' 
						WHEN PRT.PROCESS_LEVEL >= CAST('2300' AS INT) AND PRT.PROCESS_LEVEL < CAST('2400' AS INT)
							THEN 'AEP' 
						WHEN PRT.PROCESS_LEVEL >= CAST('2400' AS INT) AND PRT.PROCESS_LEVEL < CAST('2500' AS INT)
							THEN 'TEP' 
						WHEN PRT.PROCESS_LEVEL >= CAST('2500' AS INT) AND PRT.PROCESS_LEVEL < CAST('2600' AS INT)
							THEN 'ILP' 
						WHEN PRT.PROCESS_LEVEL >= CAST('2600' AS INT) AND PRT.PROCESS_LEVEL < CAST('2700' AS INT)
							THEN 'WAP' 
					END
				FROM YTDEarningsStatementStagingMD MD	
				LEFT JOIN (SELECT DISTINCT(A.EMPLOYEE), A.PROCESS_LEVEL
							FROM dbo.PRTIME A  JOIN dbo.EMPLOYEE B
								ON A.EMPLOYEE = B.EMPLOYEE AND A.COMPANY = B.COMPANY
							WHERE B.PAY_FREQUENCY = 4							
							AND (A.PROCESS_LEVEL BETWEEN '1000' AND '1999'
							OR A.PROCESS_LEVEL BETWEEN '2100' AND '7999')							
							) PRT
					ON MD.CsuFlxIDeb = PRT.EMPLOYEE


				-- update PayPeriod field 

				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '01' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 1 
					
				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '02' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 2
					
				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '03' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 3
					
				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '04' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 4
					
				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '05' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 5

				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '06' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 6


				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '07' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 7


				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '08' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 8


				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '09' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 9


				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '10' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 10


				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '11' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 11


				UPDATE MD
				SET PayPeriod = RTRIM(CalendarYear) + '12' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
				FROM YTDEarningsStatementStagingMD MD
				WHERE MONTH(CheckDate) = 12

				-- transfer data from staging table to current table

				-- Load Category A1			
				INSERT INTO YTDEarningsStatementMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
								LastName,FirstName,MiddleName,FullName,	CalendarYear,SumOfCurrentHours, SumOfYTDHours,
								ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag)
					SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
								LastName,FirstName,MiddleName,FullName,	CalendarYear,SumOfCurrentHours, SumOfYTDHours,
								ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag
					FROM YTDEarningsStatementStagingMD tmp
					WHERE CategoryFlag = 'A1' 
					AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveMD 
										WHERE	CategoryFlag = 'A1' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)

				-- Load Category S
				INSERT INTO YTDEarningsStatementMD (CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo,LastName,FirstName,MiddleName,FullName,
									CalendarYear,PayCode, PayCodeDescr, TotalEarnings, YTDNetPay,
									ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag)
					SELECT CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo,LastName,FirstName,MiddleName,FullName,
									CalendarYear,PayCode, PayCodeDescr, TotalEarnings, YTDNetPay,
									ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag
					FROM YTDEarningsStatementStagingMD tmp
					WHERE CategoryFlag = 'S' 
					AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveMD 
										WHERE	CategoryFlag = 'S' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)


				-- Load Category A
				INSERT INTO YTDEarningsStatementMD (CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo, CheckAmt,LastName,FirstName,MiddleName,FullName,
									CalendarYear,ClockNo,CurrentGrossPay,CurrentNetPay,YTDGrossPay,YTDNetPay,
									ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag)
					SELECT CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo, CheckAmt,LastName,FirstName,MiddleName,FullName,
									CalendarYear,ClockNo,CurrentGrossPay,CurrentNetPay,YTDGrossPay,YTDNetPay,
									ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag
					FROM YTDEarningsStatementStagingMD tmp
					WHERE CategoryFlag = 'A' 
					AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveMD 
										WHERE	CategoryFlag = 'A' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)

				-- Load Category B
				INSERT INTO YTDEarningsStatementMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
							LastName,FirstName,MiddleName,FullName,Dept, DeptDescr, PayCode, PayCodeDescr, 
							HourlyRate, TotalHoursbyPayCode,TotalEarnings, CalendarYear,
							ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag)	
					SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
							LastName,FirstName,MiddleName,FullName,Dept, DeptDescr, PayCode, PayCodeDescr, 
							HourlyRate, TotalHoursbyPayCode,TotalEarnings, CalendarYear,
							ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag
					FROM YTDEarningsStatementStagingMD tmp
					WHERE CategoryFlag = 'B' 
					AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveMD 
										WHERE	CategoryFlag = 'B' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)

				-- Load Category C
				INSERT INTO YTDEarningsStatementMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,PeriodEnding,
									LastName,FirstName,MiddleName,FullName,CalendarYear,SumOfTotalHours,SumOfTotalEarnings,
									ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag)
					SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,PeriodEnding,
									LastName,FirstName,MiddleName,FullName,CalendarYear,SumOfTotalHours,SumOfTotalEarnings,
									ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag
					FROM YTDEarningsStatementStagingMD tmp
					WHERE CategoryFlag = 'C' 
					AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveMD 
										WHERE	CategoryFlag = 'C' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)

				-- Load Category D
				INSERT INTO YTDEarningsStatementMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
									LastName,FirstName,MiddleName,FullName, DeductDescr,CurrDeductAmt,YTDDeductAmt,CalendarYear,
									ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag)
					SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
									LastName,FirstName,MiddleName,FullName, DeductDescr,CurrDeductAmt,YTDDeductAmt,CalendarYear,
									ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag
					FROM YTDEarningsStatementStagingMD tmp
					WHERE CategoryFlag = 'D' 
					AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveMD 
										WHERE	CategoryFlag = 'D' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)


				-- Load Category E
				INSERT INTO YTDEarningsStatementMD (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
							PeriodEnding, LastName,FirstName,MiddleName,FullName,
							BankAcctNo,ABARoutingNo, EFTAmount,AccountType,CalendarYear,
							ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag)
					SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
							PeriodEnding, LastName,FirstName,MiddleName,FullName,
							BankAcctNo,ABARoutingNo, EFTAmount,AccountType,CalendarYear,
							ActivityIn, PayPeriod, CsuPSID, EarningsStatmentCategory, CategoryFlag
					FROM YTDEarningsStatementStagingMD tmp
					WHERE CategoryFlag = 'E' 
					AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveMD 
										WHERE	CategoryFlag = 'E' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)


				delete from YTDEarningsStatementMD
				--select * from YTDEarningsStatementMD
				where 
				CheckNo in
				(
				select CheckNo from YTDEarningsStatementMD Tmp
				where CalendarYear=year(getdate()) and Tmp.TotalEarnings = YTDEarningsStatementMD.TotalEarnings
				)
				and CalendarYear in (year(getdate())-1, year(getdate())-2)
				
				
				--handle multiple Bonus rows
				
				--DELETE
				--FROM YTDEarningsStatementMD
				--WHERE CategoryFlag = 'S'
				--AND PayCodeDescr LIKE 'NQ ESTIMATED BONUS'
				--AND CalendarYear <> YEAR(CheckDate)
				----ORDER BY CsuFlxIDeb
				

				-- transfer data from current table to archive table
				INSERT INTO YTDEarningsStatementArchiveMD
					SELECT * FROM YTDEarningsStatementMD


		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		IF (XACT_STATE()) = -1
			ROLLBACK TRANSACTION;

		-- Test if the transaction is committable
		IF (XACT_STATE()) = 1
			COMMIT TRANSACTION;   
    
	END CATCH;
END












