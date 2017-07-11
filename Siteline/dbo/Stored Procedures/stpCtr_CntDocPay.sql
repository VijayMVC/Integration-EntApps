﻿CREATE PROCEDURE dbo.stpCtr_CntDocPay
(@CtrPlatinumID int)
AS 
SELECT DISTINCT 
                      dbo.tblDocPay.DocPayLbrChrgDept AS DocPayLbrChrgDept, dbo.tblCnt.CntNameFirst, dbo.tblCnt.CntNameMiddle, dbo.tblCnt.CntNameLast, 
                      dbo.tblCnt.CntNameSuffix, dbo.tblCnt.CntPhonePref, dbo.tblCnt.CntDateEdit, dbo.tblCnt.CntEmail, dbo.tblCnt.CntID, dbo.tblCnt.CntCorpLbrFlxIDEb, 
                      dbo.tblCnt.CntKey, dbo.tblDocPay.DocPayLbrFlxIDEb
FROM         dbo.tblCnt INNER JOIN
                      dbo.tblDocPay ON dbo.tblCnt.CntLbrFlxIDEb = dbo.tblDocPay.DocPayLbrFlxIDEb
WHERE     (dbo.tblDocPay.DocPayLbrChrgDept = @CtrPlatinumID)


union

SELECT DISTINCT 
                      dbo.tblDocPay.DocPayLbrChrgDept AS DocPayLbrChrgDept, dbo.tblCnt.CntNameFirst, dbo.tblCnt.CntNameMiddle, dbo.tblCnt.CntNameLast, 
                      dbo.tblCnt.CntNameSuffix, dbo.tblCnt.CntPhonePref, dbo.tblCnt.CntDateEdit, dbo.tblCnt.CntEmail, dbo.tblCnt.CntID, dbo.tblCnt.CntCorpLbrFlxIDEb, 
                      dbo.tblCnt.CntKey, dbo.tblDocPay.DocPayLbrFlxIDEb
FROM         dbo.tblCnt INNER JOIN
                      dbo.tblDocPay ON dbo.tblCnt.CntCorpLbrFlxIDEb = dbo.tblDocPay.DocPayLbrFlxIDEb
WHERE     (dbo.tblDocPay.DocPayLbrChrgDept = @CtrPlatinumID)
ORDER BY dbo.tblCnt.CntKey

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
               Top = 6
               Left = 38
               Bottom = 376
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 35
         End
         Begin Table = "tblDocPay (dbo)"
            Begin Extent = 
               Top = 29
               Left = 441
               Bottom = 291
               Right = 642
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpCtr_CntDocPay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpCtr_CntDocPay';

