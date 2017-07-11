CREATE PROCEDURE dbo.stpfrmDocsLawsonNotProviderMaster
AS SELECT DISTINCT 
                      dbo.tblCnt.CntKey, dbo.tblCnt.CntID, dbo.tblCnt.CntTitle, dbo.tblCnt.CntDocYN, dbo.tblCnt.CntPAYN, MIN(dbo.tblPay.PayImportDate) AS FirstRecord, 
                      MAX(dbo.tblPay.PayImportDate) AS LastRecord, COUNT(DISTINCT dbo.tblPay.PayID) AS Records
FROM         dbo.tblCnt INNER JOIN
                      dbo.tblPay ON dbo.tblCnt.CntID = dbo.tblPay.Pay_CntID LEFT OUTER JOIN
                      dbo.ProviderMaster ON dbo.tblPay.Pay_CntID = dbo.ProviderMaster.SiteLineCntID
WHERE     (dbo.ProviderMaster.ProviderMasterID IS NULL) AND (NOT (dbo.tblPay.Pay_CntID = 5976))
GROUP BY dbo.tblCnt.CntKey, dbo.tblCnt.CntID, dbo.tblCnt.CntTitle, dbo.tblCnt.CntDocYN, dbo.tblCnt.CntPAYN
HAVING      (dbo.tblCnt.CntKey IS NOT NULL)
ORDER BY dbo.tblCnt.CntKey
GO
EXECUTE sp_addextendedproperty @name = N'MS_DefaultView', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpfrmDocsLawsonNotProviderMaster';


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
         Configuration = "(H (1[56] 4[18] 2) )"
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
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCnt (dbo)"
            Begin Extent = 
               Top = 51
               Left = 828
               Bottom = 346
               Right = 1004
            End
            DisplayFlags = 280
            TopColumn = 41
         End
         Begin Table = "tblPay (dbo)"
            Begin Extent = 
               Top = 40
               Left = 443
               Bottom = 343
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProviderMaster (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 316
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3945
         Alias = 1500
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpfrmDocsLawsonNotProviderMaster';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpfrmDocsLawsonNotProviderMaster';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Filter', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpfrmDocsLawsonNotProviderMaster';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderBy', @value = NULL, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpfrmDocsLawsonNotProviderMaster';


GO
EXECUTE sp_addextendedproperty @name = N'MS_OrderByOn', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpfrmDocsLawsonNotProviderMaster';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Orientation', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpfrmDocsLawsonNotProviderMaster';


GO
EXECUTE sp_addextendedproperty @name = N'MS_TableMaxRecords', @value = 0, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpfrmDocsLawsonNotProviderMaster';

