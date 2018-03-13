IF OBJECT_ID('sp_AMODBMeasureGroupDimension','P') IS NOT NULL
DROP PROC sp_AMODBMeasureGroupDimension
GO
CREATE PROCEDURE sp_AMODBMeasureGroupDimension
DECLARE @MeasureGroupDimensionId INT
INSERT INTO dbo.MeasureGroupDimension
,(SELECT CubeDimensionId
    FROM CubeDimension CD
	JOIN [Cube] CU
	  ON CD.CubeId = CU.CubeId
   WHERE CU.CubeId = @CubeId
     AND CD.[ID] = @CubeDimensionId)
,@MeasureGroupId
 

 
GO