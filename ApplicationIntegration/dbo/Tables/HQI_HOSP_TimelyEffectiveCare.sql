CREATE TABLE [dbo].[HQI_HOSP_TimelyEffectiveCare] (
    [Provider ID]        NVARCHAR (6)   NULL,
    [Hospital Name]      NVARCHAR (MAX) NULL,
    [Condition]          NVARCHAR (35)  NULL,
    [Measure ID]         NVARCHAR (50)  NULL,
    [Measure Name]       NVARCHAR (MAX) NULL,
    [Score]              NVARCHAR (MAX) NULL,
    [Sample]             NVARCHAR (50)  NULL,
    [Footnote]           NVARCHAR (50)  NULL,
    [Measure Start Date] NVARCHAR (10)  NULL,
    [Measure End Date]   NVARCHAR (10)  NULL
);

