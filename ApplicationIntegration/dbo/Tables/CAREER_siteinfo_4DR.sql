CREATE TABLE [dbo].[CAREER_siteinfo_4DR] (
    [id]          INT             NOT NULL,
    [siteCode]    NVARCHAR (50)   NOT NULL,
    [siteName]    NVARCHAR (100)  NULL,
    [siteDesc]    NVARCHAR (4000) NULL,
    [commDesc]    NVARCHAR (4000) NULL,
    [picData]     IMAGE           NULL,
    [Address]     NVARCHAR (300)  NULL,
    [Phone]       VARCHAR (500)   NULL,
    [StartDate]   NVARCHAR (500)  NULL,
    [NumBed]      VARCHAR (1000)  NULL,
    [NumVisit]    VARCHAR (500)   NULL,
    [EDType]      VARCHAR (500)   NULL,
    [NumBedED]    VARCHAR (500)   NULL,
    [lastUpdated] SMALLDATETIME   NULL,
    [NumBedFTK]   VARCHAR (500)   NULL,
    [acuity]      VARCHAR (50)    NULL,
    [Mdir]        VARCHAR (500)   NULL,
    [isTrauma]    VARCHAR (500)   NULL,
    [typ]         VARCHAR (500)   NULL,
    [location]    VARCHAR (500)   NULL,
    [CreDate]     DATETIME        CONSTRAINT [DF_CAREER_siteinfo_4DR_CreDate] DEFAULT (getdate()) NULL
);

