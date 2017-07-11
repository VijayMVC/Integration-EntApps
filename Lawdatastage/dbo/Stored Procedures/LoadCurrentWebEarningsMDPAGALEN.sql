









/*
11-17-2008:
	1.  IMPLEMENT VOID CHECKS (ADD SUFFIX OF .9 IN CHECKNOs WITH CHECKTYPE = R) 
			AFFECTED CATEGORY FLAG: ALL 
	2.  IMPLEMENT DED-REFUND CASE (POINT TO PAYMASTR PROCESS LEVEL) AND SET CALENDARYR = YEAR(CHECKDATE)
			AFFECTED CATEGORY FLAG: M2, F, G, H
	3.  IMPLEMENT SETTING OF HOURLY RATE = 0 FOR PAYCODES WITH CALC_TYPE = A AND HARDCODE PAYCODES 'E7' AND 'E9' TO SET HOURLYRATE ALSO TO 0.
			AFFECTED CATEGORY FLAG: K ONLY
	4.  YTD USES CHECK_ID TO CATER ALL YTD SCENARIO: MULTIPLE CHECK, ADJUSTMENTS WITH SAME CHECKNO AND CHECKDATE, MANUAL CHECKS, REVERSALS AND VOIDED CHECKS.
  11-18-2008:
	1.  SET CHECK_ID + .5 TO THE CHECKNO OF TRANSACTIONS WITH CHECK_TYPE = J (ADJUSTMENTS)
  11-19-2008:
	1.  IMPLEMENTATION OF DED-REFUND CASE USING AN OR STATEMENT TO LOOK INTO THE PRTIME AND PAYDEDUCTN
			AFFECTED CATEGORY FLAG: M2
			CATEGORY FLAGS F, G, H POINTS TO THE PAYDEDUCTN TABLE SINCE THIS IS PULLING DEDUCTION DATA
	2.  IMPLEMENTATION OF THE SDIADJVALUE (STATE TAX ADJUSTMENT) 
			AFFECTED CATEGORY FLAG: M
  11-25-2008:
	Implement revisions on the YTD computation for multiple check with void checks (or 3 or more checks regardless of transaction).
  12-15-2008:  ADDED LINK CHECK_ID FOR CATEGORY E,F,G,H
  6/4/2010:  Revised by:  Jay Santhan, a modification was made on 6/1/10 to expand the category M fix. Now a category Flag M is added for any CheckNo that is missing it.

*/
CREATE PROCEDURE [dbo].[LoadCurrentWebEarningsMDPAGALEN]
	@PAY_FREQUENCY_START TINYINT,
	@PAY_FREQUENCY_END TINYINT,
	@PL_START1 CHAR(5),
	@PL_END1 CHAR(5),
	@PL_START2 CHAR(5),
	@PL_END2 CHAR(5)	

