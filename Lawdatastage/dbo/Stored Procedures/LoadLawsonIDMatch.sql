
/***********************************************************************************************/
/*	J Rogers	7/29/2010	Added SSN update to the "UPDATE LID" routine below	
					Removed Hard Coded updates created by Mohamed
												*/
/***********************************************************************************************/

CREATE PROCEDURE [dbo].[LoadLawsonIDMatch]
AS
BEGIN
SET NOCOUNT ON;

		INSERT INTO LawsonIDMatch (ProviderMasterID,SSN, LawsonEmpNo, LawsonLastName,LawsonFirstName,LawsonEmpStatus,
					LawsonNameSuffix, CEPWebID, echo_dr_no_ext, echo_dr_id, SiteLineCntID, NationalID, CreDate)
			SELECT MP.ProviderMasterID, EMP.FICA_NBR, EMP.EMPLOYEE, EMP.LAST_NAME, EMP.FIRST_NAME, EMP.EMP_STATUS,
					EMP.NAME_SUFFIX, PMB.WebID, MP.Echo_dr_no_ext, MP.Echo_dr_id, MP.SiteLineCntID, MP.NationalID, GETDATE()			
			FROM PROD.dbo.EMPLOYEE EMP
				LEFT JOIN dbo.ProviderMaster MP
					ON EMP.FICA_NBR = MP.SSNFormatted
				LEFT JOIN dbo.ProviderMasterBase PMB
					ON MP.ProviderMasterID = PMB.ProviderMasterID
			WHERE EMP.EMPLOYEE NOT IN (SELECT LawsonEmpNo 
							FROM dbo.LawsonIDMatch)
/*				AND EMP.EMPLOYEE NOT IN
						(SELECT EMPLOYEE 
						FROM PROD.dbo.EMPLOYEE 
						WHERE PROCESS_LEVEL IN ('9200','9100'))
					AND EMP.EMPLOYEE NOT IN 
						(SELECT EMPLOYEE 
						FROM PROD.dbo.PAEMPPOS 
						WHERE R_POSITION LIKE '%SCR%' 
								OR R_POSITION LIKE 'EBILLCLK%' 
								OR R_POSITION LIKE '8%'
								OR R_POSITION LIKE 'EPTCLLRP%'
								OR R_POSITION LIKE 'EPTRECPT%'
								OR R_POSITION LIKE 'EPRACADM%'
								OR R_POSITION LIKE 'EQTYAAST%'
								OR R_POSITION LIKE 'EERDAST%'
								OR R_POSITION LIKE 'PTNR-UNA1000%')
*/
		
		UPDATE LID
		SET LawsonLastName = EMP.LAST_NAME, LawsonFirstName = EMP.FIRST_NAME, 
			LawsonEmpStatus = EMP.EMP_STATUS, LawsonNameSuffix = EMP.NAME_SUFFIX,
			-- SSN update; 
			LID.SSN = EMP.FICA_NBR,
			UpdDate = GETDATE()
		FROM LawsonIDMatch LID
		JOIN PROD.dbo.EMPLOYEE EMP
			ON LID.LawsonEmpNo = EMP.EMPLOYEE
		WHERE LID.LawsonLastName <> EMP.LAST_NAME
		OR LID.LawsonFirstName <> EMP.FIRST_NAME
		OR LID.LawsonEmpStatus <> EMP.EMP_STATUS
		OR LID.LawsonNameSuffix <> EMP.NAME_SUFFIX		
		-- new update condition for SSN mismatch; 
		OR LID.SSN <> EMP.FICA_NBR
		
		
		
		-- Update the fields from ProviderMaster table
		UPDATE LID
		SET ProviderMasterID = MP.ProviderMasterID
				FROM LawsonIDMatch LID
		LEFT JOIN dbo.ProviderMaster MP ON LID.SSN = MP.SSNFormatted
		WHERE LID.ProviderMasterID IS NULL
		 
		UPDATE LID
		SET echo_dr_no_ext = MP.Echo_dr_no_ext,
			echo_dr_id = MP.Echo_dr_id,
			SiteLineCntID = MP.SiteLineCntID,
			NationalID = MP.NationalID,
			UpdDate = GETDATE()
		FROM LawsonIDMatch LID
		LEFT JOIN dbo.ProviderMaster MP ON LID.SSN = MP.SSNFormatted
		
		-- and CEPWebID from the ProviderMasterBase
		UPDATE LID
		SET CEPWebID = PMB.WebID, UpdDate = GETDATE()
		FROM LawsonIDMatch LID
		LEFT JOIN dbo.ProviderMasterBase PMB 
		ON LID.ProviderMasterID = PMB.ProviderMasterID
		WHERE CEPWebID IS NULL
/*
		-- hard coded by Mohamed on 11/11/2009; SSN not matching, but earning statement 
		-- is one day out, will not be fixed on time, needed to hard-code it temporarily
		UPDATE LawsonIDMatch
		SET ProviderMasterID = 2742
		WHERE LawsonEmpNo = 2606

		UPDATE LawsonIDMatch
		SET ProviderMasterID = 4504
		WHERE LawsonEmpNo = 6224

		UPDATE LawsonIDMatch
		SET ProviderMasterID = 582
		WHERE LawsonEmpNo = 6388
*/

END













