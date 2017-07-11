CREATE PROCEDURE dbo.stpGetSurplusReserveAmt
(@SttDate smalldatetime,
@CtrID int, @SurplusAmt Money OUTPUT)
AS SELECT @SurplusAmt=SttSurplusReserveAmt
FROM   dbo.tblStt
WHERE (DATEADD(Month, 1, SttDate) = @SttDate) AND (Stt_CtrID = @CtrID)
