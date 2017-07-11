CREATE TABLE [dbo].[SiteLineTblCtr] (
    [ctrID]   INT           NOT NULL,
    [ctrKey]  VARCHAR (100) NULL,
    [Matched] CHAR (1)      NULL,
    [credate] DATETIME      CONSTRAINT [DF_SiteLineTblCtr_credate] DEFAULT (getdate()) NULL
);

