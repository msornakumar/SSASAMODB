IF OBJECT_ID('sp_AMODBDimensionAttribute','P') IS NOT NULL
DROP PROC sp_AMODBDimensionAttribute
GO
CREATE PROCEDURE sp_AMODBDimensionAttribute
@CubeDimensionId                       int = NULL ,
@AttributeId                           int OUTPUT,
@Type                                  nvarchar(500) = NULL,
@Usage                                 nvarchar(500) = NULL,
@Source                                nvarchar(500) = NULL,
@EstimatedCount                        nvarchar(500) = NULL,
@NameColumn                            nvarchar(500) = NULL,
@DiscretizationMethod                  nvarchar(500) = NULL,
@DiscretizationBucketCount             nvarchar(500) = NULL,
@RootMemberIf                          nvarchar(500) = NULL,
@OrderBy                               nvarchar(500) = NULL,
@DefaultMember                         nvarchar(500) = NULL,
@OrderByAttributeID                    nvarchar(500) = NULL,
@SkippedLevelsColumn                   nvarchar(500) = NULL,
@NamingTemplate                        nvarchar(500) = NULL,
@NamingTemplateTranslations            nvarchar(500) = NULL,
@MembersWithData                       nvarchar(500) = NULL,
@MembersWithDataCaption                nvarchar(500) = NULL,
@CustomRollupColumn                    nvarchar(500) = NULL,
@CustomRollupPropertiesColumn          nvarchar(500) = NULL,
@UnaryOperatorColumn                   nvarchar(500) = NULL,
@ValueColumn                           nvarchar(500) = NULL,
@AttributeHierarchyOrdered             nvarchar(500) = NULL,
@MemberNamesUnique                     nvarchar(500) = NULL,
@IsAggregatable                        nvarchar(500) = NULL,
@AttributeHierarchyEnabled             nvarchar(500) = NULL,
@AttributeHierarchyOptimizedState      nvarchar(500) = NULL,
@AttributeHierarchyVisible             nvarchar(500) = NULL,
@AttributeHierarchyDisplayFolder       nvarchar(500) = NULL,
@KeyUniquenessGuarantee                nvarchar(500) = NULL,
@GroupingBehavior                      nvarchar(500) = NULL,
@InstanceSelection                     nvarchar(500) = NULL,
@ProcessingState                       nvarchar(500) = NULL,
@AttributeHierarchyProcessingState     nvarchar(500) = NULL,
@FormatString                          nvarchar(500) = NULL,
@VisualizationProperties               nvarchar(500) = NULL,
@OrderByAttribute                      nvarchar(500) = NULL,
@Parent                                nvarchar(500) = NULL,
@ParentDatabase                        nvarchar(500) = NULL,
@ParentServer                          nvarchar(500) = NULL,
@ID                                    nvarchar(500) = NULL,
@Name                                  nvarchar(500) = NULL,
@Description                           nvarchar(500) = NULL,
@SiteID                                nvarchar(500) = NULL
AS

DECLARE @NameTable	SYSNAME
DECLARE @NameCol	SYSNAME
DECLARE @ValueTable SYSNAME
DECLARE @ValueCol	SYSNAME

SELECT @NameTable = SUBSTRING(@NameColumn,1,CHARINDEX('.',@NameColumn)-1)
SELECT @NameCol = SUBSTRING(@NameColumn,CHARINDEX('.',@NameColumn)+1,LEN(@NameColumn))

IF LTRIM(RTRIM(@ValueColumn)) = '' 
BEGIN
	SELECT @ValueTable = ''
	SELECT @ValueCol = ''
END
ELSE
BEGIN
	SELECT @ValueTable = SUBSTRING(@ValueColumn,1,CHARINDEX('.',@ValueColumn)-1)
	SELECT @ValueCol = SUBSTRING(@ValueColumn,CHARINDEX('.',@ValueColumn)+1,LEN(@ValueColumn))
