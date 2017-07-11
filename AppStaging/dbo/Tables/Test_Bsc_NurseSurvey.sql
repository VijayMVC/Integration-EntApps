CREATE TABLE [dbo].[Test_Bsc_NurseSurvey] (
    [Region]                                                 NVARCHAR (255) NULL,
    [Site]                                                   NVARCHAR (255) NULL,
    [Nurse Manager]                                          NVARCHAR (255) NULL,
    [SiteLocationID]                                         INT            NULL,
    [Received]                                               NVARCHAR (255) NULL,
    [Overall atmosphere of MD-RN relationships]              FLOAT (53)     NULL,
    [MD awareness of the importance]                         FLOAT (53)     NULL,
    [Nurse awareness of the importance]                      FLOAT (53)     NULL,
    [MD value & respect for nurse input and collaboration? ] FLOAT (53)     NULL,
    [MD Participation and Support]                           FLOAT (53)     NULL,
    [Nurse Participation and Support]                        FLOAT (53)     NULL,
    [Sense of Team]                                          FLOAT (53)     NULL,
    [Strategies to assist your site in improving relations]  VARCHAR (2000) NULL,
    [Additional Comments]                                    VARCHAR (2000) NULL,
    [F14]                                                    FLOAT (53)     NULL,
    [F15]                                                    NVARCHAR (255) NULL
);

