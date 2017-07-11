CREATE TABLE [dbo].[CPAC_questionnaire] (
    [id]             INT          NOT NULL,
    [evalID]         CHAR (10)    NULL,
    [signature]      VARCHAR (50) NULL,
    [date]           VARCHAR (50) NULL,
    [period]         VARCHAR (50) NULL,
    [hospitals]      NCHAR (10)   NULL,
    [societies]      NCHAR (10)   NULL,
    [conduct]        NCHAR (10)   NULL,
    [databank]       NCHAR (10)   NULL,
    [gov_action]     NCHAR (10)   NULL,
    [health]         NCHAR (10)   NULL,
    [insurance]      NCHAR (10)   NULL,
    [claims]         NCHAR (10)   NULL,
    [out_activities] NCHAR (10)   NULL
);