END

SELECT @AttributeId = ISNULL(MAX(AttributeId),0) + 1
  FROM dbo.DimensionAttribute
 
INSERT INTO dbo.DimensionAttribute
([CubeDimensionId],[AttributeId],[Type],[Usage],[Source],[EstimatedCount],[NameColumn],
[DiscretizationMethod],[DiscretizationBucketCount],[RootMemberIf],[OrderBy],[DefaultMember],
[OrderByAttributeID],[SkippedLevelsColumn],[NamingTemplate],[NamingTemplateTranslations],
[MembersWithData],[MembersWithDataCaption],[CustomRollupColumn],[CustomRollupPropertiesColumn],[UnaryOperatorColumn],
[ValueColumn],[AttributeHierarchyOrdered],[MemberNamesUnique],[IsAggregatable],
[AttributeHierarchyEnabled],[AttributeHierarchyOptimizedState],[AttributeHierarchyVisible],
[AttributeHierarchyDisplayFolder],[KeyUniquenessGuarantee],[GroupingBehavior],[InstanceSelection],
[ProcessingState],[AttributeHierarchyProcessingState],[FormatString],[VisualizationProperties],
[OrderByAttribute],[Parent],[ParentDatabase],[ParentServer],[ID],[Name],[Description],[SiteID])
SELECT @CubeDimensionId,@AttributeId,@Type,@Usage,@Source,@EstimatedCount,
(
SELECT DSVT.DSVTableColumnID
  FROM DataSourceViewTablecolumns DSVT
  JOIN DataSourceView DSV
    ON DSVT.DataSourceViewId = DSV.DataSourceViewId
  JOIN DataSource DS
    ON DS.DataSourceId = DSV.DataSourceId
  JOIN Databases DB
    ON DB.DatabaseId = DS.DatabaseId
  JOIN [Cube] CU
    ON CU.DatabaseId = DB.DatabaseId
  JOIN [CubeDimension] CD
    ON CD.CubeId = CU.CubeId
 WHERE DSVT.[Table] = @NameTable
   AND DSVT.ColumnName = @NameCol
   AND CD.CubeDimensionId = @CubeDimensionId
)
,

@DiscretizationMethod,@DiscretizationBucketCount,@RootMemberIf,@OrderBy,@DefaultMember,
@OrderByAttributeID,@SkippedLevelsColumn,@NamingTemplate,@NamingTemplateTranslations,
@MembersWithData,@MembersWithDataCaption,@CustomRollupColumn,@CustomRollupPropertiesColumn,@UnaryOperatorColumn,

(
SELECT DSVT.DSVTableColumnID
  FROM DataSourceViewTablecolumns DSVT
  JOIN DataSourceView DSV
    ON DSVT.DataSourceViewId = DSV.DataSourceViewId
  JOIN DataSource DS
    ON DS.DataSourceId = DSV.DataSourceId
  JOIN Databases DB
    ON DB.DatabaseId = DS.DatabaseId
  JOIN [Cube] CU
    ON CU.DatabaseId = DB.DatabaseId
  JOIN [CubeDimension] CD
    ON CD.CubeId = CU.CubeId
 WHERE DSVT.[Table] = @ValueTable
   AND DSVT.ColumnName = @ValueCol
   AND CD.CubeDimensionId = @CubeDimensionId
),

@AttributeHierarchyOrdered,@MemberNamesUnique,@IsAggregatable,
@AttributeHierarchyEnabled,@AttributeHierarchyOptimizedState,@AttributeHierarchyVisible,
@AttributeHierarchyDisplayFolder,@KeyUniquenessGuarantee,@GroupingBehavior,@InstanceSelection,
@ProcessingState,@AttributeHierarchyProcessingState,@FormatString,@VisualizationProperties,
@OrderByAttribute,@Parent,@ParentDatabase,@ParentServer,@ID,@Name,@Description,@SiteID
 

 
GO
