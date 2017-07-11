
CREATE PROCEDURE [dbo].[usp_AddressConversion] 
	@Address1In  varchar(100), @Address2In varchar(100), @AddressOut varchar(100) OUTPUT,
		@AddressCompareOut varchar(100) OUTPUT
AS

/* 	Author: 	Reetika Singh
	Date:		03/21/2012
	Purpose:	Stored Procedure is called to take an address and convert to
				standard abbreviations and naming conventions
				exec usp_AddressConversion @Address1In, @Address2In,
					@AddressOut OUTPUT, @AddressCompare OUTPUT				
	Revision:

*/

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 
begin
	if  @Address2In != ' ' and @Address2In is not null
		begin
			select @AddressOut = rtrim  (@Address1In) + ' ' + @Address2In
		end

		else
			begin
				select @AddressOut = rtrim  (@Address1In)
			end


	if  substring(@AddressOut,1,1) = '#'
		begin
			select 	@AddressOut = substring(@AddressOut,2,99)
		end

	/* Convert to standard abbreviations and naming conventions */
		/* Avenue */
	select 	@AddressOut 		= replace (@AddressOut, ' Avenue', ' Ave')
	select 	@AddressOut 		= replace (@AddressOut, ' Ave.', ' Ave')

		/* Street/ Saint */
	select 	@AddressOut = replace (@AddressOut, ' Street', ' St')
	select 	@AddressOut = replace (@AddressOut, ' St.', ' St')
	select 	@AddressOut = replace (@AddressOut, ' Saint', ' St')

		/* Road */
	select 	@AddressOut = replace (@AddressOut, ' Road', ' Rd')
	select 	@AddressOut = replace (@AddressOut, ' Rd.', ' Rd')

		/* Lane */
	select 	@AddressOut = replace (@AddressOut, 'Lane', 'Ln')
	select 	@AddressOut = replace (@AddressOut, 'LN.', 'Ln')
	select 	@AddressOut = replace (@AddressOut, ' Lan', ' Ln')

		/* Circle */
	select 	@AddressOut = replace (@AddressOut, 'Circle', 'Cir')
	select 	@AddressOut = replace (@AddressOut, 'Cir.', 'Cir')

		/* Highway */
	select 	@AddressOut = replace (@AddressOut, 'Highway', 'Hwy')
	select 	@AddressOut = replace (@AddressOut, 'HWY.', 'Hwy')

		/* Court */
	select 	@AddressOut = replace (@AddressOut, 'Court', 'Ct')
	select 	@AddressOut = replace (@AddressOut, 'CT.', 'Ct')
	select 	@AddressOut = replace (@AddressOut, 'Crt.', 'Ct')

		/* Drive */
	select 	@AddressOut = replace (@AddressOut, 'Drive', 'Dr')
	select 	@AddressOut = replace (@AddressOut, 'DR.', 'Dr')

		/* Suite */
	select 	@AddressOut = replace (@AddressOut, 'Suite', 'Ste')
	select 	@AddressOut = replace (@AddressOut, 'Ste.', 'Ste')

		/* North */
	select 	@AddressOut = replace (@AddressOut, ' North', ' N')
	select 	@AddressOut = replace (@AddressOut, ' N.', ' N')

		/* South */
	select 	@AddressOut = replace (@AddressOut, ' South', ' S')
	select 	@AddressOut = replace (@AddressOut, ' S.', ' S')
	select 	@AddressOut = replace (@AddressOut, ' So', ' S')

		/* North */
	select 	@AddressOut = replace (@AddressOut, ' East', ' E')
	select 	@AddressOut = replace (@AddressOut, ' E.', ' E')

		/* North */
	select 	@AddressOut = replace (@AddressOut, ' West', ' W')
	select 	@AddressOut = replace (@AddressOut, ' W.', ' W')

		/* PO BOX */
	select 	@AddressOut = replace (@AddressOut, 'P.O. BOX', 'PO Box')
	select 	@AddressOut = replace (@AddressOut, 'POBOX', 'PO Box')
	select 	@AddressOut = replace (@AddressOut, 'P.O.BOX', 'PO Box')
	select 	@AddressOut = replace (@AddressOut, 'P O BOX', 'PO Box')
	select 	@AddressOut = replace (@AddressOut, 'P.O. BOX', 'PO Box')
	select 	@AddressOut = replace (@AddressOut, 'P. O. BOX', 'PO Box')

		/* APT */
	select @AddressOut = replace (@AddressOut, 'Apartment', 'Apt')
	select @AddressOut = replace (@AddressOut, 'APT.', 'Apt')
	select @AddressOut = replace (@AddressOut, 'Number', 'Apt')
	select @AddressOut = replace (@AddressOut, '#', 'Apt ')
	select @AddressOut = replace (@AddressOut, 'Nbr', 'Apt')
	select @AddressOut = replace (@AddressOut, 'Nbr.', 'Apt')
	select @AddressOut = replace (@AddressOut, 'APT APT', 'Apt')
	select @AddressOut = replace (@AddressOut, 'Box APT', 'Apt')
	select @AddressOut = replace (@AddressOut, 'Unit', 'Apt')
	select @AddressOut = replace (@AddressOut, ' PMB', ' Box')
	select @AddressOut = replace (@AddressOut,  'Road' , 'Rd'  )
	select @AddressOut = replace (@AddressOut,  'Place' , 'Pl'  )

		/* Boulevard */
	select 	@AddressOut = replace (@AddressOut, 'Boulevard', 'Blvd')
	select 	@AddressOut = replace (@AddressOut, 'Blvd.', 'Blvd')

		/* Remove Comma */
	select @AddressOut = replace (@AddressOut, ',','')

		/* Remove Apostrophe */
	select @AddressOut = replace (@AddressOut, '''','')

		/* Remove Dash */
	select @AddressOut = replace (@AddressOut, ' - ','')
	select @AddressOut = replace (@AddressOut, ' -',' ')

		/* Remove Slash */
	select @AddressOut = replace (@AddressOut, '/','')

		/* Remove Extra Space */
	select @AddressOut = replace (@AddressOut, '  ',' ')
	select @AddressOut = ltrim (@AddressOut)
		
		/* Strip out data for comparison */
	select 	@AddressCompareOut 	= replace (@AddressOut, ' AVE', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut, ' STE', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut, ' ST', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut, ' RD', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut, ' LN', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut, ' CIR', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut, ' HWY', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut, ' CT', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut, ' DR', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut, ' APT', '')
	select 	@AddressCompareOut 	= replace (@AddressCompareOut,  ' Rd', ''  )

end

SET ANSI_NULLS ON

