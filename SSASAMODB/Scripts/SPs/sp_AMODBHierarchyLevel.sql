IF OBJECT_ID('sp_AMODBHierarchyLevel','P') IS NOT NULL
DROP PROC sp_AMODBHierarchyLevel
GO
CREATE PROCEDURE sp_AMODBHierarchyLevel
@HierarchyId           int = NULL,
@HierarchyLevel        tinyint = NULL,
@Name                  nvarchar(500) = NULL,
@ID                    nvarchar(500) = NULL,
@HideMemberIf          nvarchar(500) = NULL,
@SourceAttributeId      nvarchar(500) = NULL
AS

DECLARE @LevelId int

SELECT @LevelId = ISNULL(MAX(LevelId),0)+1
  FROM dbo.HierarchyLevel
 
INSERT INTO dbo.HierarchyLevel
([LevelId],[HierarchyId],[HierarchyLevel],[Name],[ID],[HideMemberIf],[SourceAttributeId])
SELECT @LevelId,@HierarchyId,@HierarchyLevel,@Name,@ID,@HideMemberIf
, (SELECT DA.AttributeId
    FROM  DimensionAttribute DA
	JOIN Hierarchy H
	  ON H.CubeDimensionId = DA.CubeDimensionId
   WHERE DA.ID =  @SourceAttributeId
     AND H.[HierarchyId] = @HierarchyId)
 

 
GO
