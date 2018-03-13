IF OBJECT_ID('sp_AMODBDataSourceViewTablecolumns','P') IS NOT NULL
DROP PROC sp_AMODBDataSourceViewTablecolumns
GO
CREATE PROCEDURE sp_AMODBDataSourceViewTablecolumns
DECLARE @DSVTableColumnID INT

SELECT @DSVTableColumnID = ISNULL(MAX(DSVTableColumnID),0) + 1
INSERT INTO dbo.DataSourceViewTablecolumns
@AutoIncrementStep,@Caption,@ColumnName,@Prefix,@DataType,@DateTimeMode,@DefaultValue,
@Expression,@MaxLength,@Namespace,@Ordinal,@ReadOnly,@Table,@Unique,
@ColumnMapping,@Site,@Container,@DesignMode
 

 
GO