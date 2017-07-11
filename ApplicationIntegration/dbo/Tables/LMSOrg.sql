CREATE TABLE [dbo].[LMSOrg] (
    [ORG_CODE]        NVARCHAR (50)   NULL,
    [ORG_NAME]        NVARCHAR (1000) NULL,
    [ORG_PARENT_CODE] NVARCHAR (50)   NULL,
    [Hierarchy]       NVARCHAR (25)   NOT NULL,
    [DOMAIN_FLAG]     INT             NOT NULL
);

