CREATE VIEW dbo.qryStt
AS
SELECT     dbo.tblCmp.CmpName AS Site, dbo.tblCtr.CtrID, dbo.tblCtr.CtrSite_CmpID, dbo.tblCtr.CtrSys_CmpID, dbo.tblCtr.CtrTranscript_CmpID, dbo.tblCtr.CtrBillAgt_CmpID, 
                      dbo.tblCtr.CtrPhyGrp_CmpID, dbo.tblCtr.CtrMlp_CmpID, dbo.tblCtr.CtrBillCmpIDNum, dbo.tblCtr.CtrMedDir_CntID, dbo.tblCtr.CtrCamAssigned_CntID, 
                      dbo.tblCtr.Ctr_CtrTypID, dbo.tblCtr.Ctr_RgnID, dbo.tblCtr.Ctr_MlpRgnID, dbo.tblCtr.CtrKey, dbo.tblCtr.CtrHPID, dbo.tblCtr.CtrPlatinumID, dbo.tblCtr.CtrDateStart, 
                      dbo.tblCtr.CtrDateEffect, dbo.tblCtr.CtrDateRenew, dbo.tblCtr.CtrDateEnd, dbo.tblCtr.CtrYrQty, dbo.tblCtr.CtrSysCtrYN, dbo.tblCtr.CtrAutoRenewYN, 
                      dbo.tblCtr.CtrEndNoCseYN, dbo.tblCtr.CtrNoCseDayQty, dbo.tblCtr.CtrEndCseYN, dbo.tblCtr.CtrCseDayQty, dbo.tblCtr.CtrRemDayQty, 
                      dbo.tblCtr.CtrPriorAdjCollWIPAmtDefault, dbo.tblCtr.CtrPriorCollectARDefault, dbo.tblCtr.CtrPriorCollFeeAmtDefault, dbo.tblCtr.CtrPriorLoanBalDefault, 
                      dbo.tblCtr.CtrStipAmt, dbo.tblCtr.CtrStipDesc, dbo.tblCtr.CtrOtherPayAmt, dbo.tblCtr.CtrOtherPayDesc, dbo.tblCtr.CtrEmpPhysPaid, dbo.tblCtr.CtrWrkCompPaidYN, 
                      dbo.tblCtr.CtrCompeteClauseYN, dbo.tblCtr.CtrBillRecDayQty, dbo.tblCtr.CtrBillAgtDateStart, dbo.tblCtr.CtrMlpDateEffect, dbo.tblCtr.CtrTrmCtrYN, 
                      dbo.tblCtr.CtrPrmBseYN, dbo.tblCtr.CtrRsdAff, dbo.tblCtr.CtrElecLogYN, dbo.tblCtr.CtrNrsInitProtoYN, dbo.tblCtr.CtrTriageProtoYN, dbo.tblCtr.CtrClnPthwyYN, 
                      dbo.tblCtr.CtrPrcGdeYN, dbo.tblCtr.CtrComputeAfcYN, dbo.tblCtr.CtrElecMedRcdYN, dbo.tblCtr.CtrObsvUnitYN, dbo.tblCtr.CtrChstPnYN, dbo.tblCtr.CtrFastTrkYn, 
                      dbo.tblCtr.CtrOccMedYN, dbo.tblCtr.CtrHspYN, dbo.tblCtr.CtrSameStoreYN, dbo.tblCtr.CtrGoodMethodYN, dbo.tblCtr.CtrChestPainYN, dbo.tblCtr.CtrElectronicTrackYN, 
                      dbo.tblCtr.CtrPainMgmt, dbo.tblCtr.CtrAllowNursesYN, dbo.tblCtr.CtrPhySpecificDataYN, dbo.tblCtr.CtrComplaintMgtPrgYN, dbo.tblCtr.CtrSatisfactionTool, 
                      dbo.tblCtr.CtrSatisfactionTeamYN, dbo.tblCtr.CtrEDVolume, dbo.tblCtr.CtrAdmissionPct, dbo.tblCtr.CtrTransferPct, dbo.tblCtr.CtrStatPITpct, dbo.tblCtr.CtrStatRDpct, 
                      dbo.tblCtr.CtrStatMDpct, dbo.tblCtr.CtrStatContribpct, dbo.tblCtr.CtrBseHour, dbo.tblCtr.CtrBillRate, dbo.tblCtr.CtrIncExpComment, dbo.tblCtr.CtrSiteOvrHdpct, 
                      dbo.tblCtr.CtrIntRate, dbo.tblCtr.CtrMlpFlatFee, dbo.tblCtr.CtrMplSecondRate, dbo.tblCtr.CtrLclPct, dbo.tblCtr.CtrLclFixedAmt, dbo.tblCtr.CtrMDIncentivePct, 
                      dbo.tblCtr.CtrRDIncentivePct, dbo.tblCtr.CtrSurplusReservePct, dbo.tblCtr.zCtrMPRate, dbo.tblCtr.CtrDateFeeInc, dbo.tblCtr.CtrPctInc, dbo.tblCtr.CtrNightPct, 
                      dbo.tblCtr.CtrDiffRate, dbo.tblCtr.CtrDiffAmt, dbo.tblCtr.CtrDayRate, dbo.tblCtr.CtrNightRate, dbo.tblCtr.CtrBedQty, dbo.tblCtr.CtrFastTrackBedQty, 
                      dbo.tblCtr.CtrOtherBedQty, dbo.tblCtr.CtrCriticalCareBedQty, dbo.tblCtr.CtrObservationBedQty, dbo.tblCtr.CtrEmail, dbo.tblCtr.CtrDateCreate, dbo.tblCtr.CtrDateEdit, 
                      dbo.tblCtr.CtrInactiveYn, dbo.tblCtr.CtrTraumaDesignation, dbo.tblCtr.CtrFlagYn, dbo.tblCtr.CtrComment, dbo.tblCtr.CtrRequireMailYN, dbo.tblCtr.CtrCEPSurchargePct, 
                      dbo.tblCtr.CtrMngCarBatchYN, dbo.tblCtr.CtrMisc1YN, dbo.tblCtr.CtrMisc2YN, dbo.tblCtr.CtrMisc3YN, dbo.tblCtr.CtrMisc4YN, dbo.tblCtr.CtrMisc5YN, 
                      dbo.tblCtr.CtrPASupportCostPct, dbo.tblCtr.CtrTIN, dbo.tblCtr.CtrDivision, dbo.tblStt.SttDate, dbo.tblStt.Stt_CtrID, dbo.tblStt.Stt_BdgID, dbo.tblStt.SttKey, 
                      dbo.tblStt.SttLink, dbo.tblStt.SttAdmitQty, dbo.tblStt.SttBillFee, dbo.tblStt.SttBillRate, dbo.tblStt.SttBillSpec, dbo.tblStt.SttBseHour, dbo.tblStt.SttChartQty, 
                      dbo.tblStt.SttChartPostQty, dbo.tblStt.SttChartMissQty, dbo.tblStt.SttChartMiss30Qty, dbo.tblStt.SttCashARAmt, dbo.tblStt.SttCollectibleARAmt, dbo.tblStt.SttCollectWIP, 
                      dbo.tblStt.SttContribPct, dbo.tblStt.SttCurrLoanBal, dbo.tblStt.SttDiffAmt, dbo.tblStt.SttDiffRate, dbo.tblStt.SttDocHourQty, dbo.tblStt.SttDocPaidAdjAmt, 
                      dbo.tblStt.SttDocPaidAmt, dbo.tblStt.SttIntRate, dbo.tblStt.SttLclExp, dbo.tblStt.SttMDPaidAmt, dbo.tblStt.SttMDpct, dbo.tblStt.SttMPRate, dbo.tblStt.SttNightPct, 
                      dbo.tblStt.SttNonCurrAdjAmt, dbo.tblStt.SttNorAmt, dbo.tblStt.SttOffTop, dbo.tblStt.SttOtherRcpts, dbo.tblStt.SttPACost, dbo.tblStt.SttPAhoursQty, dbo.tblStt.SttPatVisitQty, 
                      dbo.tblStt.SttPhysTherVisitQty, dbo.tblStt.SttPstChgs, dbo.tblStt.SttPTCost, dbo.tblStt.SttPtsKeyed, dbo.tblStt.SttRDPaidAmt, dbo.tblStt.SttRDpct, dbo.tblStt.SttRefAR, 
                      dbo.tblStt.SttSiteOvrHdPct, dbo.tblStt.SttSrpAdjAmt, dbo.tblStt.SttSrpAdjAmtComment, dbo.tblStt.SttSrpAdjAmtPct, dbo.tblStt.SttStatPITpct, dbo.tblStt.SttStipRcvd, 
                      dbo.tblStt.SttTargetRate, dbo.tblStt.SttUnspecifiedComment, dbo.tblStt.SttValuationGainLossComment, dbo.tblStt.SttWIPGainLossComment, dbo.tblStt.SttDateCreate, 
                      dbo.tblStt.SttDateEdit, dbo.tblStt.SttInactiveYN, dbo.tblStt.SttFlagYN, dbo.tblStt.SttAdjCollWIPAmt, dbo.tblStt.SttAvgChgPt, dbo.tblStt.SttBlendedHrs, 
                      dbo.tblStt.SttBlendedPtsPerHr, dbo.tblStt.SttCashExpAmt, dbo.tblStt.SttCashRcptAmt, dbo.tblStt.SttCollFeeAmt, dbo.tblStt.SttCollPerPtAmt, dbo.tblStt.SttCompPITpct, 
                      dbo.tblStt.SttCompMDpct, dbo.tblStt.SttCompRDpct, dbo.tblStt.SttContribCEPAmt, dbo.tblStt.SttDayRate, dbo.tblStt.SttDocEarnedHourAmt, dbo.tblStt.SttDocPaidHourAmt, 
                      dbo.tblStt.SttDocPITearnedAmt, dbo.tblStt.SttEndCollectAR, dbo.tblStt.SttGrossCollAmt, dbo.tblStt.SttIntAmt, dbo.tblStt.SttLclExpPct, dbo.tblStt.SttMlpAmt, 
                      dbo.tblStt.SttNetAmt, dbo.tblStt.SttNetChangeinARAmt, dbo.tblStt.SttNetPctofNOR, dbo.tblStt.SttNetRevPerPtAmt, dbo.tblStt.SttNightRate, dbo.tblStt.SttNonCurrAdjPct, 
                      dbo.tblStt.SttPACostPct, dbo.tblStt.SttPAPaidHourAmt, dbo.tblStt.SttPriorAdjCollWIPAmt, dbo.tblStt.SttPriorCollectAR, dbo.tblStt.SttPriorLoanBal, dbo.tblStt.SttPTCostPct, 
                      dbo.tblStt.SttPtsPerHr, dbo.tblStt.SttSiteNetIncAmt, dbo.tblStt.SttSiteOverheadAmt, dbo.tblStt.SttSurplusDeficitAmt, dbo.tblStt.SttTotalCollAmt, 
                      dbo.tblStt.SttTotalCollPerPt, dbo.tblStt.SttValuationGainLossAmt, dbo.tblStt.SttWIPGainLossAmt, dbo.tblStt.SttSurplusPayout, dbo.tblStt.SttPublishYN
FROM         dbo.tblCmp INNER JOIN
                      dbo.tblCtr INNER JOIN
                      dbo.tblStt ON dbo.tblCtr.CtrID = dbo.tblStt.Stt_CtrID ON dbo.tblCmp.CmpID = dbo.tblCtr.CtrSite_CmpID

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
         Configuration = "(H (1[75] 4) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCmp (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblStt (dbo)"
            Begin Extent = 
               Top = 4
               Left = 521
               Bottom = 519
               Right = 970
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'qryStt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'qryStt';

