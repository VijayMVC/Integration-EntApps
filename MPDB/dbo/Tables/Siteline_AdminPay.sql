CREATE TABLE [dbo].[Siteline_AdminPay] (
    [PayMonth]         DATETIME      NOT NULL,
    [WebCode]          VARCHAR (20)  NULL,
    [SFContractId]     NVARCHAR (18) NULL,
    [ProviderMasterID] INT           NULL,
    [PayLawsonID]      INT           NULL,
    [PayPaidAmt]       FLOAT (53)    NULL
);

