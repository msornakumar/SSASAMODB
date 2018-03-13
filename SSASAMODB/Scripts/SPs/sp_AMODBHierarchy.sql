IF OBJECT_ID('sp_AMODBHierarchy','P') IS NOT NULL
DROP PROC sp_AMODBHierarchy
GO
CREATE PROCEDURE sp_AMODBHierarchy@HierarchyId             int OUTPUT,@CubeDimensionId         int = NULL,@DisplayFolder           nvarchar(500) = NULL,@AllMemberName           nvarchar(500) = NULL,@MemberNamesUnique       nvarchar(500) = NULL,@MemberKeysUnique        nvarchar(500) = NULL,@AllowDuplicateNames     nvarchar(500) = NULL,@ProcessingState         nvarchar(500) = NULL,@StructureType           nvarchar(500) = NULL,@Parent                  nvarchar(500) = NULL,@ParentDatabase          nvarchar(500) = NULL,@ParentServer            nvarchar(500) = NULL,@ID                      nvarchar(500) = NULL,@Name                    nvarchar(500) = NULL,@Description             nvarchar(500) = NULL,@SiteID                  nvarchar(500) = NULLAS
SELECT @HierarchyId = ISNULL(MAX(HierarchyId) ,0)+1  FROM dbo.Hierarchy 
INSERT INTO dbo.Hierarchy([HierarchyId],[CubeDimensionId],[DisplayFolder],[AllMemberName],[MemberNamesUnique],[MemberKeysUnique],[AllowDuplicateNames],[ProcessingState],[StructureType],[Parent],[ParentDatabase],[ParentServer],[ID],[Name],[Description],[SiteID])SELECT @HierarchyId,@CubeDimensionId,@DisplayFolder,@AllMemberName,@MemberNamesUnique,@MemberKeysUnique,
@AllowDuplicateNames,@ProcessingState,@StructureType,@Parent,@ParentDatabase,@ParentServer,@ID,@Name,
@Description,@SiteID
 

 
GO