AS
BEGIN
SET NOCOUNT ON;
--SET XACT_ABORT ON;
--	BEGIN TRY
--		BEGIN TRANSACTION;
				-- this sp is dependent on the LawsonIDMatchSFDC table for ProviderMasterID
	



					
				TRUNCATE TABLE YTDEarningsStatementMDPAGALEN	
				TRUNCATE TABLE YTDEarningsStatementStagingMDPAGALEN

				-- LOAD CATEGORY E
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,
								BankAcctNo,EFTAmount,AccountType,CalendarYear)
					SELECT DISTINCT   EMP.EMPLOYEE 
									, MP.ProviderMasterID
									, TEMP.CHECK_DATE
									, CheckNo = CASE WHEN TEMP.CHECK_TYPE = 'R' THEN RTRIM(CAST(TEMP.CHECK_NBR AS VARCHAR(20))) + '.9' 
													 WHEN TEMP.CHECK_TYPE = 'J' THEN CAST(TEMP.CHECK_ID AS VARCHAR(20)) + '.5' 
													 ELSE CAST(TEMP.CHECK_NBR AS VARCHAR(10)) END
									, TEMP.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
									, TEMP.BankAcctNo
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
						AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
						AND (PRT.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
						OR PRT.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)
						
									
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'EFTBankingInfo', CategoryFlag = 'E'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL

			
				-- Load Category M2
				-- Implement Ded-Refund case or (Reversal Deduction cases) by pointing the Process Level filter to PAYMASTR TABLE instead of pointing it to the PRTIME.  
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,CalendarYear,
								CurrentGrossPay,CurrentNetPay,CurrTax,CurrTaxWage,CurrDed,CsdFlxID)
						SELECT DISTINCT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(20))) + '.9' 
													 WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
													 ELSE CAST(PYM.CHECK_NBR AS VARCHAR(20)) END
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
									, CalendarYear = YEAR(PYM.CHECK_DATE)
									, PYM.GROSS_PAY
									, PYM.NET_PAY_AMT
									, CurrTax = ISNULL(TMPA.CurrTax,0)
									, CurrTaxWage = PYM.GROSS_PAY - ISNULL(TMPA.PreTax,0)
									, CurrDed = ISNULL(TMPA.AfterTax,0)
									, PYM.CHECK_ID
						FROM		dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo	
						JOIN		dbo.PAYMASTR PYM ON PYM.EMPLOYEE = EMP.EMPLOYEE
											AND PYM.COMPANY = EMP.COMPANY				
						LEFT JOIN	(SELECT TMP.COMPANY, TMP.EMPLOYEE, TMP.PROCESS_LEVEL, TMP.PAYROLL_YEAR
											, TMP.CHECK_DATE, TMP.CHECK_NBR, TMP.CHECK_ID, TMP.PER_END_DATE, TMP.TIME_STAMP
											, TMP.GROSS_PAY, TMP.NET_PAY_AMT											
											, CurrTax= ISNULL(SUM(TMP.CurrTax),0)
											, PreTax= ISNULL(SUM(TMP.PreTax),0)
											, AfterTax = ISNULL(SUM(TMP.AfterTax),0)
									FROM  (SELECT PYM.COMPANY, PYM.EMPLOYEE, PYM.PROCESS_LEVEL, PYD.PAYROLL_YEAR
														, PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP
														, PYM.GROSS_PAY, PYM.NET_PAY_AMT					
														, CurrTax=ISNULL(SUM(PYD.DED_AMT),0)
														, 0 AS AfterTax, 0 PreTax
														FROM	  dbo.DEDCODE DED
														JOIN	  dbo.PAYDEDUCTN PYD ON DED.DED_CODE = PYD.DED_CODE
														LEFT JOIN dbo.PAYMASTR PYM ON PYM.COMPANY = PYD.COMPANY
																	AND PYM.EMPLOYEE = PYD.EMPLOYEE
																	AND PYM.CHECK_ID = PYD.CHECK_ID 	
													WHERE DED.CALC_TYPE = 'T' AND DED.ADJUST_PAY = 'S'	
													AND YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
													GROUP BY PYM.COMPANY, PYM.EMPLOYEE, PYM.PROCESS_LEVEL, PYD.PAYROLL_YEAR
														, PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP
														, PYM.GROSS_PAY, PYM.NET_PAY_AMT											
											UNION ALL -- union to Category H (pre tax)
											SELECT PYM.COMPANY, PYM.EMPLOYEE, PYM.PROCESS_LEVEL, PYD.PAYROLL_YEAR
												, PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP
												, PYM.GROSS_PAY, PYM.NET_PAY_AMT, 0 AS CurrTax, 0 AS AfterTax
												, PreTax= ISNULL(SUM(PYD.DED_AMT),0) 												
											FROM		dbo.DEDCODE DED
											JOIN		dbo.PAYDEDUCTN PYD ON DED.DED_CODE = PYD.DED_CODE
											LEFT JOIN	dbo.PAYMASTR PYM ON PYM.EMPLOYEE = PYD.EMPLOYEE
																  AND PYM.COMPANY = PYD.COMPANY
																  AND PYM.CHECK_ID = PYD.CHECK_ID					
													WHERE DED.CALC_TYPE <> 'T'
														AND DED.ADJUST_PAY <> 'C'									
														AND (DED.TAX_STATUS BETWEEN '01' AND '12' 
														OR DED.TAX_STATUS = 'X')
														AND YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
													 GROUP BY PYM.COMPANY, PYM.EMPLOYEE, PYM.PROCESS_LEVEL, PYD.PAYROLL_YEAR
																, PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP
																, PYM.GROSS_PAY, PYM.NET_PAY_AMT
										UNION ALL  -- union to Category G (after tax) 
										SELECT PYM.COMPANY, PYM.EMPLOYEE, PYM.PROCESS_LEVEL, PYD.PAYROLL_YEAR
											, PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP
											, PYM.GROSS_PAY, PYM.NET_PAY_AMT, 0 AS CurrTax
											, AfterTax = ISNULL(SUM(PYD.DED_AMT),0), 0 as PreTax
										FROM	  dbo.DEDCODE DED
										JOIN	  dbo.PAYDEDUCTN PYD ON DED.DED_CODE = PYD.DED_CODE
										LEFT JOIN dbo.PAYMASTR PYM ON PYM.COMPANY = PYD.COMPANY
													  AND PYM.EMPLOYEE = PYD.EMPLOYEE
													  AND PYM.CHECK_ID = PYD.CHECK_ID											
										WHERE DED.CALC_TYPE <> 'T' AND DED.ADJUST_PAY <> 'C'
											AND DED.TAX_STATUS NOT BETWEEN '01' AND '12' 
											AND DED.TAX_STATUS <> 'X'
											AND YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
										GROUP BY PYM.COMPANY, PYM.EMPLOYEE, PYM.PROCESS_LEVEL, PYD.PAYROLL_YEAR
											, PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP
											, PYM.GROSS_PAY, PYM.NET_PAY_AMT
									) TMP	
									GROUP BY TMP.COMPANY, TMP.EMPLOYEE, TMP.PROCESS_LEVEL, TMP.PAYROLL_YEAR
											, TMP.CHECK_DATE, TMP.CHECK_NBR, TMP.CHECK_ID, TMP.PER_END_DATE, TMP.TIME_STAMP
											, TMP.GROSS_PAY, TMP.NET_PAY_AMT
									) TMPA
											ON PYM.EMPLOYEE = TMPA.EMPLOYEE 
											AND PYM.COMPANY = TMPA.COMPANY
											AND PYM.CHECK_ID = TMPA.CHECK_ID
							LEFT JOIN	dbo.PRTIME PRT ON PYM.EMPLOYEE = PRT.EMPLOYEE
											AND PYM.COMPANY = PRT.COMPANY AND PYM.CHECK_ID = PRT.CHECK_ID
							LEFT JOIN	dbo.PAYDEDUCTN PYD ON PYM.EMPLOYEE = PYD.EMPLOYEE
											AND PYM.COMPANY = PYD.COMPANY AND PYM.CHECK_ID = PYD.CHECK_ID	
						WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
							AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
							AND ((PRT.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1 OR PRT.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)
								OR (PYD.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1 OR PYD.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2))						
												
				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'CheckAmtGrossPayNetPayYTD2', CategoryFlag = 'M2'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL	


				-- Load Category S (Special Distribution)
				
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo,LastName,FirstName,MiddleName,FullName,
									CalendarYear, PayCode, PayCodeDescr, TotalEarnings,CsdFlxID)
						SELECT DISTINCT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.PER_END_DATE
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(20))) + '.9' 
													 WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
													 ELSE CAST(PYM.CHECK_NBR AS VARCHAR(20)) END									
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
									, PRT.PAYROLL_YEAR
									, SPDIST.PAY_SUM_GRP AS PayCode
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
						AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
						AND (PRT.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
						OR PRT.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)								
					

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'SpecialDistribution', CategoryFlag = 'S'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- carry over the not captured checkdates on the first insert for YTD computation			
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo,LastName,FirstName,MiddleName,FullName,
									CalendarYear, PayCode, PayCodeDescr, TotalEarnings,CsdFlxID)
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
											FROM YTDEarningsStatementStagingMDPAGALEN
											WHERE CategoryFlag = 'S') A
											CROSS JOIN (SELECT DISTINCT M2.CsuFlxIDeb, M2.ProviderMasterID
																		, M2.PeriodEnding, M2.CheckDate, M2.CheckNo
																		, M2.LastName,M2.FirstName,M2.MiddleName,M2.FullName										
																		, S.PayCode, S.PayCodeDescr	
																		, M2.CalendarYear, M2.CsdFlxID
														FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																		, PeriodEnding, CheckDate, CheckNo
																		, LastName,FirstName,MiddleName,FullName										
																		, PayCode, PayCodeDescr	
																		, CalendarYear, CsdFlxID					
																FROM YTDEarningsStatementStagingMDPAGALEN
																WHERE CategoryFlag = 'S') S
														LEFT JOIN (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																		, PeriodEnding, CheckDate, CheckNo
																		, LastName,FirstName,MiddleName,FullName										
																		, CalendarYear, CsdFlxID						
																	FROM YTDEarningsStatementStagingMDPAGALEN
																	WHERE CategoryFlag = 'M2') M2
																ON	M2.CsuFlxIDeb = S.CsuFlxIDeb) B
									  WHERE A.CsuFlxIDeb = B.CsuFlxIDeb 
									  AND A.CheckDate <= B.CheckDate									  
									  ) C
							  LEFT JOIN 
									(SELECT CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, CheckNo,
											LastName,FirstName,MiddleName,FullName, PayCode, PayCodeDescr, CalendarYear
									 FROM YTDEarningsStatementStagingMDPAGALEN 
									 WHERE CategoryFlag = 'S') PA
								ON  C.CsuFlxIDeb = PA.CsuFlxIDeb
								AND C.CheckDate = PA.CheckDate
								AND C.CheckNo = PA.CheckNo
								AND C.PayCode = PA.PayCode
								AND C.CalendarYear = PA.CalendarYear		 
								WHERE PA.PayCode IS NULL 
							ORDER BY C.CheckDate, C.CheckNo, C.PayCode

				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'SpecialDistribution', CategoryFlag = 'S'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- YTD Computation for Category S

				UPDATE PA
				SET PA.YTDNetPay = B.YTDNetPay			
				FROM YTDEarningsStatementStagingMDPAGALEN PA
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
							FROM YTDEarningsStatementStagingMDPAGALEN AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.PayCode
												,t1.CalendarYear
												,t1.CsdFlxID
												,Sum(t1.TotalEarnings) AS YTDNetPay
										FROM dbo.YTDEarningsStatementStagingMDPAGALEN t1
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
						ON PA.CsuFlxIDeb = B.CsuFlxIDeb
						AND PA.CheckDate = B.CheckDate
						AND PA.CheckNo = B.CheckNo		
						AND PA.CsdFlxID = B.CsdFlxID 
						AND PA.CalendarYear = B.CalendarYear
						AND PA.PayCode = B.PayCode
				WHERE PA.CategoryFlag = 'S' 


				DELETE 
				FROM YTDEarningsStatementStagingMDPAGALEN
				WHERE CategoryFlag = 'S' AND YTDNetPay IS NULL

				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET TotalEarnings = NULL
				WHERE CategoryFlag = 'S' AND TotalEarnings = 0


				-- implement impact of Category S to M2
				/*When a Check is issued to an SPL paycode only, the PAYMASTR table contains a GrossPay equal to 0.
				  But when a Check has both an SPL and a NON-SPL, then the GrossPay displays the sum of WAGE_AMOUNT for Non-SPL Paycode*/
				UPDATE PA
				SET CurrentGrossPay = NULL
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				WHERE PA.CategoryFlag = 'M2' and CurrentGrossPay = 0


				-- Category M2:  COMPUTE YTDTax,YTDTaxWage,YTDDed,YTDGrossPay,YTDNetPay after the implementation of the impact of S to M2
				
				UPDATE PA
				SET PA.YTDTax = B.YTDTax,
					PA.YTDTaxWage = B.YTDTaxWage,
					PA.YTDDed = B.YTDDed,
					PA.YTDGrossPay = B.YTDGrossPay,
					PA.YTDNetPay = B.YTDNetPay
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 							
							, A.CalendarYear 	 
							, A.CsdFlxID 								
							, YTDTax = SUM(A.YTDTax)
							, YTDTaxWage = SUM(A.YTDTaxWage)
							, YTDDed = SUM(A.YTDDed)
							, YTDGrossPay = SUM(A.YTDGrossPay)
							, YTDNetPay = SUM(A.YTDNetPay)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 									
									, A.CalendarYear 	 
									, A.CsdFlxID 										
									, YTDTax = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDTax END				
									, YTDTaxWage = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDTaxWage END				
									, YTDDed = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDDed END				
									, YTDGrossPay = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDGrossPay END
									, YTDNetPay = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDNetPay END
							FROM YTDEarningsStatementStagingMDPAGALEN AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CalendarYear
												,t1.CsdFlxID
												,SUM(t1.CurrTax) AS YTDTax
												,SUM(t1.CurrTaxWage) AS YTDTaxWage
												,SUM(t1.CurrDed) AS YTDDed
												,SUM(t1.CurrentGrossPay) AS YTDGrossPay
												,SUM(t1.CurrentNetPay) AS YTDNetPay
										FROM dbo.YTDEarningsStatementStagingMDPAGALEN t1
										WHERE t1.CategoryFlag = 'M2'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CsdFlxID
												,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate											
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'M2') A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 											
											, A.CalendarYear 	 
											, A.CsdFlxID 	
											) B
						ON PA.CsuFlxIDeb = B.CsuFlxIDeb
						AND PA.CheckDate = B.CheckDate
						AND PA.CheckNo = B.CheckNo		
						AND PA.CsdFlxID = B.CsdFlxID 
						AND PA.CalendarYear = B.CalendarYear						
				WHERE PA.CategoryFlag = 'M2' 


				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrentGrossPay = NULL
				WHERE CategoryFlag = 'M2' AND CurrentGrossPay = 0

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrentNetPay = NULL
				WHERE CategoryFlag = 'M2' AND CurrentNetPay = 0
				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrTax = NULL
				WHERE CategoryFlag = 'M2' AND CurrTax = 0

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrTaxWage = NULL
				WHERE CategoryFlag = 'M2' AND CurrTaxWage = 0

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrDed = NULL
				WHERE CategoryFlag = 'M2' AND CurrDed = 0	


				-- additional requirement 10/31/2008
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET YTDDed = NULL
				WHERE CategoryFlag = 'M2' AND YTDDed = 0	


				--Load Category F				
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,
								LbrCustPayCode,CsxShortDesc,CsxCurrTax,CalendarYear,CsdFlxID)
				SELECT DISTINCT EMP.EMPLOYEE
							,	MP.ProviderMasterID
							,	T_TAX.CHECK_DATE
							,	CheckNo = CASE WHEN T_TAX.CHECK_TYPE = 'R' THEN RTRIM(CAST(T_TAX.CHECK_NBR AS VARCHAR(20))) + '.9' 
											   WHEN T_TAX.CHECK_TYPE = 'J' THEN CAST(T_TAX.CHECK_ID AS VARCHAR(20)) + '.5'
											   ELSE CAST(T_TAX.CHECK_NBR AS VARCHAR(20)) END
							,	T_TAX.PER_END_DATE
							,	EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
							, 	RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
							,	T_TAX.DED_CODE
							,	T_TAX.CHECK_DESC
							,   T_TAX.DED_AMT as CsxCurrTax
							,   CalendarYear = YEAR(T_TAX.CHECK_DATE)
							,   T_TAX.CHECK_ID
					FROM	dbo.EMPLOYEE EMP
				LEFT JOIN	dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
				LEFT JOIN	dbo.PAYDEDUCTN PYD ON EMP.EMPLOYEE = PYD.EMPLOYEE
									AND EMP.COMPANY = PYD.COMPANY
					 JOIN  (SELECT  PYM.COMPANY, PYM.EMPLOYEE, PYD.DED_CODE, DED.CHECK_DESC
								  , SUM(PYD.DED_AMT) AS DED_AMT, PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID
								  , PYM.PER_END_DATE, PYM.TIME_STAMP, PYM.CHECK_TYPE
							FROM	dbo.DEDCODE DED
							JOIN	dbo.PAYDEDUCTN PYD ON DED.DED_CODE = PYD.DED_CODE							
						LEFT JOIN	dbo.PAYMASTR PYM ON PYM.EMPLOYEE = PYD.EMPLOYEE
											  AND PYM.COMPANY = PYD.COMPANY
											  AND PYM.CHECK_ID = PYD.CHECK_ID
							WHERE	DED.CALC_TYPE = 'T' AND DED.ADJUST_PAY = 'S' 
										AND YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
							GROUP BY PYM.COMPANY, PYM.EMPLOYEE, PYD.DED_CODE, DED.CHECK_DESC, PYM.CHECK_DATE, 
									 PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP, PYM.CHECK_TYPE
							) T_TAX
									ON EMP.EMPLOYEE = T_TAX.EMPLOYEE AND EMP.COMPANY = T_TAX.COMPANY	
									AND PYD.CHECK_ID = T_TAX.CHECK_ID												
					WHERE YEAR(T_TAX.CHECK_DATE) = YEAR(GETDATE()) 
					AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
					AND (PYD.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
					OR PYD.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)					


				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'StandardTaxGroupedbyCategory', CategoryFlag = 'F'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL

				
				-- carry over the deductions on the previous months for the YTD computation			
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,
								LbrCustPayCode,CsxShortDesc,CsxCurrTax,CalendarYear,CsdFlxID)
							SELECT C.CsuFlxIDeb
									, C.ProviderMasterID
									, C.CheckDate	
									, C.CheckNo
									, C.PeriodEnding
									, C.LastName, C.FirstName, C.MiddleName, C.FullName
									, C.LbrCustPayCode, C.CsxShortDesc									
									, CsxCurrTax = 0
									, C.CalendarYear
									, C.CsdFlxID
								FROM (SELECT DISTINCT B.CsuFlxIDeb, B.ProviderMasterID
											, B.CheckDate, B.CheckNo, B.PeriodEnding
											, B.LastName, B.FirstName, B.MiddleName, B.FullName	
											, A.LbrCustPayCode, A.CsxShortDesc				
											, B.CalendarYear, B.CsdFlxID			
									  FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
													, CheckDate, CheckNo, PeriodEnding
													, LastName,FirstName,MiddleName,FullName										
													, LbrCustPayCode, CsxShortDesc
													, CalendarYear, CsdFlxID					
											FROM YTDEarningsStatementStagingMDPAGALEN
											WHERE CalendarYear = YEAR(GETDATE())  
												AND CategoryFlag = 'F') A
											CROSS JOIN (SELECT DISTINCT M2.CsuFlxIDeb, M2.ProviderMasterID
																	, M2.CheckDate, M2.CheckNo, M2.PeriodEnding
																	, M2.LastName,M2.FirstName,M2.MiddleName,M2.FullName										
																	, F.LbrCustPayCode, F.CsxShortDesc
																	, M2.CalendarYear, M2.CsdFlxID
														FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																	, CheckDate, CheckNo, PeriodEnding
																	, LastName,FirstName,MiddleName,FullName										
																	, LbrCustPayCode, CsxShortDesc
																	, CalendarYear, CsdFlxID							
																FROM YTDEarningsStatementStagingMDPAGALEN
																WHERE CategoryFlag = 'F') F
														LEFT JOIN (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																			, CheckDate, CheckNo, PeriodEnding
																			, LastName,FirstName,MiddleName,FullName																			
																			, CalendarYear, CsdFlxID							
																	FROM YTDEarningsStatementStagingMDPAGALEN 
																	WHERE CategoryFlag = 'M2') M2
																ON	M2.CsuFlxIDeb = F.CsuFlxIDeb) B
									  WHERE A.CsuFlxIDeb = B.CsuFlxIDeb 
									  AND A.CheckDate <= B.CheckDate									  
									  ) C
							  LEFT JOIN 
									(SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
											LastName,FirstName,MiddleName,FullName, LbrCustPayCode,CsxShortDesc,CalendarYear
									 FROM YTDEarningsStatementStagingMDPAGALEN 
									 WHERE CategoryFlag = 'F') PA
								ON  C.CsuFlxIDeb = PA.CsuFlxIDeb
								AND C.CheckDate = PA.CheckDate
								AND C.CheckNo = PA.CheckNo
								AND C.LbrCustPayCode = PA.LbrCustPayCode
								AND C.CalendarYear = PA.CalendarYear		 
								WHERE PA.CsxShortDesc IS NULL 
							ORDER BY C.CheckDate, C.CheckNo, C.CsxShortDesc


				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'StandardTaxGroupedbyCategory', CategoryFlag = 'F'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				/*1.  used LbrCustPayCode as temporary field for DeductionCode to meet the requirement 
				      i.e. to split the YTD of different DeductionCodes but with same description 
				  2.  used CsdFlxID as temp field to calculate YTD of multiple checks - this field stores the timestamp
				*/

				-- YTD computation for Category F

				UPDATE PA
				SET PA.CsxYTDTax = B.CsxYTDTax
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				JOIN (SELECT A.CsuFlxIDeb 
								, A.CheckDate 
								, A.CheckNo 
								, A.LbrCustPayCode	
								, A.CalendarYear 	 
								, A.CsdFlxID 	
								, A.CsxCurrTax	
								, CsxYTDTax = SUM(A.CsxYTDTax)
						FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 
									, A.LbrCustPayCode	
									, A.CalendarYear 	 
									, A.CsdFlxID 	
									, A.CsxCurrTax	
									, CsxYTDTax = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDTax END				
									FROM YTDEarningsStatementStagingMDPAGALEN AS A
									LEFT JOIN (SELECT t1.CategoryFlag
													,t1.CsuFlxIDeb
													,t1.CheckDate
													,t1.CheckNo
													,t1.LbrCustPayCode
													,t1.CalendarYear
													,t1.CsdFlxID
													,Sum(t1.CsxCurrTax) AS YTDTax
												FROM dbo.YTDEarningsStatementStagingMDPAGALEN t1
												WHERE t1.CategoryFlag = 'F'
												GROUP BY t1.CategoryFlag
														,t1.CsuFlxIDeb
														,t1.CheckDate
														,t1.CheckNo
														,t1.LbrCustPayCode
														,t1.CsdFlxID
														,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
													AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
													AND t1.CheckDate <= A.CheckDate 							
													AND t1.LbrCustPayCode = A.LbrCustPayCode 												
													AND t1.CalendarYear = A.CalendarYear
									WHERE A.CategoryFlag = 'F' 
										) A
								GROUP BY A.CsuFlxIDeb 
												, A.CheckDate 
												, A.CheckNo 
												, A.LbrCustPayCode	
												, A.CalendarYear 	 
												, A.CsdFlxID 	
												, A.CsxCurrTax	
												)	B
						ON PA.CsuFlxIDeb = B.CsuFlxIDeb
						AND PA.CheckDate = B.CheckDate	
						AND PA.CheckNo = B.CheckNo					
						AND PA.LbrCustPayCode = B.LbrCustPayCode
						AND PA.CsdFlxID = B.CsdFlxID 
						AND PA.CalendarYear = B.CalendarYear
				WHERE PA.CategoryFlag = 'F' 

				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CsxCurrTax = NULL
				WHERE CategoryFlag = 'F' AND CsxCurrTax = 0

				-- Load Category G:  After Tax				
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
									PeriodEnding,LastName,FirstName,MiddleName,FullName,
									LbrCustPayCode,DeductCode,CurrDeductAmt,CalendarYear,CsdFlxID)
					SELECT DISTINCT EMP.EMPLOYEE
								  , MP.ProviderMasterID
								  , T_TAX1.CHECK_DATE
								  , CheckNo = CASE WHEN T_TAX1.CHECK_TYPE = 'R' THEN RTRIM(CAST(T_TAX1.CHECK_NBR AS VARCHAR(20))) + '.9' 
											       WHEN T_TAX1.CHECK_TYPE = 'J' THEN CAST(T_TAX1.CHECK_ID AS VARCHAR(20)) + '.5'
												   ELSE CAST(T_TAX1.CHECK_NBR AS VARCHAR(20)) END
								  , T_TAX1.PER_END_DATE
								  , EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
								  , RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
								  , T_TAX1.DED_CODE
								  , T_TAX1.CHECK_DESC
								  , T_TAX1.DED_AMT
								  , CalendarYear = YEAR(T_TAX1.CHECK_DATE)
								  , T_TAX1.CHECK_ID
							FROM    dbo.EMPLOYEE EMP
							JOIN    dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo					   
					   LEFT JOIN	dbo.PAYDEDUCTN PYD ON EMP.EMPLOYEE = PYD.EMPLOYEE
											AND EMP.COMPANY = PYD.COMPANY
							JOIN   (SELECT	PYM.COMPANY, PYM.EMPLOYEE, PYD.DED_CODE, DED.CHECK_DESC, SUM(PYD.DED_AMT) AS DED_AMT, 
											PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP, PYM.CHECK_TYPE											
									FROM	dbo.DEDCODE DED
									JOIN	dbo.PAYDEDUCTN PYD ON DED.DED_CODE = PYD.DED_CODE				
							   LEFT JOIN	dbo.PAYMASTR PYM ON PYM.EMPLOYEE = PYD.EMPLOYEE
													  AND PYM.COMPANY = PYD.COMPANY
													  AND PYM.CHECK_ID = PYD.CHECK_ID
									WHERE DED.CALC_TYPE <> 'T' AND DED.ADJUST_PAY <> 'C'
											AND DED.TAX_STATUS NOT BETWEEN '01' AND '12' 
											AND DED.TAX_STATUS <> 'X'
											AND YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
									GROUP BY PYM.COMPANY, PYM.EMPLOYEE, PYD.DED_CODE, DED.CHECK_DESC, PYM.CHECK_DATE,  
											 PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP, PYM.CHECK_TYPE 
											 ) T_TAX1
										ON EMP.EMPLOYEE = T_TAX1.EMPLOYEE AND EMP.COMPANY = T_TAX1.COMPANY
										AND PYD.CHECK_ID = T_TAX1.CHECK_ID
					WHERE YEAR(T_TAX1.CHECK_DATE) = YEAR(GETDATE()) 
					AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
					AND (PYD.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
					OR PYD.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)					

				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'AfterTaxDeductions', CategoryFlag = 'G'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- carry over the deductions on the previous months for the YTD computation			
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
									PeriodEnding,LastName,FirstName,MiddleName,FullName,
									LbrCustPayCode,DeductCode,CurrDeductAmt,CalendarYear,CsdFlxID)
							SELECT C.CsuFlxIDeb
									, C.ProviderMasterID
									, C.CheckDate	
									, C.CheckNo
									, C.PeriodEnding
									, C.LastName, C.FirstName, C.MiddleName, C.FullName
									, C.LbrCustPayCode, C.DeductCode									
									, CurrDeductAmt = 0
									, C.CalendarYear
									, C.CsdFlxID
								FROM (SELECT DISTINCT B.CsuFlxIDeb, B.ProviderMasterID
											, B.CheckDate, B.CheckNo, B.PeriodEnding
											, B.LastName, B.FirstName, B.MiddleName, B.FullName	
											, A.LbrCustPayCode, A.DeductCode				
											, B.CalendarYear, B.CsdFlxID			
									  FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
													, CheckDate, CheckNo, PeriodEnding
													, LastName,FirstName,MiddleName,FullName										
													, LbrCustPayCode, DeductCode
													, CalendarYear, CsdFlxID					
											FROM YTDEarningsStatementStagingMDPAGALEN
											WHERE CategoryFlag = 'G') A
											CROSS JOIN (SELECT DISTINCT M2.CsuFlxIDeb, M2.ProviderMasterID
															, M2.CheckDate, M2.CheckNo, M2.PeriodEnding
															, M2.LastName,M2.FirstName,M2.MiddleName,M2.FullName
															, G.LbrCustPayCode, G.DeductCode
															, M2.CalendarYear, M2.CsdFlxID							
														FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																			, CheckDate, CheckNo, PeriodEnding
																			, LastName,FirstName,MiddleName,FullName
																			, LbrCustPayCode, DeductCode
																			, CalendarYear, CsdFlxID
																	FROM YTDEarningsStatementStagingMDPAGALEN 
																	WHERE CategoryFlag = 'G') G
														LEFT JOIN (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																			, CheckDate, CheckNo, PeriodEnding
																			, LastName,FirstName,MiddleName,FullName																			
																			, CalendarYear, CsdFlxID							
																	FROM YTDEarningsStatementStagingMDPAGALEN 
																	WHERE CategoryFlag = 'M2') M2
																ON	M2.CsuFlxIDeb = G.CsuFlxIDeb) B
									  WHERE A.CsuFlxIDeb = B.CsuFlxIDeb 
									  AND A.CheckDate <= B.CheckDate									  
									  ) C
							  LEFT JOIN 
									(SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
											LastName,FirstName,MiddleName,FullName, LbrCustPayCode,DeductCode,CalendarYear
									 FROM YTDEarningsStatementStagingMDPAGALEN 
									 WHERE CategoryFlag = 'G') PA
								ON  C.CsuFlxIDeb = PA.CsuFlxIDeb
								AND C.CheckDate = PA.CheckDate
								AND C.CheckNo = PA.CheckNo
								AND C.LbrCustPayCode = PA.LbrCustPayCode
								AND C.CalendarYear = PA.CalendarYear		 
								WHERE PA.DeductCode IS NULL 
							ORDER BY C.CheckDate, C.CheckNo, C.DeductCode

				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'AfterTaxDeductions', CategoryFlag = 'G'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL

				-- YTD computation 
			 
				UPDATE PA
				SET PA.YTDDeductAmt = B.YTDDeductAmt
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 
							, A.LbrCustPayCode	
							, A.CalendarYear 	 
							, A.CsdFlxID 	
							, A.CurrDeductAmt	
							, YTDDeductAmt = SUM(A.YTDDeductAmt)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 
									, A.LbrCustPayCode	
									, A.CalendarYear 	 
									, A.CsdFlxID 	
									, A.CurrDeductAmt	
									, YTDDeductAmt = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDDeductAmt END				
							FROM YTDEarningsStatementStagingMDPAGALEN AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.LbrCustPayCode
												,t1.CalendarYear
												,t1.CsdFlxID
												,Sum(t1.CurrDeductAmt) AS YTDDeductAmt
										FROM dbo.YTDEarningsStatementStagingMDPAGALEN t1
										WHERE t1.CategoryFlag = 'G'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.LbrCustPayCode
												,t1.CsdFlxID
												,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate 							
											AND t1.LbrCustPayCode = A.LbrCustPayCode 												
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'G') A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 
											, A.LbrCustPayCode	
											, A.CalendarYear 	 
											, A.CsdFlxID 	
											, A.CurrDeductAmt)	B
						ON PA.CsuFlxIDeb = B.CsuFlxIDeb
						AND PA.CheckDate = B.CheckDate
						AND PA.CheckNo = B.CheckNo		
						AND PA.CsdFlxID = B.CsdFlxID 
						AND PA.CalendarYear = B.CalendarYear
						AND PA.LbrCustPayCode = B.LbrCustPayCode
				WHERE PA.CategoryFlag = 'G'


				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrDeductAmt = NULL
				WHERE CategoryFlag = 'G' AND CurrDeductAmt = 0
				
				-- Load Category H
				-- 11/17/2008:  IMPLEMENTED THE DED-REFUND CASE (POINT THE PROCESS LEVEL FILTER TO PAYMASTER TABLE)
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
									PeriodEnding,LastName,FirstName,MiddleName,FullName, 
									LbrCustPayCode, DeductCode,CurrDed, CalendarYear, CsdFlxID)
						SELECT	DISTINCT EMP.EMPLOYEE
								, MP.ProviderMasterID
								, TMP.CHECK_DATE
								, CheckNo = CASE WHEN TMP.CHECK_TYPE = 'R' THEN RTRIM(CAST(TMP.CHECK_NBR AS VARCHAR(20))) + '.9' 
												 WHEN TMP.CHECK_TYPE = 'J' THEN CAST(TMP.CHECK_ID AS VARCHAR(20)) + '.5'
												 ELSE CAST(TMP.CHECK_NBR AS VARCHAR(20)) END
								, TMP.PER_END_DATE
								, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
								, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
								, TMP.DED_CODE
								, TMP.CHECK_DESC
								, TMP.CurrDed			
								, CalendarYear = YEAR(TMP.CHECK_DATE)
								, TMP.CHECK_ID
						FROM	dbo.EMPLOYEE EMP 
						JOIN	dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
				   LEFT JOIN	dbo.PAYDEDUCTN PYD ON EMP.EMPLOYEE = PYD.EMPLOYEE
									AND EMP.COMPANY = PYD.COMPANY
						JOIN	(SELECT PYM.COMPANY, PYM.EMPLOYEE, PYD.DED_CODE, DED.CHECK_DESC, SUM(PYD.DED_AMT) AS CurrDed, 
										PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, PYM.TIME_STAMP, 
										PYM.CHECK_TYPE
									FROM dbo.DEDCODE DED
									JOIN dbo.PAYDEDUCTN PYD ON DED.DED_CODE = PYD.DED_CODE
							   LEFT JOIN dbo.PAYMASTR PYM ON PYM.EMPLOYEE = PYD.EMPLOYEE
												  AND PYM.COMPANY = PYD.COMPANY
												  AND PYM.CHECK_ID = PYD.CHECK_ID					
									WHERE DED.CALC_TYPE <> 'T'
										AND DED.ADJUST_PAY <> 'C'									
										AND DED.TAX_STATUS BETWEEN '01' AND '12' 
									    OR DED.TAX_STATUS = 'X'
										AND YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
									 GROUP BY PYM.COMPANY, PYM.EMPLOYEE, PYD.DED_CODE, DED.CHECK_DESC,
											  PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.CHECK_ID, PYM.PER_END_DATE, 
											  PYM.TIME_STAMP, PYM.CHECK_TYPE) TMP 
								ON EMP.EMPLOYEE = TMP.EMPLOYEE AND EMP.COMPANY = TMP.COMPANY
									AND PYD.CHECK_ID = TMP.CHECK_ID
						WHERE YEAR(TMP.CHECK_DATE) = YEAR(GETDATE()) 			
						AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
						AND (PYD.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
						OR PYD.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)	 					


				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'PreTaxDeductions', CategoryFlag = 'H'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL	

				-- Add dummy Category Flag H records.
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, CsdFlxID, LbrCustPayCode, ProviderMasterID, CheckDate, CheckNo, PeriodEnding, 
									LastName, FirstName, MiddleName, FullName, CalendarYear, 
									DeductCode, CategoryFlag, EarningsStatmentCategory) 
					SELECT DISTINCT CsuFlxIDeb, CsdFlxID, TMP.DED_CODE, ProviderMasterID, CheckDate, CheckNo, PeriodEnding, 
									LastName, FirstName, MiddleName, FullName, CalendarYear,
									DeductCode = TMP.CHECK_DESC, CategoryFlag = 'H', 
									EarningsStatmentCategory = 'PreTaxDeductions' 
					FROM YTDEarningsStatementStagingMDPAGALEN ST
						INNER JOIN (SELECT DISTINCT PYD.EMPLOYEE, PYD.DED_CODE, DED.CHECK_DESC
													FROM dbo.DEDCODE DED
													LEFT JOIN dbo.PAYDEDUCTN PYD ON DED.DED_CODE = PYD.DED_CODE
											   LEFT JOIN dbo.PAYMASTR PYM ON PYM.EMPLOYEE = PYD.EMPLOYEE
																  AND PYM.COMPANY = PYD.COMPANY
																  AND PYM.CHECK_ID = PYD.CHECK_ID					
													WHERE (DED.CALC_TYPE <> 'T'
														AND DED.ADJUST_PAY <> 'C'									
														AND DED.TAX_STATUS BETWEEN '01' AND '12' 
														OR DED.TAX_STATUS = 'X'
														AND YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) ) --AND PYD.EMPLOYEE = 2069
													) TMP
						ON TMP.EMPLOYEE = ST.CsuFlxIDeb
