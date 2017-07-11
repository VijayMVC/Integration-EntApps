USE [ApplicationIntegration]
GO

/****** Object:    StoredProcedure [dbo].[usp_EmployeeSitesFromLawson]        Script Date: 08/12/2016 15:42:00 ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_EmployeeSitesFromLawson]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_EmployeeSitesFromLawson]
GO

USE [ApplicationIntegration]
GO

/****** Object:    StoredProcedure [dbo].[usp_EmployeeSitesFromLawson]        Script Date: 08/12/2016 15:42:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_EmployeeSitesFromLawson]
AS


/*Sites :
    1. OSA sites should come from Lawson
    2. Scribe sites should come from Lawson
    3. MA and MBSI department from Lawson
*/


SET QUOTED_IDENTIFIER OFF
SET ANSI_NULLS OFF

BEGIN

    --DEPT TABLE UPDATE
    TRUNCATE TABLE DeptLookup

    INSERT INTO DeptLookup
    SELECT DISTINCT
        CASE WHEN PROCESS_LEVEL = 9100 THEN 'MA'
        ELSE 'MBSI'
        END                                                   As StaffGroup,
        DEPARTMENT                                            As DeptId,
        LTRIM(RTRIM(PROCESS_LEVEL))+ LTRIM(RTRIM(DEPARTMENT)) As DeptCode,
        NAME                                                  As DeptDescription --into ApplicationIntegration.dbo.DeptLookup
    from AppStaging.dbo.LawsonDEPTCODE
    WHERE PROCESS_LEVEL IN (9100, 9200)
      AND NAME NOT LIKE '%DO%NOT%'
    ORDER BY StaffGroup, Department




    --CASE 1 - Sites for OSA and Scribes excluding Lead Scribes
    -- RM 9/5/2016 All OSA and Scribes sites at once

    TRUNCATE TABLE EmployeeSiteBase

    INSERT INTO EmployeeSiteBase

    SELECT DISTINCT
        EB.SFID,
        EB.ProviderMasterID,
        EB.WebID,
        HR.SFID HospSFID,
        HR.Code,
        HR.HospitalName ,
        CASE WHEN LP.POS_LEVEL = 1 AND HR.Code <> 'ARW4' THEN 'Y'
        ELSE 'N' END PrimeSite
    FROM EmployeeBase                  EB
    JOIN AppStaging.dbo.LawsonPAEMPPOS LP        ON EB.LawsonID = LP.EMPLOYEE
    JOIN LS_pLevelLookup               LS        ON LS.ProcessLevel = LP.PROCESS_LEVEL
    JOIN Hospital_region               HR        ON HR.Code = LS.WebCode
    WHERE EB.StaffGroup1 IN ('OSA', 'Scribe', 'AUC')
      AND LP.END_DATE = '1753-01-01 00:00:00.000'
    --AND LawsonID NOT IN (SELECT EMPLOYEE FROM AppStaging.dbo.LawsonPAEMPPOS LP
    --                 WHERE LP.END_DATE = '1753-01-01 00:00:00.000'
    --                     AND LP.R_POSITION LIKE 'LEADSCRB%'
    --                     AND LP.POS_LEVEL = 2)



    --CASE 2 - Site for MA/MBSI - Dept in Lawson
    INSERT INTO EmployeeSiteBase

    SELECT DISTINCT
        EB.SFID,
        EB.ProviderMasterID,
        EB.WebID,
        NULL As HospSFID,
        LTRIM(RTRIM(DeptCode)) As Code ,
        LTRIM(RTRIM(DeptDescription)) As Name,
         'Y' PrimarySite
    FROM EmployeeBase                  EB
    JOIN AppStaging.dbo.LawsonEMPLOYEE LE        ON  LE.EMPLOYEE = EB.LawsonID
    JOIN (
        SELECT *,
            CASE WHEN StaffGroup = 'MA' THEN 9100
                 ELSE 9200
            END AS PL
        FROM DeptLookup
    )                                  DL        ON  DL.DeptId = LE.DEPARTMENT
                                                 AND DL.PL = LE.PROCESS_LEVEL
    WHERE LE.EMP_STATUS NOT LIKE 'T%'

    --CASE 3 -- 9100/9200 employees with sites in Location Code

    INSERT INTO EmployeeSiteBase

    SELECT DISTINCT EB.SFID,
        --EB.LastName, EB.FirstName, EB.StaffGroup1
        EB.ProviderMasterID,
        EB.WebID,
        HR.SFID HospSFID,
        HR.Code,
        HR.HospitalName ,
        CASE WHEN LP.POS_LEVEL = 1 AND HR.Code <> 'ARW4' THEN 'Y'
             ELSE 'N'
        END PrimeSite
    FROM EmployeeBase                  EB
    JOIN AppStaging.dbo.LawsonPAEMPPOS LP    ON EB.LawsonID = LP.EMPLOYEE
    JOIN LS_pLevelLookup               LS    ON LS.ProcessLevel = LP.LOCAT_CODE
    JOIN Hospital_region               HR    ON HR.Code = LS.WebCode
    WHERE EB.StaffGroup1 IN ('MA', 'MBSI')
      AND LP.END_DATE = '1753-01-01 00:00:00.000'
      AND NOT EXISTS (
        SELECT * FROM EmployeeSiteBase ESB
        WHERE ESB.ProviderMasterID = EB.ProviderMasterID
          AND ESB.WebCode = HR.Code
          AND ESB.WebID = EB.WebID)


    /*Lead Scribe    -- covered above*/


    --INSERT INTO EmployeeSiteBase

    --SELECT DISTINCT EB.SFID, --EB.LastName, EB.FirstName,
    --EB.ProviderMasterID,
    --EB.WebID,
    --HR.SFID HospSFID,
    --HR.Code,
    --HR.HospitalName ,
    --CASE WHEN LP.POS_LEVEL = 1 AND HR.Code <> 'ARW4' THEN 'Y'
    --ELSE 'N' END PrimeSite
    --FROM EmployeeBase EB
    --JOIN AppStaging.dbo.LawsonPAEMPPOS LP
    --    ON EB.LawsonID = LP.EMPLOYEE
    --JOIN LS_pLevelLookup LS
    --    ON LS.ProcessLevel = LP.PROCESS_LEVEL
    --JOIN Hospital_region HR
    --    ON HR.Code = LS.WebCode
    --WHERE EB.StaffGroup1 IN ('OSA', 'Scribe', 'AUC')
    --AND LP.END_DATE = '1753-01-01 00:00:00.000'
    --AND LP.POS_LEVEL = 1
    --AND LawsonID IN (SELECT EMPLOYEE FROM AppStaging.dbo.LawsonPAEMPPOS LP
    --                    WHERE LP.END_DATE = '1753-01-01 00:00:00.000'
    --                        AND LP.R_POSITION LIKE 'LEADSCRB%'
    --                        AND LP.POS_LEVEL = 2)


    /* Set primary site incase there are more than one*/

    --UPDATE EmployeeSiteBase
    --SET PrimarySite = 'N'
    --WHERE ProviderMasterID IN (
    --    SELECT ProviderMasterID
    --    FROM EmployeeSiteBase
    --    WHERE ProviderMasterID IS NOT NULL
    --    AND PrimarySite = 'Y'
    --    GROUP BY ProviderMasterID
    --    HAVING COUNT(*) > 1)
    --AND PrimarySite = 'Y'
    --AND HospitalSFID IS NULL

    --UPDATE EmployeeSiteBase
    --SET PrimarySite = CASE WHEN WebCode = 'QTM1' THEN 'Y' ELSE 'N' END
    --WHERE ProviderMasterID IN (SELECT ProviderMasterID
    --                        FROM EmployeeSiteBase
    --                        WHERE PrimarySite = 'Y'
    --                        AND WebCode in ('QTM1', 'GAX1', 'OVQ1'))

    --UPDATE EmployeeSiteBase
    --SET PrimarySite = CASE WHEN WebCode = 'TKL1' THEN 'Y' ELSE 'N' END
    --WHERE ProviderMasterID IN (SELECT ProviderMasterID
    --                        FROM EmployeeSiteBase
    --                        WHERE PrimarySite = 'Y'
    --                        AND WebCode in ('SEN1', 'TKL1', 'BYE1', 'KTX1', 'VWU1', 'WBX1', 'ISQ1', 'BZU1',
    --                                'LZT1', 'KKB1', 'NYS1', 'SMU1', 'GEV1', 'WFY1'))




    /*Code to handle duplicate sites due to shared process level*/

    IF OBJECT_ID('tempdb..#TempEmployeeSites') IS NOT NULL
        /*Then it exists*/
        DROP TABLE #TempEmployeeSites
    ;
    CREATE TABLE #TempEmployeeSites(
        [ID] [INT] IDENTITY(1,1),
        [SFID] [NCHAR](18) NULL,
        [ProviderMasterID] [INT] NULL,
        [WebID] [INT] NULL,
        [HospitalSFID] [NCHAR](18) NULL,
        [WebCode] [VARCHAR](10) NULL,
        [HospitalName] [VARCHAR](255) NULL,
        [PrimarySite] [CHAR](10) NULL
    )
    ;
    INSERT INTO #TempEmployeeSites (
        SFID,
        ProviderMasterID,
        WebID,
        HospitalSFID,
        WebCode,
        HospitalName,
        PrimarySite
    )
    SELECT
        [SFID]
      , [ProviderMasterID]
      , [WebID]
      , [HospitalSFID]
      , [WebCode]
      , [HospitalName]
      , [PrimarySite]
    FROM EmployeeSiteBase
    WHERE ProviderMasterID IN (
        SELECT ProviderMasterID
        FROM EmployeeSiteBase
        WHERE PrimarySite = 'Y'
        GROUP BY ProviderMasterID
        HAVING COUNT(*) > 1
        )
      AND PrimarySite = 'Y'
    ORDER BY ProviderMasterID

    --SELECT * FROM #TempEmployeeSites

    UPDATE #TempEmployeeSites
    SET PrimarySite = 'N'

    UPDATE #TempEmployeeSites
    SET PrimarySite = 'Y'
    FROM #TempEmployeeSites EB
    WHERE ID IN (
        SELECT MIN(ID)
        FROM #TempEmployeeSites TE
        WHERE EB.ProviderMasterID = TE.ProviderMasterID
        )

    IF (SELECT COUNT(*) FROM #TempEmployeeSites) > 1
    BEGIN
        UPDATE EmployeeSiteBase
        SET PrimarySite = TE.PrimarySite
        FROM #TempEmployeeSites TE
        WHERE TE.ProviderMasterID = EmployeeSiteBase.ProviderMasterID
          AND TE.WebCode = EmployeeSiteBase.WebCode
          AND TE.WebID = EmployeeSiteBase.WebID
    END
END
GO


