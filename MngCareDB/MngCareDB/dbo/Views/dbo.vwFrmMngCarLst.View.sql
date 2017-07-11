USE [MngCarDB]
GO
/****** Object:  View [dbo].[vwFrmMngCarLst]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwFrmMngCarLst]
AS
SELECT     TOP (100) PERCENT dbo.tblCtr.CtrKey, dbo.tblCmp.CmpKey AS IPA, dbo.tblMngCar.MngCarID, dbo.tblMngCar.MngCarKey, dbo.tblMngCar.MngCar_CtrID, 
                      dbo.tblMngCar.MngCarIPA_CmpID, dbo.tblMngCar.MngCarBill_CmpID, dbo.tblMngCar.MngCar_CntID, dbo.tblMngCar.MngCar_RatTypID, 
                      dbo.tblMngCar.MngCar_LivTypID, dbo.tblMngCar.MngCar_McCtrTypID, dbo.tblMngCar.MngCar_FeeSchRgnID, dbo.tblMngCar.MngCar_FeeSchYrID, 
                      dbo.tblMngCar.MngCar_MngCarRgnID, dbo.tblMngCar.MngCarPayer_CmpID, dbo.tblMngCar.MngCarOther_CmpID, dbo.tblMngCar.MngCarAppealPDR_CmpID, 
                      dbo.tblMngCar.MngCarContracting_CmpID, dbo.tblMngCar.MngCarBilling_CmpID, dbo.tblMngCar.MngCarOvPayRfnd_CmpID, dbo.tblMngCar.MngCarAlternativeName, 
                      dbo.tblMngCar.MngCarContractType, dbo.tblMngCar.MngCarPHO_CmpID, dbo.tblMngCar.MngCarMSO_CmpID, dbo.tblMngCar.MngCarEffectDate, 
                      dbo.tblMngCar.MngCarUnsignedYN, dbo.tblMngCar.MngCarClientSignDate, dbo.tblMngCar.MngCarIPASignDate, dbo.tblMngCar.MngCarAutoRenewYN, 
                      dbo.tblMngCar.MngCarTerminateDate, dbo.tblMngCar.MngCarRateExpireDate, dbo.tblMngCar.MngCarRenewNoteDaysQty, 
                      dbo.tblMngCar.MngCarTermNoCauseDaysQt, dbo.tblMngCar.MngCarTermWithCauseDaysQty, dbo.tblMngCar.MngCarComment, dbo.tblMngCar.MngCarInactiveYN, 
                      dbo.tblMngCar.MngCarFlagYN, dbo.tblMngCar.MngCarCaseRateLesserYN, dbo.tblMngCar.MngCarPctChargeLesserYN, dbo.tblMngCar.MngCarHoldHarmlessYN, 
                      dbo.tblMngCar.MngCarCMSYN, dbo.tblMngCar.MngCarCPTYN, dbo.tblMngCar.MngCarReimbGuideOtherYN, dbo.tblMngCar.MngCarInPatientRateYN, 
                      dbo.tblMngCar.MngCarUCRateYN, dbo.tblMngCar.MngCarContractURL, dbo.tblMngCar.MngCarAnniversaryDate, dbo.tblMngCar.MngCarCID, dbo.tblMngCar.MngCarTIN, 
                      dbo.tblMngCar.MngCarInPatientRateDesc, dbo.tblMngCar.MngCarUCRateDesc, dbo.tblMngCar.MngCarReciprocityYN, dbo.tblMngCar.MngCarTerminatedYN, 
                      dbo.tblMngCar.MngCarClmSubDayQty, dbo.tblMngCar.MngCarNoticeDate, dbo.tblMngCar.MngCarReviewDate, dbo.tblMngCar.MngCarMedicaidMedicalYN, 
                      dbo.tblMngCar.MngCarAmmendmentDaysQty, dbo.tblMngCar.MngCarMBSIContractID, dbo.tblMngCar.MngCarOvrPay, dbo.tblMngCar.MngCarPymnt, 
                      dbo.tblMngCar.MngCarCoPayYN, dbo.tblMngCar.MngCarPrAthYN, dbo.tblMngCar.MngCarCrdReqYN, dbo.tblMngCar.MngCarDlgCrdYN, 
                      dbo.tblMngCar.MngCarBillingProblemYN, dbo.tblMngCar.MngCarPayerName, dbo.tblMngCar.MngCarPayerEmail, dbo.tblMngCar.MngCarOtherName, 
                      dbo.tblMngCar.MngCarOtherEmail, dbo.tblMngCar.MngCarAppealPDRName, dbo.tblMngCar.MngCarAppealPDREmail, dbo.tblMngCar.MngCarContractingName, 
                      dbo.tblMngCar.MngCarContractingEmail, dbo.tblMngCar.MngCarBillingName, dbo.tblMngCar.MngCarBillingEmail, dbo.tblMngCar.MngCarOvPayRfndName, 
                      dbo.tblMngCar.MngCarOvPayRfndEmail, dbo.tblMngCar.MngCarCntNegDateRange, dbo.tblMngCar.MngCarCntNegAnnualVisits, 
                      dbo.tblMngCar.MngCarCntNegAvgAcuity, dbo.tblMngCar.MngCarCntNegAvgAllowable, dbo.tblMngCar.MngCarCntNegAvgCharges, 
                      dbo.tblMngCar.MngCarCntNegExpReimb, dbo.tblMngCar.MngCarCntNegFinImpact, dbo.tblMngCar.MngCarCntNegLstReviewed, dbo.tblMngCar.MngCarPAReductionYN, 
                      dbo.tblMngCar.MngCarExecutedOnFileYN, dbo.tblMngCar.MngCarContractedYN, dbo.tblMngCar.MngCarApplDsptDays, dbo.tblMngCar.MngCarPayerCmpAddress1, 
                      dbo.tblMngCar.MngCarPayerCmpAddress2, dbo.tblMngCar.MngCarPayerCmpCity, dbo.tblMngCar.MngCarPayerCmpState, dbo.tblMngCar.MngCarPayerCmpZip, 
                      dbo.tblMngCar.MngCarPayerCmpPhone, dbo.tblMngCar.MngCarPayerCmpFax, dbo.tblMngCar.MngCarPayerCntPhone, dbo.tblMngCar.MngCarOtherCmpAddress1, 
                      dbo.tblMngCar.MngCarOtherCmpCity, dbo.tblMngCar.MngCarOtherCmpState, dbo.tblMngCar.MngCarOtherCmpZip, dbo.tblMngCar.MngCarOtherCmpPhone, 
                      dbo.tblMngCar.MngCarOtherCmpFax, dbo.tblMngCar.MngCarOtherCntPhone, dbo.tblMngCar.MngCarAppealPDRCmpAddress1, 
                      dbo.tblMngCar.MngCarAppealPDRCmpCity, dbo.tblMngCar.MngCarAppealPDRCmpState, dbo.tblMngCar.MngCarAppealPDRCmpZip, 
                      dbo.tblMngCar.MngCarAppealPDRCmpPhone, dbo.tblMngCar.MngCarAppealPDRCmpFax, dbo.tblMngCar.MngCarAppealPDRCntPhone, 
                      dbo.tblMngCar.MngCarContractingCmpAddress1, dbo.tblMngCar.MngCarContractingCmpCity, dbo.tblMngCar.MngCarContractingCmpState, 
                      dbo.tblMngCar.MngCarContractingCmpZip, dbo.tblMngCar.MngCarContractingCmpPhone, dbo.tblMngCar.MngCarContractingCmpFax, 
                      dbo.tblMngCar.MngCarContractingCntPhone, dbo.tblMngCar.MngCarBillingCmpAddress1, dbo.tblMngCar.MngCarBillingCmpCity, 
                      dbo.tblMngCar.MngCarBillingCmpState, dbo.tblMngCar.MngCarBillingCmpZip, dbo.tblMngCar.MngCarBillingCmpPhone, dbo.tblMngCar.MngCarBillingCmpFax, 
                      dbo.tblMngCar.MngCarBillingCntPhone, dbo.tblMngCar.MngCarOvPayRfndCmpAddress1, dbo.tblMngCar.MngCarOvPayRfndCmpCity, 
                      dbo.tblMngCar.MngCarOvPayRfndCmpState, dbo.tblMngCar.MngCarOvPayRfndCmpZip, dbo.tblMngCar.MngCarOvPayRfndCmpPhone, 
                      dbo.tblMngCar.MngCarOvPayRfndCmpFax, dbo.tblMngCar.MngCarOvPayRfndCntPhone, dbo.tblMngCar.MngCarSpecialty, tblCmp_1.CmpName AS BillingCompany, 
                      dbo.tblMngCar.MngCarSpecialty2, dbo.tblMngCar.MngCarDBA
FROM         dbo.tblMngCar LEFT OUTER JOIN
                      dbo.tblCmp AS tblCmp_1 ON dbo.tblMngCar.MngCarBill_CmpID = tblCmp_1.CmpID LEFT OUTER JOIN
                      dbo.tblCmp ON dbo.tblMngCar.MngCarIPA_CmpID = dbo.tblCmp.CmpID LEFT OUTER JOIN
                      dbo.tblCtr ON dbo.tblMngCar.MngCar_CtrID = dbo.tblCtr.CtrID
ORDER BY IPA
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
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
      ActivePaneConfig = 1
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblMngCar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 228
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 123
         End
         Begin Table = "tblCmp_1"
            Begin Extent = 
               Top = 126
               Left = 734
               Bottom = 234
               Right = 963
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblCmp"
            Begin Extent = 
               Top = 202
               Left = 351
               Bottom = 310
               Right = 580
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblCtr"
            Begin Extent = 
               Top = 1
               Left = 356
               Bottom = 109
               Right = 580
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
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1965
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1650
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwFrmMngCarLst'
GO
