IF OBJECT_ID('sp_AMODBCube','P') IS NOT NULL
DROP PROC sp_AMODBCube
GO
CREATE PROCEDURE sp_AMODBCube
SELECT @CubeId = ISNULL(MAX(CubeId),0) + 1 FROM dbo.Cube
INSERT INTO dbo.Cube
,(SELECT DataSourceId FROM DataSource WHERE [id] = @DataSourceId AND DatabaseId = @DatabaseId)
,(SELECT DataSourceViewId FROM DataSourceView DSV JOIN DataSource DS ON DSV.DataSourceId = DS.DataSourceId
  WHERE DSV.[id] = @DataSourceViewId AND DS.DatabaseId = @DatabaseId)
,@DefaultMdxScript,@Language,@Collation,
@DefaultMeasure,@Visible,@Source,@MdxScripts,@AggregationPrefix,@ProcessingPriority,@StorageMode,
@ProcessingMode,@StorageLocation,@EstimatedRows,@ScriptCacheProcessingMode,@ScriptErrorHandlingMode,
@AllMeasures,@Parent,@ParentServer,@LastProcessed,@State,@IsLoaded,@CreatedTimestamp,
@LastSchemaUpdate,@Description,@ID,@Name,@SiteID,@Container
 

 
GO