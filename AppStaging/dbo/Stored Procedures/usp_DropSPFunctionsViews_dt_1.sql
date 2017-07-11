create procedure usp_DropSPFunctionsViews_dt_1

as

 

-- variable to object name

declare @name  varchar(1000)

-- variable to hold object type

declare @xtype varchar(20)

-- variable to hold sql string

declare @sqlstring nvarchar(4000)

 

declare SPViews_cursor cursor for

SELECT QUOTENAME(ROUTINE_SCHEMA) + '.' + QUOTENAME(ROUTINE_NAME) AS name, ROUTINE_TYPE AS xtype

FROM

INFORMATION_SCHEMA.ROUTINES

WHERE ROUTINE_NAME NOT LIKE '%dt_%'

UNION

SELECT QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) AS name, 'VIEW' AS xtype

FROM

INFORMATION_SCHEMA.VIEWS

 

open SPViews_cursor

 

fetch next from SPViews_cursor into @name, @xtype

 

while @@fetch_status = 0

  begin

-- test object type if it is a stored procedure

   if @xtype = 'PROCEDURE'

      begin

        set @sqlstring = 'drop procedure ' + @name

        exec sp_executesql @sqlstring

        set @sqlstring = ' '

      end

-- test object type if it is a function

   if @xtype = 'FUNCTION'

      begin

        set @sqlstring = 'drop FUNCTION ' + @name

        exec sp_executesql @sqlstring

        set @sqlstring = ' '

      end

-- test object type if it is a view

   if @xtype = 'VIEW'

      begin

         set @sqlstring = 'drop view ' + @name

         exec sp_executesql @sqlstring

         set @sqlstring = ' '

      end

 

-- get next record

    fetch next from SPViews_cursor into @name, @xtype

  end

 

close SPViews_cursor

deallocate SPViews_cursor