--							AND TMP.DED_CODE = ST.LbrCustPayCode
				WHERE CheckNo NOT IN (SELECT DISTINCT CheckNo 
																 FROM YTDEarningsStatementStagingMDPAGALEN 
																 WHERE CategoryFlag = 'H')
					AND CsuFlxIDeb IN (
										SELECT DISTINCT PYD.EMPLOYEE--, PYD.DED_CODE, DED.CHECK_DESC
													FROM dbo.DEDCODE DED
													LEFT JOIN dbo.PAYDEDUCTN PYD ON DED.DED_CODE = PYD.DED_CODE
											   LEFT JOIN dbo.PAYMASTR PYM ON PYM.EMPLOYEE = PYD.EMPLOYEE
																  AND PYM.COMPANY = PYD.COMPANY
																  AND PYM.CHECK_ID = PYD.CHECK_ID					
													WHERE (DED.CALC_TYPE <> 'T'
														AND DED.ADJUST_PAY <> 'C'									
														AND DED.TAX_STATUS BETWEEN '01' AND '12' 
														OR DED.TAX_STATUS = 'X'
														AND YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) ) --AND PYD.EMPLOYEE = 2069
				)
				AND CsdFlxID IS NOT NULL

				DECLARE @i INT
				DECLARE @j INT
				SET @i = 1
				SET @j = 30
					WHILE (@i < 500) 
					BEGIN
								-- carry over the deductions on the previous months for the YTD computation			
								INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
													PeriodEnding,LastName,FirstName,MiddleName,FullName, 
													LbrCustPayCode,DeductCode,CurrDed, CalendarYear, CsdFlxID)
											SELECT C.CsuFlxIDeb
													, C.ProviderMasterID
													, C.CheckDate	
													, C.CheckNo
													, C.PeriodEnding
													, C.LastName, C.FirstName, C.MiddleName, C.FullName
													, C.LbrCustPayCode, C.DeductCode									
													, CurrDed = 0
													, C.CalendarYear
													, C.CsdFlxID
												FROM (SELECT DISTINCT B.CsuFlxIDeb, B.ProviderMasterID
															, B.CheckDate, B.CheckNo, B.PeriodEnding
															, B.LastName, B.FirstName, B.MiddleName, B.FullName	
															, A.LbrCustPayCode, A.DeductCode				
															, B.CalendarYear, B.CsdFlxID			
													  FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																	, CheckDate, CheckNo, PeriodEnding
																	, LastName,FirstName,MiddleName,FullName										
																	, LbrCustPayCode, DeductCode
																	, CalendarYear, CsdFlxID					
															FROM YTDEarningsStatementStagingMDPAGALEN
															WHERE CategoryFlag = 'H'
																	AND CsuFlxIDeb BETWEEN (@i-1)*@j + 1 AND @i*@j) A
															CROSS JOIN (SELECT DISTINCT M2.CsuFlxIDeb, M2.ProviderMasterID
																			, M2.CheckDate, M2.CheckNo, M2.PeriodEnding
																			, M2.LastName,M2.FirstName,M2.MiddleName,M2.FullName
																			, H.LbrCustPayCode, H.DeductCode
																			, M2.CalendarYear, M2.CsdFlxID							
																		FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																							, CheckDate, CheckNo, PeriodEnding
																							, LastName,FirstName,MiddleName,FullName
																							, LbrCustPayCode, DeductCode
																							, CalendarYear, CsdFlxID
																					FROM YTDEarningsStatementStagingMDPAGALEN 
																					WHERE CategoryFlag = 'H'
																						AND CsuFlxIDeb BETWEEN (@i-1)*@j + 1 AND @i*@j) H
																		LEFT JOIN (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																							, CheckDate, CheckNo, PeriodEnding
																							, LastName,FirstName,MiddleName,FullName																			
																							, CalendarYear, CsdFlxID							
																					FROM YTDEarningsStatementStagingMDPAGALEN 
																					WHERE CategoryFlag = 'M2'
																						AND CsuFlxIDeb BETWEEN (@i-1)*@j + 1 AND @i*@j) M2
																				ON	M2.CsuFlxIDeb = H.CsuFlxIDeb) B
													  WHERE A.CsuFlxIDeb = B.CsuFlxIDeb 
													  AND A.CheckDate <= B.CheckDate									  
													  ) C
											  LEFT JOIN 
													(SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding,
															LastName,FirstName,MiddleName,FullName, LbrCustPayCode,DeductCode,CalendarYear
													 FROM YTDEarningsStatementStagingMDPAGALEN 
													 WHERE CategoryFlag = 'H'
															AND CsuFlxIDeb BETWEEN (@i-1)*@j + 1 AND @i*@j) PA
												ON  C.CsuFlxIDeb = PA.CsuFlxIDeb
												AND C.CheckDate = PA.CheckDate
												AND C.CheckNo = PA.CheckNo
												AND C.LbrCustPayCode = PA.LbrCustPayCode
												AND C.CalendarYear = PA.CalendarYear		 
												WHERE PA.DeductCode IS NULL 
											ORDER BY C.CheckDate, C.CheckNo, C.DeductCode
						SET @i = @i + 1
					END
				
				-- compute YTD values for Category H
				UPDATE PA
				SET PA.YTDDed = B.YTDDed
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 
							, A.LbrCustPayCode	
							, A.CalendarYear 	 
							, A.CsdFlxID 	
							, A.CurrDed	
							, YTDDed = SUM(A.YTDDed)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 
									, A.LbrCustPayCode	
									, A.CalendarYear 	 
									, A.CsdFlxID 	
									, A.CurrDed	
									, YTDDed = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDDed END				
							FROM YTDEarningsStatementStagingMDPAGALEN AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.LbrCustPayCode
												,t1.CalendarYear
												,t1.CsdFlxID
												,Sum(t1.CurrDed) AS YTDDed
										FROM dbo.YTDEarningsStatementStagingMDPAGALEN t1
										WHERE t1.CategoryFlag = 'H'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.LbrCustPayCode
												,t1.CsdFlxID
												,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate 							
											AND t1.LbrCustPayCode = A.LbrCustPayCode 												
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'H') A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 
											, A.LbrCustPayCode	
											, A.CalendarYear 	 
											, A.CsdFlxID 	
											, A.CurrDed)	B
						ON PA.CsuFlxIDeb = B.CsuFlxIDeb
						AND PA.CheckDate = B.CheckDate
						AND PA.CheckNo = B.CheckNo		
						AND PA.CsdFlxID = B.CsdFlxID 
						AND PA.CalendarYear = B.CalendarYear
						AND PA.LbrCustPayCode = B.LbrCustPayCode
				WHERE PA.CategoryFlag = 'H'


				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrDed = NULL
				WHERE CategoryFlag = 'H' AND CurrDed = 0

				-- Load Category I
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,
								Dept,SpecialItem, SpecialItemAmount, CalendarYear)
						SELECT DISTINCT	EMP.EMPLOYEE
							  , MP.ProviderMasterID
							  , PYM.CHECK_DATE
							  , CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(20))) + '.9' 
											WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
											ELSE CAST(PYM.CHECK_NBR AS VARCHAR(20)) END
							  , PYM.PER_END_DATE
							  , EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME 
							  , RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME							  
							  , TEM.HM_PROC_LEVEL
                              , TEM.R_PLAN, TEM.AVAIL_HRS_BAL, PRT.PAYROLL_YEAR  			
						FROM	dbo.EMPLOYEE EMP
						JOIN	dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo	
				   LEFT JOIN	dbo.PAYMASTR PYM  ON EMP.EMPLOYEE = PYM.EMPLOYEE
										AND EMP.COMPANY = PYM.COMPANY						
				   LEFT JOIN	dbo.PRTIME PRT ON EMP.EMPLOYEE = PRT.EMPLOYEE
										AND EMP.COMPANY = PRT.COMPANY
										AND PYM.CHECK_ID = PRT.CHECK_ID							
						JOIN	dbo.TAEEMASTER TEM ON EMP.EMPLOYEE = TEM.EMPLOYEE
										AND EMP.COMPANY = TEM.COMPANY		
						WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE())
						AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
						AND (PRT.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
						OR PRT.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)
												

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'SpecialInformation', CategoryFlag = 'I'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL
				

				--Load Category K	
				-- Added 11/12/2008:  IMPLEMENT SETTING OF HOURLY RATE TO ZERO FOR CALC_TYPE = A AND E7 AND E9 PAYCODES			
				-- Added 11/17/2008:  implement HourlyRate computation for DIFF Paycodes (RATE + SHFT_DIFF_RATE) by inserting also the SHFT_DIFF_RATE to CssFlxIDCsu temp field
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
							PeriodEnding,LastName,FirstName,MiddleName,FullName,Dept,
							PayCode, PayCodeDescr, CurrHours, CurrUnits, CurrEarnings, HourlyRate, [Site],CalendarYear,
							TotalHoursbyPayCode,CsdFlxID,CssFlxIDCsu)	
					SELECT DISTINCT EMP.EMPLOYEE
								, MP.ProviderMasterID
								, PYM.CHECK_DATE
								, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(20))) + '.9' 
											WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
											ELSE CAST(PYM.CHECK_NBR AS VARCHAR(20)) END
								, PYM.PER_END_DATE
								, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME 
								, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
								, SPDIST.PROCESS_LEVEL
								, SPDIST.PAY_SUM_GRP
								, SPDIST.PayCodeDescr
								, CurrHours = SUM(SPDIST.Hours)
								, CurrUnits = SUM(SPDIST.Units)
								, CurrEarnings = SUM(SPDIST.WageAmt)
								, SPDIST.RATE
								, PRS.[NAME] AS [Site]								
								, SPDIST.PAYROLL_YEAR								
								, TotalHoursbyPayCode = SUM(SPDIST.Hours)
								, PYM.CHECK_ID
								, SPDIST.SHFT_DIFF_RATE													
					FROM		dbo.EMPLOYEE EMP
					JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
					LEFT JOIN	dbo.PAYMASTR PYM ON EMP.EMPLOYEE = PYM.EMPLOYEE
										AND EMP.COMPANY = PYM.COMPANY					
					LEFT JOIN	(SELECT DISTINCT SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAY_SUM_GRP, 
										PYG.DESCRIPTION AS PayCodeDescr, SP.PROCESS_LEVEL, --SUM(SP.HOURS) Hours, 
										Units = CASE WHEN SP.PAY_SUM_GRP in ('OVT', 'OVD', 'OV7') THEN SUM(SP.HOURS) ELSE 0 END,
										Hours = CASE WHEN SP.PAY_SUM_GRP not in ('OVT', 'OVD', 'OV7') THEN SUM(SP.HOURS) ELSE 0 END, 
										SUM(SP.WAGE_AMOUNT) WageAmt, SP.RATE, SP.SHFT_DIFF_RATE, SP.PAYROLL_YEAR
									 FROM	dbo.PRTIME SP 
									 JOIN   dbo.PAYSUMGRP PYG ON PYG.PAY_SUM_GRP = SP.PAY_SUM_GRP								
									WHERE	SP.PAY_SUM_GRP NOT IN 
											(SELECT PAY_SUM_GRP FROM dbo.PSGRELATE WHERE PAY_CLASS = 'SPL')
									GROUP BY SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAY_SUM_GRP, 
										PYG.DESCRIPTION, SP.PROCESS_LEVEL, SP.RATE, SP.SHFT_DIFF_RATE, SP.PAYROLL_YEAR
									 ) SPDIST
									 ON SPDIST.COMPANY = PYM.COMPANY 
										AND SPDIST.EMPLOYEE = PYM.EMPLOYEE 
										AND SPDIST.CHECK_ID = PYM.CHECK_ID
					JOIN		dbo.PRSYSTEM PRS ON SPDIST.COMPANY = PRS.COMPANY
										AND SPDIST.PROCESS_LEVEL = PRS.PROCESS_LEVEL
					WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE())
					AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
					AND (SPDIST.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
					OR SPDIST.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)	
					GROUP BY EMP.EMPLOYEE, MP.ProviderMasterID, PYM.CHECK_DATE, PYM.CHECK_NBR, PYM.PER_END_DATE,
							 EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME, SPDIST.PROCESS_LEVEL, SPDIST.PAY_SUM_GRP,
							 SPDIST.PayCodeDescr, SPDIST.RATE, PRS.[NAME], SPDIST.PAYROLL_YEAR, PYM.CHECK_ID, 
							 PYM.CHECK_TYPE, SPDIST.SHFT_DIFF_RATE


				-- set a temporary Category Flag for recalculation of hours and earnings
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CategoryFlag = 'K_TMP'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL

				-- update the HourlyRate to Null so that it could be grouped as one row per CheckDate, CheckNo
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET HourlyRate = NULL
				WHERE PayCode in ('OVT', 'OVD', 'OV7', 'E7','E9')


				-- UPDATE HOURLY RATE AND SET IT TO NULL FOR PAYCODES IN PRPAYCODE WITH CALC_TYPE = 'A'
				UPDATE PA
				SET HourlyRate = 0
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				JOIN (SELECT PA.CsuFlxIDeb, PA.CheckDate, PA.CheckNo, PA.PayCode, PA.HourlyRate, PA.CalendarYear
						FROM YTDEarningsStatementStagingMDPAGALEN PA
						WHERE PA.CategoryFlag = 'K_TMP'
						AND PA.PayCode IN (SELECT PAY_SUM_GRP FROM dbo.PRPAYCODE WHERE CALC_TYPE = 'A')
						AND PA.HourlyRate IS NOT NULL
						) TMP
						ON PA.CsuFlxIDeb = TMP.CsuFlxIDeb
						AND PA.CheckDate = TMP.CheckDate
						AND PA.CheckNo = TMP.CheckNo
						AND PA.PayCode = TMP.PayCode						
						AND PA.CalendarYear = TMP.CalendarYear
				WHERE PA.CategoryFlag = 'K_TMP'

				-- ADDED 11/17/2008:  COMPUTE HOURLY RATE OF DIFF PAYCODES
				UPDATE PA
				SET PA.HourlyRate = PA.HourlyRate + PA.CssFlxIDCsu
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				JOIN (SELECT PA.CsuFlxIDeb, PA.CheckDate, PA.CheckNo, PA.PayCode, PA.HourlyRate, PA.CalendarYear
						FROM YTDEarningsStatementStagingMDPAGALEN PA					
						WHERE PA.CategoryFlag = 'K_TMP'
						AND PA.PayCode IN (SELECT PAY_SUM_GRP FROM dbo.PRPAYCODE WHERE CALC_TYPE IN ('D','S','Q','B'))
						) TMP
						ON PA.CsuFlxIDeb = TMP.CsuFlxIDeb
						AND PA.CheckDate = TMP.CheckDate
						AND PA.CheckNo = TMP.CheckNo
						AND PA.PayCode = TMP.PayCode						
						AND PA.CalendarYear = TMP.CalendarYear
				WHERE PA.CategoryFlag = 'K_TMP'

				/* 			
				The first insert statement above extracts the Rate of the PayCode for a particular check, 
				which may output two or more rows for a particular PayCode of that same check.  
				However, client requires the output to be one distinct paycode per CheckDate and CheckNo.  
				
				Since Rate is still required, Category K needs another step to meet this requirement:  
				Only one distinct PayCode per CheckDate and CheckNo.
				Resolved in the meeting (10/28/2008) that this will be applied to OVT, OVD and OV7 only. 
					Additional requirement (11/12/2008) to include E7 and E9 in the hardcode list. 
				Thus, an insert statement below is the action taken to output this requirement.
				*/

				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
							PeriodEnding,LastName,FirstName,MiddleName,FullName,Dept,
							PayCode, PayCodeDescr, CurrHours, CurrUnits, CurrEarnings, HourlyRate, [Site],CalendarYear,
							TotalHoursbyPayCode,CsdFlxID)	
					SELECT CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,Dept,
								PayCode, PayCodeDescr, SUM(CurrHours) CurrHours, SUM(CurrUnits) CurrUnits, SUM(CurrEarnings) CurrEarnings, 
								HourlyRate, [Site],CalendarYear,SUM(TotalHoursbyPayCode)TotalHoursbyPayCode, 
								CsdFlxID
					FROM YTDEarningsStatementStagingMDPAGALEN
					WHERE CategoryFlag = 'K_TMP'
					GROUP BY CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,Dept,
								PayCode, PayCodeDescr, HourlyRate, [Site],CalendarYear,CsdFlxID

					
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'HoursAndEarningsBySite', CategoryFlag = 'K'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- DELETE THE TEMPORARY FILES FOR CATEGORY K
				DELETE FROM YTDEarningsStatementStagingMDPAGALEN
				WHERE CategoryFlag = 'K_TMP'
				

				-- carry over previous months paycode entries for YTD values of the current month
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
							PeriodEnding,LastName,FirstName,MiddleName,FullName,Dept,
							PayCode, PayCodeDescr, CurrHours, CurrUnits, CurrEarnings, HourlyRate, [Site],CalendarYear,
							TotalHoursbyPayCode,CsdFlxID)
							SELECT C.CsuFlxIDeb
									, C.ProviderMasterID
									, C.CheckDate	
									, C.CheckNo
									, C.PeriodEnding
									, C.LastName, C.FirstName, C.MiddleName, C.FullName
									, C.Dept
									, C.PayCode, C.PayCodeDescr								
									, CurrHours = 0, CurrUnits = 0, CurrEarnings = 0, HourlyRate = 0  
									, C.[Site]
									, C.CalendarYear, TotalHoursbyPayCode = 0
									, C.CsdFlxID
								FROM (SELECT DISTINCT B.CsuFlxIDeb, B.ProviderMasterID 
											, B.CheckDate, B.CheckNo, B.PeriodEnding
											, B.LastName, B.FirstName, B.MiddleName, B.FullName	
											, A.Dept, A.PayCode, A.PayCodeDescr
											, A.[Site], B.CalendarYear, B.CsdFlxID			
									  FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
													, CheckDate, CheckNo, PeriodEnding
													, LastName,FirstName,MiddleName,FullName										
													, Dept, PayCode, PayCodeDescr, [Site]
													, CalendarYear, CsdFlxID					
											FROM YTDEarningsStatementStagingMDPAGALEN
											WHERE CategoryFlag = 'K') A
											CROSS JOIN (SELECT DISTINCT M2.CsuFlxIDeb, M2.ProviderMasterID
															, M2.CheckDate, M2.CheckNo, M2.PeriodEnding
															, M2.LastName,M2.FirstName,M2.MiddleName,M2.FullName										
															, K.Dept, K.PayCode, K.PayCodeDescr, K.[Site]
															, M2.CalendarYear, M2.CsdFlxID
														FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																		, CheckDate, CheckNo, PeriodEnding
																		, LastName,FirstName,MiddleName,FullName										
																		, Dept, PayCode, PayCodeDescr, [Site]
																		, CalendarYear, CsdFlxID
																FROM YTDEarningsStatementStagingMDPAGALEN
																WHERE CategoryFlag = 'K') K
														LEFT JOIN (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																			, CheckDate, CheckNo, PeriodEnding
																			, LastName,FirstName,MiddleName,FullName																			
																			, CalendarYear, CsdFlxID							
																	FROM YTDEarningsStatementStagingMDPAGALEN 
																	WHERE CategoryFlag = 'M2') M2
																ON	M2.CsuFlxIDeb = K.CsuFlxIDeb) B
									  WHERE A.CsuFlxIDeb = B.CsuFlxIDeb 
									  AND A.CheckDate <= B.CheckDate													   
									  ) C
							  LEFT JOIN 
									(SELECT CsuFlxIDeb, ProviderMasterID,
											CheckDate, CheckNo, PeriodEnding,
											LastName,FirstName,MiddleName,FullName, Dept, PayCode, CalendarYear
									 FROM YTDEarningsStatementStagingMDPAGALEN 
									 WHERE CategoryFlag = 'K' 
									) PA
								ON  C.CsuFlxIDeb = PA.CsuFlxIDeb								
								AND C.CheckDate = PA.CheckDate
								AND C.CheckNo = PA.CheckNo								
								AND C.PayCode = PA.PayCode
								AND C.Dept = PA.Dept
								AND C.CalendarYear = PA.CalendarYear				
								WHERE PA.CsuFlxIDeb IS NULL 
							ORDER BY C.CheckDate, C.CheckNo, C.Dept, C.PayCode


				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'HoursAndEarningsBySite', CategoryFlag = 'K'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL

				-- COMPUTE FOR YTD VALUES
				UPDATE PA
				SET	  PA.YTDEarningsBySite = B.YTDEarningsBySite,
					  PA.YTDHoursBySite = B.YTDHoursBySite,
					  PA.YTDUnitsBySite = B.YTDUnitsBySite
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 							
							, A.CalendarYear 	 
							, A.CsdFlxID 	
							, A.CurrHours, A.CurrUnits, A.CurrEarnings
							, A.Site, A.PayCode								
							, YTDEarningsBySite = SUM(A.YTDEarningsBySite)
							, YTDHoursBySite = SUM(A.YTDHoursBySite)
							, YTDUnitsBySite = SUM(A.YTDUnitsBySite)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 									
									, A.CalendarYear 	 
									, A.CsdFlxID 	
									, A.CurrEarnings, A.CurrHours, A.CurrUnits, A.Site, A.PayCode
									, YTDEarningsBySite = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDEarningsBySite END				
									, YTDHoursBySite = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDHoursBySite END
									, YTDUnitsBySite = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.YTDUnitsBySite END
							FROM YTDEarningsStatementStagingMDPAGALEN AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.Site, t1.PayCode
												,t1.CalendarYear
												,t1.CsdFlxID
												,Sum(t1.CurrEarnings) AS YTDEarningsBySite
												,SUM(t1.CurrHours) AS YTDHoursBySite
												,SUM(t1.CurrUnits) AS YTDUnitsBySite
										FROM dbo.YTDEarningsStatementStagingMDPAGALEN t1
										WHERE t1.CategoryFlag = 'K'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo
												,t1.Site, t1.PayCode
												,t1.CsdFlxID
												,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate 							
											AND t1.PayCode = A.PayCode 	
											AND t1.Site = A.Site
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'K') A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 
											, A.PayCode, A.Site
											, A.CalendarYear 	 
											, A.CsdFlxID 	
											, A.CurrEarnings, A.CurrHours, A.CurrUnits) B
						ON PA.CsuFlxIDeb = B.CsuFlxIDeb
						AND PA.CheckDate = B.CheckDate		
						AND PA.CheckNo = B.CheckNo
						AND PA.CsdFlxID = B.CsdFlxID 
						AND PA.CalendarYear = B.CalendarYear
						AND PA.PayCode = B.PayCode
						AND PA.Site = B.Site
				WHERE PA.CategoryFlag = 'K' 

				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrEarnings = NULL
				WHERE CurrEarnings = 0

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET TotalHoursbyPayCode = NULL, HourlyRate = NULL, CurrHours = NULL
				WHERE TotalHoursbyPayCode  = 0			

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrHours = NULL
				WHERE CurrHours  = 0		

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET CurrUnits = NULL
				WHERE CurrUnits = 0		

				-- additional requirement 10/31/2008
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET  YTDHoursBySite = NULL
				WHERE YTDHoursBySite = 0

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET  YTDUnitsBySite = NULL
				WHERE YTDUnitsBySite = 0

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET  HourlyRate = NULL
				WHERE HourlyRate = 0
				

				-- Load Category L // added 10/31/2008 requirement to exclude special distribution
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding, LastName, FirstName, MiddleName, FullName, CalendarYear, 
								SumOfCurrentEarnings,CsdFlxID)
						SELECT DISTINCT EMP.EMPLOYEE 
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(20))) + '.9' 
												WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
												ELSE CAST(PYM.CHECK_NBR AS VARCHAR(20)) END
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME 
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME
									, SPDIST.PAYROLL_YEAR	
									, SumOfCurrentEarnings = SUM(SPDIST.WageAmt)
									, PYM.CHECK_ID
						FROM		dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
						JOIN		dbo.PAYMASTR PYM ON EMP.EMPLOYEE = PYM.EMPLOYEE
											AND EMP.COMPANY = PYM.COMPANY
						LEFT JOIN	(SELECT DISTINCT SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAY_SUM_GRP, 
												PYG.DESCRIPTION AS PayCodeDescr,
												SP.PROCESS_LEVEL, SP.RATE, SP.PAYROLL_YEAR, 
												SUM(SP.HOURS) HOURS, SUM(SP.WAGE_AMOUNT) AS WageAmt 
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
						AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
						AND (SPDIST.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
						OR SPDIST.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)							
						GROUP BY EMP.EMPLOYEE, MP.ProviderMasterID, PYM.CHECK_DATE,PYM.CHECK_NBR,PYM.PER_END_DATE, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME, 			
									SPDIST.PAYROLL_YEAR, PYM.CHECK_ID, PYM.CHECK_TYPE
				

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'SumOfYTDEarnings', CategoryFlag = 'L'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL				
				
		
				-- added 10/31/2008
				-- need to display checkdates with special distribution paycodes and set SumOfCurrentEarnings to NULL
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding, LastName, FirstName, MiddleName, FullName, CalendarYear, 
								SumOfCurrentEarnings,CsdFlxID)
							SELECT C.CsuFlxIDeb
									, C.ProviderMasterID
									, C.CheckDate	
									, C.CheckNo
									, C.PeriodEnding
									, C.LastName, C.FirstName, C.MiddleName, C.FullName
									, C.CalendarYear													
									, SumOfCurrentEarnings = 0
									, C.CsdFlxID
								FROM (SELECT DISTINCT A.CsuFlxIDeb, B.ProviderMasterID 
											, B.CheckDate, B.CheckNo, B.PeriodEnding
											, B.LastName, B.FirstName, B.MiddleName, B.FullName	
											, B.CalendarYear, B.CsdFlxID
									  FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
													, CheckDate, CheckNo, PeriodEnding
													, LastName,FirstName,MiddleName,FullName										
												    , CalendarYear, CsdFlxID
											FROM YTDEarningsStatementStagingMDPAGALEN
											WHERE CategoryFlag = 'L') A
											CROSS JOIN (SELECT DISTINCT L.CsuFlxIDeb, M2.ProviderMasterID
															, M2.CheckDate, M2.CheckNo, M2.PeriodEnding
															, M2.LastName,M2.FirstName,M2.MiddleName,M2.FullName										
															, M2.CalendarYear, M2.CsdFlxID
														FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																		, CheckDate, CheckNo, PeriodEnding
																		, LastName,FirstName,MiddleName,FullName										
																		, CalendarYear, CsdFlxID
																FROM YTDEarningsStatementStagingMDPAGALEN
																WHERE CategoryFlag = 'L') L
														LEFT JOIN (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																			, CheckDate, CheckNo, PeriodEnding
																			, LastName,FirstName,MiddleName,FullName																			
																			, CalendarYear, CsdFlxID						
																	FROM YTDEarningsStatementStagingMDPAGALEN 
																	WHERE CategoryFlag = 'M2') M2
																ON	M2.CsuFlxIDeb = L.CsuFlxIDeb) B
									  WHERE A.CsuFlxIDeb = B.CsuFlxIDeb 
									  AND A.CheckDate <= B.CheckDate													   
									  ) C
							  LEFT JOIN 
									(SELECT CsuFlxIDeb, ProviderMasterID,
											CheckDate, CheckNo, PeriodEnding,
											LastName,FirstName,MiddleName,FullName, CalendarYear
									 FROM YTDEarningsStatementStagingMDPAGALEN 
									 WHERE CategoryFlag = 'L'
									) PA
								ON  C.CsuFlxIDeb = PA.CsuFlxIDeb								
								AND C.CheckDate = PA.CheckDate
								AND C.CheckNo = PA.CheckNo								
								AND C.CalendarYear = PA.CalendarYear				
								WHERE PA.CsuFlxIDeb IS NULL 
							ORDER BY C.CheckDate, C.CheckNo


				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'SumOfYTDEarnings', CategoryFlag = 'L'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL	


				-- compute YTD for Category L
				UPDATE PA
				SET	  PA.SumOfYTDEarnings = B.SumOfYTDEarnings
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 							
							, A.CalendarYear 	 
							, A.CsdFlxID 	
							, A.SumOfCurrentEarnings	
							, SumOfYTDEarnings = SUM(A.SumOfYTDEarnings)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 									
									, A.CalendarYear 	 
									, A.CsdFlxID 	
									, A.SumOfCurrentEarnings	
									, SumOfYTDEarnings = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.SumOfYTDEarnings END				
							FROM YTDEarningsStatementStagingMDPAGALEN AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CalendarYear
												,t1.CsdFlxID
												,Sum(t1.SumOfCurrentEarnings) AS SumOfYTDEarnings
										FROM dbo.YTDEarningsStatementStagingMDPAGALEN t1
										WHERE t1.CategoryFlag = 'L'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CsdFlxID
												,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate																					
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'L') A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 											
											, A.CalendarYear 	 
											, A.CsdFlxID 	
											, A.SumOfCurrentEarnings) B
						ON PA.CsuFlxIDeb = B.CsuFlxIDeb
						AND PA.CheckDate = B.CheckDate
						AND PA.CheckNo = B.CheckNo		
						AND PA.CsdFlxID = B.CsdFlxID 
						AND PA.CalendarYear = B.CalendarYear						
				WHERE PA.CategoryFlag = 'L' 
				

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET SumOfCurrentEarnings = NULL
				WHERE CategoryFlag = 'L' AND SumOfCurrentEarnings = 0


				-- Load Category M1

				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding, LastName, FirstName, MiddleName, FullName, CalendarYear, 
								SumOfCurrentHours, SumOfCurrentUnits, CsdFlxID)
						SELECT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(20))) + '.9' 
												WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'
												ELSE CAST(PYM.CHECK_NBR AS VARCHAR(20)) END
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME 
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME						
									, PRT.PAYROLL_YEAR									
