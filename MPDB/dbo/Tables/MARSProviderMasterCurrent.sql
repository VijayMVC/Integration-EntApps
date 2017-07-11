CREATE TABLE [dbo].[MARSProviderMasterCurrent] (
    [Practice]             CHAR (3)     NULL,
    [ProviderCode]         INT          NULL,
    [ProviderMasterID]     INT          NULL,
    [Providerlast]         VARCHAR (30) NULL,
    [Providerfirst]        VARCHAR (30) NULL,
    [ProviderFirstNew]     VARCHAR (30) NULL,
    [ProviderMiddleNew]    VARCHAR (30) NULL,
    [Providertitle]        VARCHAR (15) NULL,
    [Providerlicense]      VARCHAR (15) NULL,
    [ProviderName]         VARCHAR (45) NULL,
    [ProviderNameComma]    VARCHAR (45) NULL,
    [ProviderInitials]     CHAR (5)     NULL,
    [PAFlag]               CHAR (1)     NULL,
    [MainEDorQuickCare]    CHAR (1)     NULL,
    [ActiveInactiveFlag]   CHAR (1)     NULL,
    [CurrentlyNotUsedFlag] CHAR (1)     NULL
);

