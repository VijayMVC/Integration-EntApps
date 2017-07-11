CREATE VIEW dbo.qryContractInfo
AS
SELECT     tblSites.CmpName AS Site, tblSites.CmpCity AS SiteCity, tblSites.CmpState AS SiteState, tblSites.CmpZip AS SiteZip, tblRegion.RgnName AS Region, 
                      tblSites.CmpAddress1 AS SiteAddress1, tblSites.CmpPhone AS SitePhone, tblSites.CmpFax AS SiteFax, tblContracts.CtrPlatinumID AS ID, 
                      tblContracts.CtrKey AS LongName, tblContracts.CtrInactiveYn AS Inactive, tblContracts.CtrMisc1YN, tblContracts.CtrMisc2YN, 
                      tblContracts.CtrMisc3YN AS LargeSite, tblContracts.CtrMisc4YN AS MediumSite, tblContracts.CtrMisc5YN AS SmallSite, 
                      tblContracts.CtrSameStoreYN AS SameStore, tblContracts.CtrSysCtrYN AS CurrentContract, tblSites.CmpSiteYN
FROM         dbo.tblRgn tblRegion RIGHT OUTER JOIN
                      dbo.tblCtr tblContracts ON tblRegion.RgnID = tblContracts.Ctr_RgnID RIGHT OUTER JOIN
                      dbo.tblCmp tblSites ON tblContracts.CtrSite_CmpID = tblSites.CmpID
WHERE     (tblSites.CmpSiteYN = 1)

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
         Begin Table = "tblRegion"
            Begin Extent = 
               Top = 54
               Left = 863
               Bottom = 290
               Right = 1026
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblContracts"
            Begin Extent = 
               Top = 0
               Left = 500
               Bottom = 703
               Right = 823
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblSites"
            Begin Extent = 
               Top = 5
               Left = 68
               Bottom = 597
               Right = 358
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
         Alias = 1515
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'qryContractInfo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'qryContractInfo';

