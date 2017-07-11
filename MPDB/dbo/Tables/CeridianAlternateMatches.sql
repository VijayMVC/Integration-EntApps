CREATE TABLE [dbo].[CeridianAlternateMatches] (
    [CAMID]                    INT           NOT NULL,
    [CeridianFlxID]            INT           NULL,
    [CeridianClockNbr]         INT           NOT NULL,
    [CeridianEbPSID]           VARCHAR (8)   NULL,
    [ProviderMasterID]         INT           NULL,
    [FormerlyIncorporatedFlag] CHAR (1)      NULL,
    [ActiveInactive]           VARCHAR (100) NULL,
    [TaxIDIncorporated]        VARCHAR (11)  NULL,
    [IncorporatedName]         VARCHAR (100) NULL,
    [CreDate]                  DATETIME      CONSTRAINT [DF_CeridianAlternateMatches_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]                  DATETIME      CONSTRAINT [DF_CeridianAlternateMatches_UpdDAte] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_CeridianAlternateMatches] PRIMARY KEY CLUSTERED ([CAMID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_CeridianAlternateMatches_ProviderMaster] FOREIGN KEY ([ProviderMasterID]) REFERENCES [dbo].[ProviderMaster] ([ProviderMasterID])
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[CeridianAlternateMatches] TO [MEDAMERICA\SpearM]
    AS [dbo];

