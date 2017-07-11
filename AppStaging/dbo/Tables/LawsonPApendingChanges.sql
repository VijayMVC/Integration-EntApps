CREATE TABLE [dbo].[LawsonPApendingChanges] (
    [provider_action] VARCHAR (100) NULL,
    [effective_date]  DATETIME      NULL,
    [provider_name]   VARCHAR (60)  NULL,
    [lawson_id]       VARCHAR (5)   NULL,
    [pos_level]       VARCHAR (2)   NULL,
    [new_site]        VARCHAR (50)  NULL,
    [new_site_id]     CHAR (4)      NULL,
    [prev_site]       VARCHAR (50)  NULL,
    [prev_site_id]    CHAR (4)      NULL,
    [new_position]    VARCHAR (30)  NULL,
    [prev_position]   VARCHAR (30)  NULL,
    [new_status]      VARCHAR (15)  NULL,
    [prev_status]     VARCHAR (15)  NULL,
    [new_rate]        VARCHAR (15)  NULL,
    [prev_pay_rate]   VARCHAR (15)  NULL,
    [reason_01]       VARCHAR (15)  NULL,
    [reason_02]       VARCHAR (15)  NULL,
    [ben_date_1]      DATETIME      NULL,
    [ben_date_2]      DATETIME      NULL,
    [loadDate]        DATETIME      NULL
);

