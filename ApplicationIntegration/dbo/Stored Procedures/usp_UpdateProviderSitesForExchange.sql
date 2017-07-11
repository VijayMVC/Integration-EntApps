

/*The following script is based on the changes to the new ProviderDirectory*/



CREATE  PROCEDURE [dbo].[usp_UpdateProviderSitesForExchange]
AS
BEGIN
	SET NOCOUNT ON;

	
--DROP TABLE #TempSiteBase
	
SELECT DISTINCT * 
INTO #TempSiteBase
FROM SiteBase

--DROP TABLE #ProvSites

CREATE TABLE #ProvSites
(WebCode varchar(5),
PMID varchar(6000))

INSERT INTO #ProvSites
SELECT DISTINCT WebCode, ''
			FROM SiteBase


DECLARE @PMID		varchar(50),
		@Site		VARCHAR(5),
		@Count		INT
		
	
	DECLARE SitesCursor CURSOR FOR
		
			SELECT DISTINCT WebCode
			FROM #ProvSites
			FOR UPDATE

	OPEN SitesCursor

	FETCH NEXT FROM SitesCursor
		INTO @Site

	WHILE @@FETCH_STATUS = 0
		BEGIN
		
			SET @Count = (SELECT COUNT(*) FROM #TempSiteBase 
							WHERE WebCode = @Site)			
		
			WHILE @Count > 0
				BEGIN
				
					SET @PMID = (SELECT TOP 1 ProviderMasterID 
					FROM #TempSiteBase
					WHERE WebCode = @Site)
					
					--PRINT @PMID
					
					UPDATE #ProvSites
					SET PMID =  CASE WHEN PMID = ''
							THEN @PMID 
							ELSE PMID + ', ' + @PMID END 
					WHERE WebCode = @Site
					--and PMID IS NULL
						
					
				
					DELETE FROM #TempSiteBase
					WHERE ProviderMasterID = @PMID
					AND WebCode = @Site
					
					SET @Count = @Count - 1
					
				END					
					
				

			FETCH NEXT FROM SitesCursor
				INTO @Site
		END

	CLOSE SitesCursor
	DEALLOCATE SitesCursor
	
	
TRUNCATE TABLE ProviderSites2
	
INSERT INTO ProviderSites2 
SELECT * FROM #ProvSites
order by WebCode

TRUNCATE TABLE ProviderSites2Demographic

INSERT INTO ProviderSites2Demographic
SELECT m.ProviderMasterID, m.LastName, m.FirstName, m.Title, m.CellPhoneNbr, m.PhoneNbr1, m.Status
FROM providermasterbase m
JOIN physicianinfo p ON m.ProviderMasterID = p.MPID 
WHERE m.status = 0




DROP TABLE #TempSiteBase
DROP TABLE #ProvSites


--select * from ProviderSites

	
END






