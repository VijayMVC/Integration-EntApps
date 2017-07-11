CREATE TABLE [dbo].[ProviderContractRosters] (
    [PCR_ID]              INT          NOT NULL,
    [StaffGroup]          VARCHAR (50) NULL,
    [ProviderMasterID]    INT          NULL,
    [NationalID]          VARCHAR (20) NULL,
    [SiteLocationID]      INT          NULL,
    [UPIN]                CHAR (15)    NULL,
    [PinNbr]              VARCHAR (25) NULL,
    [RailRoad]            VARCHAR (25) NULL,
    [MediCal]             VARCHAR (25) NULL,
    [BlueShield]          VARCHAR (25) NULL,
    [CalOptima]           VARCHAR (25) NULL,
    [BlueCrossBlueShield] VARCHAR (25) NULL,
    [Medicaid]            VARCHAR (25) NULL,
    [Section1011]         VARCHAR (25) NULL,
    [CreDate]             DATETIME     NULL,
    [UpdDate]             DATETIME     NULL
);

