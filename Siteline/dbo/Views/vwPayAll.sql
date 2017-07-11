CREATE VIEW [dbo].[vwPayAll]
AS
SELECT     TOP (100) PERCENT dbo.vwPayStt.Stt_CtrID, dbo.vwPayStt.CtrKey, dbo.vwPayStt.SttDate, SUM(ISNULL(dbo.vwPaySttDocHourQty.PaySttDocHourQty, 0)) 
                      AS PaySttDocHourQty1, SUM(ISNULL(dbo.vwPaySttDocPaidAmt.PaySttDocPaidAmt, 0)) AS PaySttDocPaidAmt1, 
                      SUM(ISNULL(dbo.vwPaySttMDPaidAmt.PaySttMDPaidAmt, 0)) AS PaySttMDPaidAmt1, SUM(ISNULL(dbo.vwPaySttNonCurrMDPaidAmt.PaySttNonCurrMDPaidAmt, 0)) 
                      AS PaySttNonCurrMDPaidAmt1, SUM(ISNULL(dbo.vwPaySttPACost.PaySttPACost, 0)) AS PaySttPACost1, SUM(ISNULL(dbo.vwPaySttPAHoursQty.PaySttPAHoursQty, 0)) 
                      AS PaySttPAHoursQty1, SUM(ISNULL(dbo.vwPaySttBillSpecScribesAmt.PaySttBillSpecScribesAmt, 0)) AS PaySttBillSpecScribesAmt1, 
                      SUM(ISNULL(dbo.vwPaySttSurplusPayout.PaySttSurplusPayout, 0)) AS PaySttSurplusPayout1, 
                      SUM(ISNULL(dbo.vwPaySttBillSpecSitePersonnelAmt.PaySttBillSpecSitePersonnelAmt, 0)) AS PaySttBillSpecSitePersonnelAmt1, 
                      SUM(ISNULL(dbo.vwPaySttPTCost.PaySttPTPayout, 0)) AS PaySttPTPayout1
FROM         dbo.vwPayStt LEFT OUTER JOIN
                      dbo.vwPaySttBillSpecSitePersonnelAmt ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttBillSpecSitePersonnelAmt.Pay_CtrID AND 
                      dbo.vwPayStt.SttDate = dbo.vwPaySttBillSpecSitePersonnelAmt.PayMonth LEFT OUTER JOIN
                      dbo.vwPaySttPAHoursQty ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttPAHoursQty.Pay_CtrID AND 
                      dbo.vwPayStt.SttDate = dbo.vwPaySttPAHoursQty.PayMonth LEFT OUTER JOIN
                      dbo.vwPaySttPACost ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttPACost.Pay_CtrID AND dbo.vwPayStt.SttDate = dbo.vwPaySttPACost.PayMonth LEFT OUTER JOIN
                      dbo.vwPaySttNonCurrMDPaidAmt ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttNonCurrMDPaidAmt.Pay_CtrID AND 
                      dbo.vwPayStt.SttDate = dbo.vwPaySttNonCurrMDPaidAmt.PayMonth LEFT OUTER JOIN
                      dbo.vwPaySttMDPaidAmt ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttMDPaidAmt.Pay_CtrID AND 
                      dbo.vwPayStt.SttDate = dbo.vwPaySttMDPaidAmt.PayMonth LEFT OUTER JOIN
                      dbo.vwPaySttSurplusPayout ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttSurplusPayout.Pay_CtrID AND 
                      dbo.vwPayStt.SttDate = dbo.vwPaySttSurplusPayout.PayMonth LEFT OUTER JOIN
                      dbo.vwPaySttDocPaidAmt ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttDocPaidAmt.Pay_CtrID AND 
                      dbo.vwPayStt.SttDate = dbo.vwPaySttDocPaidAmt.PayMonth LEFT OUTER JOIN
                      dbo.vwPaySttDocHourQty ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttDocHourQty.Pay_CtrID AND 
                      dbo.vwPayStt.SttDate = dbo.vwPaySttDocHourQty.PayMonth LEFT OUTER JOIN
                      dbo.vwPaySttBillSpecScribesAmt ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttBillSpecScribesAmt.Pay_CtrID AND 
                      dbo.vwPayStt.SttDate = dbo.vwPaySttBillSpecScribesAmt.PayMonth LEFT OUTER JOIN
                      dbo.vwPaySttPTCost ON dbo.vwPayStt.Stt_CtrID = dbo.vwPaySttPTCost.Pay_CtrID and dbo.vwPayStt.SttDate = vwPaySttPTCost.PayMonth 
GROUP BY dbo.vwPayStt.CtrKey, dbo.vwPayStt.SttDate, dbo.vwPayStt.Stt_CtrID
HAVING      (dbo.vwPayStt.SttDate > CONVERT(DATETIME, '2008-09-15 00:00:00', 102))
ORDER BY dbo.vwPayStt.CtrKey, dbo.vwPayStt.SttDate


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
         Configuration = "(H (1[42] 4[32] 2) )"
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
         Begin Table = "vwPayStt (dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 99
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttBillSpecSitePersonnelAmt (dbo)"
            Begin Extent = 
               Top = 175
               Left = 444
               Bottom = 268
               Right = 691
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttPAHoursQty (dbo)"
            Begin Extent = 
               Top = 6
               Left = 243
               Bottom = 99
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttPACost (dbo)"
            Begin Extent = 
               Top = 6
               Left = 468
               Bottom = 99
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttNonCurrMDPaidAmt (dbo)"
            Begin Extent = 
               Top = 6
               Left = 673
               Bottom = 144
               Right = 895
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttMDPaidAmt (dbo)"
            Begin Extent = 
               Top = 6
               Left = 933
               Bottom = 99
               Right = 1115
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttSurplusPayout (dbo)"
            Begin Extent = 
               Top = 6
               L', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwPayAll';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'eft = 1153
               Bottom = 99
               Right = 1350
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttDocPaidAmt (dbo)"
            Begin Extent = 
               Top = 6
               Left = 1388
               Bottom = 99
               Right = 1573
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttDocHourQty (dbo)"
            Begin Extent = 
               Top = 6
               Left = 1611
               Bottom = 99
               Right = 1798
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttBillSpecScribesAmt (dbo)"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 195
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vwPaySttPTCost (dbo)"
            Begin Extent = 
               Top = 144
               Left = 729
               Bottom = 237
               Right = 926
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 7035
         Alias = 2130
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwPayAll';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwPayAll';

