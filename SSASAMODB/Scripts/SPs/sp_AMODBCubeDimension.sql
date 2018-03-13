IF OBJECT_ID('sp_AMODBCubeDimension','P') IS NOT NULL
DROP PROC sp_AMODBCubeDimension
GO
CREATE PROCEDURE sp_AMODBCubeDimension@CubeDimensionId               int OUTPUT,@CubeId                        int = NULL,@DimensionID                   nvarchar(500) = NULL,@Visible                       nvarchar(500) = NULL,@HierarchyUniqueNameStyle      nvarchar(500) = NULL,@MemberUniqueNameStyle         nvarchar(500) = NULL,@AllMemberAggregationUsage     nvarchar(500) = NULL,@Parent                        nvarchar(500) = NULL,@ParentDatabase                nvarchar(500) = NULL,@ParentServer                  nvarchar(500) = NULL,@ID                            nvarchar(500) = NULL,@Name                          nvarchar(500) = NULL,@Description                   nvarchar(500) = NULL,@SiteID                        nvarchar(500) = NULLAS
SELECT @CubeDimensionId = ISNULL(MAX(CubeDimensionId),0)  +1   FROM dbo.CubeDimension 
INSERT INTO dbo.CubeDimension([CubeDimensionId],[CubeId],[DimensionID],[Visible],[HierarchyUniqueNameStyle],[MemberUniqueNameStyle],[AllMemberAggregationUsage],[Parent],[ParentDatabase],[ParentServer],[ID],[Name],[Description],[SiteID])SELECT @CubeDimensionId,@CubeId,@DimensionID,@Visible,@HierarchyUniqueNameStyle,@MemberUniqueNameStyle,
@AllMemberAggregationUsage,@Parent,@ParentDatabase,@ParentServer,@ID,@Name,@Description,@SiteID
 

 
GO
