﻿CREATE TABLE [dbo].[tblfrmCtrLst] (
    [CtrID]                         INT            IDENTITY (1, 1) NOT NULL,
    [CtrSite_CmpID]                 INT            NULL,
    [CtrSys_CmpID]                  INT            NULL,
    [CtrTranscript_CmpID]           INT            NULL,
    [CtrBillAgt_CmpID]              INT            NULL,
    [CtrPhyGrp_CmpID]               INT            NULL,
    [CtrMlp_CmpID]                  INT            NULL,
    [CtrBillCmpID]                  INT            NULL,
    [CtrMedDir_CntID]               INT            NULL,
    [CtrCamAssigned_CntID]          INT            NULL,
    [Ctr_CtrTypID]                  NVARCHAR (50)  NULL,
    [Ctr_RgnID]                     INT            NULL,
    [Ctr_MlpRgnID]                  NVARCHAR (50)  NULL,
    [CtrKey]                        NVARCHAR (100) NULL,
    [CtrCtrLnk]                     NTEXT          NULL,
    [CtrHPID]                       INT            NULL,
    [CtrPlatinumID]                 INT            NULL,
    [CtrDateStart]                  DATETIME       NULL,
    [CtrDateEffect]                 DATETIME       NULL,
    [CtrDateRenew]                  DATETIME       NULL,
    [CtrDateEnd]                    DATETIME       NULL,
    [CtrYrQty]                      FLOAT (53)     NULL,
    [CtrSysCtrYN]                   BIT            NULL,
    [CtrAutoRenewYN]                BIT            NULL,
    [CtrEndNoCseYN]                 BIT            NULL,
    [CtrNoCseDayQty]                SMALLINT       NULL,
    [CtrEndCseYN]                   BIT            NULL,
    [CtrCseDayQty]                  SMALLINT       NULL,
    [CtrRemDayQty]                  SMALLINT       NULL,
    [CtrPriorAdjCollWIPAmtDefault]  MONEY          NULL,
    [CtrPriorCollectARDefault]      MONEY          NULL,
    [CtrPriorLoanBalDefault]        MONEY          NULL,
    [CtrStipAmt]                    MONEY          NULL,
    [CtrStipDesc]                   NVARCHAR (30)  NULL,
    [CtrOtherPayAmt]                MONEY          NULL,
    [CtrOtherPayDesc]               NVARCHAR (30)  NULL,
    [CtrEmpPhysPaid]                SMALLINT       NULL,
    [CtrWrkCompPaidYN]              BIT            NULL,
    [CtrCompeteClauseYN]            BIT            NULL,
    [CtrBillRecDayQty]              INT            NULL,
    [CtrBillAgtDateStart]           DATETIME       NULL,
    [CtrMlpDateEffect]              DATETIME       NULL,
    [CtrTrmCtrYN]                   BIT            NULL,
    [CtrPrmBseYN]                   BIT            NULL,
    [CtrRsdAffYN]                   BIT            NULL,
    [CtrElecLogYN]                  BIT            NULL,
    [CtrNrsInitProtoYN]             BIT            NULL,
    [CtrTriageProtoYN]              BIT            NULL,
    [CtrClnPthwyYN]                 BIT            NULL,
    [CtrPrcGdeYN]                   BIT            NULL,
    [CtrComputeAfcYN]               BIT            NULL,
    [CtrElecMedRcdYN]               BIT            NULL,
    [CtrObsvUnitYN]                 BIT            NULL,
    [CtrChstPnYN]                   BIT            NULL,
    [CtrFastTrkYn]                  BIT            NULL,
    [CtrOccMedYN]                   BIT            NULL,
    [CtrHspYN]                      BIT            NULL,
    [CtrMedTracYN]                  BIT            NULL,
    [CtrStatPITpct]                 REAL           NULL,
    [CtrStatRDpct]                  REAL           NULL,
    [CtrStatMDpct]                  REAL           NULL,
    [CtrStatContribpct]             REAL           NULL,
    [CtrBseHour]                    REAL           NULL,
    [CtrBillRate]                   REAL           NULL,
    [CtrIncExpComment]              NTEXT          NULL,
    [CtrSiteOvrHdpct]               REAL           NULL,
    [CtrDateFeeInc]                 DATETIME       NULL,
    [CtrPctInc]                     REAL           NULL,
    [CtrNightPct]                   REAL           NULL,
    [CtrDiffRate]                   REAL           NULL,
    [CtrDiffAmt]                    REAL           NULL,
    [CtrDayRate]                    MONEY          NULL,
    [CtrNightRate]                  MONEY          NULL,
    [CtrBedQty]                     INT            NULL,
    [CtrEmail]                      NVARCHAR (50)  NULL,
    [CtrDateCreate]                 DATETIME       NULL,
    [CtrDateEdit]                   DATETIME       NULL,
    [CtrInactiveYn]                 BIT            NULL,
    [CtrFlagYn]                     BIT            NULL,
    [CtrComment]                    NTEXT          NULL,
    [zPhone]                        NVARCHAR (14)  NULL,
    [zFAX]                          NVARCHAR (14)  NULL,
    [zAddress]                      NVARCHAR (30)  NULL,
    [zCity]                         NVARCHAR (20)  NULL,
    [zState]                        NVARCHAR (2)   NULL,
    [zZip]                          NVARCHAR (10)  NULL,
    [zMedicalDirector_Physician_ID] INT            NULL,
    [zCAMAssigned_ID]               INT            NULL,
    [zPhysicianGroup_ID]            INT            NULL,
    [zSite_ID]                      INT            NULL,
    [Site]                          NVARCHAR (70)  NULL,
    [System]                        NVARCHAR (70)  NULL,
    [PhysicianGroup]                NVARCHAR (70)  NULL,
    [SiteCity]                      NVARCHAR (20)  NULL,
    [SiteState]                     NVARCHAR (2)   NULL,
    [SiteZip]                       NVARCHAR (10)  NULL,
    [Director]                      NVARCHAR (20)  NULL,
    [Admin]                         NVARCHAR (20)  NULL,
    [AdminTitle]                    NVARCHAR (20)  NULL,
    [AdminPhoneWorK]                NVARCHAR (20)  NULL,
    [RgnName]                       NVARCHAR (30)  NULL
);

