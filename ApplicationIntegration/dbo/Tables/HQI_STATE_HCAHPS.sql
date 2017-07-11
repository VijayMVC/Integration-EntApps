CREATE TABLE [dbo].[HQI_STATE_HCAHPS] (
    [State]                     NVARCHAR (50)  NULL,
    [HCAHPS Question]           NVARCHAR (MAX) NULL,
    [HCAHPS Measure ID]         NVARCHAR (50)  NULL,
    [HCAHPS Answer Description] NVARCHAR (MAX) NULL,
    [HCAHPS Answer Percent]     NVARCHAR (MAX) NULL,
    [Footnote]                  NVARCHAR (MAX) NULL,
    [Measure Start Date]        NVARCHAR (10)  NULL,
    [Measure End Date]          NVARCHAR (10)  NULL
);

