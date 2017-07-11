CREATE VIEW dbo.vwChgCtr
AS
SELECT DISTINCT 
                      dbo.tblChg.ChgSttDate, dbo.tblCtr.CtrID, dbo.tblCtr.CtrSite_CmpID, dbo.tblCtr.CtrSys_CmpID, dbo.tblCtr.CtrTranscript_CmpID, 
                      dbo.tblCtr.CtrBillAgt_CmpID, dbo.tblCtr.CtrMlp_CmpID, dbo.tblCtr.CtrPhyGrp_CmpID, dbo.tblCtr.CtrBillCmpIDNum, dbo.tblCtr.CtrMedDir_CntID, 
                      dbo.tblCtr.CtrCamAssigned_CntID, dbo.tblCtr.Ctr_CtrTypID, dbo.tblCtr.Ctr_RgnID, dbo.tblCtr.CtrKey, dbo.tblCtr.CtrHPID, dbo.tblCtr.CtrPlatinumID, 
                      dbo.tblCtr.CtrDateStart, dbo.tblCtr.CtrDateEffect, dbo.tblCtr.CtrDateRenew, dbo.tblCtr.CtrDateEnd, dbo.tblCtr.CtrYrQty, dbo.tblCtr.CtrSysCtrYN, 
                      dbo.tblCtr.CtrAutoRenewYN, dbo.tblCtr.CtrEndNoCseYN, dbo.tblCtr.CtrNoCseDayQty, dbo.tblCtr.CtrEndCseYN, dbo.tblCtr.CtrCseDayQty, 
                      dbo.tblCtr.CtrPriorCollectARDefault, dbo.tblCtr.CtrPriorAdjCollWIPAmtDefault, dbo.tblCtr.CtrRemDayQty, dbo.tblCtr.CtrPriorCollFeeAmtDefault, 
                      dbo.tblCtr.CtrPriorLoanBalDefault, dbo.tblCtr.CtrStipAmt, dbo.tblCtr.CtrStipDesc, dbo.tblCtr.CtrOtherPayAmt, dbo.tblCtr.CtrOtherPayDesc, 
                      dbo.tblCtr.CtrEmpPhysPaid, dbo.tblCtr.CtrBillRecDayQty, dbo.tblCtr.CtrBillAgtDateStart, dbo.tblCtr.CtrMlpDateEffect, dbo.tblCtr.CtrPainMgmt, 
                      dbo.tblCtr.CtrAdmissionPct, dbo.tblCtr.CtrTransferPct, dbo.tblCtr.CtrEDVolume, dbo.tblCtr.CtrStatPITpct, dbo.tblCtr.CtrStatRDpct, dbo.tblCtr.CtrStatMDpct, 
                      dbo.tblCtr.CtrStatContribpct, dbo.tblCtr.CtrBseHour, dbo.tblCtr.CtrBillRate, dbo.tblCtr.CtrSiteOvrHdpct, dbo.tblCtr.CtrIntRate, dbo.tblCtr.CtrMlpFlatFee, 
                      dbo.tblCtr.CtrMplSecondRate, dbo.tblCtr.CtrLclPct, dbo.tblCtr.CtrMDIncentivePct, dbo.tblCtr.CtrRDIncentivePct, dbo.tblCtr.CtrSurplusReservePct, 
                      dbo.tblCtr.CtrDateFeeInc, dbo.tblCtr.CtrPctInc, dbo.tblCtr.CtrNightPct, dbo.tblCtr.CtrDiffRate, dbo.tblCtr.CtrDiffAmt, dbo.tblCtr.CtrDayRate, 
                      dbo.tblCtr.CtrNightRate, dbo.tblCtr.CtrBedQty, dbo.tblCtr.CtrFastTrackBedQty, dbo.tblCtr.CtrOtherBedQty, dbo.tblCtr.CtrCriticalCareBedQty, 
                      dbo.tblCtr.CtrObservationBedQty, dbo.tblCtr.CtrCEPSurchargePct, dbo.tblCtr.CtrPASupportCostPct
FROM         dbo.tblChg INNER JOIN
                      dbo.tblCtr ON dbo.tblChg.Chg_CtrID = dbo.tblCtr.CtrID

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
         Begin Table = "tblChg (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 99
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 6
               Left = 227
               Bottom = 412
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 94
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwChgCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwChgCtr';

