IF OBJECT_ID('sp_AMODBAttributeRelationship','P') IS NOT NULL
DROP PROC sp_AMODBAttributeRelationship
GO
CREATE PROCEDURE sp_AMODBAttributeRelationship
 DECLARE @Atrid int
 DECLARE @ParentAtrid int

 SELECT @Atrid = DA.AttributeId
   FROM DimensionAttribute DA
   JOIN CubeDimension CD
     ON DA.CubeDimensionId = CD.CubeDimensionId 
  WHERE DA.ID		= @AttributeID
    AND CD.CubeId	= @CubeID

 SELECT @ParentAtrid = DA.AttributeId
   FROM DimensionAttribute DA
   JOIN CubeDimension CD
     ON DA.CubeDimensionId = CD.CubeDimensionId 
  WHERE DA.ID		= @ParentAttributeID
    AND CD.CubeId	= @CubeID



INSERT INTO dbo.AttributeRelationship
@Name,@Visible,@Parent,@ParentDimension,@ParentDatabase,@ParentServer
 

 
GO