--									, SumOfCurrentHours = ISNULL(SUM(PRT.HOURS),0)
									, SumOfCurrentHours = SUM(CASE WHEN PRT.PAY_SUM_GRP not in ('OVT', 'OVD', 'OV7') THEN ISNULL(PRT.HOURS,0) ELSE 0 END)
									, SumOfCurrentUnits = SUM(CASE WHEN PRT.PAY_SUM_GRP in ('OVT', 'OVD', 'OV7') THEN ISNULL(PRT.HOURS,0) ELSE 0 END)
									, PYM.CHECK_ID									
						FROM		dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo										 
						JOIN		dbo.PAYMASTR PYM ON PYM.COMPANY = EMP.COMPANY 
											AND PYM.EMPLOYEE = EMP.EMPLOYEE						
						LEFT JOIN	dbo.PRTIME PRT ON PYM.CHECK_ID = PRT.CHECK_ID
											AND PYM.EMPLOYEE = PRT.EMPLOYEE
											AND PYM.COMPANY = PRT.COMPANY					
						WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE())
						AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
						AND (PRT.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
						OR PRT.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)						
						GROUP BY EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, PYM.CHECK_NBR
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME 
									, PRT.PAYROLL_YEAR, PYM.CHECK_ID, PYM.CHECK_TYPE
						ORDER BY EMP.EMPLOYEE, PYM.CHECK_DATE
				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'SumOfYTDHours', CategoryFlag = 'M1'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL

				-- COMPUTE YTD 
				UPDATE PA
				SET	PA.SumOfYTDHours = B.SumOfYTDHours,
					PA.SumOfYTDUnits = B.SumOfYTDUnits
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				JOIN (SELECT A.CsuFlxIDeb 
							, A.CheckDate 
							, A.CheckNo 							
							, A.CalendarYear 	 
							, A.CsdFlxID 	
							, A.SumOfCurrentHours	
							, A.SumOfCurrentUnits
							, SumOfYTDHours = SUM(A.SumOfYTDHours)
							, SumOfYTDUnits = SUM(A.SumOfYTDUnits)
					  FROM (SELECT A.CsuFlxIDeb 
									, A.CheckDate 
									, A.CheckNo 									
									, A.CalendarYear 	 
									, A.CsdFlxID 	
									, A.SumOfCurrentHours	
									, A.SumOfCurrentUnits	
									, SumOfYTDHours = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.SumOfYTDHours END				
									, SumOfYTDUnits = CASE WHEN (A.CheckDate = t1.CheckDate AND A.CsdFlxID < t1.CsdFlxID) THEN 0 ELSE t1.SumOfYTDUnits END				
							FROM YTDEarningsStatementStagingMDPAGALEN AS A
							LEFT JOIN (SELECT t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CalendarYear
												,t1.CsdFlxID
												,Sum(t1.SumOfCurrentHours) AS SumOfYTDHours
												,Sum(t1.SumOfCurrentUnits) AS SumOfYTDUnits
										FROM dbo.YTDEarningsStatementStagingMDPAGALEN t1
										WHERE t1.CategoryFlag = 'M1'
										GROUP BY t1.CategoryFlag
												,t1.CsuFlxIDeb
												,t1.CheckDate
												,t1.CheckNo												
												,t1.CsdFlxID
												,t1.CalendarYear) t1 ON t1.CategoryFlag = A.CategoryFlag
											AND t1.CsuFlxIDeb = A.CsuFlxIDeb			
											AND t1.CheckDate <= A.CheckDate																					
											AND t1.CalendarYear = A.CalendarYear
							WHERE A.CategoryFlag = 'M1') A
							GROUP BY A.CsuFlxIDeb 
											, A.CheckDate 
											, A.CheckNo 											
											, A.CalendarYear 	 
											, A.CsdFlxID 	
											, A.SumOfCurrentHours
											, A.SumOfCurrentUnits) B
						ON PA.CsuFlxIDeb = B.CsuFlxIDeb
						AND PA.CheckDate = B.CheckDate
						AND PA.CheckNo = B.CheckNo		
						AND PA.CsdFlxID = B.CsdFlxID 
						AND PA.CalendarYear = B.CalendarYear						
				WHERE PA.CategoryFlag = 'M1' 
				
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET SumOfCurrentHours = NULL
				WHERE CategoryFlag = 'M1' AND SumOfCurrentHours = 0

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET SumOfCurrentUnits = NULL
				WHERE CategoryFlag = 'M1' AND SumOfCurrentUnits = 0

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET SumOfYTDUnits = NULL
				WHERE CategoryFlag = 'M1' AND SumOfYTDUnits  = 0


				-- Load Category M
				-- 12052008: modified this category to accommodate the requirement of getting the StateExempt using the DedCode from the PAYDEDUCTN
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,CalendarYear,
								BaseRate, TaxStatus, StStatus1, FedAdjValue, SdiAdjValue, FedExempt, StateExempt)					
						SELECT DISTINCT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(20))) + '.9' 
												WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'	
												ELSE CAST(PYM.CHECK_NBR AS VARCHAR(20)) END
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME									
									, CalendarYear = YEAR(PYM.CHECK_DATE)
									, EMP.PAY_RATE
									, FED.TaxStatus, STE.StStatus1
									, FED.FedAdjValue, STE.SdiAdjValue
									, FED.FedExempt, STE.StateExempt
						FROM		dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
						JOIN		dbo.PAYMASTR PYM ON EMP.EMPLOYEE = PYM.EMPLOYEE
											AND EMP.COMPANY = PYM.COMPANY						
						JOIN		(SELECT COMPANY, EMPLOYEE, DED_CODE, PROCESS_LEVEL, CHECK_ID
									 FROM dbo.PAYDEDUCTN WHERE DED_CODE LIKE '11%') PYD
										ON PYM.COMPANY = PYD.COMPANY AND PYM.EMPLOYEE = PYD.EMPLOYEE 
										AND PYM.CHECK_ID = PYD.CHECK_ID
						LEFT JOIN	(SELECT COMPANY, EMPLOYEE, DED_CODE
											, MARITAL_STATUS as TaxStatus 
											, ADDL_AMOUNT as FedAdjValue
											, EXEMPTIONS + ADDL_EXEMPTS AS FedExempt
									 FROM dbo.EMDEDMASTR 
									 WHERE DED_CODE LIKE '101%') FED
										ON PYM.COMPANY = FED.COMPANY AND PYM.EMPLOYEE = FED.EMPLOYEE
						LEFT JOIN	(SELECT COMPANY, EMPLOYEE, DED_CODE
											, MARITAL_STATUS as StStatus1
											, ADDL_AMOUNT as SdiAdjValue
											, EXEMPTIONS + ADDL_EXEMPTS AS StateExempt
									 FROM dbo.EMDEDMASTR) STE
											ON PYM.COMPANY = STE.COMPANY AND PYM.EMPLOYEE = STE.EMPLOYEE
											AND PYD.DED_CODE = STE.DED_CODE
						WHERE YEAR(PYM.CHECK_DATE) = YEAR(GETDATE()) 
						AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
						AND (PYD.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1 OR PYD.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)					
					

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'CheckAmtGrossPayNetPayYTD', CategoryFlag = 'M'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				
				-- Load Category P:  //added new requirement 10/31/2008: set the SumOfCurrentEarnings to NULL for special distribution checks.
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,
								CalendarYear,SumOfCurrentHours, SumOfCurrentUnits, SumOfCurrentEarnings)
						SELECT EMP.EMPLOYEE
									, MP.ProviderMasterID
									, PYM.CHECK_DATE
									, CheckNo = CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(20))) + '.9' 
												WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5'						
												ELSE CAST(PYM.CHECK_NBR AS VARCHAR(20)) END
									, PYM.PER_END_DATE
									, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME
									, RTRIM(EMP.LAST_NAME) + ', ' + RTRIM(EMP.FIRST_NAME) + ' ' +  RTRIM(EMP.MIDDLE_NAME) AS FULLNAME									
									, SPDIST.PAYROLL_YEAR
									, SumOfCurrentHours = SUM(SPDIST.SumOfCurrentHours)									
									, SumOfCurrentUnits = SUM(SPDIST.SumOfCurrentUnits)									
									, SumOfCurrentEarnings = SUM(SPDIST.WageAmt)									
						FROM		dbo.EMPLOYEE EMP
						JOIN		dbo.LawsonIDMatchSFDC MP ON EMP.EMPLOYEE = MP.LawsonEmpNo
						JOIN		dbo.PAYMASTR PYM ON EMP.EMPLOYEE = PYM.EMPLOYEE
											AND EMP.COMPANY = PYM.COMPANY
						LEFT JOIN	(SELECT DISTINCT SP.COMPANY, SP.EMPLOYEE, SP.CHECK_ID, SP.PAY_SUM_GRP, 
												PYG.DESCRIPTION AS PayCodeDescr, SP.PROCESS_LEVEL, SP.RATE, SP.PAYROLL_YEAR, 
												SumOfCurrentHours = SUM(CASE WHEN SP.PAY_SUM_GRP not in ('OVT', 'OVD', 'OV7') THEN ISNULL(SP.HOURS,0) ELSE 0 END),
												SumOfCurrentUnits = SUM(CASE WHEN SP.PAY_SUM_GRP in ('OVT', 'OVD', 'OV7') THEN ISNULL(SP.HOURS,0) ELSE 0 END)
												--SUM(SP.HOURS) SumOfCurrentHours
												, SUM(SP.WAGE_AMOUNT) AS WageAmt 
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
						AND EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END 
						AND (SPDIST.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
						OR SPDIST.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)						
						GROUP BY EMP.EMPLOYEE, MP.ProviderMasterID, PYM.CHECK_DATE,PYM.CHECK_NBR, PYM.PER_END_DATE, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.MIDDLE_NAME, 			
						SPDIST.PAYROLL_YEAR, PYM.CHECK_TYPE, PYM.CHECK_ID
				

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'SumOfEarningsAndHours', CategoryFlag = 'P'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL

				-- need to display checkdates with special distribution paycodes and set SumOfCurrentEarnings to NULL
				INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,LastName,FirstName,MiddleName,FullName,
								CalendarYear,SumOfCurrentHours,SumOfCurrentUnits, SumOfCurrentEarnings)
							SELECT C.CsuFlxIDeb
									, C.ProviderMasterID
									, C.CheckDate	
									, C.CheckNo
									, C.PeriodEnding
									, C.LastName, C.FirstName, C.MiddleName, C.FullName
									, C.CalendarYear
									, SumOfCurrentHours = 0						
									, SumOfCurrentUnits = 0						
									, SumOfCurrentEarnings = 0
								FROM (SELECT DISTINCT A.CsuFlxIDeb, B.ProviderMasterID 
											, B.CheckDate, B.CheckNo, B.PeriodEnding
											, B.LastName, B.FirstName, B.MiddleName, B.FullName	
											, B.CalendarYear
									  FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
													, CheckDate, CheckNo, PeriodEnding
													, LastName,FirstName,MiddleName,FullName										
												    , CalendarYear
											FROM YTDEarningsStatementStagingMDPAGALEN
											WHERE CategoryFlag = 'P') A
											CROSS JOIN (SELECT DISTINCT P.CsuFlxIDeb, M2.ProviderMasterID
															, M2.CheckDate, M2.CheckNo, M2.PeriodEnding
															, M2.LastName,M2.FirstName,M2.MiddleName,M2.FullName										
															, M2.CalendarYear
														FROM (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																		, CheckDate, CheckNo, PeriodEnding
																		, LastName,FirstName,MiddleName,FullName										
																		, CalendarYear
																FROM YTDEarningsStatementStagingMDPAGALEN
																WHERE CategoryFlag = 'P') P
														LEFT JOIN (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID
																			, CheckDate, CheckNo, PeriodEnding
																			, LastName,FirstName,MiddleName,FullName																			
																			, CalendarYear							
																	FROM YTDEarningsStatementStagingMDPAGALEN 
																	WHERE CategoryFlag = 'M2') M2
																ON	M2.CsuFlxIDeb = P.CsuFlxIDeb) B
									  WHERE A.CsuFlxIDeb = B.CsuFlxIDeb 
									  AND A.CheckDate <= B.CheckDate													   
									  ) C
							  LEFT JOIN 
									(SELECT CsuFlxIDeb, ProviderMasterID,
											CheckDate, CheckNo, PeriodEnding,
											LastName,FirstName,MiddleName,FullName, CalendarYear
									 FROM YTDEarningsStatementStagingMDPAGALEN 
									 WHERE CategoryFlag = 'P' 
									) PA
								ON  C.CsuFlxIDeb = PA.CsuFlxIDeb								
								AND C.CheckDate = PA.CheckDate
								AND C.CheckNo = PA.CheckNo								
								AND C.CalendarYear = PA.CalendarYear				
								WHERE PA.CsuFlxIDeb IS NULL 
							ORDER BY C.CheckDate, C.CheckNo


				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET EarningsStatmentCategory = 'SumOfEarningsAndHours', CategoryFlag = 'P'
				WHERE CategoryFlag = '' OR CategoryFlag IS NULL


				-- added 10/31/2008:  set SumOfCurrentEarnings field to NULL when this is zero
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET SumOfCurrentEarnings = NULL
				WHERE CategoryFlag = 'P' and SumOfCurrentEarnings = 0

