CREATE TABLE [dbo].[tmpDateInterval] (
    [Id]                INT      IDENTITY (1, 1) NOT NULL,
    [IntervalStartDate] DATETIME NULL,
    [IntervalEndDate]   DATETIME NULL,
    CONSTRAINT [PK_tmpDateInterval] PRIMARY KEY CLUSTERED ([Id] ASC)
);

