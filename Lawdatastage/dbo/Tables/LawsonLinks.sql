CREATE TABLE [dbo].[LawsonLinks] (
    [SystemCode]     VARCHAR (10)  NOT NULL,
    [MasterFileCode] VARCHAR (10)  NULL,
    [Company]        INT           NULL,
    [FiscalYear]     INT           NULL,
    [FiscalPeriod]   INT           NULL,
    [MasterFileID]   VARCHAR (20)  NULL,
    [DocumentNumber] VARCHAR (50)  NULL,
    [DocumentDate]   VARCHAR (50)  NULL,
    [Link1]          VARCHAR (255) NULL,
    [Link2]          VARCHAR (255) NULL,
    [Link3]          VARCHAR (255) NULL,
    [Link4]          VARCHAR (255) NULL,
    [Link5]          VARCHAR (255) NULL,
    [Link6]          VARCHAR (255) NULL,
    [Link7]          VARCHAR (255) NULL,
    [Link8]          VARCHAR (255) NULL,
    [Link9]          VARCHAR (255) NULL,
    [Link10]         VARCHAR (255) NULL
);


GO
CREATE CLUSTERED INDEX [UX_MasterFileCode]
    ON [dbo].[LawsonLinks]([MasterFileCode] ASC);


GO
CREATE NONCLUSTERED INDEX [UX_DocumentNumber]
    ON [dbo].[LawsonLinks]([DocumentNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [UX_FiscalYear]
    ON [dbo].[LawsonLinks]([FiscalYear] ASC);


GO
CREATE NONCLUSTERED INDEX [UX_FiscalPeriod]
    ON [dbo].[LawsonLinks]([FiscalPeriod] ASC);

