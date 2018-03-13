IF OBJECT_ID('sp_AMODBPartition','P') IS NOT NULL
DROP PROC sp_AMODBPartition
GO
CREATE PROCEDURE sp_AMODBPartition
@PartitionId                               int OUTPUT,
@MeasureGroupId                            int ,
@CubeId									   int ,
@DatabaseId								   int,
@ID                                        nvarchar(500) = NULL,
@Name                                      nvarchar(500) = NULL,
@Parent                                    nvarchar(500) = NULL,
@ParentCube                                nvarchar(500) = NULL,
@ParentDatabase                            nvarchar(500) = NULL,
@ParentServer                              nvarchar(500) = NULL,
@Source                                    nvarchar(500) = NULL,
@ProcessingPriority                        nvarchar(500) = NULL,
@AggregationPrefix                         nvarchar(500) = NULL,
@StorageMode                               nvarchar(500) = NULL,
@CurrentStorageMode                        nvarchar(500) = NULL,
@ProcessingMode                            nvarchar(500) = NULL,
@StorageLocation                           nvarchar(500) = NULL,
@RemoteDataSourceID                        nvarchar(500) = NULL,
@Slice                                     nvarchar(500) = NULL,
@ProactiveCaching                          nvarchar(500) = NULL,
@Type                                      nvarchar(500) = NULL,
@EstimatedSize                             nvarchar(500) = NULL,
@EstimatedRows                             nvarchar(500) = NULL,
@AggregationDesignID                       nvarchar(500) = NULL,
@AggregationInstanceSource                 nvarchar(500) = NULL,
@StringStoresCompatibilityLevel            nvarchar(500) = NULL,
@CurrentStringStoresCompatibilityLevel     nvarchar(500) = NULL,
@DirectQueryUsage                          nvarchar(500) = NULL,
@DataSourceId                              nvarchar(500) = NULL,
@DataSourceViewId                          nvarchar(500) = NULL,
@RemoteDataSource                          nvarchar(500) = NULL,
@LastProcessed                             nvarchar(500) = NULL,
@State                                     nvarchar(500) = NULL,
@IsLoaded                                  nvarchar(500) = NULL,
@CreatedTimestamp                          nvarchar(500) = NULL,
@LastSchemaUpdate                          nvarchar(500) = NULL,
@Description                               nvarchar(500) = NULL,
@SiteID                                    nvarchar(500) = NULL
AS

SELECT @PartitionId = ISNULL(MAX(PartitionId),0) + 1
 FROM dbo.Partition
 
INSERT INTO dbo.Partition
([PartitionId],[MeasureGroupId],[ID],[Name],[Parent],[ParentCube],[ParentDatabase],[ParentServer],
[Source],[ProcessingPriority],[AggregationPrefix],[StorageMode],[CurrentStorageMode],[ProcessingMode],
[StorageLocation],[RemoteDataSourceID],[Slice],[ProactiveCaching],[Type],[EstimatedSize],[EstimatedRows],
[AggregationDesignID],[AggregationInstanceSource],[StringStoresCompatibilityLevel],[CurrentStringStoresCompatibilityLevel],
[DirectQueryUsage],[DataSourceId],[DataSourceViewId],[RemoteDataSource],[LastProcessed],[State],[IsLoaded],
[CreatedTimestamp],[LastSchemaUpdate],[Description],[SiteID])
SELECT @PartitionId,@MeasureGroupId,@ID,@Name,@Parent,@ParentCube,@ParentDatabase,@ParentServer,
@Source,@ProcessingPriority,@AggregationPrefix,@StorageMode,@CurrentStorageMode,@ProcessingMode,
@StorageLocation,@RemoteDataSourceID,@Slice,@ProactiveCaching,@Type,@EstimatedSize,@EstimatedRows,
( SELECT AD.AggregationDesignId
    FROM AggregationDesign AD
	JOIN MeasureGroup MG
	  ON AD.MeasureGroupId = MG.MeasureGroupId
	JOIN Cube cu
	  ON MG.CubeId = CU.CubeId
   WHERE cu.CubeId = @CubeId
     AND AD.[ID] = @AggregationDesignID)
,@AggregationInstanceSource,@StringStoresCompatibilityLevel,@CurrentStringStoresCompatibilityLevel,
@DirectQueryUsage,
( SELECT DS.DataSourceId
    FROM DataSource DS
	JOIN Databases  DB
	  ON DS.DatabaseId = DB.DatabaseId
   WHERE DB.DatabaseId = @DatabaseId
     AND DS.[ID]       =  @DataSourceId
	 ),
( SELECT DSV.DataSourceViewId
    FROM DataSource DS
	JOIN Databases  DB
	  ON DS.DatabaseId = DB.DatabaseId
	JOIN DataSourceView DSV
	  ON DSV.DataSourceId = DS.DataSourceId
   WHERE DB.DatabaseId = @DatabaseId
     AND DSV.[ID]       =  @DataSourceViewId
	 ),
@RemoteDataSource,@LastProcessed,@State,@IsLoaded,
@CreatedTimestamp,@LastSchemaUpdate,@Description,@SiteID
 

 
GO
