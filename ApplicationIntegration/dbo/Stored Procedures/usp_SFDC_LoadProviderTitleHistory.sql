CREATE PROCEDURE [dbo].[usp_SFDC_LoadProviderTitleHistory] 
AS

/* 	Author: 	
	Date:		
	Purpose:	Load Director and History History Information
	Revision:	Can be used as is for SFDC
*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN
	DECLARE 	@UnknownPMasterID		INT,
			@DummyRegionID			INT,
			@DummyRegionName		VARCHAR(100),
			@DummySiteLocationID		INT,
			@DummySiteLocationName		VARCHAR(100),
			@BoardMember 			CHAR(4),
			@RegionalDirector		CHAR(4),
			@MedicalDirector		CHAR(4),
			@AsstMedicalDirector		CHAR(4),
			@ReimbursementDirector		CHAR(4),
			@CMO				CHAR(4),
			@DirectorNPRelations		CHAR(4),
			@EMSDirector			CHAR(4),
			@QIDirector1			CHAR(4),
			@QIDirector2			CHAR(4),
			@QIDirector3			CHAR(4),
			@QIDirector4			CHAR(4),
			@QIDirector5			CHAR(4),
			@CEPStaffGroup			VARCHAR(50)
		
	SET @BoardMember 		= 'BD'
	SET @RegionalDirector		= 'RD'
	SET @MedicalDirector		= 'MD'
	SET @ReimbursementDirector	= 'RID'
	SET @AsstMedicalDirector	= 'AMD'
	SET @CMO			= 'CMO'
	SET @DirectorNPRelations	= 'NP'
	SET @EMSDirector		= 'EMS'
	SET @QIDirector1		= 'QI1'
	SET @QIDirector2		= 'QI2'
	SET @QIDirector3		= 'QI3'
	SET @QIDirector4		= 'QI4'
	SET @QIDirector5		= 'QI5'
	SET @UnknownPMasterID 		= 2581
	SET @CEPStaffGroup 		= 'CEP'

	SELECT  @DummyRegionID 		= RL.RegionID,
		@DummyRegionName	= RL.RegionName
		FROM PMDBStaging.dbo.RegionLookup RL
		WHERE RL.DummyRegionFlag = 'Y'

	SELECT  @DummySiteLocationID 	= SLL.SiteLocationID,
		@DummySiteLocationName	= SLL.SiteLocationName
		FROM PMDBStaging.dbo.SiteLocationLookup SLL
		WHERE SLL.DummySiteLocationFlag = 'Y'

	DELETE FROM ProviderTitleHistory
		WHERE ProviderMasterID = @UnknownPMasterID	

	/* Board Of Directors */
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @BoardMember,
		 @DummyRegionID,
		 @DummyRegionName,
		 @DummySiteLocationID,
		 @DummySiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM ProviderMaster Prov
		WHERE Prov.BoardMember = 'Y'
		  AND NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID = Prov.ProviderMasterID
				  AND PTH.TitleCode = @BoardMember
				  AND PTH.StaffGroup = @CEPStaffGroup
				  AND PTH.EndDate IS NULL)

	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @BoardMember
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1 
				FROM ProviderMaster Prov
				WHERE Prov.BoardMember = 'Y'
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* Regions */
		/* New Directors */
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @RegionalDirector,
		 RL.RegionID,
		 RL.RegionName,
		 @DummySiteLocationID,
		 @DummySiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM Regions RS
		INNER JOIN RegionLookup RL
			ON RS.RegionCode = RL.WebRegionCode
		INNER JOIN ProviderMaster Prov
			ON RS.Region_DIR = Prov.WebID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @RegionalDirector
				  AND PTH.RegionID		= RL.RegionID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @RegionalDirector
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM Regions RS
				INNER JOIN RegionLookup RL
					ON RS.RegionCode = RL.WebRegionCode		
				INNER JOIN ProviderMaster Prov
					ON RS.Region_Dir = Prov.WebID
				WHERE RL.RegionID 	    = ProviderTitleHistory.RegionID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* Sites */
	CREATE TABLE #Temp_Hospital_Region 
		(Code 			CHAR (20) 	NOT NULL ,
		 Site_Dir 		NCHAR (50) 	NULL,
		 Site_Dir1 		NCHAR (50) 	NULL,
		 Site_Dir2 		NCHAR (50) 	NULL,
		 AssSite_Dir 		NCHAR (50)	NULL,
		 AssSite_Dir1 		NCHAR (50)	NULL,
		 AssSite_Dir2		NCHAR (50)	NULL,
		 AssSite_Dir3 		NCHAR (50)	NULL,
		 AssSite_Dir4		NCHAR (50)	NULL,
		 AssSite_Dir5 		NCHAR (50)	NULL,
		 RID	 		NCHAR (50)	NULL,
		 CMO 			NCHAR (10) 	NULL,
		 EMS_Dir 		NCHAR (10) 	NULL,
		 NP_Dir 		NCHAR (10) 	NULL,
		 QI_DIR 		NCHAR (50) 	NULL,
		 QI_DIR1 		NCHAR (50) 	NULL,
		 QI_DIR2	 	NCHAR (50) 	NULL,
		 QI_DIR3 		NCHAR (50) 	NULL,
		 QI_DIR4	 	NCHAR (50) 	NULL,
		 QI_DIR5 		NCHAR (50) 	NULL,
		 CommaPosition 		INT, 
		 FirstStringPosition 	INT,
		 LastStringPosition1 	INT,  
		 LastStringPosition2 	INT)

	INSERT INTO #Temp_Hospital_Region
		(Code,
		 Site_Dir,
		 AssSite_Dir,
		 CMO,
		 EMS_Dir,
		 NP_Dir,
		 QI_DIR,
		 RID,
		 CommaPosition)
	SELECT	 HR.Code,
		 HR.Site_Dir,
		 HR.AssSite_Dir,
		 HR.CMO,
		 HR.EMS_Dir,
		 HR.NP_Dir,
		 HR.QI_DIR,
		 HR.Reimb_Dir,
		 PATINDEX('%,%',HR.Site_DIR) 
		FROM Hospital_Region HR

	-- Handle leading commas
	UPDATE #Temp_Hospital_Region SET 
		AssSite_Dir = RIGHT(rtrim(AssSite_Dir),LEN(rtrim(AssSite_Dir))-2)
		WHERE LEFT(AssSite_Dir,1) = ','

	UPDATE #Temp_Hospital_Region SET 
		QI_Dir = RIGHT(rtrim(QI_Dir),LEN(rtrim(QI_Dir))-2)
		WHERE LEFT(QI_Dir,1) = ','

	UPDATE #Temp_Hospital_Region SET 
		RID = RIGHT(rtrim(RID),LEN(rtrim(RID))-2)
		WHERE LEFT(RID,1) = ','

	UPDATE #Temp_Hospital_Region SET 
		EMS_Dir = RIGHT(rtrim(EMS_Dir),LEN(rtrim(EMS_Dir))-2)
		WHERE LEFT(EMS_Dir,1) = ','

	/* Multiple Site Directors */
	UPDATE #Temp_Hospital_Region SET 
		FirstStringPosition = CommaPosition - 1,
	 	LastStringPosition1 = CommaPosition + 2,  
		LastStringPosition2 = 49 - CommaPosition

	UPDATE #Temp_Hospital_Region SET 
		Site_Dir1 = RTRIM(LTRIM(LEFT(Site_Dir,FirstStringPosition))),
		Site_Dir2 = RTRIM(LTRIM(RIGHT(Site_Dir,LastStringPosition2)))
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 

	UPDATE #Temp_Hospital_Region SET 
		Site_Dir1 = Site_Dir
		WHERE Site_Dir1 IS NULL

	/* Multiple QI Directors */
		/* Round 1 */
	UPDATE #Temp_Hospital_Region SET 
		CommaPosition = PATINDEX ('%,%',QI_DIR) 

	UPDATE #Temp_Hospital_Region SET 
		FirstStringPosition = CommaPosition - 1,
	 	LastStringPosition1 = CommaPosition + 2,  
		LastStringPosition2 = 49 - CommaPosition

	UPDATE #Temp_Hospital_Region SET 
		QI_Dir1 = QI_Dir

	UPDATE #Temp_Hospital_Region SET 
		QI_Dir1 = RTRIM(LTRIM(LEFT(QI_Dir1,FirstStringPosition))),
		QI_Dir2 = RTRIM(LTRIM(RIGHT(QI_Dir1,LastStringPosition2)))
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 

		/* Round 2 */

	UPDATE #Temp_Hospital_Region SET 
		CommaPosition = PATINDEX ('%,%',QI_DIR2) 

	UPDATE #Temp_Hospital_Region SET 
		FirstStringPosition = CommaPosition - 1,
	 	LastStringPosition1 = CommaPosition + 2,  
		LastStringPosition2 = 49 - CommaPosition

	UPDATE #Temp_Hospital_Region SET 
		QI_Dir2 = RTRIM(LTRIM(LEFT(QI_Dir2,FirstStringPosition))),
		QI_Dir3 = RTRIM(LTRIM(RIGHT(QI_Dir2,LastStringPosition2)))
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 

		/* Round 3 */
	UPDATE #Temp_Hospital_Region SET 
		CommaPosition = PATINDEX ('%,%',QI_DIR3) 

	UPDATE #Temp_Hospital_Region SET 
		FirstStringPosition = CommaPosition - 1,
	 	LastStringPosition1 = CommaPosition + 2,  
		LastStringPosition2 = 49 - CommaPosition

	UPDATE #Temp_Hospital_Region SET 
		QI_Dir3 = RTRIM(LTRIM(LEFT(QI_Dir3,FirstStringPosition))),
		QI_Dir4 = RTRIM(LTRIM(RIGHT(QI_Dir3,LastStringPosition2)))
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 

		/* Round 4 */
	UPDATE #Temp_Hospital_Region SET 
		CommaPosition = PATINDEX ('%,%',QI_DIR4) 

	UPDATE #Temp_Hospital_Region SET 
		FirstStringPosition = CommaPosition - 1,
	 	LastStringPosition1 = CommaPosition + 2,  
		LastStringPosition2 = 49 - CommaPosition

	UPDATE #Temp_Hospital_Region SET 
		QI_Dir4 = RTRIM(LTRIM(LEFT(QI_Dir4,FirstStringPosition))),
		QI_Dir5 = RTRIM(LTRIM(RIGHT(QI_Dir4,LastStringPosition2)))
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 

	/* Multiple Assistant Site Directors */
		/* Round 1 */
	UPDATE #Temp_Hospital_Region SET 
		CommaPosition = PATINDEX ('%,%',AssSite_Dir) 

	UPDATE #Temp_Hospital_Region SET 
		FirstStringPosition = CommaPosition - 1,
	 	LastStringPosition1 = CommaPosition + 2,  
		LastStringPosition2 = 49 - CommaPosition

	UPDATE #Temp_Hospital_Region SET 
		AssSite_Dir1 = AssSite_Dir

	UPDATE #Temp_Hospital_Region SET 
		AssSite_Dir1 = RTRIM(LTRIM(LEFT(AssSite_Dir1,FirstStringPosition))),
		AssSite_Dir2 = RTRIM(LTRIM(RIGHT(AssSite_Dir1,LastStringPosition2)))
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 

		/* Round 2 */

	UPDATE #Temp_Hospital_Region SET 
		CommaPosition = PATINDEX ('%,%',AssSite_Dir2) 

	UPDATE #Temp_Hospital_Region SET 
		FirstStringPosition = CommaPosition - 1,
	 	LastStringPosition1 = CommaPosition + 2,  
		LastStringPosition2 = 49 - CommaPosition

	UPDATE #Temp_Hospital_Region SET 
		AssSite_Dir2 = RTRIM(LTRIM(LEFT(AssSite_Dir2,FirstStringPosition))),
		AssSite_Dir3 = RTRIM(LTRIM(RIGHT(AssSite_Dir2,LastStringPosition2)))
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 






	/* Round 3 */
	UPDATE #Temp_Hospital_Region SET 
		CommaPosition = PATINDEX ('%,%',AssSite_Dir3) 

	UPDATE #Temp_Hospital_Region SET 
		FirstStringPosition = CommaPosition - 1,
	 	LastStringPosition1 = CommaPosition + 2,  
		LastStringPosition2 = 49 - CommaPosition

	UPDATE #Temp_Hospital_Region SET 
		AssSite_Dir3 = RTRIM(LTRIM(LEFT(AssSite_Dir3,FirstStringPosition))),
		AssSite_Dir4 = RTRIM(LTRIM(RIGHT(AssSite_Dir3,LastStringPosition2)))
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 

		/* Round 4 */
	UPDATE #Temp_Hospital_Region SET 
		CommaPosition = PATINDEX ('%,%',AssSite_Dir4) 

	UPDATE #Temp_Hospital_Region SET 
		FirstStringPosition = CommaPosition - 1,
	 	LastStringPosition1 = CommaPosition + 2,  
		LastStringPosition2 = 49 - CommaPosition

	UPDATE #Temp_Hospital_Region SET 
		AssSite_Dir4 = RTRIM(LTRIM(LEFT(AssSite_Dir4,FirstStringPosition))),
		AssSite_Dir5 = RTRIM(LTRIM(RIGHT(AssSite_Dir4,LastStringPosition2)))
		WHERE FirststringPosition > 0 
		  AND LastStringPosition2 > 0 







	/* Convert to Provider Master ID */

	CREATE TABLE #Temp_Hospital_Region_PMasterID 
		(Code 			CHAR (20) 	NOT NULL ,
		 Site_Dir 		NCHAR (50) 	NULL,
		 Site_Dir1 		NCHAR (50) 	NULL,
		 Site_Dir2 		NCHAR (50) 	NULL,
		 AssSite_Dir 		NCHAR (50)	NULL,
		 AssSite_Dir1 		NCHAR (50)	NULL,
		 AssSite_Dir2		NCHAR (50)	NULL,
		 AssSite_Dir3 		NCHAR (50)	NULL,
		 AssSite_Dir4 		NCHAR (50)	NULL,
		 AssSite_Dir5 		NCHAR (50)	NULL,
		 RID	 		NCHAR (50)	NULL,
		 CMO 			NCHAR (10) 	NULL,
		 EMS_Dir 		NCHAR (10) 	NULL,
		 NP_Dir 		NCHAR (10) 	NULL,
		 QI_DIR 		NCHAR (50) 	NULL,
		 QI_DIR1 		NCHAR (50) 	NULL,
		 QI_DIR2	 	NCHAR (50) 	NULL,
		 QI_DIR3 		NCHAR (50) 	NULL,
		 QI_DIR4	 	NCHAR (50) 	NULL,
		 QI_DIR5 		NCHAR (50) 	NULL)

	INSERT INTO #Temp_Hospital_Region_PMasterID
		(Code,
		 Site_Dir1,
		 Site_Dir2,
		 AssSite_Dir1,
		 AssSite_Dir2,
		 AssSite_Dir3,
		 AssSite_Dir4,
		 AssSite_Dir5,
		 RID,
		 CMO,
		 EMS_Dir,
		 NP_Dir,
		 QI_DIR1,
		 QI_DIR2,
		 QI_DIR3,
		 QI_DIR4,
		 QI_DIR5)
	SELECT 	 HR.Code,
		 CASE WHEN SD1.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE SD1.ProviderMasterID END,
		 CASE WHEN SD2.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE SD2.ProviderMasterID END,
		 CASE WHEN AD1.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE AD1.ProviderMasterID END,
		 CASE WHEN AD2.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE AD2.ProviderMasterID END,
		 CASE WHEN AD3.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE AD3.ProviderMasterID END,
		 CASE WHEN AD4.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE AD4.ProviderMasterID END,
		 CASE WHEN AD5.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE AD5.ProviderMasterID END,
		 CASE WHEN RID.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE RID.ProviderMasterID END,
		 CASE WHEN CMO.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE CMO.ProviderMasterID END,
		 CASE WHEN EMS.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE EMS.ProviderMasterID END,
		 CASE WHEN NP.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE NP.ProviderMasterID END,
		 CASE WHEN QI1.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE QI1.ProviderMasterID END,
		 CASE WHEN QI2.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE QI2.ProviderMasterID END,
		 CASE WHEN QI3.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE QI3.ProviderMasterID END,
		 CASE WHEN QI4.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE QI4.ProviderMasterID END,
		 CASE WHEN QI5.ProviderMasterID IS NULL THEN @UnknownPMasterID
			ELSE QI5.ProviderMasterID END
		FROM #Temp_Hospital_Region HR
		LEFT OUTER JOIN ProviderMaster SD1
			ON HR.Site_Dir1 = SD1.WebID
		LEFT OUTER JOIN ProviderMaster SD2
			ON HR.Site_Dir2 = SD2.WebID
		LEFT OUTER JOIN ProviderMaster AD1
			ON HR.AssSite_Dir1 = AD1.WebID
		LEFT OUTER JOIN ProviderMaster AD2
			ON HR.AssSite_Dir2 = AD2.WebID
		LEFT OUTER JOIN ProviderMaster AD3
			ON HR.AssSite_Dir3 = AD3.WebID
		LEFT OUTER JOIN ProviderMaster AD4
			ON HR.AssSite_Dir4 = AD4.WebID
		LEFT OUTER JOIN ProviderMaster AD5
			ON HR.AssSite_Dir5 = AD5.WebID
		LEFT OUTER JOIN ProviderMaster RID
			ON HR.RID = RID.WebID
		LEFT OUTER JOIN ProviderMaster CMO
			ON HR.CMO = CMO.WebID
		LEFT OUTER JOIN ProviderMaster EMS
			ON HR.EMS_Dir = EMS.WebID
		LEFT OUTER JOIN ProviderMaster NP
			ON HR.NP_Dir = NP.WebID
		LEFT OUTER JOIN ProviderMaster QI1
			ON HR.QI_DIR1 = QI1.WebID
		LEFT OUTER JOIN ProviderMaster QI2
			ON HR.QI_DIR2 = QI2.WebID
		LEFT OUTER JOIN ProviderMaster QI3
			ON HR.QI_DIR3 = QI3.WebID
		LEFT OUTER JOIN ProviderMaster QI4
			ON HR.QI_DIR4 = QI4.WebID
		LEFT OUTER JOIN ProviderMaster QI5
			ON HR.QI_DIR5 = QI5.WebID

	/* Medical Director 1 */
		/* New Directors */
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @MedicalDirector,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.Site_Dir1 = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @MedicalDirector
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

	/* Medical Director 2 */
		/* New Directors */
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @MedicalDirector,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.Site_Dir2 = Prov.ProviderMasterID
		WHERE THR.Site_Dir2 != @UnknownPMasterID
		  AND NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @MedicalDirector
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

	/* Both Medical Directors */
		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @MedicalDirector
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.Site_Dir1 = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.Site_Dir2 = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* Reimbursement Director */
		/* New Directors */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @ReimbursementDirector,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.RID = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @ReimbursementDirector
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')
	
		/* Prior Directors */
	 
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @ReimbursementDirector
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.RID = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)
	
	/* Assistant Medical Director */
		/* New Directors */
			/* Asst Dir 1 */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @AsstMedicalDirector,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.AssSite_Dir1 = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @AsstMedicalDirector
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup 		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

			/* Asst Dir 2 */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @AsstMedicalDirector,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.AssSite_Dir2 = Prov.ProviderMasterID
		WHERE THR.AssSite_Dir2 != @UnknownPMasterID
		  AND NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @AsstMedicalDirector
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

			/* Asst Dir 3 */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @AsstMedicalDirector,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.AssSite_Dir3 = Prov.ProviderMasterID
		WHERE THR.AssSite_Dir3 != @UnknownPMasterID
		  AND NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @AsstMedicalDirector
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')


	
		/* Asst Dir 4 */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @AsstMedicalDirector,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.AssSite_Dir4 = Prov.ProviderMasterID
		WHERE THR.AssSite_Dir4 != @UnknownPMasterID
		  AND NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @AsstMedicalDirector
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')




		/* Asst Dir 5 */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @AsstMedicalDirector,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.AssSite_Dir5 = Prov.ProviderMasterID
		WHERE THR.AssSite_Dir5 != @UnknownPMasterID
		  AND NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @AsstMedicalDirector
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')




		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @AsstMedicalDirector
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.AssSite_Dir1 = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR2
				INNER JOIN ProviderMaster Prov2
					ON THR2.AssSite_Dir2 = Prov2.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL2
					ON THR2.Code = SLL2.WebCode
				WHERE SLL2.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov2.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR3
				INNER JOIN ProviderMaster Prov3
					ON THR3.AssSite_Dir3 = Prov3.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL3
					ON THR3.Code = SLL3.WebCode
				WHERE SLL3.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov3.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR4
				INNER JOIN ProviderMaster Prov4
					ON THR4.AssSite_Dir4 = Prov4.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL4
					ON THR4.Code = SLL4.WebCode
				WHERE SLL4.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov4.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR5
				INNER JOIN ProviderMaster Prov5
					ON THR5.AssSite_Dir5 = Prov5.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL5
					ON THR5.Code = SLL5.WebCode
				WHERE SLL5.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov5.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* Chief Medical Officer */
		/* New Directors */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @CMO,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.CMO = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @CMO
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup 		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @CMO
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.CMO = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* Director Nurse Physician Relations */
		/* New Directors */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @DirectorNPRelations,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.NP_dir = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @DirectorNPRelations
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @DirectorNPRelations
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.NP_dir = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* EMS Director */
		/* New Directors */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @EMSDirector,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.EMS_Dir = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @EMSDirector
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @EMSDirector
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.EMS_Dir = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* QI Director 1 */
		/* New Directors */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @QIDirector1,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.QI_DIR1 = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @QIDirector1
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @QIDirector1
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.QI_DIR1 = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* QI Director 2 */
		/* New Directors */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @QIDirector2,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.QI_DIR2 = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @QIDirector2
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @QIDirector2
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.QI_DIR2 = Prov.ProviderMasterID
					INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* QI Director 3 */
		/* New Directors */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @QIDirector3,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.QI_DIR3 = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @QIDirector3
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')


		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @QIDirector3
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.QI_DIR3 = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* QI Director 4 */
		/* New Directors */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @QIDirector4,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.QI_DIR4 = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @QIDirector4
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @QIDirector4
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.QI_DIR4 = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* QI Director 5 */
		/* New Directors */ 
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 ActiveFlag) 
	SELECT 	 Prov.ProviderMasterID,
		 @CEPStaffGroup,
		 @QIDirector5,
		 RL.RegionID,
		 RL.RegionName,
		 SLL.SiteLocationID,
		 SLL.SiteLocationName,
		 RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
			 RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 'Y'
		FROM #Temp_Hospital_Region_PMasterID THR
		INNER JOIN SiteLocationLookup SLL
			ON THR.Code = SLL.WebCode
		INNER JOIN RegionLookup RL
			ON SLL.RegionID = RL.RegionID
		INNER JOIN ProviderMaster Prov
			ON THR.QI_DIR5 = Prov.ProviderMasterID
		WHERE NOT EXISTS
			(SELECT 1 
				FROM ProviderTitleHistory PTH
				WHERE PTH.ProviderMasterID 	= Prov.ProviderMasterID
				  AND PTH.TitleCode 		= @QIDirector5
				  AND PTH.SiteLocationID	= SLL.SiteLocationID
				  AND PTH.StaffGroup 		= @CEPStaffGroup
				  AND PTH.EndDate IS NULL)
		  AND RL.RegionName NOT IN ('MedAmerica', 'Affiliated')

		/* Prior Directors */
	UPDATE ProviderTitleHistory SET 
		 EndDate = RTRIM(LTRIM(STR(DATEPART(mm,GETDATE())))) + '/' + 
			 	RTRIM(LTRIM(STR(DATEPART(dd,GETDATE())))) + '/' +
				RTRIM(LTRIM(STR(DATEPART(yyyy,GETDATE())))),
		 ActiveFlag 	= 'N'
		WHERE TitleCode = @QIDirector5
		  AND EndDate IS NULL
		  AND NOT EXISTS
			(SELECT 1
				FROM #Temp_Hospital_Region_PMasterID THR
				INNER JOIN ProviderMaster Prov
					ON THR.QI_DIR5 = Prov.ProviderMasterID
				INNER JOIN SiteLocationLookup SLL
					ON THR.Code = SLL.WebCode
				WHERE SLL.SiteLocationID    = ProviderTitleHistory.SiteLocationID
				  AND Prov.ProviderMasterID = ProviderTitleHistory.ProviderMasterID)

	/* Make Sure Title Description is accurate and not NULL */
	UPDATE ProviderTitleHistory SET 
		TitleDescr = Ttl.TitleDescr
		FROM ProviderTitleHistory PTH
		INNER JOIN TitleLookup Ttl
			 ON PTH.TitleCode = Ttl.TitleCode


	-- Delete all current active AMDs excluding dummy provider ID 2581
	DELETE ProviderTitleHistory
	WHERE TitleCode IN ('amd','qi1','qi2','rid','SCH') 
	AND ActiveFlag = 'Y' AND ProviderMasterID <> 2581
	
	-- Load from web staging tables
	INSERT INTO ProviderTitleHistory
		(ProviderMasterID,
		 StaffGroup,
		 TitleCode,
		 TitleDescr,
		 RegionID,
		 RegionName,
		 SiteLocationID,
		 SiteLocationName,
		 StartDate,
		 EndDate,
		 ActiveFlag,
		 SentFlag,
		 SentDate,
		 Credate,
		 UpdDate) 
	SELECT  T.Item_Value AS ProviderMasterID,
		'CEP' AS StaffGroup,
		CASE SII1.Item_Value 
		WHEN '0' THEN 'AMD'
		WHEN 'QI' THEN 'QI1'
		WHEN 'Reimburse' THEN 'RID'
		WHEN 'Sched Admin' THEN 'SCH'
		END AS TitleCode,
		CASE SII1.Item_Value
		WHEN '0' THEN 'Assistant Medical Director'
		WHEN 'QI' THEN 'QI Director 1'
		WHEN 'Reimburse' THEN 'Reimbursement Director'
		WHEN 'Sched Admin' THEN 'Schedule Admin' 
		END AS TitleDescr,
		RL.RegionID,
		RL.RegionName,
		SLL.SiteLocationID AS SiteLocationID,
		SLL.SiteLocationName,
		SIIH.Timestmp AS StartDate,
		NULL AS EndDate,
		'Y' AS ActiveFlag,
		NULL AS SentFlag,
		NULL AS SentDate,
		GETDATE() AS Credate,
		GETDATE() AS Upddate
	FROM SITE_Item_Info SII1
	INNER JOIN (SELECT DISTINCT SITE_Item_Info_History.* 
			FROM SITE_Item_Info_History 
			INNER JOIN
			(SELECT ID_Site, ID_Item, MAX(Timestmp) AS Timestmp
				FROM SITE_Item_Info_History 
				GROUP BY ID_Site, ID_Item) LATEST
			ON SITE_Item_Info_History.ID_Site = LATEST.ID_Site
				AND SITE_Item_Info_History.ID_Item = LATEST.ID_Item
				AND SITE_Item_Info_History.Timestmp = LATEST.Timestmp
				) SIIH
	ON SIIH.ID_Site = SII1.ID_Site
	AND SIIH.ID_Item = SII1.ID_Item
	INNER JOIN Hospital_Region HR
	ON HR.ID = SII1.ID_Site 
	INNER JOIN SiteLocationLookup SLL
	ON SLL.Webcode = HR.Code
	INNER JOIN RegionLookup RL
	ON SLL.RegionID = RL.RegionID
	INNER JOIN (
	SELECT SII.ID_Site, 
		CASE SII.ID_Item
		WHEN 51 THEN 52
		WHEN 64 THEN 60
		WHEN 65 THEN 61
		WHEN 66 THEN 62
		WHEN 67 THEN 63
		END AS ID_Item,
		SII.Item_Value
	FROM SITE_Item_Info SII
	WHERE SII.ID_Item IN (51,64,65,66,67)
	) T 
	ON T.ID_Site = SII1.ID_Site
	AND T.ID_Item = SII1.ID_Item
	WHERE SII1.ID_Item IN (52,60,61,62,63)
	AND T.Item_Value <> '0'
	
	-- Update QI1 to QI2
	UPDATE ProviderTitleHistory
	SET TitleCode = 'QI2',
		TitleDescr = 'QI Director 2',
		upddate = getdate()
	FROM ProviderTitleHistory PTH
	INNER JOIN
	(SELECT MAX(ProviderMasterID) AS ProviderMasterID,
		SiteLocationID
	FROM ProviderTitleHistory 
	WHERE SiteLocationID IN 
	(
		SELECT SiteLocationID
		FROM ProviderTitleHistory
		WHERE TitleCode LIKE 'QI%'
			AND ActiveFlag = 'Y'
			AND ProviderMasterID <> 2581
		GROUP BY SiteLocationID,LEFT(TitleCode,2)
		HAVING COUNT(ProviderMasterID) > 1
	)
	AND TitleCode LIKE 'QI%'
	AND ActiveFlag = 'Y'
	AND ProviderMasterID <> 2581
	GROUP BY SiteLocationID
	) T ON T.ProvidermasterID = PTH.ProviderMasterID
		AND T.SiteLocationID = PTH.SiteLocationID
	WHERE 
	PTH.TitleCode LIKE 'QI%'
	AND PTH.ActiveFlag = 'Y'
	AND PTH.ProviderMasterID <> 2581
	
	-- Delete Any dummy providermasterIDs that are already assigned
	DELETE ProviderTitleHistory 
	WHERE TitleHistoryID IN (
	SELECT TitleHistoryID
	FROM ProviderTitleHistory PTH
	WHERE EXISTS
	(SELECT 1
	FROM ProviderTitleHistory PTH1
	WHERE PTH1.SiteLocationID = PTH.SiteLocationID
	AND PTH1.TitleCode = PTH.TitleCode
	AND ActiveFlag = 'Y'
	GROUP BY SiteLocationID, TitleCode, ActiveFlag
	HAVING COUNT(*) > 1
	)
	AND ActiveFlag = 'Y'
	AND TitleCode IN ('amd','qi1','qi2','rid','sch') 
	AND ProviderMasterID = 2581
	)
	
END