--				UPDATE YTDEarningsStatementStagingMDPAGALEN
--				SET SumOfCurrentHours = NULL
--				WHERE CategoryFlag = 'P' and SumOfCurrentHours = 0

				-- UPDATE CsuPSID 
				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET SumOfCurrentHours = NULL
				WHERE CategoryFlag = 'P' AND SumOfCurrentHours = 0

				UPDATE YTDEarningsStatementStagingMDPAGALEN
				SET SumOfCurrentUnits = NULL
				WHERE CategoryFlag = 'P' AND SumOfCurrentUnits = 0

				UPDATE PA
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
					END
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				LEFT JOIN (SELECT DISTINCT(A.EMPLOYEE), A.PROCESS_LEVEL
							FROM dbo.PRTIME A  JOIN EMPLOYEE B
								ON A.EMPLOYEE = B.EMPLOYEE AND A.COMPANY = B.COMPANY
							WHERE B.PAY_FREQUENCY = 3							
							AND (A.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1
							OR A.PROCESS_LEVEL BETWEEN @PL_START2 AND @PL_END2)							
							) PRT
					ON PA.CsuFlxIDeb = PRT.EMPLOYEE

									 
				--Batch UPDATE PayPeriod Column

				IF @PL_START1 < '8000' 
				BEGIN

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '02' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 1 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '04' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 2 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '06' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 3 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '08' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 4 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '10' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 5 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '12' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 6 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '14' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 7 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '16' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 8 AND DAY(PeriodEnding) = 15
					
					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '18' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 9 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '20' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 10 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '22' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 11 AND DAY(PeriodEnding) = 15

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '24' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 12 AND DAY(PeriodEnding) = 15

					-- payperiod day = 28,29,30,31

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '03' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 1 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '05' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 2 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '07' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 3 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '09' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 4 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '11' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 5 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '13' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 6 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '15' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 7 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '17' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 8 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '19' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 9 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '21' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 10 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '23' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 11 AND DAY(PeriodEnding) IN (28,29,30,31)

					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) + '01' + (CASE WHEN PayCode LIKE 'E8%' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					WHERE MONTH(PeriodEnding) = 12 AND DAY(PeriodEnding) IN (28,29,30,31)
				END
-----------------------This section of code was added by MEdAmerica on 2/19/09 to fix the problem dealing with
-----------------------missing category flag M's. A missing Cat M means that the web program does not display the entire statemnt.
-----------------------Two issues caused the earnings statement code to NOT create Cat M flags.
-----------------------An adjustment statement that had no state witholding tax adjustment and and Checks for a provider from TX.
-----------------------Each one is handled seperately below. The code below adds Category Flag M's for those adjustments and TX
-----------------------checks that don't have one.
/***********************************************************************************************************************/
/*This adds dummy cat M flags for adjustment check. The web program recognizes this as a dummy cat M Flag (by the values in the field
and does not display this section on adjustment statements. Althought the Category Flag is still M, the category name is 
AdjustmentFlagM*/
INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding, 
					LastName, FirstName, MiddleName, FullName, CalendarYear, BaseRate, TaxStatus, StStatus1,
					FedAdjValue, SdiAdjValue, FedExempt, StateExempt, CategoryFlag, 
					EarningsStatmentCategory) 

	SELECT DISTINCT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding, 
					LastName, FirstName, MiddleName, FullName, CalendarYear, BaseRate = NULL, TaxStatus = 'X', StStatus1 = 'X',
					FedAdjValue = 'X', SdiAdjValue = 'X', FedExempt = -9999, StateExempt = -9999, CategoryFlag = 'M', 
					EarningsStatmentCategory = 'AdjustmentFlagM' 
	FROM YTDEarningsStatementStagingMDPAGALEN
	WHERE CheckNo like '%.5' and CheckNo NOT IN (SELECT DISTINCT CheckNo 
												 FROM YTDEarningsStatementStagingMDPAGALEN 
												 WHERE CheckNo like '%.5' and CategoryFlag = 'M')

