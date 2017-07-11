CREATE TABLE [dbo].[LEmployeeIDCrossWalk] (
    [EmpNo]            INT          NULL,
    [ProviderMasterID] INT          NULL,
    [SSN]              VARCHAR (9)  NULL,
    [ID1]              INT          NULL,
    [ID2]              INT          NULL,
    [FirstName]        VARCHAR (50) NULL,
    [MiddleName]       VARCHAR (50) NULL,
    [LastName]         VARCHAR (50) NULL,
    [EbPSID1]          VARCHAR (8)  NULL,
    [EbPSID2]          VARCHAR (8)  NULL,
    [EbClock1]         VARCHAR (10) NULL,
    [EbClock2]         VARCHAR (10) NULL,
    [TaxID]            INT          NULL,
    [MBSIBadgeNo]      VARCHAR (20) NULL,
    [Source]           VARCHAR (10) NULL,
    [CreDate]          DATETIME     NULL,
    [UpdDate]          DATETIME     NULL,
    [WebID]            INT          NULL
);

