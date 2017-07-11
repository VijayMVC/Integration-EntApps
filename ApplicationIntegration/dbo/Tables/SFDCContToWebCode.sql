CREATE TABLE [dbo].[SFDCContToWebCode] (
    [AccountID]            NCHAR (18)     NOT NULL,
    [ContractId]           NCHAR (18)     NOT NULL,
    [ContractName]         NVARCHAR (80)  NULL,
    [ContractHolderId]     NCHAR (18)     NULL,
    [ContractHolderName]   NVARCHAR (255) NOT NULL,
    [Practice_Location__c] NVARCHAR (255) NULL,
    [WebCode]              CHAR (20)      NULL,
    [WebHospName]          VARCHAR (100)  NULL
);

