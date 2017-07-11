CREATE VIEW dbo.vwSttMartyNew
AS
SELECT      tblCmp1.CmpName AS Site, tblCmp2.CmpName AS System, tblCmp3.CmpName AS TranscriptCompany, tblCmp4.CmpName AS BillingAgent, 
                        tblCmp5.CmpName AS PhysicianGroup, tblCmp6.CmpName AS MalpracticeCompany, tblCnt1.CntKey AS MedicalDirector, 
                        tblCnt3.CntKey AS RegionalDirector, tblCmp1.CmpCity AS SiteCity, tblCmp1.CmpState AS SiteState, tblCmp1.CmpZip AS SiteZip, 
                        dbo.tblRgn.RgnName AS Region, 
                        dbo.tblStt.SttChartQty + dbo.tblStt.SttChartPostQty + dbo.tblStt.SttChartMissQty + dbo.tblStt.SttChartMiss30Qty AS TotalWip, DATEPART(Year, 
                        dbo.tblStt.SttDate) AS Year, tblCmp1.CmpAddress2, dbo.tblCtr.CtrID, dbo.tblCtr.CtrSite_CmpID, dbo.tblCtr.CtrSys_CmpID, 
                        dbo.tblCtr.CtrTranscript_CmpID, dbo.tblCtr.CtrBillAgt_CmpID, dbo.tblCtr.CtrPhyGrp_CmpID, dbo.tblCtr.CtrMlp_CmpID, dbo.tblCtr.CtrBillCmpIDNum, 
                        dbo.tblCtr.CtrMedDir_CntID, dbo.tblCtr.CtrCamAssigned_CntID, dbo.tblCtr.Ctr_CtrTypID, dbo.tblCtr.Ctr_RgnID, dbo.tblCtr.Ctr_MlpRgnID, 
                        dbo.tblCtr.CtrKey, dbo.tblCtr.CtrHPID, dbo.tblCtr.CtrPlatinumID, dbo.tblCtr.CtrDateStart, dbo.tblCtr.CtrDateEffect, dbo.tblCtr.CtrSysCtrYN, 
                        dbo.tblCtr.CtrSameStoreYN, dbo.tblCtr.CtrAdmissionPct, dbo.tblCtr.CtrTransferPct, dbo.tblCtr.CtrStatPITpct, dbo.tblCtr.CtrStatRDpct, 
                        dbo.tblCtr.CtrStatMDpct, dbo.tblCtr.CtrStatContribpct, dbo.tblCtr.CtrBillRate, dbo.tblCtr.CtrIncExpComment, dbo.tblCtr.CtrSiteOvrHdpct, 
                        dbo.tblCtr.CtrIntRate, dbo.tblCtr.CtrMlpFlatFee, dbo.tblCtr.CtrMplSecondRate, dbo.tblCtr.CtrLclPct, dbo.tblCtr.CtrLclFixedAmt, 
                        dbo.tblCtr.CtrMDIncentivePct, dbo.tblCtr.CtrRDIncentivePct, dbo.tblCtr.CtrSurplusReservePct, dbo.tblCtr.zCtrMPRate, dbo.tblCtr.CtrFastTrackBedQty, 
                        dbo.tblCtr.CtrOtherBedQty, dbo.tblCtr.CtrCriticalCareBedQty, dbo.tblCtr.CtrObservationBedQty, dbo.tblCtr.CtrInactiveYn, 
                        dbo.tblCtr.CtrTraumaDesignation, dbo.tblCtr.CtrFlagYn, dbo.tblCtr.CtrComment, dbo.tblCtr.CtrCEPSurchargePct, dbo.tblCtr.CtrMisc1YN, 
                        dbo.tblCtr.CtrMisc2YN, dbo.tblCtr.CtrMisc3YN, dbo.tblCtr.CtrMisc4YN, dbo.tblCtr.CtrMisc5YN, dbo.tblCtr.CtrPASupportCostPct, dbo.tblCtr.CtrTIN, 
                        dbo.tblCtr.CtrDivision, dbo.tblStt.SttDate, dbo.tblStt.Stt_CtrID, dbo.tblStt.Stt_BdgID, dbo.tblStt.SttID, dbo.tblStt.SttKey, dbo.tblStt.SttAccExpenseAmt, 
                        dbo.tblStt.SttAdmitQty, dbo.tblStt.SttBillFee, dbo.tblStt.SttBillRate, dbo.tblStt.SttBillSpec, dbo.tblStt.SttBillSpecMBSIAmt, 
                        dbo.tblStt.SttBillSpecScribesAmt, dbo.tblStt.SttBillSpecScribesAdjAmt, dbo.tblStt.SttBillSpecSitePersonnelAmt, 
                        dbo.tblStt.SttBillSpecSitePersonnelAdjAmt, dbo.tblStt.SttChartQty, dbo.tblStt.SttChartPostQty, dbo.tblStt.SttChartMissQty, dbo.tblStt.SttChartMiss30Qty, 
                        dbo.tblStt.SttCashARAmt, dbo.tblStt.SttCEPSurchargePct, dbo.tblStt.SttCollectibleARAmt, dbo.tblStt.SttCollectWIP, dbo.tblStt.SttContribPct, 
                        dbo.tblStt.SttCurrLoanBal, dbo.tblStt.SttDocHourQty, dbo.tblStt.SttDocPaidAdjAmt, dbo.tblStt.SttDocPaidAmt, dbo.tblStt.SttDonationAmt, 
                        dbo.tblStt.SttFixedLocalAmt, dbo.tblStt.SttIntRate, dbo.tblStt.SttLclExp, dbo.tblStt.SttLclPct, dbo.tblStt.SttLclVarAmt, dbo.tblStt.SttMDIncentiveAmt, 
                        dbo.tblStt.SttMDIncentivePct, dbo.tblStt.SttMDPaidAmt, dbo.tblStt.SttMDpct, dbo.tblStt.SttMPFlatFeeAmt, dbo.tblStt.SttMPRate, dbo.tblStt.SttMPUCRate, 
                        dbo.tblStt.SttNorAmt, dbo.tblStt.SttOffTop, dbo.tblStt.SttOtherRcpts, dbo.tblStt.SttPAAdjAmt, dbo.tblStt.SttPACost, dbo.tblStt.SttPAhoursQty, 
                        dbo.tblStt.SttPASupportCostPct, dbo.tblStt.SttPatVisitQty, dbo.tblStt.SttPatVisitUCQty, dbo.tblStt.SttPatVisitReturnQty, dbo.tblStt.SttPhysTherVisitQty, 
                        dbo.tblStt.SttPstChgs, dbo.tblStt.SttPTCost, dbo.tblStt.SttPTAdjAmt, dbo.tblStt.SttPTOAccrualRate, dbo.tblStt.SttPtsKeyed, dbo.tblStt.SttRDIncentiveAmt, 
                        dbo.tblStt.SttRDPaidAmt, dbo.tblStt.SttRDpct, dbo.tblStt.SttRefAR, dbo.tblStt.SttSiteOvrHdPct, dbo.tblStt.SttSrpAdjAmt, dbo.tblStt.SttSrpAdjAmtComment, 
                        dbo.tblStt.SttSrpAdjAmtPct, dbo.tblStt.SttStatPITpct, dbo.tblStt.SttStipRcvd, dbo.tblStt.SttSurplusPayout, dbo.tblStt.SttSurplusReserveNote, 
                        dbo.tblStt.SttSurplusReservePct, dbo.tblStt.SttSurplusReserveAmt, dbo.tblStt.SttTargetRate, dbo.tblStt.SttPTOTrueUpAdj, dbo.tblStt.SttInactiveYN, 
                        dbo.tblStt.SttFlagYN, dbo.tblStt.SttAdjCollWIPAmt, dbo.tblStt.SttAvgChgPt, dbo.tblStt.SttBlendedHrs, dbo.tblStt.SttBlendedPtsPerHr, 
                        dbo.tblStt.SttCashExpAmt, dbo.tblStt.SttCashRcptAmt, dbo.tblStt.SttCEPSurchargeAmt, dbo.tblStt.SttCollFeeAmt, dbo.tblStt.SttCollFeeChgAmt, 
                        dbo.tblStt.SttCollPerPtAmt, dbo.tblStt.SttDocEarnedHourAmt, dbo.tblStt.SttDocPaidHourAmt, dbo.tblStt.SttDocPITearnedAmt, dbo.tblStt.SttEndCollectAR, 
                        dbo.tblStt.SttGrossCollAmt, dbo.tblStt.SttIntAmt, dbo.tblStt.SttLclExpPct, dbo.tblStt.SttMDEarnedAmt, dbo.tblStt.SttMDLclAmt, dbo.tblStt.SttMlpAmt, 
                        dbo.tblStt.SttNetAmt, dbo.tblStt.SttNetRevPerPtAmt, dbo.tblStt.SttNonCurrAdjPct, dbo.tblStt.SttPACostPct, dbo.tblStt.SttPAPaidHourAmt, 
                        dbo.tblStt.SttPASupportCostAmt, dbo.tblStt.SttPriorAdjCollWIPAmt, dbo.tblStt.SttPriorCollectAR, dbo.tblStt.SttPriorCollFeeAmt, dbo.tblStt.SttPriorLoanBal,
                         dbo.tblStt.SttPTCostPct, dbo.tblStt.SttPTOAccrual, dbo.tblStt.SttPTOTotalCost, dbo.tblStt.SttPtsPerHr, dbo.tblStt.SttRDEarnedAmt, 
                        dbo.tblStt.SttRDLclAmt, dbo.tblStt.SttSiteNetIncAmt, dbo.tblStt.SttSiteOverheadAmt, dbo.tblStt.SttSurplusDeficitAmt, dbo.tblStt.SttTotalCollAmt, 
                        dbo.tblStt.SttTotalCollPerPt, dbo.tblStt.SttValuationGainLossAmt, dbo.tblStt.SttWIPGainLossAmt, dbo.tblStt.YtdSttPstChgs, dbo.tblStt.YtdBdgPstChgs, 
                        dbo.tblStt.YtdGrossColl, dbo.tblStt.YtdBdgGrossColl, dbo.tblStt.YtdSttTargetRate, dbo.tblStt.YtdBdgTargetRate, dbo.tblStt.YtdStipendsRcvd, 
                        dbo.tblStt.YtdBdgStipendsRcvd, dbo.tblStt.YtdOtherRcpts, dbo.tblStt.YtdBdgOthRcpts, dbo.tblStt.YtdValuationGainLoss, dbo.tblStt.YtdTotalColl, 
                        dbo.tblStt.YtdBdgTotalColl, dbo.tblStt.YtdMalpractice, dbo.tblStt.YtdBdgMalpractice, dbo.tblStt.YtdInterest, dbo.tblStt.YtdBdgInterest, 
                        dbo.tblStt.YtdSttBillFee, dbo.tblStt.YtdBdgBillFee, dbo.tblStt.YtdBillSpec, dbo.tblStt.YtdBdgBillSpec, dbo.tblStt.YtdSttOffTop, dbo.tblStt.YtdBdgOffTop, 
                        dbo.tblStt.YtdSiteOverhead, dbo.tblStt.YtdBdgSiteOverhead, dbo.tblStt.YtdNOR, dbo.tblStt.YtdBdgNOR, dbo.tblStt.YtdNetPctofNOR, 
                        dbo.tblStt.YtdBdgNetPctofNOR, dbo.tblStt.YtdSttDocPaidAmt, dbo.tblStt.YtdSttDocPaidAmtAdj, dbo.tblStt.YtdBdgPITEarned, dbo.tblStt.YtdPITearned, 
                        dbo.tblStt.YtdBdgPITearned2, dbo.tblStt.YtdPITpct, dbo.tblStt.YtdBdgPITPct, dbo.tblStt.YtdSttPACost, dbo.tblStt.YtdBdgPACost, 
                        dbo.tblStt.YtdSttPACostPct, dbo.tblStt.YtdBdgPACostPct, dbo.tblStt.YtdSttPTCost, dbo.tblStt.YtdBdgPTCost, dbo.tblStt.YtdSttPTCostPct, 
                        dbo.tblStt.YtdBdgPTCostPct, dbo.tblStt.YtdSttLclExp, dbo.tblStt.YtdBdgLclExp, dbo.tblStt.YtdSttLclExpPct, dbo.tblStt.YtdBdgLclExpPct, 
                        dbo.tblStt.YtdSttRDPaidAmt, dbo.tblStt.YtdBdgRDearned, dbo.tblStt.YtdRDpct, dbo.tblStt.YtdBdgRDpct, dbo.tblStt.YtdSttMDPaidAmt, 
                        dbo.tblStt.YtdBdgMDearned, dbo.tblStt.YtdMDpct, dbo.tblStt.YtdBdgMDpct, dbo.tblStt.YtdSttNonCurrAdjAmt, dbo.tblStt.YtdNonCurrAdjPct, 
                        dbo.tblStt.YtdSttSrpAdjAmt, dbo.tblStt.YtdSttSrpAdjAmtPct, dbo.tblStt.YtdContribCEP, dbo.tblStt.YtdBdgContribCEP, dbo.tblStt.YtdStatContribPct, 
                        dbo.tblStt.YtdBdgContribPct, dbo.tblStt.YtdSiteNetInc, dbo.tblStt.YtdBdgSiteNetInc, dbo.tblStt.YtdSttPatVisitQty, dbo.tblStt.YTDSttPatVisitUCQty, 
                        dbo.tblStt.YtdBdgPatients, dbo.tblStt.YtdSttAdmitQty, dbo.tblStt.YtdSttPhysTherVisitQty, dbo.tblStt.YtdSttPtsKeyed, dbo.tblStt.YtdSttDocPaidAmtHrly, 
                        dbo.tblStt.YtdDocEarnedHrly, dbo.tblStt.YtdBdgDocEarnedHrly, dbo.tblStt.YtdDocHours, dbo.tblStt.YtdBdgDocHours, dbo.tblStt.YtdPAHours, 
                        dbo.tblStt.YtdBdgPAHours, dbo.tblStt.YtdPAPaidHrly, dbo.tblStt.YtdBdgPAPaidHrly, dbo.tblStt.YtdPtsPerHr, dbo.tblStt.YtdBdgPtsPerHr, 
                        dbo.tblStt.YtdBlendedPtsPerHr, dbo.tblStt.YtdbdgBlendedPtsPerHr, dbo.tblStt.YtdNetRevPerPt, dbo.tblStt.YtdBdgNetRevPerPt, dbo.tblStt.YtdAvgChgPt, 
                        dbo.tblStt.YtdBdgAvgChgPt, dbo.tblStt.YtdCollPerPt, dbo.tblStt.YtdBdgCollPerPt, dbo.tblStt.YtdTotalCollPerPt, dbo.tblStt.YtdWIPGainLoss, 
                        dbo.tblStt.YtdSttDonationAmt, dbo.tblStt.YtdSttAccExpenseAmt, dbo.tblStt.YtdSttFixedLocalAmt, dbo.tblStt.YtdSttLclVarAmt, 
                        dbo.tblStt.YtdSttSurplusPayout, dbo.tblStt.YtdSttNonCurrMDAmt, dbo.tblStt.YtdSttNonCurrRDAmt, dbo.tblStt.YtdSttMDIncentiveAmt, 
                        dbo.tblStt.YtdSttRDIncentiveAmt, dbo.tblStt.YtdSttPAAdjAmt, dbo.tblStt.YtdSttCashARAmt, dbo.tblStt.YtdSttRefArAmt, dbo.tblStt.YtdSttMDEarnedAmt, 
                        dbo.tblStt.YtdSttRDEarnedAmt, dbo.tblStt.YtdSttCollFeeChgAmt, dbo.tblStt.YtdSttMPFlatFeeAmt, dbo.tblStt.YtdSttCEPSurchargeAmt, 
                        dbo.tblStt.YtdBdgCEPRetentionAmt, dbo.tblStt.YtdBdgSiteOvrHdAmt, dbo.tblStt.YtdSttBillSpecMBSIAmt, dbo.tblStt.YtdSttPTAdjAmt, 
                        dbo.tblStt.YtdSttPASupportCostAmt, dbo.tblStt.YtdBdgPASupportCostAmt, dbo.tblStt.YtdSttMDLclAmt, dbo.tblStt.YtdSttRDLclAmt, 
                        dbo.tblStt.YtdBdgDonations, dbo.tblStt.YtdSttPatVisitReturnQty, dbo.tblStt.YTDSttBillSpecScribesAmt, dbo.tblStt.YTDSttBillSpecSitePersonnelAmt, 
                        dbo.tblStt.YTDSttBillSpecScribesAdjAmt, dbo.tblStt.YTDSttBillSpecSitePersonnelAdjAmt, dbo.tblStt.YTDBdgEncounters, dbo.tblStt.YTDSttPTOAccrual, 
                        dbo.tblStt.YTDSttPTOTotalCost, dbo.tblStt.YTDSttPTOTrueUpAdj, tblCnt1.CntLawsonNumber AS LawsonID, dbo.tblCtr.CtrDivision AS Division, 
                        dbo.tblCtr.CtrTIN AS TIN, dbo.tblStt.SttPublishYN, dbo.tblCtr.CtrEDVolume, dbo.tblCtr.CtrBedQty, dbo.tblStt.SttEncounterQty, dbo.tblStt.SttBilledUnitQty, 
                        dbo.tblStt.SttNetRevPerEncounter, dbo.tblStt.SttNetRevPerBilledUnit, dbo.tblStt.SttAvgChgEncounter, dbo.tblStt.SttAvgChgBilledUnit, 
                        dbo.tblStt.SttCollPerEncounter, dbo.tblStt.SttCollPerBilledUnit, dbo.tblStt.SttTotalCollAmtPerEncounter, dbo.tblStt.SttTotalCollAmtperBilledUnit, 
                        dbo.tblStt.YTDSttEncounterQty, dbo.tblStt.YTDSttBilledUnitQty, dbo.tblStt.YTDSttNetRevPerEncounter, dbo.tblStt.YTDSttNetRevPerBilledUnit, 
                        dbo.tblStt.YTDSttAvgChgEncounter, dbo.tblStt.YTDSttAvgChgBilledUnit, dbo.tblStt.YTDSttCollPerEncounter, dbo.tblStt.YTDSttCollPerBilledUnit, 
                        dbo.tblStt.YTDSttTotalCollAmtPerEncounter, dbo.tblStt.YTDSttTotalCollAmtperBilledUnit, dbo.tblStt.SttRDIncentivePct
