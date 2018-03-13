IF OBJECT_ID('sp_AMODBAttributeRelationship','P') IS NOT NULL
DROP PROC sp_AMODBAttributeRelationship
GO
CREATE PROCEDURE sp_AMODBAttributeRelationship@CubeID				   int,@AttributeID           nvarchar(500) = NULL,@ParentAttributeID     nvarchar(500) = NULL,@RelationshipType      nvarchar(500) = NULL,@Cardinality           nvarchar(500) = NULL,@Optionality           nvarchar(500) = NULL,@OverrideBehavior      nvarchar(500) = NULL,@Name                  nvarchar(500) = NULL,@Visible               nvarchar(500) = NULL,@Parent                nvarchar(500) = NULL,@ParentDimension       nvarchar(500) = NULL,@ParentDatabase        nvarchar(500) = NULL,@ParentServer          nvarchar(500) = NULLAS 
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



INSERT INTO dbo.AttributeRelationship([AttributeID],[ParentAttributeID],[RelationshipType],[Cardinality],[Optionality],[OverrideBehavior],[Name],[Visible],[Parent],[ParentDimension],[ParentDatabase],[ParentServer])SELECT @Atrid,@ParentAtrid,@RelationshipType,@Cardinality,@Optionality,@OverrideBehavior,
@Name,@Visible,@Parent,@ParentDimension,@ParentDatabase,@ParentServer
 

 
GO
