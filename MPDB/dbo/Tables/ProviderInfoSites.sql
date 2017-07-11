CREATE TABLE [dbo].[ProviderInfoSites] (
    [PinfSID]               INT           NOT NULL,
    [StaffGroup]            VARCHAR (50)  NULL,
    [ProviderMasterID]      INT           NULL,
    [WebID]                 INT           NULL,
    [WebSiteCode]           VARCHAR (20)  NULL,
    [SiteOrder]             INT           NULL,
    [MPDBAction]            CHAR (2)      NULL,
    [MPDBTimeStamp]         DATETIME      NULL,
    [MPDBAuthor]            VARCHAR (60)  NULL,
    [MPDBApprovalTimeStamp] DATETIME      NULL,
    [MPDBAuthorApproval]    VARCHAR (60)  NULL,
    [SchedAction]           CHAR (2)      NULL,
    [SchedTimeStamp]        DATETIME      NULL,
    [SchedAuthor]           VARCHAR (60)  NULL,
    [SiteStartDate]         DATETIME      NULL,
    [SiteEndDate]           DATETIME      NULL,
    [Notes]                 VARCHAR (255) NULL
);

