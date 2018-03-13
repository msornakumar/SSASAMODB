IF OBJECT_ID('sp_AMODBMeasureGroup','P') IS NOT NULL
DROP PROC sp_AMODBMeasureGroup
GO
CREATE PROCEDURE sp_AMODBMeasureGroup
@MeasureGroupId                int OUTPUT,
@CubeId                        int = NULL,
@ID                            nvarchar(500) = NULL,
@Name                          nvarchar(500) = NULL,
@IsLinked                      nvarchar(500) = NULL,
@Type                          nvarchar(500) = NULL,
@Source                        nvarchar(500) = NULL,
@StorageMode                   nvarchar(500) = NULL,
@StorageLocation               nvarchar(500) = NULL,
@IgnoreUnrelatedDimensions     nvarchar(500) = NULL,
@EstimatedRows                 nvarchar(500) = NULL,
@EstimatedSize                 nvarchar(500) = NULL,
@ProcessingMode                nvarchar(500) = NULL,
@AggregationPrefix             nvarchar(500) = NULL,
@ProcessingPriority            nvarchar(500) = NULL,
@Parent                        nvarchar(500) = NULL,
@ParentDatabase                nvarchar(500) = NULL,
@ParentServer                  nvarchar(500) = NULL,
@LastProcessed                 nvarchar(500) = NULL,
@State                         nvarchar(500) = NULL,
@IsLoaded                      nvarchar(500) = NULL,
@CreatedTimestamp              nvarchar(500) = NULL,
@LastSchemaUpdate              nvarchar(500) = NULL,
@Description                   nvarchar(500) = NULL,
@SiteID                        nvarchar(500) = NULL
AS

SELECT @MeasureGroupId = ISNULL(MAX(MeasureGroupId),0) + 1
 FROM dbo.MeasureGroup
 
 INSERT INTO dbo.MeasureGroup
([MeasureGroupId],[CubeId],[ID],[Name],[IsLinked],[Type],[Source],[StorageMode],[StorageLocation],
[IgnoreUnrelatedDimensions],[EstimatedRows],[EstimatedSize],[ProcessingMode],[AggregationPrefix],
[ProcessingPriority],[Parent],[ParentDatabase],[ParentServer],[LastProcessed],[State],[IsLoaded],
[CreatedTimestamp],[LastSchemaUpdate],[Description],[SiteID])
SELECT @MeasureGroupId,@CubeId,@ID,@Name,@IsLinked,@Type,@Source,@StorageMode,@StorageLocation,
@IgnoreUnrelatedDimensions,@EstimatedRows,@EstimatedSize,@ProcessingMode,@AggregationPrefix,
@ProcessingPriority,@Parent,@ParentDatabase,@ParentServer,@LastProcessed,@State,@IsLoaded,
@CreatedTimestamp,@LastSchemaUpdate,@Description,@SiteID
 
 
GO
