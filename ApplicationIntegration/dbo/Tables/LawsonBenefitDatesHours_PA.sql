CREATE TABLE [dbo].[LawsonBenefitDatesHours_PA] (
    [lawson_id]                     INT             NOT NULL,
    [providerMasterID]              INT             NULL,
    [provider_name]                 VARCHAR (46)    NULL,
    [position]                      CHAR (30)       NOT NULL,
    [benefit_date]                  DATETIME        NULL,
    [ninety_day_date]               DATETIME        NULL,
    [eligible_date]                 DATETIME        NULL,
    [Date390Hours]                  DATETIME        NULL,
    [HoursSinceEffectDate]          DECIMAL (10, 2) NULL,
    [HoursAtEligibleDate]           DECIMAL (10, 2) NULL,
    [HoursEffectDateToEligibleDate] DECIMAL (10, 2) NULL,
    [HoursAfterEligibleDate]        DECIMAL (10, 2) NULL,
    [HoursAtQualifyDate]            DECIMAL (10, 2) NULL,
    [HoursAllDates]                 DECIMAL (10, 2) NULL,
    [MaxWorkDate]                   DATETIME        NULL,
    [FirstWorkDate]                 DATETIME        NULL,
    [term_date]                     VARCHAR (30)    NULL,
    [job_code]                      CHAR (9)        NOT NULL,
    [LoadDate]                      DATETIME        NOT NULL
);

