IF OBJECT_ID('sp_AMODBCube','P') IS NOT NULL
DROP PROC sp_AMODBCube
GO
CREATE PROCEDURE sp_AMODBCube@CubeId                        int OUTPUT,@DatabaseId                    int = NULL,@DataSourceId                  nvarchar(500) = NULL,@DataSourceViewId              nvarchar(500) = NULL,@DefaultMdxScript              nvarchar(500) = NULL,@Language                      nvarchar(500) = NULL,@Collation                     nvarchar(500) = NULL,@DefaultMeasure                nvarchar(500) = NULL,@Visible                       nvarchar(500) = NULL,@Source                        nvarchar(500) = NULL,@MdxScripts                    nvarchar(500) = NULL,@AggregationPrefix             nvarchar(500) = NULL,@ProcessingPriority            nvarchar(500) = NULL,@StorageMode                   nvarchar(500) = NULL,@ProcessingMode                nvarchar(500) = NULL,@StorageLocation               nvarchar(500) = NULL,@EstimatedRows                 nvarchar(500) = NULL,@ScriptCacheProcessingMode     nvarchar(500) = NULL,@ScriptErrorHandlingMode       nvarchar(500) = NULL,@AllMeasures                   nvarchar(500) = NULL,@Parent                        nvarchar(500) = NULL,@ParentServer                  nvarchar(500) = NULL,@LastProcessed                 nvarchar(500) = NULL,@State                         nvarchar(500) = NULL,@IsLoaded                      nvarchar(500) = NULL,@CreatedTimestamp              nvarchar(500) = NULL,@LastSchemaUpdate              nvarchar(500) = NULL,@Description                   nvarchar(500) = NULL,@ID                            nvarchar(500) = NULL,@Name                          nvarchar(500) = NULL,@SiteID                        nvarchar(500) = NULL,@Container                     nvarchar(500) = NULLAS
SELECT @CubeId = ISNULL(MAX(CubeId),0) + 1 FROM dbo.Cube 
INSERT INTO dbo.Cube([CubeId],[DatabaseId],[DataSourceId],[DataSourceViewId],[DefaultMdxScript],[Language],[Collation],[DefaultMeasure],[Visible],[Source],[MdxScripts],[AggregationPrefix],[ProcessingPriority],[StorageMode],[ProcessingMode],[StorageLocation],[EstimatedRows],[ScriptCacheProcessingMode],[ScriptErrorHandlingMode],[AllMeasures],[Parent],[ParentServer],[LastProcessed],[State],[IsLoaded],[CreatedTimestamp],[LastSchemaUpdate],[Description],[ID],[Name],[SiteID],[Container])SELECT @CubeId,@DatabaseId
,(SELECT DataSourceId FROM DataSource WHERE [id] = @DataSourceId AND DatabaseId = @DatabaseId)
,(SELECT DataSourceViewId FROM DataSourceView DSV JOIN DataSource DS ON DSV.DataSourceId = DS.DataSourceId
  WHERE DSV.[id] = @DataSourceViewId AND DS.DatabaseId = @DatabaseId)
,@DefaultMdxScript,@Language,@Collation,
@DefaultMeasure,@Visible,@Source,@MdxScripts,@AggregationPrefix,@ProcessingPriority,@StorageMode,
@ProcessingMode,@StorageLocation,@EstimatedRows,@ScriptCacheProcessingMode,@ScriptErrorHandlingMode,
@AllMeasures,@Parent,@ParentServer,@LastProcessed,@State,@IsLoaded,@CreatedTimestamp,
@LastSchemaUpdate,@Description,@ID,@Name,@SiteID,@Container
 

 
GO
