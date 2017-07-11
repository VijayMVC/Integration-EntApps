CREATE FUNCTION [dbo].[ufn_CamelCase](@Text AS VARCHAR(8000)) 
 RETURNS VARCHAR(8000) 
 AS 
 BEGIN 
    -- declare some variables 
    DECLARE @Reset BIT; DECLARE @Ret VARCHAR(8000); DECLARE @i INT; 
    DECLARE @c0 CHAR(1); DECLARE @c1 CHAR(1); DECLARE @c2 CHAR(1); 
    DECLARE @CaseLen INT; 
    DECLARE @CaseExceptions VARCHAR(8000); 
    DECLARE @CaseValue VARCHAR(8000); 
  
    -- Set some default values 
    SELECT @Reset = 1, @i=1, @Ret = ''; 
  
    -- only apply if all characters are already in uppercase 
    IF (UPPER(@Text)=@Text COLLATE Latin1_General_CS_AI) 
         BEGIN 
  
                 -- add a leading and trailing space to indicate word delimiters (bol & eol) 
                 SET @Text = ' ' + @Text + ' '; 
  
                 -- cycle through each character, 
                 -- if non-alpha, uppercase next alpha character. 
                 -- if alpha then lowercase subsequent alphas. 
                 WHILE (@i <= LEN(@Text)) 
                         SELECT 
                                 @c0=SUBSTRING(@Text,@i-2,1), @c1=SUBSTRING(@Text,@i-1,1), @c2=SUBSTRING(@Text,@i,1), 
                                 @Ret = @Ret + CASE WHEN @Reset=1 THEN UPPER(@c2) ELSE LOWER(@c2) END, 
                                 @Reset = CASE 
                                                 -- EXCEPTION: McDonalds and Mc Donalds but not Tomcat 
                                                 WHEN @c0 = ' ' AND @c1 = 'M' AND @c2 = 'c' THEN 1 
  
                                                 -- EXCEPTION: D'Artagnan, I'Anson, O'Neils and O' Sullivan but Mo'Money 
                                                 WHEN @c0 = ' ' AND @c1 IN ('D', 'I', 'O') AND @c2 = '''' THEN 1 
  
                                                 WHEN @c2 LIKE '[a-zA-Z'']' THEN 0               -- Apply LOWER to any character after alphas or apostrophes 
                                                 ELSE 1                                                                  -- Apply UPPER to any character after symbols/punctuation 
                                         END, 
                                 @i = @i +1 
  
                 -- add a trailing space in case the previous rule changed this. 
                 SET @Ret = @Ret + ' '; 
  
                 -- custom exceptions: this search is case-insensitive and will 
                 -- replace the word to the case as it is written in the list. 
                 -- NOTE: this list has to end with a comma! 
                 SELECT @i=0, @CaseLen=0, 
                         @CaseExceptions = 'and,at,de,for,in,of,or,the,to,van,y,'+ 
                         'BI,GP,HR,IT,NHS,OVC,'+ 
                         'PA,PR,PT,PTHP,UET,UK,USA,VP,II,III,'+ 
                         'HoD,PO Box,SportMe,SNF,BD,QA,ACC,LF,C/PE,'+
                         'AA,MA,OA,IV,COO,CEO,CFO,CIO,CME,(IT),IS,PE,PMC,HC,CME,CA/TX,PED,UCC,'+
                         'DIV,NP,ED,LAX,WC,CA,TX,SF,OBS,HBOT,UCLA,DMC,MV,RMC,ED,LD,V,VI,RA,'+
                         'CRM,ERP,ETL,ANES,CEP,PA/NP,AAD,AEP,AUC,CSR,CEPA,CFM,CME,CMO,TQI,CP/E,DVP,' +
                         'DB,EDC,EDI,(HBOT),HRIS,ICU,II-,PDR,(PMC,SJ,RN,AR,AP/,/RP,RP,MOBS,-CEPA,CRM/ERP,'+
                         'AZ,DB/,ED/GAL,(CME,PC,LAN,SEMA,VP,LOA,PANP,PR/Sr,IV-,'
  
                 -- Loop through exception cases 
                 WHILE CHARINDEX(',', @CaseExceptions, @i+1)>0 
                         BEGIN 
                                 -- get the delimited word 
                                 SET @CaseLen = CHARINDEX(',', @CaseExceptions, @i+1) - @i 
                                 SET @CaseValue = SUBSTRING(@CaseExceptions, @i, @CaseLen) 
  
                                 -- replace it in the original text 
                                 SET @Ret = REPLACE(@Ret, ' '+@CaseValue+' ', ' '+@CaseValue+' ') 
  
                                 -- get position of next word 
                                 SET @i = CHARINDEX(',', @CaseExceptions, @i+@CaseLen) +1 
                         END 
  
                 -- remove any leading and trailing spaces 
                 SET @Ret = LTRIM(RTRIM(@Ret)); 
  
                 -- capitalize first character of data irrespective of previous rules 
                 SET @Ret = UPPER(SUBSTRING(@Ret,1,1)) + SUBSTRING(@Ret,2,LEN(@Ret)); 
  
         END 
    ELSE 
     BEGIN 
                 -- return the string unaffected if it is not in uppercase 
                 SET @Ret=@Text 
         END 
  
    RETURN @Ret 
 END 