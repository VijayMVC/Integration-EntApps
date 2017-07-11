CREATE TABLE [dbo].[ProviderCrossMapMARS] (
    [ProviderMasterID] INT      NULL,
    [MARSPractice]     CHAR (3) NULL,
    [MARSProviderCode] INT      NULL,
    [CreDate]          DATETIME CONSTRAINT [DF_ProviderCrossMapMARS_CreDate] DEFAULT (getdate()) NULL,
    [UpdDate]          DATETIME CONSTRAINT [DF_ProviderCrossMapMARS_UpdDate] DEFAULT (getdate()) NULL
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[ProviderCrossMapMARS] TO [MEDAMERICA\SpearM]
    AS [dbo];

