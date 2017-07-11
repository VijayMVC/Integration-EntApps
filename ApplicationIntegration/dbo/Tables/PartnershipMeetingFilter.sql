CREATE TABLE [dbo].[PartnershipMeetingFilter] (
    [LastName]                      VARCHAR (50)    NULL,
    [FirstName]                     VARCHAR (50)    NULL,
    [Title]                         VARCHAR (100)   NULL,
    [ProviderMasterID]              INT             NULL,
    [LawsonEmpNo]                   INT             NULL,
    [Echo_dr_id]                    VARCHAR (12)    NULL,
    [SSNFormatted]                  VARCHAR (11)    NULL,
    [DateOfHire]                    DATETIME        NULL,
    [CEPLevel]                      VARCHAR (5)     NULL,
    [CEPLevelDate]                  SMALLDATETIME   NULL,
    [MPDBPrimarySite]               VARCHAR (100)   NULL,
    [GRANDTotalHrsJan09toApr10]     DECIMAL (38, 2) NULL,
    [AttendedNewPartnerOrientation] VARCHAR (3)     NULL,
    [Credate]                       DATETIME        NULL
);

