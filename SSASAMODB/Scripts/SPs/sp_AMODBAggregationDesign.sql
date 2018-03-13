IF OBJECT_ID('sp_AMODBAggregationDesign','P') IS NOT NULL
DROP PROC sp_AMODBAggregationDesign
GO
CREATE PROCEDURE sp_AMODBAggregationDesign
@AggregationDesignId          int OUTPUT,
@MeasureGroupId               int = NULL,
@ID                           nvarchar(500) = NULL,
@Name                         nvarchar(500) = NULL,
@EstimatedRows                nvarchar(500) = NULL,
@EstimatedPerformanceGain     nvarchar(500) = NULL,
@Parent                       nvarchar(500) = NULL,
@ParentCube                   nvarchar(500) = NULL,
@ParentDatabase               nvarchar(500) = NULL,
@ParentServer                 nvarchar(500) = NULL,
@IsLoaded                     nvarchar(500) = NULL,
@CreatedTimestamp             nvarchar(500) = NULL,
@LastSchemaUpdate             nvarchar(500) = NULL,
@Description                  nvarchar(500) = NULL,
@SiteID                       nvarchar(500) = NULL
AS

SELECT @AggregationDesignId = ISNULL(MAX(AggregationDesignId),0) + 1
  FROM dbo.AggregationDesign

 
INSERT INTO dbo.AggregationDesign
([AggregationDesignId],[MeasureGroupId],[ID],[Name],[EstimatedRows],[EstimatedPerformanceGain],[Parent],
[ParentCube],[ParentDatabase],[ParentServer],[IsLoaded],[CreatedTimestamp],[LastSchemaUpdate],[Description],[SiteID])
SELECT @AggregationDesignId,@MeasureGroupId,@ID,@Name,@EstimatedRows,@EstimatedPerformanceGain,@Parent,
@ParentCube,@ParentDatabase,@ParentServer,@IsLoaded,@CreatedTimestamp,@LastSchemaUpdate,@Description,@SiteID
 
 
GO