/***********************************************************************************************************************/

/***********************************************************************************************************************/
/*This adds Cat M rows for TX statements. Since texas does not have a witholding tax, a texas state witholding deduction is never 
applied to any check, hence the paydeductn table will not have a state dedcode to match with. Thus no cat M flag is created for 
tx check. To fix this we are adding cat M flags for TX. These cat M flags are a special, they put in dummy values for the state
section, but retrieve the right federal values.Althought the Category Flag is still M, the category name is 
TexasFlagM

Revision by Jay Santhan 6/1/2010 - this code was further modified on 6/1/10 to ensure that a category flag M record was added 
for every distinct CheckNo that did not have a category Flag M, regardless of the reason it was missing.*/

INSERT INTO YTDEarningsStatementStagingMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding, 
					LastName, FirstName, MiddleName, FullName, CalendarYear, BaseRate, TaxStatus, StStatus1,
					FedAdjValue, SdiAdjValue, FedExempt, StateExempt, 
					CategoryFlag, EarningsStatmentCategory) 

      SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding, 
               LastName, FirstName, MiddleName, FullName, CalendarYear, BaseRate = NULL, TaxStatus, StStatus1 = '-',
               FedAdjValue, SdiAdjValue = 0.00, FedExempt, StateExempt = '-',
               CategoryFlag = 'M', EarningsStatmentCategory = 'NoStateWihtholding'                    
      FROM
            (SELECT DISTINCT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo, PeriodEnding, 
                                          LastName, FirstName, MiddleName, FullName, CalendarYear
            FROM YTDEarningsStatementStagingMDPAGALEN
            WHERE CheckNo NOT IN (SELECT DISTINCT CheckNo 
                                            FROM YTDEarningsStatementStagingMDPAGALEN
                                            WHERE CategoryFlag = 'M')) Earn
            JOIN 
            (SELECT EMPLOYEE, DED_CODE  , MARITAL_STATUS as TaxStatus 
                                                      , ADDL_AMOUNT as FedAdjValue
                                                      , EXEMPTIONS + ADDL_EXEMPTS AS FedExempt
             FROM dbo.EMDEDMASTR
             WHERE DED_CODE in ('1010') ) Fed
            ON Earn.CsuFlxIDeb = Fed.EMPLOYEE
            /*as noted on 6/1/10  revision, commenting out 
			WHERE NOT EXISTS 
            (SELECT 1
             FROM dbo.EMDEDMASTR
             WHERE EMDEDMASTR.EMPLOYEE = Earn.CsuFlxIDeb
					AND DED_CODE like '11%') */

