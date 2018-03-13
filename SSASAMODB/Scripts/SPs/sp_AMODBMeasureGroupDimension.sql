IF OBJECT_ID('sp_AMODBMeasureGroupDimension','P') IS NOT NULL
DROP PROC sp_AMODBMeasureGroupDimension
GO
CREATE PROCEDURE sp_AMODBMeasureGroupDimension@CubeDimensionId             nvarchar(500) = NULL,@CubeId						 int = NULL,@MeasureGroupId              int = NULLAS
DECLARE @MeasureGroupDimensionId INTSELECT @MeasureGroupDimensionId = ISNULL(MAX(MeasureGroupDimensionId),0) + 1  FROM dbo.MeasureGroupDimension 
INSERT INTO dbo.MeasureGroupDimension([MeasureGroupDimensionId],[CubeDimensionId],[MeasureGroupId])SELECT @MeasureGroupDimensionId
,(SELECT CubeDimensionId
    FROM CubeDimension CD
	JOIN [Cube] CU
	  ON CD.CubeId = CU.CubeId
   WHERE CU.CubeId = @CubeId
     AND CD.[ID] = @CubeDimensionId)
,@MeasureGroupId
 

 
GO
