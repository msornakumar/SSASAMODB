IF OBJECT_ID('sp_AMODBAttributeKeyColumns','P') IS NOT NULL
DROP PROC sp_AMODBAttributeKeyColumns
GO
CREATE PROCEDURE sp_AMODBAttributeKeyColumns
@AttributeID          int,
@KeyColumnName		  NVARCHAR(500)
AS

DECLARE @AttributeKeyColumnID INT

DECLARE @KeyTable	SYSNAME
DECLARE @KeyCol	SYSNAME

SELECT @KeyTable = SUBSTRING(@KeyColumnName,1,CHARINDEX('.',@KeyColumnName)-1)
SELECT @KeyCol = SUBSTRING(@KeyColumnName,CHARINDEX('.',@KeyColumnName)+1,LEN(@KeyColumnName))

SELECT @AttributeKeyColumnID = ISNULL(MAX(AttributeKeyColumnID),0) + 1
  FROM AttributeKeyColumns 

INSERT INTO dbo.AttributeKeyColumns
([AttributeKeyColumnID],[AttributeID],[DSVTableColumnID])
SELECT @AttributeKeyColumnID,@AttributeID
,(
SELECT DSVT.DSVTableColumnID
  FROM DataSourceViewTablecolumns DSVT
  JOIN DataSourceView DSV
    ON DSVT.DataSourceViewId = DSV.DataSourceViewId
  JOIN DataSource DS
    ON DS.DataSourceId = DSV.DataSourceId
  JOIN Databases DB
    ON DB.DatabaseId = DS.DatabaseId
  JOIN [Cube] CU
    ON CU.DatabaseId = DB.DatabaseId
  JOIN [CubeDimension] CD
    ON CD.CubeId = CU.CubeId
  JOIN [DimensionAttribute] DA
    ON DA.CubeDimensionId = CD.CubeDimensionId
 WHERE DSVT.[Table] = @KeyTable
   AND DSVT.ColumnName = @KeyCol
   AND DA.AttributeId = @AttributeID
)


 
GO