/***********************************************************************************************************************/
---------------------------------------END MedAmerica addition 2/19/09
---------------------------------------END MedAmerica addition 2/19/09
---------------------------------------END MedAmerica addition 2/19/09

				-- UPDATE CsuPSID 


			IF @PL_START1 >= '8000' 
			BEGIN
				UPDATE PA
				SET CsuPSID =
					CASE WHEN PYM.PROCESS_LEVEL >= CAST('8000' AS INT) AND PYM.PROCESS_LEVEL < CAST('8100' AS INT)
							THEN 'GALEN' 
						WHEN PYM.PROCESS_LEVEL >= CAST('8100' AS INT) AND PYM.PROCESS_LEVEL < CAST('8200' AS INT)
							THEN 'SEMA' 
						ELSE 'Unknown'
					END
				FROM YTDEarningsStatementStagingMDPAGALEN PA
				INNER JOIN dbo.PAYMASTR PYM ON PA.CheckNo = 
					(CASE WHEN PYM.CHECK_TYPE = 'R' THEN RTRIM(CAST(PYM.CHECK_NBR AS VARCHAR(20))) + '.9' 
						  WHEN PYM.CHECK_TYPE = 'J' THEN CAST(PYM.CHECK_ID AS VARCHAR(20)) + '.5' 
						  ELSE CAST(PYM.CHECK_NBR AS VARCHAR(10)) END)
				INNER JOIN dbo.EMPLOYEE EMP ON EMP.EMPLOYEE = PYM.EMPLOYEE
				WHERE PYM.PROCESS_LEVEL BETWEEN @PL_START1 AND @PL_END1		
				AND (EMP.PAY_FREQUENCY BETWEEN @PAY_FREQUENCY_START AND @PAY_FREQUENCY_END)
				
				--UPDATE PA
				--SET CsuPSID =
					--CASE WHEN PRT.PROCESS_LEVEL >= CAST('8000' AS INT) AND PRT.PROCESS_LEVEL < CAST('8100' AS INT)
							--THEN 'GALEN' 
						--WHEN PRT.PROCESS_LEVEL >= CAST('8100' AS INT) AND PRT.PROCESS_LEVEL < CAST('8200' AS INT)
							--THEN 'SEMA' 
						--ELSE 'Unknown'
					--END
				--FROM YTDEarningsStatementStagingMDPAGALEN PA
				--LEFT JOIN (SELECT DISTINCT(A.EMPLOYEE), A.PROCESS_LEVEL
							--FROM dbo.PRTIME A  JOIN EMPLOYEE B
								--ON A.EMPLOYEE = B.EMPLOYEE AND A.COMPANY = B.COMPANY
							--WHERE (B.PAY_FREQUENCY = 3 OR B.PAY_FREQUENCY = 4)						
							--AND A.PROCESS_LEVEL BETWEEN @Process_Level_Start AND @Process_Level_End					
							--) PRT
					--ON PA.CsuFlxIDeb = PRT.EMPLOYEE
					

									 
				--Batch UPDATE PayPeriod Column

					--Set Pay Period for Bi-Monthly Pay frequency
					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) 
						+ (CASE WHEN MONTH(CheckDate) * 2 + DAY(CheckDate)/16 = 25 THEN '01' ELSE RIGHT('00' + CAST(MONTH(CheckDate) * 2 + DAY(CheckDate)/16 AS VARCHAR), 2) END)
						+ (CASE WHEN PayCode = '87D' OR PayCode = '89G' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					INNER JOIN dbo.EMPLOYEE EMP ON EMP.EMPLOYEE = PA.CsuFlxIDeb
					WHERE EMP.PAY_FREQUENCY = 3
					
					--Set Pay Period for Monlty Pay Frequency
					UPDATE PA
					SET PayPeriod = RTRIM(CalendarYear) 
						+ (CASE WHEN MONTH(CheckDate) = 12 THEN '01' ELSE RIGHT('00' + CAST(MONTH(CheckDate) + 1 AS VARCHAR), 2) END)
						+ (CASE WHEN PayCode = '87D' OR PayCode = '89G' THEN '1' ELSE '0' END)
					FROM YTDEarningsStatementStagingMDPAGALEN PA
					INNER JOIN dbo.EMPLOYEE EMP ON EMP.EMPLOYEE = PA.CsuFlxIDeb
					WHERE EMP.PAY_FREQUENCY = 4

			END
					-- insert data from temporary table to the current table
					
					-- Load Category E to Current Table
					INSERT INTO YTDEarningsStatementMDPAGALEN(CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
								BankAcctNo,EFTAmount,AccountType,CalendarYear,
								EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
								BankAcctNo,EFTAmount,AccountType,CalendarYear,
								EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'E'					
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'E' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)

					-- Load Category F to Current Table
					INSERT INTO YTDEarningsStatementMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
								CsxShortDesc,CsxCurrTax,CsxYTDTax,CalendarYear, 
								EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
								CsxShortDesc,CsxCurrTax,CsxYTDTax,CalendarYear,
								EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'F' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'F' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)
						ORDER BY CsuFlxIDeb, CheckDate, CheckNo


					-- Load Category G to Current Table
					INSERT INTO YTDEarningsStatementMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
									PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
									DeductCode,CurrDeductAmt,YTDDeductAmt,CalendarYear,
									EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
									PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
									DeductCode,CurrDeductAmt,YTDDeductAmt,CalendarYear,
									EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'G' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'G' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)
					
					-- Load Category H to Current Table
					INSERT INTO YTDEarningsStatementMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
									PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName, 
									DeductCode,CurrDed, YTDDed, CalendarYear,
									EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
									PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName, 
									DeductCode,CurrDed, YTDDed, CalendarYear,
									EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'H' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'H' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)

					-- Load Category I to Current Table
					INSERT INTO YTDEarningsStatementMDPAGALEN(CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
								Dept,SpecialItem, SpecialItemAmount, CalendarYear,
								EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
								Dept,SpecialItem, SpecialItemAmount, CalendarYear,
								EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'I' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'I' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)
				

					-- Load Category K to Current Table
					INSERT INTO YTDEarningsStatementMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
									PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,Dept,
									PayCode, PayCodeDescr, CurrHours, CurrUnits, YTDUnitsBySite, CurrEarnings, HourlyRate, Site,CalendarYear,
									TotalHoursbyPayCode, YTDEarningsBySite, YTDHoursBySite,
									EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
									PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,Dept,
									PayCode, PayCodeDescr, CurrHours, CurrUnits, YTDUnitsBySite, CurrEarnings, HourlyRate, Site,CalendarYear,
									TotalHoursbyPayCode, YTDEarningsBySite, YTDHoursBySite,
									EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'K' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'K' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)
						ORDER BY CheckDate, CheckNo
			
					-- Load Category L to Current Table
					INSERT INTO YTDEarningsStatementMDPAGALEN(CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding, PayPeriod,LastName, FirstName, MiddleName, FullName, CalendarYear, 
								SumOfCurrentEarnings, SumOfYTDEarnings,
								EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding, PayPeriod,LastName, FirstName, MiddleName, FullName, CalendarYear, 
								SumOfCurrentEarnings, SumOfYTDEarnings,
								EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'L' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'L' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)

					-- Load Category M to current table
					INSERT INTO YTDEarningsStatementMDPAGALEN(CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,CalendarYear,
								BaseRate, TaxStatus, StStatus1, FedAdjValue, SdiAdjValue, FedExempt, StateExempt,
								EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,CalendarYear,
								BaseRate, TaxStatus, StStatus1, FedAdjValue, SdiAdjValue, FedExempt, StateExempt,
								EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM 	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'M' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'M' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb
												AND tmp.CalendarYear = CalendarYear)


					-- Load Category M1 to current table
					INSERT INTO YTDEarningsStatementMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,PayPeriod, LastName, FirstName, MiddleName, FullName, CalendarYear, 
								SumOfYTDUnits, SumOfCurrentUnits, SumOfCurrentHours, SumOfYTDHours, EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,PayPeriod, LastName, FirstName, MiddleName, FullName, CalendarYear, 
								SumOfYTDUnits, SumOfCurrentUnits, SumOfCurrentHours, SumOfYTDHours, EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'M1' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'M1' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)

					-- Load Category M2 to current table
					INSERT INTO YTDEarningsStatementMDPAGALEN (CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,CalendarYear,
								CurrentGrossPay,CurrentNetPay,CurrTax,CurrTaxWage,CurrDed, 
								YTDTax,YTDTaxWage,YTDDed,YTDGrossPay,YTDNetPay,
								EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate,CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,CalendarYear,
								CurrentGrossPay,CurrentNetPay,CurrTax,CurrTaxWage,CurrDed,
								YTDTax,YTDTaxWage,YTDDed,YTDGrossPay,YTDNetPay,
								EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'M2' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'M2' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)


					-- Load Category P to Current Table
					INSERT INTO YTDEarningsStatementMDPAGALEN(CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
								CalendarYear,SumOfCurrentHours,SumOfCurrentUnits,SumOfCurrentEarnings,
								EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, CheckDate, CheckNo,
								PeriodEnding,PayPeriod,LastName,FirstName,MiddleName,FullName,
								CalendarYear,SumOfCurrentHours,SumOfCurrentUnits,SumOfCurrentEarnings,
								EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'P' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'P' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb
												AND tmp.CalendarYear = CalendarYear)


					-- Load Category S to Current Table
					INSERT INTO YTDEarningsStatementMDPAGALEN (CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo,PayPeriod,LastName,FirstName,MiddleName,FullName,
									CalendarYear, PayCode, PayCodeDescr, TotalEarnings, YTDNetPay,
									EarningsStatmentCategory, CategoryFlag, CsuPSID)
						SELECT CsuFlxIDeb, ProviderMasterID, PeriodEnding, CheckDate, 
									CheckNo,PayPeriod,LastName,FirstName,MiddleName,FullName,
									CalendarYear, PayCode, PayCodeDescr, TotalEarnings, YTDNetPay,
									EarningsStatmentCategory, CategoryFlag, CsuPSID
						FROM	YTDEarningsStatementStagingMDPAGALEN tmp
						WHERE	CategoryFlag = 'S' 
						AND NOT EXISTS (SELECT  CsuFlxIDeb, CheckDate, CheckNo, CalendarYear
										FROM	YTDEarningsStatementArchiveGALEN 
										WHERE	CategoryFlag = 'S' AND tmp.CheckDate = CheckDate 
												AND tmp.CheckNo = CheckNo
												AND tmp.CsuFlxIDeb = CsuFlxIDeb 
												AND tmp.CalendarYear = CalendarYear)


					--Imputed Income changes
					--Modified by Mohamed Mahmoud on 4/19/2010 based on spec from Derrick Fong
