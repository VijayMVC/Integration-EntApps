/*
--on server SACDC-SVRDEVAPP
use ApplicationIntegration
go
-- 13848  Manzoor	Tahir   
-- 13719 Mollick	Joseph
DELETE from ProviderAccount           where ProviderMasterID IN (13848, 13719)
go
DELETE FROM ProviderAffiliations      WHERE ProviderMasterID IN (13848, 13719)
go
DELETE FROM ProviderCertification     WHERE ProviderMasterID IN (13848, 13719)
go
DELETE FROM ProviderEducation         WHERE ProviderMasterID IN (13848, 13719)
go
DELETE FROM ProviderLicenses          WHERE ProviderMasterID IN (13848, 13719)
go
DELETE FROM ProviderMalPracCarrier    WHERE ProviderMasterID IN (13848, 13719)
go
DELETE FROM ProviderSpecialty         WHERE ProviderMasterID IN (13848, 13719)
go
DELETE FROM ProviderTraining          WHERE ProviderMasterID IN (13848, 13719)
go
DELETE FROM ProviderWorkHistoryGap    WHERE ProviderMasterID IN (13848, 13719)
go
    --DELETE FROM ProviderReferences  WHERE ProviderMasterID IN (13848, 13719)
*/
/*
--on server SACDC-SVRSQL4

USE OnBoarding
go
DELETE from ProviderAccount           where ProviderMasterID IN (13848, 13719)     -- (2 row(s) affected)
go
DELETE FROM ProviderAffiliations      WHERE ProviderMasterID IN (13848, 13719)     -- (23 row(s) affected)
go
DELETE FROM ProviderCertification     WHERE ProviderMasterID IN (13848, 13719)     -- (3 row(s) affected)
go
DELETE FROM ProviderEducation         WHERE ProviderMasterID IN (13848, 13719)     -- (5 row(s) affected)
go
DELETE FROM ProviderLicenses          WHERE ProviderMasterID IN (13848, 13719)     -- (9 row(s) affected)
go
DELETE FROM ProviderMalPracCarrier    WHERE ProviderMasterID IN (13848, 13719)     -- (2 row(s) affected)
go
DELETE FROM ProviderSpecialty         WHERE ProviderMasterID IN (13848, 13719)     -- (3 row(s) affected)
go
DELETE FROM ProviderTraining          WHERE ProviderMasterID IN (13848, 13719)     -- (5 row(s) affected)
go
DELETE FROM ProviderWorkHistoryGap    WHERE ProviderMasterID IN (13848, 13719)     -- (0 row(s) affected)
go
DELETE FROM ProviderReferences        WHERE ProviderMasterID IN (13848, 13719)     -- (0 row(s) affected)
go
*/





















