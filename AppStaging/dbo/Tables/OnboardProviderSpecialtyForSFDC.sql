CREATE TABLE [dbo].[OnboardProviderSpecialtyForSFDC] (
    [SFDCName]               VARCHAR (80)  NULL,
    [ProviderMasterID]       INT           NOT NULL,
    [WebID]                  INT           NOT NULL,
    [SFID]                   VARCHAR (50)  NOT NULL,
    [SpecialtyType]          VARCHAR (20)  NULL,
    [PrimarySpeciality]      VARCHAR (500) NULL,
    [BoardCertified]         VARCHAR (500) NULL,
    [BoardSFID]              VARCHAR (18)  NULL,
    [CertifyingBoard]        VARCHAR (500) NULL,
    [InitialCertDate]        DATETIME      NULL,
    [ReCertDate]             DATETIME      NULL,
    [ExpirationDate]         DATETIME      NULL,
    [NotCertifiedOption]     VARCHAR (50)  NULL,
    [PendingCertBoard]       VARCHAR (20)  NULL,
    [PendingCertDate]        DATETIME      NULL,
    [FutureExamDate]         DATETIME      NULL,
    [DoNotIntendToBoardCert] CHAR (1)      NULL,
    [Comments1]              TEXT          NULL
);

