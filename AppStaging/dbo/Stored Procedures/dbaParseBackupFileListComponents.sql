CREATE PROCEDURE [dbo].[dbaParseBackupFileListComponents] 
	@AppendToTable bit = 0
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE curFileList CURSOR FOR
		SELECT EntireLine FROM DBARawBackupFileList ORDER BY ListingID;

	OPEN curFileList;

	IF (@AppendToTable = 0) 
	BEGIN
		DELETE FROM dbo.DBABackupFile;
	END;
	
	DECLARE @FileListing varchar(2000);

	DECLARE @FileDatabaseName Varchar(50), @FileDateTime Datetime, @FileSizeStr Varchar(20), 
			@FileSizeBytes as BigInt, @FullFileName varchar(255), @FileName varchar(255), 
			@FileExtension varchar(15), @CurrentBackupFolder varchar(255), @CurrentServerNameFromFolder varchar(50);

	FETCH NEXT FROM curFileList INTO @FileListing;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF (isnumeric(left(@FileListing,1)) = 1 )  
		BEGIN
			-- Inside this section we are working with actual files

			set @FileDateTime = cast( left(@FileListing,20) as Datetime);		
			set @FileSizeStr = substring(@FileListing,21,18);

			IF ( isnumeric (replace(rtrim(ltrim(@FileSizeStr)),',','')) = 1)
			BEGIN
				-- Trigger actual work if it looks like there is a valid numeric value for the size
				set @FileSizeBytes = cast( replace(rtrim(ltrim(@FileSizeStr)),',','') AS BigInt)
				set @FullFileName = substring(@FileListing,39, len(@FileListing) - 38);
				set @FileExtension = dbo.dbaSplitStringAtLast(@FullFileName,'.','right');
				print @FileListing + '=' + cast(@FileDateTime as varchar(20)) + '=' + @FileSizeStr + '=' + @FullFileName + '=' + @FileExtension
				IF ( upper(@FileExtension) = 'BAK' or upper(@FileExtension) = 'TRN') 
				BEGIN

					-- This is a complete hack but this is to get around not always knowing what the delimiter text
					-- after the database name is for each file(_backup_, _tlog_, _db_)
					set @FileDatabaseName = dbo.dbaSplitStringAtFirst(@FullFileName,'_backup_', 'LEFT') 
					IF ( @FileDatabaseName = @FullFileName ) -- then you didn't get just the dbname 
					BEGIN
						set @FileDatabaseName = dbo.dbaSplitStringAtFirst(@FullFileName,'_db_', 'LEFT') 

						IF ( @FileDatabaseName = @FullFileName ) -- then you didn't get just the dbname 
						BEGIN
							set @FileDatabaseName = dbo.dbaSplitStringAtFirst(@FullFileName,'_tlog_', 'LEFT') 

							IF ( @FileDatabaseName = @FullFileName ) -- then you didn't get just the dbname 
							BEGIN
								set @FileDatabaseName =  null;
							END;
						END;
					END;

					set @FileDatabaseName = rtrim(ltrim(@FileDatabaseName));

					INSERT dbo.DBABackupFile (FullFileName, FileDateTime, FileSizeInBytes, FileExtension, FileDatabaseName, FolderLocation, DBServername)
						VALUES (@FullFileName, @FileDateTime, @FileSizeBytes, @FileExtension, @FileDatabaseName, @CurrentBackupFolder, @CurrentServerNameFromFolder );
				END;
			END;
		END -- End the section dealing with an actual file
		ELSE
		BEGIN  
			-- Found something other than a file. Need to look to keep track of which folder
			-- currently being looked at.
			-- Only do something if it's  Directory indicator: ' Directory of '
			IF (left(@FileListing, len(' Directory of ')) = ' Directory of ' )  
			BEGIN
				set @CurrentBackupFolder = rtrim(ltrim(dbo.dbaSplitStringAtFirst(@FileListing, ' Directory of ', 'RIGHT')));
				set @CurrentServerNameFromFolder = rtrim(ltrim(dbo.dbaSplitStringAtLast(@FileListing, '\', 'RIGHT')));
			END;
		END; 

		FETCH NEXT FROM curFileList INTO @FileListing;
	END;

	CLOSE curFileList;
	DEALLOCATE curFileList;

	-- Table now contains lots of junk records because it contains all files
	-- read in from the listing; but some of them might come
	-- in handy so leave them in the table for now.
	

END
