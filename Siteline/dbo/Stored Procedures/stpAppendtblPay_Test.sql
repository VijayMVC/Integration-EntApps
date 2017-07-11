CREATE PROCEDURE dbo.stpAppendtblPay_Test(@MthYrID DateTime)
AS INSERT INTO dbo.tblPay_Test
                      (Pay_CtrID, Pay_CntID, PayMonth, PayPaidAmt, PayHours, PayPayType, PayPayCode, PayPayCodeSummary, PayJobCode, PayJobCodeSummary, 
                      PaySitelineClass, PayProcLevel, PaySource, PayImportDate, PayDistCompany5, PayAccount3, PayAccountUnit)
SELECT     dbo.tblCtr.CtrID, dbo.tblCnt.CntID, @MthYrID AS Expr6, ISNULL(LussierM.MohamedTestFile.Dist_Amt, 0) AS Expr10, 
                      ISNULL(LussierM.MohamedTestFile.Hours, 0) AS Expr9, 
                      CASE PayCodeName WHEN 'OVD' THEN 'O' WHEN 'OVT' THEN 'O' WHEN 'OV7' THEN 'O' ELSE 'R' END AS Expr1, 
                      LussierM.MohamedTestFile.Pay_Code, dbo.tlkpPayCode.PayCodeDesc, LussierM.MohamedTestFile.Job_Code, 
                      dbo.tlkpJobCode.JobCodeJBCDescription, CASE WHEN [PAY_CODE] = '87A' THEN [PayCodeSitelineClass] WHEN LEFT([JobCodeID], 1) 
                      = 'P' THEN [PayCodeSitelineClass] ELSE [JobCodeSitelineClass] END AS Expr2, LussierM.MohamedTestFile.Process_Level, 'Lawson' AS Expr4, 
                      GETDATE() AS Expr5, LussierM.MohamedTestFile.Dist_Company, LussierM.MohamedTestFile.Dst_Account, 
                      LussierM.MohamedTestFile.Dst_Acct_Unit
FROM         LussierM.MohamedTestFile LEFT OUTER JOIN
                      dbo.tlkpJobCode ON LussierM.MohamedTestFile.Job_Code = dbo.tlkpJobCode.JobCodeID LEFT OUTER JOIN
                      dbo.tblCnt ON LussierM.MohamedTestFile.Employee = dbo.tblCnt.CntLawsonNumber LEFT OUTER JOIN
                      dbo.tlkpPayCode ON LussierM.MohamedTestFile.Pay_Code = dbo.tlkpPayCode.PayCodeName LEFT OUTER JOIN
                      dbo.tblCtr ON LussierM.MohamedTestFile.Dst_Acct_Unit = dbo.tblCtr.CtrTIN
WHERE     (LussierM.MohamedTestFile.Job_Code IS NOT NULL)
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
         Configuration = "(H (1[56] 4[19] 2) )"
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
         Begin Table = "MohamedTestFile"
            Begin Extent = 
               Top = 17
               Left = 1126
               Bottom = 335
               Right = 1291
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpJobCode (dbo)"
            Begin Extent = 
               Top = 95
               Left = 1597
               Bottom = 203
               Right = 1790
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt (dbo)"
            Begin Extent = 
               Top = 383
               Left = 338
               Bottom = 491
               Right = 514
            End
            DisplayFlags = 280
            TopColumn = 53
         End
         Begin Table = "tlkpPayCode (dbo)"
            Begin Extent = 
               Top = 78
               Left = 519
               Bottom = 186
               Right = 738
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 176
               Left = 510
               Bottom = 284
               Right = 734
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
         Column = 11790
         Alias = 900
         Table = 2700
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpAppendtblPay_Test';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N' = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpAppendtblPay_Test';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'stpAppendtblPay_Test';

