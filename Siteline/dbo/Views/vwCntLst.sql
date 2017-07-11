CREATE VIEW dbo.vwCntLst
AS
SELECT DISTINCT 
                      dbo.tblCmp.CmpKey, dbo.tblCmp.CmpCity, dbo.tblCmp.CmpState, dbo.tblCmp.CmpZip, dbo.tblCmp.CmpPhone, dbo.tblCmpCnt.CmpCntRole, 
                      dbo.tblCnt.CntKey, dbo.tblCnt.CntID, dbo.tblCnt.CntLbrFlxIDEb, dbo.tblCnt.CntNameFirst, dbo.tblCnt.CntNameMiddle, dbo.tblCnt.CntNameLast, 
                      dbo.tblCnt.CntAddress1, dbo.tblCnt.CntAddress2, dbo.tblCnt.CntCity, dbo.tblCnt.CntState, dbo.tblCnt.CntZip, dbo.tblCnt.CntCountry, dbo.tblCnt.CntEmail, 
                      dbo.tblCnt.CntPhonePref, dbo.tblCnt.CntPhoneHome, dbo.tblCnt.CntPhoneWork, dbo.tblCnt.CntPhoneExt, dbo.tblCnt.CntPhoneCell, 
                      dbo.tblCnt.CntPhoneAlt, dbo.tblCnt.CntPager, dbo.tblCnt.CntFaxHome, dbo.tblCnt.CntFaxWork, dbo.tblCnt.CntPhoneVoicemail, dbo.tblCnt.CntCALicNo, 
                      dbo.tblCnt.CntDocNo, dbo.tblCnt.CntSSN, dbo.tblCnt.CntDOB, dbo.tblCnt.CntInactiveYN, dbo.tblCnt.CntFlagYN, dbo.tblCnt.CntDocYN, 
                      dbo.tblCnt.CntPAYN, dbo.tblCnt.CntCAMYN, dbo.tblCnt.CntRegDirYN, dbo.tblCnt.CntRegAssYN, dbo.tblCnt.CntRegAssDirYN, dbo.tblCnt.CntMedDirYN, 
                      dbo.tblCnt.CntNurseMgrYN, dbo.tblCnt.CntQIDirYN, dbo.tblCnt.CntAdminYN, dbo.tblCnt.CntDirEd, dbo.tblCnt.CntMAMarketingYN, 
                      dbo.tblCnt.CntLoginName, dbo.tblCnt.CntCorpName, dbo.tblCnt.CntCorpTaxID, dbo.tblCnt.CntCorpLbrFlxIDEb, dbo.tblCnt.Cnt_HonID, dbo.tblCnt.CntTitle, 
                      dbo.tblCnt.CntNameSuffix, dbo.tblCmp.CmpName, dbo.tblCnt.CntLawsonNumber
FROM         dbo.tblCnt LEFT OUTER JOIN
                      dbo.tblCmp RIGHT OUTER JOIN
                      dbo.tblCmpCnt ON dbo.tblCmp.CmpID = dbo.tblCmpCnt.CmpCnt_CmpID ON dbo.tblCnt.CntID = dbo.tblCmpCnt.CmpCnt_CntID

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
         Configuration = "(H (1[44] 4[30] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1[45] 4) )"
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
               Top = 6
               Left = 38
               Bottom = 292
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 41
         End
         Begin Table = "tblCmp (dbo)"
            Begin Extent = 
               Top = 24
               Left = 734
               Bottom = 144
               Right = 963
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmpCnt (dbo)"
            Begin Extent = 
               Top = 7
               Left = 456
               Bottom = 127
               Right = 610
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCntLst';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwCntLst';

