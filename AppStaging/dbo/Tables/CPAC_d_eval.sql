CREATE TABLE [dbo].[CPAC_d_eval] (
    [id]                       INT            NOT NULL,
    [evalID]                   CHAR (10)      NULL,
    [mdirID]                   VARCHAR (50)   NOT NULL,
    [clinical_performance]     CHAR (10)      NULL,
    [patient_satisfaction]     CHAR (10)      NULL,
    [risk_management]          CHAR (10)      NULL,
    [local_facility]           CHAR (10)      NULL,
    [fiduciary]                CHAR (10)      NULL,
    [personal_clinical_skills] CHAR (10)      NULL,
    [technical_skills]         CHAR (10)      NULL,
    [professional_comm]        CHAR (10)      NULL,
    [professional_demeanor]    CHAR (10)      NULL,
    [team_skills]              CHAR (10)      NULL,
    [overall_performance]      CHAR (10)      NULL,
    [assessment]               VARCHAR (1000) NULL,
    [suggestion]               VARCHAR (1000) NULL,
    [recommendation]           CHAR (10)      NULL,
    [signature_director]       VARCHAR (100)  NULL,
    [date_director]            VARCHAR (50)   NULL
);

