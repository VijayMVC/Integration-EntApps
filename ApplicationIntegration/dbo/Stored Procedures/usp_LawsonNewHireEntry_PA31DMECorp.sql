USE [ApplicationIntegration]
GO
/****** Object:  StoredProcedure [dbo].[usp_LawsonNewHireEntry_PA31DMECorp]    Script Date: 07/13/2016 18:10:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER                     PROCEDURE [dbo].[usp_LawsonNewHireEntry_PA31DMECorp] 
AS

/* 	Author: 	Reetika Singh
	Date:		4/4/2011
	Purpose:	Create PA31 DME for PFI to load
	Revision:	

*/
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 

BEGIN





TRUNCATE TABLE DME_31Corp



INSERT INTO DME_31Corp
SELECT DISTINCT '_PDL=PROD&_TKN=PA31.1&_EVT=ADD&_RTN=DATA&_LFN=ALL&_TDS=IGNORE&FC=A &APL-COMPANY= 100 &'
+ 'APL-HM-PHONE-NBR=' + CASE WHEN PhoneNbr1 IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(PhoneNbr1)) END
+ '&APL-EMAIL-ADDRESS=' + CASE WHEN Email IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(Email)) END,

'&APL-ADDR1=' + CASE WHEN Address1 IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(Address1)) END
+ '&APL-CITY=' + CASE WHEN City1 IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(City1)) END
+ '&APL-STATE=' + CASE WHEN State1 IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(State1)) END
+ '&APL-ZIP=' + CASE WHEN ZipCode1 IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(ZipCode1)) END
+ '&APL-COUNTRY-CODE=' + CASE WHEN Country IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(Country)) END
+ '&APL-EEO-CLASS=' + CASE WHEN Ethnicity IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(Ethnicity)) END
+ '&APL-SEX=' + CASE WHEN Gender IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(Gender)) END
+ '&APL-LAST-NAME=' + CASE WHEN LastName IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(LastName)) END,

'&APL-FIRST-NAME=' + CASE WHEN FirstName IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(FirstName)) END
+'&APL-MIDDLE-NAME=' + CASE WHEN MiddleNameOrInitial IS NULL THEN '' 
			    ELSE LTRIM(RTRIM(MiddleNameOrInitial)) END
+ '&APL-NAME-SUFFIX=' + CASE WHEN LTRIM(RTRIM(Title)) IS NULL OR LTRIM(RTRIM(Title)) = '' THEN '' 
			    ELSE LTRIM(RTRIM(Title)) END
+ '&APL-DATE-APPLIED=' + LTRIM(RTRIM(CONVERT(VARCHAR(8),Convert(DateTime, DateOfHire), 112)))  
+ '&APL-PROCESS-LEVEL=' + LTRIM(RTRIM(Convert(varchar, ProcessLevel )))
+ '&APL-FICA-NBR=' + LTRIM(RTRIM(Convert(varchar, SSNFormatted )))
+ '&APL-BIRTHDATE=' + LTRIM(RTRIM(CONVERT(VARCHAR(8),DateOfBirth, 112))) 
+ '&_DELIM=%09&_OUT=XML&_EOT=TRUE'
FROM dbo.LawsonNewHireEntryCorporate








	

END
