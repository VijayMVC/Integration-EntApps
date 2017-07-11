CREATE TABLE [dbo].[HQI_HOSP_HCAHPS] (
    [Provider ID]                           NVARCHAR (6)   NOT NULL,
    [Hospital Name]                         NVARCHAR (MAX) NULL,
    [State]                                 NVARCHAR (2)   NULL,
    [HCAHPS Measure ID]                     NVARCHAR (50)  NOT NULL,
    [HCAHPS Question]                       NVARCHAR (MAX) NULL,
    [HCAHPS Answer Description]             NVARCHAR (MAX) NULL,
    [Patient Survey Star Rating]            NVARCHAR (MAX) NULL,
    [Patient Survey Star Rating Footnote]   NVARCHAR (MAX) NULL,
    [HCAHPS Answer Percent]                 NVARCHAR (MAX) NULL,
    [HCAHPS Answer Percent Footnote]        NVARCHAR (MAX) NULL,
    [HCAHPS Linear Mean Value]              NVARCHAR (MAX) NULL,
    [Number of Completed Surveys]           NVARCHAR (MAX) NULL,
    [Number of Completed Surveys Footnote]  NVARCHAR (MAX) NULL,
    [Survey Response Rate Percent]          NVARCHAR (MAX) NULL,
    [Survey Response Rate Percent Footnote] NVARCHAR (MAX) NULL,
    [Measure Start Date]                    NVARCHAR (10)  NULL,
    [Measure End Date]                      NVARCHAR (10)  NULL
);

