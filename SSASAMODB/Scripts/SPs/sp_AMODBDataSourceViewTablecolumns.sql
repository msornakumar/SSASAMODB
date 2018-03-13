IF OBJECT_ID('sp_AMODBDataSourceViewTablecolumns','P') IS NOT NULL
DROP PROC sp_AMODBDataSourceViewTablecolumns
GO
CREATE PROCEDURE sp_AMODBDataSourceViewTablecolumns@DataSourceViewId       int = NULL,@AllowDBNull            nvarchar(500) = NULL,@AutoIncrement          nvarchar(500) = NULL,@AutoIncrementSeed      nvarchar(500) = NULL,@AutoIncrementStep      nvarchar(500) = NULL,@Caption                nvarchar(500) = NULL,@ColumnName             nvarchar(500) = NULL,@Prefix                 nvarchar(500) = NULL,@DataType               nvarchar(500) = NULL,@DateTimeMode           nvarchar(500) = NULL,@DefaultValue           nvarchar(500) = NULL,@Expression             nvarchar(500) = NULL,@MaxLength              nvarchar(500) = NULL,@Namespace              nvarchar(500) = NULL,@Ordinal                nvarchar(500) = NULL,@ReadOnly               nvarchar(500) = NULL,@Table                  nvarchar(500) = NULL,@Unique                 nvarchar(500) = NULL,@ColumnMapping          nvarchar(500) = NULL,@Site                   nvarchar(500) = NULL,@Container              nvarchar(500) = NULL,@DesignMode             nvarchar(500) = NULLAS
DECLARE @DSVTableColumnID INT

SELECT @DSVTableColumnID = ISNULL(MAX(DSVTableColumnID),0) + 1 FROM dbo.DataSourceViewTablecolumns 
INSERT INTO dbo.DataSourceViewTablecolumns([DSVTableColumnID],[DataSourceViewId],[AllowDBNull],[AutoIncrement],[AutoIncrementSeed],[AutoIncrementStep],[Caption],[ColumnName],[Prefix],[DataType],[DateTimeMode],[DefaultValue],[Expression],[MaxLength],[Namespace],[Ordinal],[ReadOnly],[Table],[Unique],[ColumnMapping],[Site],[Container],[DesignMode])SELECT @DSVTableColumnID,@DataSourceViewId,@AllowDBNull,@AutoIncrement,@AutoIncrementSeed,
@AutoIncrementStep,@Caption,@ColumnName,@Prefix,@DataType,@DateTimeMode,@DefaultValue,
@Expression,@MaxLength,@Namespace,@Ordinal,@ReadOnly,@Table,@Unique,
@ColumnMapping,@Site,@Container,@DesignMode
 

 
GO
