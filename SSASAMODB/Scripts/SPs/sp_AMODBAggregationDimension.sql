IF OBJECT_ID('sp_AMODBAggregationDimension','P') IS NOT NULL
DROP PROC sp_AMODBAggregationDimension
GO
CREATE PROCEDURE sp_AMODBAggregationDimension
@AggregationId              int = NULL,
@DimensionId                NVARCHAR(500) = NULL,
@CubeId						int = NULL
AS

DECLARE @AggregationDimensionId     int

SELECT @AggregationDimensionId = ISNULL(MAX(AggregationDimensionId),0) + 1
 FROM dbo.AggregationDimension
 
INSERT INTO dbo.AggregationDimension
([AggregationDimensionId],[AggregationId],[DimensionId])
SELECT @AggregationDimensionId,@AggregationId,
(SELECT CubeDimensionID
   FROM CubeDimension
  WHERE [ID]	= @DimensionId
    AND CubeId	= @CubeId)
 

 
GO

