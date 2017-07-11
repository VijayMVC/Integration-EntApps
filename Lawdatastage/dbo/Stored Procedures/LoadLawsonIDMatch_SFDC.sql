


CREATE PROCEDURE [dbo].[LoadLawsonIDMatch_SFDC]
AS
BEGIN
SET NOCOUNT ON;

		INSERT INTO LawsonIDMatchSFDC (ProviderMasterID,SSN, LawsonEmpNo, LawsonLastName, LawsonFirstName,
					LawsonEmpStatus, LawsonNameSuffix, CEPWebID, SFID, 
					SiteLineCntID, NationalID, CreDate)
			SELECT MP.ProviderMasterID, EMP.FICA_NBR, EMP.EMPLOYEE, EMP.LAST_NAME, EMP.FIRST_NAME, 
					EMP.EMP_STATUS, EMP.NAME_SUFFIX, MP.WebID, 
					MP.SFID, 
					MP.SiteLineCntID, MP.NationalID, GETDATE()			
			FROM PROD.dbo.EMPLOYEE EMP
				LEFT JOIN dbo.ProviderMaster MP
					ON EMP.FICA_NBR = MP.SSNFormatted
			WHERE EMP.EMPLOYEE NOT IN (SELECT LawsonEmpNo 
							FROM dbo.LawsonIDMatchSFDC)
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
		
		UPDATE LawsonIDMatchSFDC
		SET LawsonLastName = EMP.LAST_NAME, 
			LawsonFirstName = EMP.FIRST_NAME, 
			LawsonEmpStatus = EMP.EMP_STATUS, 
			LawsonNameSuffix = EMP.NAME_SUFFIX,
			SSN = EMP.FICA_NBR,
			UpdDate = GETDATE()
		FROM LawsonIDMatchSFDC LID
		JOIN PROD.dbo.EMPLOYEE EMP
			ON LID.LawsonEmpNo = EMP.EMPLOYEE
		WHERE LID.LawsonLastName <> EMP.LAST_NAME
		OR LID.LawsonFirstName <> EMP.FIRST_NAME
		OR LID.LawsonEmpStatus <> EMP.EMP_STATUS
		OR LID.LawsonNameSuffix <> EMP.NAME_SUFFIX		
		-- new update condition for SSN mismatch; 
		OR LID.SSN <> EMP.FICA_NBR
		
		
		
		-- Update the fields from ProviderMaster table
		UPDATE LawsonIDMatchSFDC
		SET ProviderMasterID = MP.ProviderMasterID,
			SFID = MP.SFID,
			SiteLineCntID = MP.SiteLineCntID,
			NationalID = MP.NationalID,
			UpdDate = GETDATE()
		FROM ProviderMaster MP
		WHERE LawsonIDMatchSFDC.SSN = MP.SSNFormatted

		
		-- and CEPWebID from the ProviderMasterBase
		UPDATE LawsonIDMatchSFDC
		SET CEPWebID = PMB.WebID, 
			UpdDate = GETDATE()
		FROM ProviderMasterBase PMB 
		WHERE LawsonIDMatchSFDC.ProviderMasterID = PMB.ProviderMasterID
		
		
		DELETE FROM LawsonIDMatchSFDC
		WHERE LawsonEmpNo NOT IN (SELECT EMPLOYEE FROM PROD.dbo.EMPLOYEE)


END