/*					SELECT MIN(CsuFlxIDeb) AS CsuFlxIDeb, MIN(CsdFlxID) AS CsdFlxID, MIN(ProviderMasterID) AS ProviderMasterID, MIN(CheckDate) AS CheckDate, CheckNo, MIN(PeriodEnding) AS PeriodEnding, 
									MIN(LastName) AS LastName, MIN(FirstName) AS FirstName, MIN(MiddleName) AS MiddleName, MIN(FullName) AS FullName, MAX(CalendarYear) AS CalendarYear,
									'XX' AS PayCode, 'Total' AS PayCodeDescr, MIN(DeductCode) AS DeductCode, CategoryFlag = 'S', 
									MIN(EarningsStatmentCategory) AS EarningsStatmentCategory, -SUM(ISNULL(YTDNetPay,0)+ISNULL(YTDEarningsBySite,0)) AS YTDNetPay,
									-SUM(ISNULL(TotalEarnings,0)+ISNULL(CurrEarnings,0)) AS TotalEarnings
					INTO #Temp
					FROM YTDEarningsStatementMDPAGALEN
					WHERE (PayCode IN ('HSA','DP') OR CategoryFlag = 'S')
					GROUP BY CheckNo

					DELETE YTDEarningsStatementMDPAGALEN
					WHERE CheckNo IN (SELECT CheckNo FROM #Temp)
							AND CategoryFlag = 'S'

					INSERT INTO YTDEarningsStatementMDPAGALEN (CsuFlxIDeb, CsdFlxID, ProviderMasterID, CheckDate, CheckNo, PeriodEnding, 
									LastName, FirstName, MiddleName, FullName, CalendarYear, 
									PayCode, PayCodeDescr, DeductCode, CategoryFlag, EarningsStatmentCategory, YTDNetPay, TotalEarnings) 
					SELECT DISTINCT * FROM #Temp
*/
					-- Create HSA/DP cat 'S' records
					SELECT MIN(CsuFlxIDeb) AS CsuFlxIDeb, MIN(CsdFlxID) AS CsdFlxID, MIN(ProviderMasterID) AS ProviderMasterID, MIN(CheckDate) AS CheckDate, CheckNo, MIN(PeriodEnding) AS PeriodEnding, 
									MIN(LastName) AS LastName, MIN(FirstName) AS FirstName, MIN(MiddleName) AS MiddleName, MIN(FullName) AS FullName, MAX(CalendarYear) AS CalendarYear,
									MIN(PayCode) AS PayCode,MIN(PayCode) AS PayCodeDescr, MIN(DeductCode) AS DeductCode, CategoryFlag = 'S', 
									MIN(EarningsStatmentCategory) AS EarningsStatmentCategory, -SUM(ISNULL(YTDNetPay,0)+ISNULL(YTDEarningsBySite,0)) AS YTDNetPay,
									-SUM(ISNULL(TotalEarnings,0)+ISNULL(CurrEarnings,0)) AS TotalEarnings
					INTO #Temp1
					FROM YTDEarningsStatementMDPAGALEN
					WHERE (PayCode IN ('HSA','DP'))
						AND CategoryFlag <> 'S'
					GROUP BY CheckNo, PayCode


					INSERT INTO YTDEarningsStatementMDPAGALEN (CsuFlxIDeb, CsdFlxID, ProviderMasterID, CheckDate, CheckNo, PeriodEnding, 
									LastName, FirstName, MiddleName, FullName, CalendarYear, 
									PayCode, PayCodeDescr, DeductCode, CategoryFlag, EarningsStatmentCategory, YTDNetPay, TotalEarnings) 
					SELECT DISTINCT * FROM #Temp1
					--End of Imputed Income Changes

					UPDATE YTDEarningsStatementMDPAGALEN 
						SET TaxStatus = 'Single' 
					WHERE TaxStatus = '1'

					UPDATE YTDEarningsStatementMDPAGALEN 
						SET TaxStatus = 'Married'
					WHERE TaxStatus = '2'

					UPDATE YTDEarningsStatementMDPAGALEN 
						set StStatus1 = 'Single' 
					WHERE StStatus1 = '1'

					UPDATE YTDEarningsStatementMDPAGALEN 
						SET StStatus1 = 'Married' 
					WHERE StStatus1 = '2'

					 --transfer current data to archive 
 					INSERT INTO YTDEarningsStatementArchiveGALEN
 						SELECT * FROM YTDEarningsStatementMDPAGALEN


--		COMMIT TRANSACTION;
--	END TRY
--	BEGIN CATCH
--		IF (XACT_STATE()) = -1
--			ROLLBACK TRANSACTION;
		
		-- test if the transaction is committable
--		IF (XACT_STATE()) = 1
--			COMMIT TRANSACTION;   
    
		
--END CATCH;
END























