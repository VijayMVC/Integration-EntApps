CREATE TABLE [dbo].[SFDCUploadTracking] (
    [ProviderMasterID]    INT           NOT NULL,
    [SFID]                NVARCHAR (18) NULL,
    [ProviderType]        NVARCHAR (10) NULL,
    [UploadToOnboard]     DATETIME      NULL,
    [UploadToSFDC]        DATETIME      NULL,
    [SFDCContact]         CHAR (5)      NULL,
    [HospAffiliations]    CHAR (5)      NULL,
    [OtherClinical]       CHAR (5)      NULL,
    [GapInWH]             CHAR (5)      NULL,
    [Certifications]      CHAR (5)      NULL,
    [BoardCertifications] CHAR (5)      NULL,
    [MedicalLicense]      CHAR (5)      NULL,
    [StateDEA]            CHAR (5)      NULL,
    [FederalDEA]          CHAR (5)      NULL,
    [Education]           CHAR (5)      NULL,
    [ForeignEducation]    CHAR (5)      NULL,
    [MalPracCarriers]     CHAR (5)      NULL,
    [ProviderReferences]  CHAR (5)      NULL,
    [Specialty]           CHAR (5)      NULL,
    [Training]            CHAR (5)      NULL
);

