IF OBJECT_ID('sp_AMODBCubeDimension','P') IS NOT NULL
DROP PROC sp_AMODBCubeDimension
GO
CREATE PROCEDURE sp_AMODBCubeDimension
SELECT @CubeDimensionId = ISNULL(MAX(CubeDimensionId),0)  +1 
INSERT INTO dbo.CubeDimension
@AllMemberAggregationUsage,@Parent,@ParentDatabase,@ParentServer,@ID,@Name,@Description,@SiteID
 

 
GO