CREATE TABLE [dbo].[SFDCDepartmentHistory] (
    [LastName]           VARCHAR (50)  NOT NULL,
    [FirstName]          VARCHAR (50)  NOT NULL,
    [PMID]               INT           NOT NULL,
    [FromDate]           DATETIME      NULL,
    [ToDate]             DATETIME      NULL,
    [Comments]           TEXT          NULL,
    [PartnershipHistory] VARCHAR (255) NOT NULL,
    [PartHistDetails]    TEXT          NULL
);

