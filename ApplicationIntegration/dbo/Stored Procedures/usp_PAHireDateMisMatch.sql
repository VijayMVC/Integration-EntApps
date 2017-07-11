-- =============================================
-- Author:		Chafik
-- Create date: 5/12/2014
-- Description:	Generates a report that includes Lawson Hire date and First date worked for comparaison
-- =============================================
CREATE PROCEDURE [dbo].[usp_PAHireDateMisMatch] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here


SELECT DISTINCT ProviderMasterID, 
WebID, 
LastName, 
FirstName, 
GETDATE()-41637.6 as LawsonHireDate, 
GETDATE()-41637.6 as LawsonAdjHireDate,
GETDATE()-41637.6 as TimeCardDate, 
0 LawsonID 
INTO #Temptable_A
FROM ApplicationIntegration.DBO.ProviderMasterBase
WHERE Status = 0 AND Title NOT LIKE 'D%O%' AND Title NOT LIKE 'M%D%'

SELECT DISTINCT DATE_HIRED, 
ADJ_HIRE_DATE, 
EMPLOYEE
INTO #Temptable_B
FROM appstaging.dbo.LawsonEMPLOYEE

SELECT DISTINCT AppStaging.dbo.PA_TCPIP_details.TCID,
MIN(AppStaging.dbo.PA_TCPIP_details.dat)MINDATE
INTO #Temptable_C
FROM AppStaging.dbo.PA_TCPIP_details
WHERE AppStaging.dbo.PA_TCPIP_details.hrs_TTL != 0
GROUP BY AppStaging.dbo.PA_TCPIP_details.TCID

UPDATE #Temptable_A 
SET LawsonHireDate = DATE_HIRED, LawsonAdjHireDate = ADJ_HIRE_DATE, LawsonID = EMPLOYEE
FROM appstaging.dbo.LawsonEMPLOYEE , ApplicationIntegration.dbo.LawsonIDMatch, ApplicationIntegration.dbo.ProviderMasterBase, #Temptable_A
WHERE #Temptable_A.ProviderMasterID = ApplicationIntegration.dbo.ProviderMasterBase.ProviderMasterID
AND LawsonEmpNo = EMPLOYEE
AND ApplicationIntegration.dbo.ProviderMasterBase.ProviderMasterID = ApplicationIntegration.dbo.LawsonIDMatch.ProviderMasterID



UPDATE #Temptable_A 
SET TimeCardDate = #Temptable_C.MINDATE
FROM #Temptable_A, #Temptable_C
WHERE #Temptable_A.WebID = #Temptable_C.TCID 


TRUNCATE TABLE ApplicationIntegration.dbo.PA_HireDateMisMatch
INSERT INTO ApplicationIntegration.dbo.PA_HireDateMisMatch
SELECT 
LawsonID,
LastName, 
FirstName, 
LawsonHireDate, 
LawsonAdjHireDate, 
TimeCardDate
from #Temptable_A
WHERE LawsonHireDate >= '2014-01-01 00:00:00.000'
AND TimeCardDate != '2005-05-01 00:00:00.000'
AND LawsonHireDate <> TimeCardDate

END



