CREATE VIEW dbo.[vwDocPayAll(Marty)]
AS
SELECT     dbo.tblCnt.CntNameFirst AS First, dbo.tblCnt.CntNameLast AS Last, dbo.tblCnt.CntNameLast + ', ' + dbo.tblCnt.CntNameFirst AS DocName, 
                      dbo.tblCnt.CntCorpLbrFlxIDEb AS CorpFlxID, dbo.ProviderMaster.LastName, dbo.ProviderMaster.FirstName, dbo.ProviderMaster.CeridianFlxID, 
                      dbo.ProviderMaster.PartnershipLevel, dbo.ProviderMaster.SSNUnformatted, dbo.ProviderMaster.TaxIDIncorporated, dbo.ProviderMaster.PartnershipLevelCode, 
                      dbo.ProviderMaster.PartnershipLevelDate, dbo.ProviderMaster.EchoPartnershipLevelCode, dbo.ProviderMaster.DateOfHire, dbo.tblCnt.CntSSN, 
                      dbo.tblCnt.CntCorpTaxID, dbo.tblCnt.CntLbrFlxIDEb, dbo.tblDocPay.DocPayLbrFlxIDEb, dbo.tblDocPay.DocPayLbrPayPeriod, dbo.tblDocPay.DocPayLbrTotalHours, 
                      dbo.tblDocPay.DocPayLbrTotalEarnings, dbo.tblDocPay.DocPayLbrSocNumber, dbo.tblDocPay.DocPayLbrEmpName, dbo.tblDocPay.DocPayPaytype, 
                      dbo.tblDocPay.DocPayPaycode, dbo.tblDocPay.DocPaySite, dbo.tblDocPay.DocPayLbrChrgDept, dbo.ProviderMaster.CeridianClockNbr, dbo.tblCnt.CntID, 
                      dbo.ProviderMaster.ProviderMasterID, dbo.tlkpPayCode.PayCodeID, dbo.tlkpPayCode.PayCodeName, dbo.tlkpPayCode.PayCodeDesc, 
                      dbo.tlkpPayCode.PayCodeSitelineClass, dbo.tlkpPayCode.PayCodeCompany, dbo.tlkpPayCode.PayCodeFinStmnt, dbo.tlkpPayCode.PayCodeLawsonGLDept, 
                      dbo.tlkpPayCode.PayCodeLawsonDeptName, dbo.tlkpPayCode.PayCodeSummaryPayType, dbo.tblCmp.CmpName AS SiteName, dbo.tblCtr.Ctr_CtrTypID AS Type, 
                      dbo.tblCtr.CtrKey, dbo.tblCtr.CtrHPID, dbo.tblCtr.CtrPlatinumID, dbo.tblCtr.Ctr_RgnID, dbo.tblStt.SttDate, dbo.tblStt.Stt_CtrID, dbo.tblStt.SttKey, dbo.tblStt.SttPatVisitQty, 
                      dbo.tblStt.SttDocHourQty, dbo.tlkpPayDate.PayDatePeriod, dbo.tlkpPayDate.PayDateChgMonth, dbo.tlkpPayDate.PayDatePayDate, dbo.tlkpPayDate.PayCodePayYear, 
                      dbo.tblRgn.RgnName, dbo.ProviderMaster.WebID, dbo.tlkpPayDate.PayCodeTaxYear, dbo.ProviderMaster.DateOfBirth, dbo.ProviderMaster.EmploymentCategory, 
                      dbo.ProviderMaster.EmploymentCategoryDate, dbo.ProviderMaster.StaffStatus, dbo.ProviderMaster.CurrentStaffFlag, dbo.ProviderMaster.CurrentProviderFlag, 
                      dbo.ProviderMaster.CEPPartnerFlag, dbo.tblDocPay.DocPayLbrFlxID, dbo.tblCtr.CtrDivision, dbo.tblCtr.CtrSysCtrYN, dbo.tblStt.SttPublishYN
FROM         dbo.tblStt RIGHT OUTER JOIN
                      dbo.ProviderMaster RIGHT OUTER JOIN
                      dbo.tblCtr LEFT OUTER JOIN
                      dbo.tblRgn ON dbo.tblCtr.Ctr_RgnID = dbo.tblRgn.RgnID RIGHT OUTER JOIN
                      dbo.tlkpPayDate RIGHT OUTER JOIN
                      dbo.tblDocPay ON dbo.tlkpPayDate.PayDatePeriod = dbo.tblDocPay.DocPayLbrPayPeriod LEFT OUTER JOIN
                      dbo.tblCnt RIGHT OUTER JOIN
                      dbo.wvCntLbrFlxIDebwithCorp ON dbo.tblCnt.CntID = dbo.wvCntLbrFlxIDebwithCorp.CntID ON 
                      dbo.tblDocPay.DocPayLbrFlxIDEb = dbo.wvCntLbrFlxIDebwithCorp.FlxID ON dbo.tblCtr.CtrPlatinumID = dbo.tblDocPay.DocPayLbrChrgDept ON 
                      dbo.ProviderMaster.SiteLineCntID = dbo.tblCnt.CntID LEFT OUTER JOIN
                      dbo.tlkpPayCode ON dbo.tblDocPay.DocPayPaycode = dbo.tlkpPayCode.PayCodeName LEFT OUTER JOIN
                      dbo.tblCmp ON dbo.tblCtr.CtrSite_CmpID = dbo.tblCmp.CmpID ON dbo.tblStt.Stt_CtrID = dbo.tblCtr.CtrID AND dbo.tblStt.SttDate = dbo.tlkpPayDate.PayDateChgMonth

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'old Query of DocPay table, no longer used.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwDocPayAll(Marty)';


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
         Configuration = "(H (1[70] 4) )"
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
         Begin Table = "ProviderMaster (dbo)"
            Begin Extent = 
               Top = 90
               Left = 1788
               Bottom = 249
               Right = 2030
            End
            DisplayFlags = 280
            TopColumn = 33
         End
         Begin Table = "tblCtr (dbo)"
            Begin Extent = 
               Top = 31
               Left = 265
               Bottom = 424
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblRgn (dbo)"
            Begin Extent = 
               Top = 247
               Left = 13
               Bottom = 543
               Right = 177
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpPayDate (dbo)"
            Begin Extent = 
               Top = 126
               Left = 711
               Bottom = 283
               Right = 878
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDocPay (dbo)"
            Begin Extent = 
               Top = 8
               Left = 947
               Bottom = 764
               Right = 1215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCnt (dbo)"
            Begin Extent = 
               Top = 41
               Left = 1547
               Bottom = 188
               Right = 1720
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "wvCntLbrFlxIDebwithCorp (dbo)"
            Begin Extent = 
               Top = 4
               Left = 1274
               Bottom = 91
    ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwDocPayAll(Marty)';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'           Right = 1493
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tlkpPayCode (dbo)"
            Begin Extent = 
               Top = 523
               Left = 1393
               Bottom = 698
               Right = 1598
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCmp (dbo)"
            Begin Extent = 
               Top = 0
               Left = 10
               Bottom = 222
               Right = 182
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblStt (dbo)"
            Begin Extent = 
               Top = 78
               Left = 496
               Bottom = 340
               Right = 682
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2040
         Alias = 1425
         Table = 1935
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwDocPayAll(Marty)';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwDocPayAll(Marty)';