FROM          dbo.tblStt INNER JOIN
                        dbo.tblCmp tblCmp1 INNER JOIN
                        dbo.tblCtr ON tblCmp1.CmpID = dbo.tblCtr.CtrSite_CmpID ON dbo.tblStt.Stt_CtrID = dbo.tblCtr.CtrID LEFT OUTER JOIN
                        dbo.tblRgn LEFT OUTER JOIN
                        dbo.tblCnt tblCnt3 ON dbo.tblRgn.RgnDir_CntID = tblCnt3.CntID ON dbo.tblCtr.Ctr_RgnID = dbo.tblRgn.RgnID LEFT OUTER JOIN
                        dbo.tblCnt tblCnt1 ON dbo.tblCtr.CtrMedDir_CntID = tblCnt1.CntID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp6 ON dbo.tblCtr.CtrMlp_CmpID = tblCmp6.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp5 ON dbo.tblCtr.CtrPhyGrp_CmpID = tblCmp5.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp4 ON dbo.tblCtr.CtrBillAgt_CmpID = tblCmp4.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp3 ON dbo.tblCtr.CtrTranscript_CmpID = tblCmp3.CmpID LEFT OUTER JOIN
                        dbo.tblCmp tblCmp2 ON dbo.tblCtr.CtrSys_CmpID = tblCmp2.CmpID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[89] 4) )"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -19
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblStt (dbo)"
            Begin Extent = 
               Top = 18
               Left = 1229
               Bottom = 757
               Right = 1469
            End
            DisplayFlags = 280
            TopColumn = 247
         End
         Begin Table = "tblCmp1"
            Begin Extent = 
               Top = 59
               Left = 23
               Bottom = 167
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 23
               Left = 368
               Bottom = 711
               Right = 625
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 490
               Left = 720
               Bottom = 650
               Right = 909
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt3"
            Begin Extent = 
               Top = 316
               Left = 709
               Bottom = 484
               Right = 918
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt1"
            Begin Extent = 
               Top = 110
               Left = 706
               Bottom = 309
               Right = 925
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp6"
            Begin Extent = 
               Top = 635
               Left = 14
               Bottom = 762
               Right = 243
            End
         ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwSttMartyNew';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'   DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp5"
            Begin Extent = 
               Top = 515
               Left = 19
               Bottom = 623
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp4"
            Begin Extent = 
               Top = 403
               Left = 18
               Bottom = 511
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp3"
            Begin Extent = 
               Top = 289
               Left = 24
               Bottom = 397
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp2"
            Begin Extent = 
               Top = 173
               Left = 23
               Bottom = 281
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwSttMartyNew';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwSttMartyNew';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwSttMartyNew';

