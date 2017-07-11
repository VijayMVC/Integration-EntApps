
CREATE                       PROCEDURE [dbo].[usp_LawsonNewHireEntryArchive] AS


--Archives old files



DECLARE @cmd VARCHAR(5000)

DECLARE @LoadYYYYMM VARCHAR(100)
SET @LoadYYYYMM = LTRIM(RTRIM(CONVERT(CHAR(10),GETDATE(),112)))

DECLARE @FileName1 VARCHAR(100)
DECLARE @FileName2 VARCHAR(100)
DECLARE @FileName3 VARCHAR(100)


DECLARE @NewFileName1 VARCHAR(100)
DECLARE @NewFileName2 VARCHAR(100)
DECLARE @NewFileName3 VARCHAR(100)


SET @FileName1 = '"\\maw-filesvr1\groups\IS\Documentation\LawsonDupEntry\ArchiveFiles\PA31.xls"'
--PRINT @FileName1

SET @FileName2 = '"\\maw-filesvr1\groups\IS\Documentation\LawsonDupEntry\ArchiveFiles\PA52.xls"'
--PRINT @FileName2

SET @FileName3 = '"\\maw-filesvr1\groups\IS\Documentation\LawsonDupEntry\ArchiveFiles\ApplicantsLoaded.xls"'
--PRINT @FileName3


SET @NewFileName1 = @LoadYYYYMM + '_PA31.xls'
--PRINT @NewFileName1


SET @NewFileName2 = @LoadYYYYMM + '_PA52.xls'
--PRINT @NewFileName2

SET @NewFileName3 = @LoadYYYYMM + '_ApplicantsLoaded.xls'
--PRINT @NewFileName3



-- 
-- 
-- 
-- EXEC master..xp_cmdshell 'RENAME 
-- 	"\\maw-filesvr1\groups\IS\Documentation\LawsonDupEntry\ArchiveFiles\PA52_MidLevel.xls" 
-- 			PA52_MidLevel.xls ' 

SET @cmd = 'RENAME' + ' ' + @FileName1 + ' ' + @NewFileName1 
EXEC Master..xp_cmdshell @cmd

SET @cmd = 'RENAME' + ' ' + @FileName2 + ' ' + @NewFileName2 
EXEC Master..xp_cmdshell @cmd

SET @cmd = 'RENAME' + ' ' + @FileName3 + ' ' + @NewFileName3 
EXEC Master..xp_cmdshell @cmd
