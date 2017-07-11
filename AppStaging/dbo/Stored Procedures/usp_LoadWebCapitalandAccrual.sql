CREATE PROCEDURE [dbo].[usp_LoadWebCapitalandAccrual] AS

	DECLARE

	@SumCapBal02		numeric (10,2),
	@SumABal02		numeric (10,2),
	@SumDistMar03	numeric (10,2),
	@SumADistMar03	numeric (10,2),
	@SumCBalMar03	numeric (10,2),
	@SumABalMar03	numeric (10,2),
	@SumNetCont03	numeric (10,2),
	@SumANetCont03	numeric (10,2),
	@SumNetInc03		numeric (10,2),
	@SumANetInc03	numeric (10,2),
	@SumValOther		numeric (10,2),
	@SumOther		numeric (10,2),
	@SumCBalDec02	numeric (10,2),
	@SumABalDec03	numeric (10,2),
	@SumDistMar04	numeric (10,2),
	@SumADistMar04	numeric (10,2),
	@SumBalMar04		numeric (10,2),
	@SumABalMar04	numeric (10,2)

	SET 	@SumCapBal02		=	(Select Sum(CapBal02)	FROM WebCapitalAndAccrualStaging)
	SET 	@SumABal02		=	(Select Sum(ABal02) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumDistMar03	=	(Select Sum(DistMar03) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumADistMar03	=	(Select Sum(ADistMar03) FROM WebCapitalAndAccrualStaging)
	SET 	@SumCBalMar03	=	(Select Sum(CBalMar03) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumABalMar03	=	(Select Sum(ABalMar03) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumNetCont03	=	(Select Sum(NetCont03) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumANetCont03	=	(Select Sum(ANetCont03) FROM WebCapitalAndAccrualStaging)
	SET 	@SumNetInc03		=	(Select Sum(NetInc03) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumANetInc03	=	(Select Sum(ANetInc03) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumValOther		=	(Select Sum(ValOther) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumOther		=	(Select Sum(Other)	FROM WebCapitalAndAccrualStaging)
	SET 	@SumCBalDec02	=	(Select Sum(CBalDec02) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumABalDec03	=	(Select Sum(ABalDec03) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumDistMar04	=	(Select Sum(DistMar04) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumADistMar04	=	(Select Sum(ADistMar04) FROM WebCapitalAndAccrualStaging)
	SET 	@SumBalMar04		=	(Select Sum(BalMar04) 	FROM WebCapitalAndAccrualStaging)
	SET 	@SumABalMar04	=	(Select Sum(ABalMar04) 	FROM WebCapitalAndAccrualStaging)

	UPDATE WebCapitalAndAccrualStaging
	SET 	CapMD1		=	CAPBAL02,
		AccrMD1 		=	ABAL02,
		PeMD1  		=	CAPBAL02+ABAL02,	
	
		CapAOP1  		=	@SumCAPBAL02-(CAPBAL02),
		AccrAOP1  		=	@SumabaL02-abaL02,
		PeAOP1  		=	@SumCAPBAL02-CAPBAL02+@SumABAL02-ABAL02,
		
		CapTAP1 		=	@SumcapBAL02, 
		AccrTAP1 		=	@SumabaL02,
		PeTAP1  		=	@SumcapBAL02+@SumabaL02,
		
		CapMD2  		=	-(DISTMAR03),
		AccrMD2  		=	-ADISTMAR03,
		PeMD2  		=	-(DISTMAR03)-(ADISTMAR03),


		CapAOP2 		=	-(@SumDISTMAR03-DISTMAR03) ,
		AccrAOP2 		=	-(@SumADISTMAR03-ADISTMAR03) ,
		PeAOP2  		=	-(@SumDISTMAR03-DISTMAR03-@SumADISTMAR03
						-ADISTMAR03),


		CapTAP2  		=	-(@SumDISTMAR03),
		AccrTAP2  		=	-(@SumADISTMAR03),
		PeTAP2  		=	-(@SumDISTMAR03+@SumADISTMAR03),


		CapMD3  		=	CBALMAR03,
		AccrMD3 		=	ABALMAR03 ,
		PeMD3  		=	CBALMAR03+ABALMAR03,
		

		CapAOP3  	=	@SumCBALMAR03-CBALMAR03,
		AccrAOP3 	=	@SumABALMAR03-ABALMAR03 ,
		PeAOP3  	=	@SumCBALMAR03-CBALMAR03+@SumABALMAR03-ABALMAR03,
		

		CapTAP3  	=	@SumCBALMAR03,
		AccrTAP3 	=	@SumABALMAR03,
		PeTAP3 		=	@SumCBALMAR03+@SumABALMAR03,


		CapMD4  	=	NETCONT03,
		AccrMD4 	=	ANETCONT03 ,
		PeMD4  		=	NETCONT03+ANETCONT03,
		

		CapAOP4  	=	@SumNETCONT03-NETCONT03,
		AccrAOP4  	=	(@SumANETCONT03-ANETCONT03),
		PeAOP4  	=	@SumnetconT03-netcont03+(@SumANETCONT03-ANETCONT03),
		

		CapTAP4  	=	@SumNETCONT03,
		AccrTAP4  	=	(@SumANETCONT03),
		PeTAP4  	=	@SumNETCONT03+@SumANETCONT03,


		CapMD5  	=	NETINC03,
		AccrMD5  	=	ANETINC03,
		PeMD5  		=	(NETINC03+ANETINC03),
		

		CapAOP5  	=	@SumNETINC03-NETINC03,
		AccrAOP5  	=	@SumANETINC03-ANETINC03,
		PeAOP5  	=	@SumNETINC03-NETINC03+@SumANETINC03-ANETINC03,
		

		CapTAP5  	=	@SumNETINC03,
		AccrTAP5  	=	@SumANETINC03,
		PeTAP5  	=	@SumNETINC03+@SumANETINC03,
		

		CapMD6  	=	VALOTHER,
		AccrMD6  	=	OTHER,
		PeMD6  		=	(VALOTHER+OTHER),
		

		CapAOP6  	=	(@SumVALOTHER-VALOTHER),
		AccrAOP6  	=	(@SumOTHER-OTHER),
		PeAOP6  	=	(@Sumvalother-valother+@Sumother-other),
	
	
		CapTAP6  	=	(@SumVALOTHER),
		AccrTAP6  	=	(@SumOTHER),
		PeTAP6  	=	(@SumVALOTHER+@SumOTHER),
		

		CapMD7  	=	CBALDEC02,
		AccrMD7  	=	ABALDEC03,
		PeMD7  		=	(CBALDEC02+ABALDEC03),
	
	
		CapAOP7  	=	@SumCBALDEC02-CBALDEC02,
		AccrAOP7  	=	@SumABALDEC03-ABALDEC03,
		PeAOP7  	=	@SumCBALDEC02-CBALDEC02+@SumABALDEC03-ABALDEC03,
	
	
		CapTAP7  	=	@SumCBALDEC02,
		AccrTAP7  	=	@SumABALDEC03,
		PeTAP7  	=	@SumCBALDEC02+@SumABALDEC03,
	
	
		CapMD8  	=	DISTMAR04,
		AccrMD8  	=	ADISTMAR04,
		PeMD8  		=	(DISTMAR04+ADISTMAR04),
	
	
		CapAOP8  	=	(@SumDISTMAR04-DISTMAR04),
		AccrAOP8  	=	(@SumADISTMAR04-ADISTMAR04),
		PeAOP8  	=	(@SumDISTMAR04-DISTMAR04+@SumADISTMAR04
						-ADISTMAR04),
	
	
		CapTAP8  	=	(@SumDISTMAR04),
		AccrTAP8  	=	(@SumADISTMAR04),
		PeTAP8 		=	(@SumDISTMAR04+@SumADISTMAR04),


		CapMD9  	=	BALMAR04,
		AccrMD9  	=	ABALMAR04,
		PeMD9  		=	(BALMAR04+ABALMAR04),
	
	
		CapAOP9  	=	@SumBALMAR04-BALMAR04,
		AccrAOP9  	=	@SumABALMAR04-ABALMAR04,
		PeAOP9  	=	@SumBALMAR04-BALMAR04+@SumABALMAR04-ABALMAR04,
	
	
		CapTAP9  	=	@SumBALMAR04,
		AccrTAP9  	=	@SumABALMAR04,
		PeTAP9		=	@SumBALMAR04+@SumABALMAR04
