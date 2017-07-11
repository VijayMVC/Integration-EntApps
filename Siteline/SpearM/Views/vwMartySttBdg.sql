CREATE VIEW SpearM.vwMartySttBdg
AS
SELECT      dbo.tblBdg.*, dbo.tblStt.*, dbo.tblCmp.CmpName AS SiteName, dbo.tblCtr.*, tblCnt1.CntKey AS RegDir, LEFT(DATENAME(mm, dbo.tblStt.SttDate), 3) 
                        + ' ' + DATENAME(yyyy, dbo.tblStt.SttDate) AS ReportDate, LEFT(DATENAME(mm, dbo.tblStt.SttDate), 3) AS Month, DATENAME(yyyy, dbo.tblStt.SttDate) 
                        AS Year, tblCnt_1.CntKey AS MedDir
FROM          dbo.tblCnt tblCnt1 RIGHT OUTER JOIN
                        dbo.tblRgn ON tblCnt1.CntID = dbo.tblRgn.RgnDir_CntID RIGHT OUTER JOIN
                        dbo.tblCnt tblCnt_1 RIGHT OUTER JOIN
                        dbo.tblBdg INNER JOIN
                        dbo.tblStt ON dbo.tblBdg.BdgID = dbo.tblStt.Stt_BdgID INNER JOIN
                        dbo.tblCtr ON dbo.tblStt.Stt_CtrID = dbo.tblCtr.CtrID INNER JOIN
                        dbo.tblCmp ON dbo.tblCtr.CtrSite_CmpID = dbo.tblCmp.CmpID ON tblCnt_1.CntID = dbo.tblCtr.CtrMedDir_CntID ON 
                        dbo.tblRgn.RgnID = dbo.tblCtr.Ctr_RgnID

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
         Begin Table = "tblCnt1"
            Begin Extent = 
               Top = 282
               Left = 1059
               Bottom = 390
               Right = 1235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 425
               Left = 660
               Bottom = 534
               Right = 836
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt_1"
            Begin Extent = 
               Top = 188
               Left = 659
               Bottom = 384
               Right = 835
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblBdg (dbo)"
            Begin Extent = 
               Top = 349
               Left = 64
               Bottom = 632
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 49
         End
         Begin Table = "tblStt (dbo)"
            Begin Extent = 
               Top = 43
               Left = 79
               Bottom = 295
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 56
               Left = 349
               Bottom = 490
               Right = 543
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp (dbo)"
            Begin Extent = 
               Top = 0
               Left = 661
               Bottom = 163
               Right = 833
            End
  ', @level0type = N'SCHEMA', @level0name = N'SpearM', @level1type = N'VIEW', @level1name = N'vwMartySttBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'          DisplayFlags = 280
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
         Column = 7335
         Alias = 1830
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
', @level0type = N'SCHEMA', @level0name = N'SpearM', @level1type = N'VIEW', @level1name = N'vwMartySttBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'SpearM', @level1type = N'VIEW', @level1name = N'vwMartySttBdg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'SpearM', @level1type = N'VIEW', @level1name = N'vwMartySttBdg';

