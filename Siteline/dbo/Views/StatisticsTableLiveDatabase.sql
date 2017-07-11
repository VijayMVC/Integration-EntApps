CREATE VIEW dbo.StatisticsTableLiveDatabase
AS
SELECT     dbo.tblCtr.CtrPlatinumID AS PlatinumID, dbo.tblCtr.CtrBillCmpIDNum AS MBSINumber, tblCmp1.CmpName AS SiteName, dbo.tblCtr.CtrHPID AS HIPID, 
                      dbo.tblCtr.CtrTIN AS TIN, dbo.tblStt.SttDate, dbo.tblStt.SttAccExpenseAmt, dbo.tblStt.SttAdmitQty, dbo.tblStt.SttBillFee, dbo.tblStt.SttBillRate, dbo.tblStt.SttBillSpec, 
                      dbo.tblStt.SttBillSpecMBSIAmt, dbo.tblStt.SttBillSpecScribesAmt, dbo.tblStt.SttBillSpecScribesAdjAmt, dbo.tblStt.SttBillSpecSitePersonnelAmt, 
                      dbo.tblStt.SttBillSpecSitePersonnelAdjAmt, dbo.tblStt.SttBseHour, dbo.tblStt.SttChartQty, dbo.tblStt.SttChartPostQty, dbo.tblStt.SttChartMissQty, 
                      dbo.tblStt.SttChartMiss30Qty, dbo.tblStt.SttCashARAmt, dbo.tblStt.SttCEPSurchargePct, dbo.tblStt.SttCollectibleARAmt, dbo.tblStt.SttCollectWIP, dbo.tblStt.SttContribPct, 
                      dbo.tblStt.SttCurrLoanBal, dbo.tblStt.SttDiffAmt, dbo.tblStt.SttDiffRate, dbo.tblStt.SttDocHourQty, dbo.tblStt.SttDocPaidAdjAmt, dbo.tblStt.SttDocPaidAmt, 
                      dbo.tblStt.SttDonationAmt, dbo.tblStt.SttFixedLocalAmt, dbo.tblStt.SttIntRate, dbo.tblStt.SttLclExp, dbo.tblStt.SttLclPct, dbo.tblStt.SttLclVarAmt, 
                      dbo.tblStt.SttMDIncentiveAmt, dbo.tblStt.SttMDIncentivePct, dbo.tblStt.SttMDPaidAmt, dbo.tblStt.SttMDpct, dbo.tblStt.SttMPFlatFeeAmt, dbo.tblStt.SttMPRate, 
                      dbo.tblStt.SttMPUCRate, dbo.tblStt.SttNightPct, dbo.tblStt.SttNonCurrAdjAmt, dbo.tblStt.SttNonCurrMDAmt, dbo.tblStt.SttNonCurrRDAmt, dbo.tblStt.SttNorAmt, 
                      dbo.tblStt.SttOffTop, dbo.tblStt.SttOtherRcpts, dbo.tblStt.SttPAAdjAmt, dbo.tblStt.SttPACost, dbo.tblStt.SttPAhoursQty, dbo.tblStt.SttPASupportCostPct, 
                      dbo.tblStt.SttPatVisitQty, dbo.tblStt.SttPatVisitUCQty, dbo.tblStt.SttPatVisitReturnQty, dbo.tblStt.SttPhysTherVisitQty, dbo.tblStt.SttPstChgs, dbo.tblStt.SttPTCost, 
                      dbo.tblStt.SttPTAdjAmt, dbo.tblStt.SttPtsKeyed, dbo.tblStt.SttRDIncentiveAmt, dbo.tblStt.SttRDIncentivePct, dbo.tblStt.SttRDPaidAmt, dbo.tblStt.SttRDpct, 
                      dbo.tblStt.SttRefAR, dbo.tblStt.SttSiteOvrHdPct, dbo.tblStt.SttSrpAdjAmt, dbo.tblStt.SttSrpAdjAmtComment, dbo.tblStt.SttSrpAdjAmtPct, dbo.tblStt.SttStatPITpct, 
                      dbo.tblStt.SttStipRcvd, dbo.tblStt.SttSurplusPayout, dbo.tblStt.SttSurplusReserveNote, dbo.tblStt.SttSurplusReservePct, dbo.tblStt.SttSurplusReserveAmt, 
                      dbo.tblStt.SttTargetRate, dbo.tblStt.SttCommentOther, dbo.tblStt.SttUnspecifiedComment, dbo.tblStt.SttValuationGainLossComment, 
                      dbo.tblStt.SttWIPGainLossComment, dbo.tblStt.SttCommentInternal, dbo.tblStt.SttAdjCollWIPAmt, dbo.tblStt.SttAvgChgPt, dbo.tblStt.SttBlendedHrs, 
                      dbo.tblStt.SttBlendedPtsPerHr, dbo.tblStt.SttCashExpAmt, dbo.tblStt.SttCashRcptAmt, dbo.tblStt.SttCEPSurchargeAmt, dbo.tblStt.SttCollFeeAmt, 
                      dbo.tblStt.SttCollFeeChgAmt, dbo.tblStt.SttCollPerPtAmt, dbo.tblStt.SttCompPITpct, dbo.tblStt.SttCompMDpct, dbo.tblStt.SttCompRDpct, dbo.tblStt.SttContribCEPAmt, 
                      dbo.tblStt.SttDayRate, dbo.tblStt.SttDocEarnedHourAmt, dbo.tblStt.SttDocPaidHourAmt, dbo.tblStt.SttDocPITearnedAmt, dbo.tblStt.SttEndCollectAR, 
                      dbo.tblStt.SttGrossCollAmt, dbo.tblStt.SttIntAmt, dbo.tblStt.SttLclExpPct, dbo.tblStt.SttMDEarnedAmt, dbo.tblStt.SttMDLclAmt, dbo.tblStt.SttMlpAmt, dbo.tblStt.SttNetAmt, 
                      dbo.tblStt.SttNetChangeinARAmt, dbo.tblStt.SttNetPctofNOR, dbo.tblStt.SttNetRevPerPtAmt, dbo.tblStt.SttNightRate, dbo.tblStt.SttNonCurrAdjPct, dbo.tblStt.SttPACostPct, 
                      dbo.tblStt.SttPAPaidHourAmt, dbo.tblStt.SttPASupportCostAmt, dbo.tblStt.SttPriorAdjCollWIPAmt, dbo.tblStt.SttPriorCollectAR, dbo.tblStt.SttPriorCollFeeAmt, 
                      dbo.tblStt.SttPriorLoanBal, dbo.tblStt.SttPTCostPct, dbo.tblStt.SttPtsPerHr, dbo.tblStt.SttRDEarnedAmt, dbo.tblStt.SttRDLclAmt, dbo.tblStt.SttSiteNetIncAmt, 
                      dbo.tblStt.SttSiteOverheadAmt, dbo.tblStt.SttSurplusDeficitAmt, dbo.tblStt.SttTotalCollAmt, dbo.tblStt.SttTotalCollPerPt, dbo.tblStt.SttValuationGainLossAmt, 
                      dbo.tblStt.SttWIPGainLossAmt, dbo.tblStt.Stt_CtrID, dbo.tblStt.SttPTOAccrualRate, dbo.tblStt.SttPTOTrueUpAdj, dbo.tblStt.SttPTOAccrual, dbo.tblStt.SttPTOTotalCost, 
                      dbo.tblStt.SttPublishYN, dbo.tblStt.SttEncounterQty, dbo.tblStt.SttBilledUnitQty, dbo.tblStt.SttNetRevPerEncounter, dbo.tblStt.SttNetRevPerBilledUnit, 
                      dbo.tblStt.SttAvgChgEncounter, dbo.tblStt.SttAvgChgBilledUnit, dbo.tblStt.SttCollPerEncounter, dbo.tblStt.SttCollPerBilledUnit, dbo.tblStt.SttTotalCollAmtPerEncounter, 
                      dbo.tblStt.SttTotalCollAmtperBilledUnit
FROM         dbo.tblStt INNER JOIN
                      dbo.tblCmp AS tblCmp1 INNER JOIN
                      dbo.tblCtr ON tblCmp1.CmpID = dbo.tblCtr.CtrSite_CmpID ON dbo.tblStt.Stt_CtrID = dbo.tblCtr.CtrID

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
         Top = -11
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblStt (dbo)"
            Begin Extent = 
               Top = 9
               Left = 155
               Bottom = 487
               Right = 380
            End
            DisplayFlags = 280
            TopColumn = 264
         End
         Begin Table = "tblCmp1"
            Begin Extent = 
               Top = 189
               Left = 471
               Bottom = 297
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 92
               Left = 681
               Bottom = 356
               Right = 905
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
         Column = 7260
         Alias = 1860
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'StatisticsTableLiveDatabase';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'StatisticsTableLiveDatabase';

