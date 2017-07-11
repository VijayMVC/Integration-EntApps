CREATE PROCEDURE dbo.stpAppendNewBudget
AS INSERT INTO dbo.tblBdg
                        (Bdg_CtrID, BdgKey, BdgAvgChgPt, BdgBillFee, BdgBillRate, BdgBillSpec, BdgBlendedHrs, BdgBlendedPtsHr, BdgCEPRetentionAmt, 
                        BdgCEPRetentionPct, BdgCollPerPt, BdgContribCEP, BdgContribPct, BdgDocEarnedHrly, BdgDocHours, BdgDonations, BdgEncounters, 
                        BdgFixedLocalAmt, BdgGrossColl, BdgInterest, BdgInterestRate, BdgLclExp, BdgLclExpPct, BdgLclPct, BdgLclVarAmt, BdgMalpractice, 
                        BdgMDearned, BdgMDpct, BdgMPFlatFeeAmt, BdgMPRate, BdgNetPctofNOR, BdgNetRevPerPt, BdgNOR, BdgOffTop, BdgOthRcpts, BdgPACost, 
                        BdgPACostHr, BdgPACostPct, BdgPAHours, BdgPASupportCostAmt, BdgPASupportCostPct, BdgPatients, BdgPstChgs, BdgPTCost, BdgPITpct, 
                        BdgPITearned, BdgPITEarnedPct, BdgPTCostPct, BdgPtsPerHr, BdgRDearned, BdgRDpct, BdgStipendsRcvd, BdgTargetRate, BdgSiteNetInc, 
                        BdgSiteOverhead, BdgSiteOvrHdAmt, BdgSiteOvrHdPct, BdgTotalColl, BdgFlagYN, BdgInactiveYN, BdgYear)
SELECT      Bdg_CtrID, REPLACE(BdgKey, '2015', '2016') AS Expr1, BdgAvgChgPt, BdgBillFee, BdgBillRate, BdgBillSpec, BdgBlendedHrs, BdgBlendedPtsHr, 
                        BdgCEPRetentionAmt, BdgCEPRetentionPct, BdgCollPerPt, BdgContribCEP, BdgContribPct, BdgDocEarnedHrly, BdgDocHours, BdgDonations, 
                        BdgEncounters, BdgFixedLocalAmt, BdgGrossColl, BdgInterest, BdgInterestRate, BdgLclExp, BdgLclExpPct, BdgLclPct, BdgLclVarAmt, 
                        BdgMalpractice, BdgMDearned, BdgMDpct, BdgMPFlatFeeAmt, BdgMPRate, BdgNetPctofNOR, BdgNetRevPerPt, BdgNOR, BdgOffTop, BdgOthRcpts, 
                        BdgPACost, BdgPACostHr, BdgPACostPct, BdgPAHours, BdgPASupportCostAmt, BdgPASupportCostPct, BdgPatients, BdgPstChgs, BdgPTCost, 
                        BdgPITpct, BdgPITearned, BdgPITEarnedPct, BdgPTCostPct, BdgPtsPerHr, BdgRDearned, BdgRDpct, BdgStipendsRcvd, BdgTargetRate, 
                        BdgSiteNetInc, BdgSiteOverhead, BdgSiteOvrHdAmt, BdgSiteOvrHdPct, BdgTotalColl, BdgFlagYN, BdgInactiveYN, 2016 AS Expr2
FROM          dbo.tblBdg tblBdg_1
WHERE      (BdgYear = 2015)
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
         Configuration = "(H (1[50] 4) )"
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
         Begin Table = "tblBdg_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 244
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
      Begin ColumnWidths = 12
         Column = 5070
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpAppendNewBudget';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpAppendNewBudget';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpAppendNewBudget';

