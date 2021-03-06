﻿CREATE TABLE [dbo].[PI_EDIS] (
    [id]                   INT            NOT NULL,
    [site]                 VARCHAR (4)    NOT NULL,
    [StatusEDIS]           CHAR (1)       NOT NULL,
    [HIS_vendor]           VARCHAR (50)   NULL,
    [HIS_prod]             VARCHAR (50)   NULL,
    [HIS_prod_o]           VARCHAR (50)   NULL,
    [ID_vendor]            VARCHAR (50)   NULL,
    [ID_prod]              VARCHAR (50)   NULL,
    [ID_prod_o]            VARCHAR (50)   NULL,
    [ID_version]           VARCHAR (50)   NULL,
    [year_impl]            VARCHAR (50)   NULL,
    [impl_PatTrack]        CHAR (1)       NULL,
    [outcome_PatTrack]     CHAR (1)       NULL,
    [impl_DocuPhy]         CHAR (1)       NULL,
    [outcome_DocuPhy]      CHAR (1)       NULL,
    [impl_DocuNurse]       CHAR (1)       NULL,
    [outcome_DocuNurse]    CHAR (1)       NULL,
    [impl_LabOrder]        CHAR (1)       NULL,
    [outcome_LabOrder]     CHAR (1)       NULL,
    [impl_NurseOrder]      CHAR (1)       NULL,
    [outcome_NurseOrder]   CHAR (1)       NULL,
    [impl_MedOrder]        CHAR (1)       NULL,
    [outcome_MedOrder]     CHAR (1)       NULL,
    [impl_Other]           CHAR (1)       NULL,
    [outcome_other]        CHAR (1)       NULL,
    [impl_LabReport]       CHAR (1)       NULL,
    [outcome_LabReport]    CHAR (1)       NULL,
    [impl_img]             CHAR (1)       NULL,
    [outcome_img]          CHAR (1)       NULL,
    [impl_ECG]             CHAR (1)       NULL,
    [outcome_ECG]          CHAR (1)       NULL,
    [impl_MedList]         CHAR (1)       NULL,
    [outcome_MedList]      CHAR (1)       NULL,
    [impl_discharge]       CHAR (1)       NULL,
    [outcome_discharge]    CHAR (1)       NULL,
    [impl_prescription]    CHAR (1)       NULL,
    [outcome_prescription] CHAR (1)       NULL,
    [impl_scan]            CHAR (1)       NULL,
    [outcome_scan]         CHAR (1)       NULL,
    [App_best]             CHAR (1)       NULL,
    [App_least]            CHAR (1)       NULL,
    [Aspect_prod]          VARCHAR (500)  NULL,
    [Aspect_nonprod]       VARCHAR (500)  NULL,
    [isUseReport]          CHAR (1)       NULL,
    [useReport_comment]    VARCHAR (5000) NULL,
    [useReport_list]       VARCHAR (5000) NULL,
    [isConsultAccess]      CHAR (1)       NULL,
    [isRefPhyAccess]       CHAR (1)       NULL,
    [isWillRecommend]      CHAR (1)       NULL,
    [lastSavedTS]          DATETIME       NULL,
    [lastSavedWebID]       INT            NULL
);

