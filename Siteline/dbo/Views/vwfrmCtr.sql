CREATE VIEW dbo.vwfrmCtr
AS
SELECT     dbo.tblCmp.CmpAddress1 AS [Company Address 1], dbo.tblCmp.CmpAddress2 AS [Company Address 2], dbo.tblCmp.CmpCity AS City, 
                      dbo.tblCmp.CmpState AS State, dbo.tblCmp.CmpZip AS Zip, dbo.tblCmp.CmpCountry AS Country, dbo.tblCmp.CmpPhone AS Phone, 
                      dbo.tblCmp.CmpFax AS Fax, dbo.tlkpCtrTyp.CtrTypName AS [Contract Type], dbo.tblRgn.RgnName AS Region, tblCnt_1.CntNameLast AS [Regional Dir], 
                      dbo.tblCmp.CmpName AS Site, dbo.tblCnt.CntNameLast AS [Medical Dir], tblCnt_2.CntNameLast AS PMC, dbo.tblCtr.*, dbo.tblCtr.CtrDivision AS Division,
                       dbo.tblCtr.CtrTIN AS [Lawson ID], dbo.tblCtr.CtrBillCmpIDNum AS [Billing ID]
FROM         dbo.tblCnt RIGHT OUTER JOIN
                      dbo.tblCtr ON dbo.tblCnt.CntID = dbo.tblCtr.CtrMedDir_CntID LEFT OUTER JOIN
                      dbo.tblCmp ON dbo.tblCtr.CtrSite_CmpID = dbo.tblCmp.CmpID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt_2 ON dbo.tblCtr.CtrCamAssigned_CntID = tblCnt_2.CntID LEFT OUTER JOIN
                      dbo.tblRgn ON dbo.tblCtr.Ctr_RgnID = dbo.tblRgn.RgnID LEFT OUTER JOIN
                      dbo.tblCnt tblCnt_1 ON dbo.tblRgn.RgnDir_CntID = tblCnt_1.CntID LEFT OUTER JOIN
                      dbo.tlkpCtrTyp ON dbo.tblCtr.Ctr_CtrTypID = dbo.tlkpCtrTyp.CtrTypID

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
         Configuration = "(H (1[65] 4) )"
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
         Begin Table = "tblCnt (dbo)"
            Begin Extent = 
               Top = 2
               Left = 596
               Bottom = 404
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 7
               Left = 258
               Bottom = 526
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp (dbo)"
            Begin Extent = 
               Top = 20
               Left = 36
               Bottom = 510
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt_2"
            Begin Extent = 
               Top = 11
               Left = 879
               Bottom = 126
               Right = 1056
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 401
               Left = 584
               Bottom = 566
               Right = 748
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt_1"
            Begin Extent = 
               Top = 353
               Left = 829
               Bottom = 520
               Right = 1006
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "tlkpCtrTyp (dbo)"
            Begin Extent = 
               Top = 152
               Left = 828
               Bottom = 251
               Right = 980
            End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwfrmCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
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
         Column = 2580
         Alias = 4065
         Table = 2250
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwfrmCtr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwfrmCtr';

