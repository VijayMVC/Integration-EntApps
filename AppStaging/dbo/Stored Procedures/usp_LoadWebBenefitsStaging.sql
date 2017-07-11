CREATE PROCEDURE [dbo].[usp_LoadWebBenefitsStaging] AS

UPDATE WebBenefitsimport_table
	SET EmployeeHSA = msa
		WHERE Company = 'CEP'

UPDATE WebBenefitsimport_table
	SET EmployeeFSA = msa
		WHERE Company <> 'CEP'

UPDATE WebBenefitsimport_table
	SET LastName = ltrim(Lastname), FirstName = ltrim(FirstName)

UPDATE webbenefitsimport_table
	SET providermasterid = B.Providermasterid
		FROM webbenefitsimport_table,CEPINTEGRATEDDB.DBO.PROVIDERMASTER B
			WHERE SSN = B.SSNUNFORMATTED
				AND webbenefitsimport_table.providermasterid is null
					AND company in ('CEP', 'AH')

DELETE FROM webbenefitsimport_table
	WHERE lastname is null

UPDATE webbenefitsimport_table 
	SET X = 0  
		WHERE len(ssn)<9
UPDATE webbenefitsimport_table 
	SET ssn = X+ssn 
		WHERE len(ssn)<9
UPDATE webbenefitsimport_table 
	SET X = 00  
		WHERE len(ssn)<9
UPDATE webbenefitsimport_table 
	SET ssn = X+ssn 
		WHERE len(ssn)<9


UPDATE webbenefitsimport_table 
	SET sufffix = b.title
		FROM webbenefitsimport_table, cepintegrateddb.dbo.providermaster b
			WHERE webbenefitsimport_table.providermasterid = b.providermasterid

UPDATE webbenefitsimport_table
	SET providermasterid = ''
	WHERE company = 'AH'
