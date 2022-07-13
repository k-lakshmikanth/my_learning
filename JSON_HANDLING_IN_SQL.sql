 
 Declare @JSON varchar(max)
 Declare @data nvarchar(max)
SELECT @JSON=BulkColumn
FROM OPENROWSET (BULK 'C:\Users\Lakshmikanth\Desktop\Sample\Sample-json.json', SINGLE_CLOB) import
SELECT @data=value
FROM OPENJSON (@JSON)
insert into temp 
select JSON_VALUE(value,'$.id') AS ID,JSON_VALUE(value,'$.SNAME') AS SNAME
from OPENJSON (@data)


SELECT * FROM TEMP
