

CREATE                       PROCEDURE [dbo].[usp_LawsonNewHireEntryArchive_PFICorp] AS


--Archives old files



DECLARE @cmd VARCHAR(5000)

DECLARE @LoadYYYYMM VARCHAR(100)
SET @LoadYYYYMM = LTRIM(RTRIM(CONVERT(CHAR(10),GETDATE(),112)))

DECLARE @FileName1 VARCHAR(100)
DECLARE @FileName2 VARCHAR(100)
DECLARE @FileName3 VARCHAR(100)
DECLARE @FileName4 VARCHAR(100)
DECLARE @FileName5 VARCHAR(100)
DECLARE @FileName6 VARCHAR(100)
DECLARE @FileName7 VARCHAR(100)
DECLARE @FileName8 VARCHAR(100)

DECLARE @NewFileName1 VARCHAR(100)
DECLARE @NewFileName2 VARCHAR(100)
DECLARE @NewFileName3 VARCHAR(100)
DECLARE @NewFileName4 VARCHAR(100)
DECLARE @NewFileName5 VARCHAR(100)
DECLARE @NewFileName6 VARCHAR(100)
DECLARE @NewFileName7 VARCHAR(100)
DECLARE @NewFileName8 VARCHAR(100)

SET @FileName1 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\PA31Corp.xls"'
--PRINT @FileName1

SET @FileName2 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\PA52Corp.xls"'
--PRINT @FileName2

SET @FileName3 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\PA31_DMECorp.txt"'
--PRINT @FileName3

SET @FileName4 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\PA52_DMECorp.txt"'
--PRINT @FileName4

SET @FileName5 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\ApplicantsLoadedCorp.xls"'
--PRINT @FileName5

SET @FileName6 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\ApplicantsNotLoadedCorp.xls"'
--PRINT @FileName6

SET @FileName7 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\ApplicantsLoadedMBSICorp.xls"'
--PRINT @FileName7

SET @FileName8 = '"\\sacdc-svrlawapp\Lawson_output\LawsonPFI\ArchiveFiles\ApplicantsNotLoadedMBSICorp.xls"'
--PRINT @FileName8



SET @NewFileName1 = @LoadYYYYMM + '_PA31Corp.xls'
--PRINT @NewFileName1

SET @NewFileName2 = @LoadYYYYMM + '_PA52Corp.xls'
--PRINT @NewFileName2

SET @NewFileName3 = @LoadYYYYMM + '_PA31_DMECorp.txt'
SET @NewFileName4 = @LoadYYYYMM + '_PA52_DMECorp.txt'
SET @NewFileName5 = @LoadYYYYMM + '_ApplicantsLoadedCorp.xls'

SET @NewFileName6 = @LoadYYYYMM + '_ApplicantsNotLoadedCorp.xls'
SET @NewFileName7 = @LoadYYYYMM + '_ApplicantsLoadedMBSICorp.xls'
SET @NewFileName8 = @LoadYYYYMM + '_ApplicantsNotLoadedMBSICorp.xls'



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

SET @cmd = 'RENAME' + ' ' + @FileName6 + ' ' + @NewFileName6
EXEC Master..xp_cmdshell @cmd

SET @cmd = 'RENAME' + ' ' + @FileName7 + ' ' + @NewFileName7
EXEC Master..xp_cmdshell @cmd

SET @cmd = 'RENAME' + ' ' + @FileName8 + ' ' + @NewFileName8
EXEC Master..xp_cmdshell @cmd


