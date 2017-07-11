CREATE TABLE [dbo].[JOB_REC_Desired_Zone_4DR] (
    [candidateID] INT      NULL,
    [zone_id]     INT      NULL,
    [priority]    INT      NULL,
    [CreDate]     DATETIME CONSTRAINT [DF_JOB_REC_Desired_Zone_4DR_CreDate] DEFAULT (getdate()) NULL
);

