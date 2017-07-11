USE [MngCarDB]
GO
/****** Object:  StoredProcedure [dbo].[stpUpdateMngCarReviewNotice]    Script Date: 09/08/2016 10:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stpUpdateMngCarReviewNotice]
@MngCarID int
AS 
Declare @Date datetime, @AnniversaryDate DateTime, @PresentDate datetime, @Days int, @NoticeDate dateTime, @ReviewDate datetime, @ReviewDays int, @RenewalYN smallint
SELECT      @Date = CASE WHEN MngCarTerminateDate IS NOT NULL 
                      THEN dbo.tblMngCar.MngCarTerminateDate ELSE CASE WHEN dbo.vwMngCarRateLast.LastRate IS NOT NULL 
                      THEN dbo.vwMngCarRateLast.LastRate ELSE CASE WHEN MngCarAnniversaryDate IS NOT NULL THEN MngCarAnniversaryDate ELSE GetDate() 
                      END END END, @AnniversaryDate =  MngCarAnniversaryDate, @RenewalYN = MngCarAutoRenewYN
FROM         dbo.tblMngCar LEFT OUTER JOIN
                      dbo.vwMngCarRateLast ON dbo.tblMngCar.MngCarIPA_CmpID = dbo.vwMngCarRateLast.MngCarIPA_CmpID AND 
                      dbo.tblMngCar.MngCar_CtrID = dbo.vwMngCarRateLast.MngCar_CtrID AND 
                      dbo.tblMngCar.MngCar_LivTypID = dbo.vwMngCarRateLast.MngCar_LivTypID AND 
                      dbo.tblMngCar.MngCar_McCtrTypID = dbo.vwMngCarRateLast.MngCar_McCtrTypID
Where          MngCarID = @MngCarID
set @Presentdate = getdate()
If @Date < GetDate()
Begin	
set @Date =Convert(DateTime,Cast( Datepart(month,@AnniversaryDate) as Varchar(2)) +  '/' + cast(Datepart(day,@AnniversaryDate)as varchar(2)) + '/' + cast(Datepart(year,@PresentDate) as varchar(4)),102)  
	
	If @Date<Getdate()
		Begin
		Set @Date = DateAdd(yyyy,1,@Date)
		End
End
SELECT      @Days = CASE WHEN MngCarRenewNoteDaysQty <>0 THEN MngCarRenewNoteDaysQty ELSE CASE WHEN MngCarTermNoCauseDaysQt <>0
                       THEN MngCarTermNoCauseDaysQt ELSE 45 END END 
FROM         dbo.tblMngCar
WHERE     (MngCarID = @MngCarID)
Set @Days = @Days +1
Set @ReviewDays = @Days+45
Select @NoticeDate =  DATEADD(Day, - (@Days), @Date),@ReviewDate =  DATEADD(Day, - (@ReviewDays), @Date)
FROM         dbo.tblMngCar
WHERE     (MngCarID = @MngCarID)
If Datediff(Day,GetDate(),@NoticeDate) < @Days
	Begin
	set @NoticeDate = DateAdd(Year,1,@NoticeDate)
	set @ReviewDate = DateAdd(Year,1,@ReviewDate)
	End
If isdate(@NoticeDate) =1
	select @NoticeDate = @NoticeDate
Else
	select @NoticeDate = dateadd(Day,-1,@NoticeDate)
If isdate(@ReviewDate) =1
	select @ReviewDate = @ReviewDate
Else
	select @ReviewDate = dateadd(Day,-1,@ReviewDate)
UPDATE    dbo.tblMngCar
SET              MngCarNoticeDate = @NoticeDate , MngCarReviewDate = @ReviewDate
WHERE     (MngCarID = @MngCarID)
Return
GO
