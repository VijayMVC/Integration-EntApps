CREATE Procedure dbo.stpCnt_DocPay
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@DocPayLbrFlxIDEb int, 
@CntCorpLbrFlxIDEb int,
@DocPayPaytype varchar(100),
@PayDateChgMonth datetime,
@Year int

As
	If @DocPayPaytype = '0'
		IF @PayDateChgMonth = '1/1/1900'
			If  @Year = 0
				SELECT dbo.vwDocPay.* FROM dbo.vwDocPay 
				Where (vwDocPay.DocPayLbrFlxIDEb = @DocPayLbrFlxIDEb OR vwDocPay.DocPayLbrFlxIDEb = @CntCorpLbrFlxIDEb)
				ORDER BY DocPayPaytype,CtrKey,PayDateChgMonth
			Else
				SELECT dbo.vwDocPay.* FROM dbo.vwDocPay 
				Where (vwDocPay.DocPayLbrFlxIDEb = @DocPayLbrFlxIDEb OR vwDocPay.DocPayLbrFlxIDEb = @CntCorpLbrFlxIDEb) AND Year(vwDocPay.PayDateChgMonth) = @Year
				ORDER BY DocPayPaytype,CtrKey,PayDateChgMonth
		Else
			If  @Year = 0
				SELECT dbo.vwDocPay.* FROM dbo.vwDocPay 
				Where (vwDocPay.DocPayLbrFlxIDEb = @DocPayLbrFlxIDEb OR vwDocPay.DocPayLbrFlxIDEb = @CntCorpLbrFlxIDEb) And vwDocPay.PayDateChgMonth = @PayDateChgMonth
				ORDER BY DocPayPaytype,CtrKey,PayDateChgMonth
			Else
				SELECT dbo.vwDocPay.* FROM dbo.vwDocPay 
				Where (vwDocPay.DocPayLbrFlxIDEb = @DocPayLbrFlxIDEb OR vwDocPay.DocPayLbrFlxIDEb = @CntCorpLbrFlxIDEb) And vwDocPay.PayDateChgMonth = @PayDateChgMonth AND Year(vwDocPay.PayDateChgMonth) = @Year
				ORDER BY DocPayPaytype,CtrKey,PayDateChgMonth

	Else
		IF @PayDateChgMonth = '1/1/1900'
			If @Year = 0
				SELECT dbo.vwDocPay.* FROM dbo.vwDocPay 
				Where (vwDocPay.DocPayLbrFlxIDEb = @DocPayLbrFlxIDEb OR vwDocPay.DocPayLbrFlxIDEb = @CntCorpLbrFlxIDEb) And vwDocPay.DocPayPayCode = @DocPayPaytype
				ORDER BY DocPayPaytype,CtrKey,PayDateChgMonth
			Else
				SELECT dbo.vwDocPay.* FROM dbo.vwDocPay 
				Where (vwDocPay.DocPayLbrFlxIDEb = @DocPayLbrFlxIDEb OR vwDocPay.DocPayLbrFlxIDEb = @CntCorpLbrFlxIDEb) And vwDocPay.DocPayPayCode = @DocPayPaytype AND Year(vwDocPay.PayDateChgMonth) = @Year
				ORDER BY DocPayPaytype,CtrKey,PayDateChgMonth
		Else
			If @Year = 0
				SELECT dbo.vwDocPay.* FROM dbo.vwDocPay 
				Where (vwDocPay.DocPayLbrFlxIDEb = @DocPayLbrFlxIDEb OR vwDocPay.DocPayLbrFlxIDEb = @CntCorpLbrFlxIDEb) And vwDocPay.PayDateChgMonth = @PayDateChgMonth And vwDocPay.DocPayPayCode = @DocPayPaytype
				ORDER BY DocPayPaytype,CtrKey,PayDateChgMonth
			Else
				SELECT dbo.vwDocPay.* FROM dbo.vwDocPay 
				Where (vwDocPay.DocPayLbrFlxIDEb = @DocPayLbrFlxIDEb OR vwDocPay.DocPayLbrFlxIDEb = @CntCorpLbrFlxIDEb) And vwDocPay.PayDateChgMonth = @PayDateChgMonth And vwDocPay.DocPayPayCode = @DocPayPaytype AND Year(vwDocPay.PayDateChgMonth) = @Year
				ORDER BY DocPayPaytype,CtrKey,PayDateChgMonth
	return 

