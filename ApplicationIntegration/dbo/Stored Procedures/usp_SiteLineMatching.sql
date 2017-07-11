
CREATE PROCEDURE [dbo].[usp_SiteLineMatching] AS
/*SiteLine Matching on SiteLineID*/

UPDATE ApplicationIntegration.dbo.ProviderMaster
SET SiteLineCntID = S.CntID,
	UpdDate = GetDate()
FROM Siteline_tblCnt S
INNER JOIN LawsonIDMatch L
	ON S.CntLawsonNumber = L.LawsonEmpNo
INNER JOIN Providermaster P
		ON P.ProviderMasterID = L.ProviderMasterID
WHERE P.SiteLineCntID IS NULL


--siteline matching for LawsonID

TRUNCATE TABLE SiteLineLID

INSERT INTO SiteLineLID
select ProviderMasterID, LawsonEmpNo, SiteLineCntID, 
LID.LawsonLastName, LID.LawsonFirstName
from LawsonIDMatch LID
where ProviderMasterID IN (SELECT ProviderMasterID
						FROM ProviderMasterBase)
ORDER BY LID.LawsonLastName, LID.LawsonFirstName

--Matching for additional data not in PMB

INSERT INTO SiteLineLID
SELECT MPID, LE.LawsonNum, ST.CntID, PH.LastName, PH.FirstName
FROM WebStaging.dbo.LS_EmplLookup LE
JOIN PhysicianInfo PH
	ON LE.ID = PH.ID
LEFT OUTER JOIN Siteline_tblCnt ST
	ON ST.CntLawsonNumber = LE.LawsonNum
WHERE LE.LawsonNum NOT IN (SELECT LawsonEmpNo
						FROM SiteLineLID)



