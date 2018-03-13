IF OBJECT_ID('sp_AMODBDeleteMetadata','P') IS NOT NULL
	DROP PROCEDURE sp_AMODBDeleteMetadata
GO
CREATE PROCEDURE sp_AMODBDeleteMetadata
 @ServerName sysname
,@DbName sysname
,@CubeName sysname

AS

IF @ServerName <> '' AND @DbName = '' AND @CubeName = ''
BEGIN
			DELETE [dbo].[AggregationDimension]
		 FROM [dbo].[AggregationDimension]
		JOIN [dbo].[Aggregation] 
		 ON  [dbo].[Aggregation].[AggregationId] =  [dbo].[AggregationDimension].[AggregationId]
		JOIN [dbo].[AggregationDesign] 
		 ON  [dbo].[AggregationDesign].[AggregationDesignId] =  [dbo].[Aggregation].[AggregationDesignId]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[AggregationDesign].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[ProactiveCaching]
		 FROM [dbo].[ProactiveCaching]
		JOIN [dbo].[Partition] 
		 ON  [dbo].[Partition].[PartitionId] =  [dbo].[ProactiveCaching].[PartitionId]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[Partition].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[Aggregation]
		 FROM [dbo].[Aggregation]
		JOIN [dbo].[AggregationDesign] 
		 ON  [dbo].[AggregationDesign].[AggregationDesignId] =  [dbo].[Aggregation].[AggregationDesignId]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[AggregationDesign].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[AttributeRelationship]
		 FROM [dbo].[AttributeRelationship]
		JOIN [dbo].[DimensionAttribute] 
		 ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[AttributeRelationship].[AttributeID]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)

		 DELETE [dbo].[AttributeRelationship]
		 FROM [dbo].[AttributeRelationship]
		JOIN [dbo].[DimensionAttribute] 
		  ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[AttributeRelationship].[ParentAttributeID]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)



		DELETE [dbo].[AttributeKeyColumns]
		 FROM [dbo].[AttributeKeyColumns]
		JOIN [dbo].[DimensionAttribute] 
		 ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[AttributeKeyColumns].[AttributeID]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[HierarchyLevel]
		 FROM [dbo].[HierarchyLevel]
		JOIN [dbo].[DimensionAttribute] 
		 ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[HierarchyLevel].[SourceAttributeId]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[HierarchyLevel]
		 FROM [dbo].[HierarchyLevel]
		JOIN [dbo].[Hierarchy] 
		 ON  [dbo].[Hierarchy].[HierarchyId] =  [dbo].[HierarchyLevel].[HierarchyId]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[Hierarchy].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[AttributeKeyColumns]
		 FROM [dbo].[AttributeKeyColumns]
		JOIN [dbo].[DataSourceViewTablecolumns] 
		 ON  [dbo].[DataSourceViewTablecolumns].[DSVTableColumnID] =  [dbo].[AttributeKeyColumns].[DSVTableColumnID]
		JOIN [dbo].[DataSourceView] 
		 ON  [dbo].[DataSourceView].[DataSourceViewId] =  [dbo].[DataSourceViewTablecolumns].[DataSourceViewId]
		JOIN [dbo].[DataSource] 
		 ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[ProactiveCaching]
		 FROM [dbo].[ProactiveCaching]
		JOIN [dbo].[Partition] 
		 ON  [dbo].[Partition].[PartitionId] =  [dbo].[ProactiveCaching].[PartitionId]
		JOIN [dbo].[DataSourceView] 
		 ON  [dbo].[DataSourceView].[DataSourceViewId] =  [dbo].[Partition].[DataSourceViewId]
		JOIN [dbo].[DataSource] 
		 ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[AggregationDesign]
		 FROM [dbo].[AggregationDesign]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[AggregationDesign].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[Partition]
		 FROM [dbo].[Partition]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[Partition].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[MeasureGroupDimension]
		 FROM [dbo].[MeasureGroupDimension]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[MeasureGroupDimension].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[Measure]
		 FROM [dbo].[Measure]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[Measure].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[KPI]
		 FROM [dbo].[KPI]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[KPI].[AssociatedMeasureGroupID]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[AggregationDimension]
		 FROM [dbo].[AggregationDimension]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[AggregationDimension].[DimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[MeasureGroupDimension]
		 FROM [dbo].[MeasureGroupDimension]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[MeasureGroupDimension].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[Hierarchy]
		 FROM [dbo].[Hierarchy]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[Hierarchy].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[DimensionAttribute]
		 FROM [dbo].[DimensionAttribute]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[Partition]
		 FROM [dbo].[Partition]
		JOIN [dbo].[DataSourceView] 
		 ON  [dbo].[DataSourceView].[DataSourceViewId] =  [dbo].[Partition].[DataSourceViewId]
		JOIN [dbo].[DataSource] 
		 ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[DataSourceViewTablecolumns]
		 FROM [dbo].[DataSourceViewTablecolumns]
		JOIN [dbo].[DataSourceView] 
		 ON  [dbo].[DataSourceView].[DataSourceViewId] =  [dbo].[DataSourceViewTablecolumns].[DataSourceViewId]
		JOIN [dbo].[DataSource] 
		 ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[KPI]
		 FROM [dbo].[KPI]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[KPI].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[CubeDimension]
		 FROM [dbo].[CubeDimension]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[MeasureGroup]
		 FROM [dbo].[MeasureGroup]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[DataSourceView]
		 FROM [dbo].[DataSourceView]
		JOIN [dbo].[DataSource] 
		 ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[DataSource]
		 FROM [dbo].[DataSource]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[Cube]
		 FROM [dbo].[Cube]
		JOIN [dbo].[Databases] 
		 ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE [dbo].[Databases]
		 FROM [dbo].[Databases]
		JOIN [dbo].[Server] 
		 ON  [dbo].[Server].[ServerId] =  [dbo].[Databases].[ServerId]
		 WHERE ([Server].[ID] = @ServerName)


		DELETE FROM [dbo].[Server] WHERE [Server].[ID] = @ServerName



END

IF @ServerName <> '' AND @DbName <> '' AND @CubeName = ''
BEGIN

		DELETE [dbo].[AggregationDimension]
			FROM [dbo].[AggregationDimension]
		JOIN [dbo].[Aggregation] 
			ON  [dbo].[Aggregation].[AggregationId] =  [dbo].[AggregationDimension].[AggregationId]
		JOIN [dbo].[AggregationDesign] 
			ON  [dbo].[AggregationDesign].[AggregationDesignId] =  [dbo].[Aggregation].[AggregationDesignId]
		JOIN [dbo].[MeasureGroup] 
			ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[AggregationDesign].[MeasureGroupId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[ProactiveCaching]
			FROM [dbo].[ProactiveCaching]
		JOIN [dbo].[Partition] 
			ON  [dbo].[Partition].[PartitionId] =  [dbo].[ProactiveCaching].[PartitionId]
		JOIN [dbo].[MeasureGroup] 
			ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[Partition].[MeasureGroupId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[Aggregation]
			FROM [dbo].[Aggregation]
		JOIN [dbo].[AggregationDesign] 
			ON  [dbo].[AggregationDesign].[AggregationDesignId] =  [dbo].[Aggregation].[AggregationDesignId]
		JOIN [dbo].[MeasureGroup] 
			ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[AggregationDesign].[MeasureGroupId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[AttributeRelationship]
			FROM [dbo].[AttributeRelationship]
		JOIN [dbo].[DimensionAttribute] 
			ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[AttributeRelationship].[AttributeID]
		JOIN [dbo].[CubeDimension] 
			ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


	  DELETE [dbo].[AttributeRelationship]
			FROM [dbo].[AttributeRelationship]
		JOIN [dbo].[DimensionAttribute] 
			ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[AttributeRelationship].[ParentAttributeID]
		JOIN [dbo].[CubeDimension] 
			ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)

		DELETE [dbo].[AttributeKeyColumns]
			FROM [dbo].[AttributeKeyColumns]
		JOIN [dbo].[DimensionAttribute] 
			ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[AttributeKeyColumns].[AttributeID]
		JOIN [dbo].[CubeDimension] 
			ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[HierarchyLevel]
			FROM [dbo].[HierarchyLevel]
		JOIN [dbo].[DimensionAttribute] 
			ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[HierarchyLevel].[SourceAttributeId]
		JOIN [dbo].[CubeDimension] 
			ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[HierarchyLevel]
			FROM [dbo].[HierarchyLevel]
		JOIN [dbo].[Hierarchy] 
			ON  [dbo].[Hierarchy].[HierarchyId] =  [dbo].[HierarchyLevel].[HierarchyId]
		JOIN [dbo].[CubeDimension] 
			ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[Hierarchy].[CubeDimensionId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[AttributeKeyColumns]
			FROM [dbo].[AttributeKeyColumns]
		JOIN [dbo].[DataSourceViewTablecolumns] 
			ON  [dbo].[DataSourceViewTablecolumns].[DSVTableColumnID] =  [dbo].[AttributeKeyColumns].[DSVTableColumnID]
		JOIN [dbo].[DataSourceView] 
			ON  [dbo].[DataSourceView].[DataSourceViewId] =  [dbo].[DataSourceViewTablecolumns].[DataSourceViewId]
		JOIN [dbo].[DataSource] 
			ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[ProactiveCaching]
			FROM [dbo].[ProactiveCaching]
		JOIN [dbo].[Partition] 
			ON  [dbo].[Partition].[PartitionId] =  [dbo].[ProactiveCaching].[PartitionId]
		JOIN [dbo].[DataSourceView] 
			ON  [dbo].[DataSourceView].[DataSourceViewId] =  [dbo].[Partition].[DataSourceViewId]
		JOIN [dbo].[DataSource] 
			ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[AggregationDesign]
			FROM [dbo].[AggregationDesign]
		JOIN [dbo].[MeasureGroup] 
			ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[AggregationDesign].[MeasureGroupId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[Partition]
			FROM [dbo].[Partition]
		JOIN [dbo].[MeasureGroup] 
			ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[Partition].[MeasureGroupId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[MeasureGroupDimension]
			FROM [dbo].[MeasureGroupDimension]
		JOIN [dbo].[MeasureGroup] 
			ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[MeasureGroupDimension].[MeasureGroupId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[Measure]
			FROM [dbo].[Measure]
		JOIN [dbo].[MeasureGroup] 
			ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[Measure].[MeasureGroupId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[KPI]
			FROM [dbo].[KPI]
		JOIN [dbo].[MeasureGroup] 
			ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[KPI].[AssociatedMeasureGroupID]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[AggregationDimension]
			FROM [dbo].[AggregationDimension]
		JOIN [dbo].[CubeDimension] 
			ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[AggregationDimension].[DimensionId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[MeasureGroupDimension]
			FROM [dbo].[MeasureGroupDimension]
		JOIN [dbo].[CubeDimension] 
			ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[MeasureGroupDimension].[CubeDimensionId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[Hierarchy]
			FROM [dbo].[Hierarchy]
		JOIN [dbo].[CubeDimension] 
			ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[Hierarchy].[CubeDimensionId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[DimensionAttribute]
			FROM [dbo].[DimensionAttribute]
		JOIN [dbo].[CubeDimension] 
			ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[Partition]
			FROM [dbo].[Partition]
		JOIN [dbo].[DataSourceView] 
			ON  [dbo].[DataSourceView].[DataSourceViewId] =  [dbo].[Partition].[DataSourceViewId]
		JOIN [dbo].[DataSource] 
			ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[DataSourceViewTablecolumns]
			FROM [dbo].[DataSourceViewTablecolumns]
		JOIN [dbo].[DataSourceView] 
			ON  [dbo].[DataSourceView].[DataSourceViewId] =  [dbo].[DataSourceViewTablecolumns].[DataSourceViewId]
		JOIN [dbo].[DataSource] 
			ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[KPI]
			FROM [dbo].[KPI]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[KPI].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[CubeDimension]
			FROM [dbo].[CubeDimension]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[MeasureGroup]
			FROM [dbo].[MeasureGroup]
		JOIN [dbo].[Cube] 
			ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[DataSourceView]
			FROM [dbo].[DataSourceView]
		JOIN [dbo].[DataSource] 
			ON  [dbo].[DataSource].[DataSourceId] =  [dbo].[DataSourceView].[DataSourceId]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[Cube]
			FROM [dbo].[Cube]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[Cube].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE [dbo].[DataSource]
			FROM [dbo].[DataSource]
		JOIN [dbo].[Databases] 
			ON  [dbo].[Databases].[DatabaseId] =  [dbo].[DataSource].[DatabaseId]
			WHERE (Databases.Name = @DBName)


		DELETE FROM [dbo].[Databases] WHERE Databases.Name = @DBName


END

IF @ServerName <> '' AND @DbName <> '' AND @CubeName <> ''
BEGIN
	
			DELETE [dbo].[AggregationDimension]
		 FROM [dbo].[AggregationDimension]
		JOIN [dbo].[Aggregation] 
		 ON  [dbo].[Aggregation].[AggregationId] =  [dbo].[AggregationDimension].[AggregationId]
		JOIN [dbo].[AggregationDesign] 
		 ON  [dbo].[AggregationDesign].[AggregationDesignId] =  [dbo].[Aggregation].[AggregationDesignId]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[AggregationDesign].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[ProactiveCaching]
		 FROM [dbo].[ProactiveCaching]
		JOIN [dbo].[Partition] 
		 ON  [dbo].[Partition].[PartitionId] =  [dbo].[ProactiveCaching].[PartitionId]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[Partition].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[Aggregation]
		 FROM [dbo].[Aggregation]
		JOIN [dbo].[AggregationDesign] 
		 ON  [dbo].[AggregationDesign].[AggregationDesignId] =  [dbo].[Aggregation].[AggregationDesignId]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[AggregationDesign].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[AttributeRelationship]
		 FROM [dbo].[AttributeRelationship]
		JOIN [dbo].[DimensionAttribute] 
		 ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[AttributeRelationship].[AttributeID]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)

		DELETE [dbo].[AttributeRelationship]
		 FROM [dbo].[AttributeRelationship]
		JOIN [dbo].[DimensionAttribute] 
		 ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[AttributeRelationship].[ParentAttributeID]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)

		DELETE [dbo].[AttributeKeyColumns]
		 FROM [dbo].[AttributeKeyColumns]
		JOIN [dbo].[DimensionAttribute] 
		 ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[AttributeKeyColumns].[AttributeID]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[HierarchyLevel]
		 FROM [dbo].[HierarchyLevel]
		JOIN [dbo].[DimensionAttribute] 
		 ON  [dbo].[DimensionAttribute].[AttributeId] =  [dbo].[HierarchyLevel].[SourceAttributeId]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[HierarchyLevel]
		 FROM [dbo].[HierarchyLevel]
		JOIN [dbo].[Hierarchy] 
		 ON  [dbo].[Hierarchy].[HierarchyId] =  [dbo].[HierarchyLevel].[HierarchyId]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[Hierarchy].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[AggregationDesign]
		 FROM [dbo].[AggregationDesign]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[AggregationDesign].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[Partition]
		 FROM [dbo].[Partition]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[Partition].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[MeasureGroupDimension]
		 FROM [dbo].[MeasureGroupDimension]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[MeasureGroupDimension].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[Measure]
		 FROM [dbo].[Measure]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[Measure].[MeasureGroupId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[KPI]
		 FROM [dbo].[KPI]
		JOIN [dbo].[MeasureGroup] 
		 ON  [dbo].[MeasureGroup].[MeasureGroupId] =  [dbo].[KPI].[AssociatedMeasureGroupID]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[AggregationDimension]
		 FROM [dbo].[AggregationDimension]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[AggregationDimension].[DimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[MeasureGroupDimension]
		 FROM [dbo].[MeasureGroupDimension]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[MeasureGroupDimension].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[Hierarchy]
		 FROM [dbo].[Hierarchy]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[Hierarchy].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[DimensionAttribute]
		 FROM [dbo].[DimensionAttribute]
		JOIN [dbo].[CubeDimension] 
		 ON  [dbo].[CubeDimension].[CubeDimensionId] =  [dbo].[DimensionAttribute].[CubeDimensionId]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[CubeDimension]
		 FROM [dbo].[CubeDimension]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[CubeDimension].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[MeasureGroup]
		 FROM [dbo].[MeasureGroup]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[MeasureGroup].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE [dbo].[KPI]
		 FROM [dbo].[KPI]
		JOIN [dbo].[Cube] 
		 ON  [dbo].[Cube].[CubeId] =  [dbo].[KPI].[CubeId]
		 WHERE ([Cube].[ID] = @CubeName)


		DELETE FROM [dbo].[Cube] WHERE [Cube].[ID] = @CubeName

END

go
