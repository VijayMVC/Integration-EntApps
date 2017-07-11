CREATE TABLE [dbo].[WebAutoCPACPartnershipLevel] (
    [PartnershipLevel]   VARCHAR (255)  NOT NULL,
    [ProviderMasterID]   INT            NOT NULL,
    [FromDate]           DATETIME       NULL,
    [ToDate]             DATETIME       NULL,
    [Comment]            VARCHAR (255)  NULL,
    [PartnershipDetails] NVARCHAR (MAX) NULL,
    [Credate]            DATETIME       NULL
);

