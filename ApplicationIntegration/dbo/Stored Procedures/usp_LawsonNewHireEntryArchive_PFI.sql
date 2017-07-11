
CREATE                       PROCEDURE [dbo].[usp_LawsonNewHireEntryArchive_PFI] AS


--Archives old files



DECLARE @cmd VARCHAR(5000)

DECLARE @LoadYYYYMM VARCHAR(100)
SET @LoadYYYYMM = LTRIM(RTRIM(CONVERT(CHAR(10),GETDATE(),112)))

DECLARE @FileName1 VARCHAR(100)
DECLARE @FileName2 VARCHAR(100)
DECLARE @FileName3 VARCHAR(100)
DECLARE @FileName4 VARCHAR(100)
DECLARE @FileName5 VARCHAR(100)

DECLARE @NewFileName1 VARCHAR(100)
DECLARE @NewFileName2 VARCHAR(100)
DECLARE @NewFileName3 VARCHAR(100)
DECLARE @NewFileName4 VARCHAR(100)
DECLARE @NewFileName5 VARCHAR(100)

SET @FileName1 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\PA31.xls"'
--PRINT @FileName1

SET @FileName2 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\PA52.xls"'
--PRINT @FileName2

SET @FileName3 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\PA31_DME.txt"'
--PRINT @FileName3

SET @FileName4 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\PA52_DME.txt"'
--PRINT @FileName4

SET @FileName5 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\ApplicantsLoaded.xls"'
--PRINT @FileName5



SET @NewFileName1 = @LoadYYYYMM + '_PA31.xls'
--PRINT @NewFileName1

SET @NewFileName2 = @LoadYYYYMM + '_PA52.xls'
--PRINT @NewFileName2

SET @NewFileName3 = @LoadYYYYMM + '_PA31_DME.txt'
SET @NewFileName4 = @LoadYYYYMM + '_PA52_DME.txt'
SET @NewFileName5 = @LoadYYYYMM + '_ApplicantsLoaded.xls'



-- 
-- 
-- 
-- EXEC master..xp_cmdshell 'RENAME 
-- 	"\\maw-filesvr1\groups\IS\Data Area\LawsonDupEntry\ArchiveFiles\PA52_MidLevel.xls" 
-- 			PA52_MidLevel.xls ' 

SET @cmd = 'RENAME' + ' ' + @FileName1 + ' ' + @NewFileName1 
EXEC Master..xp_cmdshell @cmd

SET @cmd = 'RENAME' + ' ' + @FileName2 + ' ' + @NewFileName2 
EXEC Master..xp_cmdshell @cmd

SET @cmd = 'RENAME' + ' ' + @FileName3 + ' ' + @NewFileName3 
EXEC Master..xp_cmdshell @cmd

SET @cmd = 'RENAME' + ' ' + @FileName4 + ' ' + @NewFileName4 
EXEC Master..xp_cmdshell @cmd

SET @cmd = 'RENAME' + ' ' + @FileName5 + ' ' + @NewFileName5
EXEC Master..xp_cmdshell @cmd

