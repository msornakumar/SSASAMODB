 
IF OBJECT_ID('sp_AMODBDatabases','P') IS NOT NULL
DROP PROC sp_AMODBDatabases
GO
CREATE PROCEDURE sp_AMODBDatabases
@DatabaseId             int OUTPUT,
@ServerId               int = NULL,
@LastUpdate             nvarchar(500) = NULL,
@AggregationPrefix      nvarchar(500) = NULL,
@ProcessingPriority     nvarchar(500) = NULL,
@EstimatedSize          nvarchar(500) = NULL,
@Visible                nvarchar(500) = NULL,
@Language               nvarchar(500) = NULL,
@Collation              nvarchar(500) = NULL,
@MasterDataSourceID     nvarchar(500) = NULL,
@ReadWriteMode          nvarchar(500) = NULL,
@DbStorageLocation      nvarchar(500) = NULL,
@ImagePath              nvarchar(500) = NULL,
@ImageUniqueID          nvarchar(500) = NULL,
@ImageVersion           nvarchar(500) = NULL,
@ImageUrl               nvarchar(500) = NULL,
@StorageEngineUsed      nvarchar(500) = NULL,
@CompatibilityLevel     nvarchar(500) = NULL,
@DirectQueryMode        nvarchar(500) = NULL,
@Parent                 nvarchar(500) = NULL,
@LastProcessed          nvarchar(500) = NULL,
@State                  nvarchar(500) = NULL,
@IsLoaded               nvarchar(500) = NULL,
@CreatedTimestamp       nvarchar(500) = NULL,
@LastSchemaUpdate       nvarchar(500) = NULL,
@Description            nvarchar(500) = NULL,
@ID                     nvarchar(500) = NULL,
@Name                   nvarchar(500) = NULL,
@SiteID                 nvarchar(500) = NULL
AS

	SELECT @DatabaseId = ISNULL(MAX(DatabaseId),0)+1
	  FROM Databases


	INSERT INTO dbo.Databases
	(DatabaseId,ServerId,LastUpdate,AggregationPrefix,ProcessingPriority,EstimatedSize,Visible,Language
	,Collation,MasterDataSourceID,ReadWriteMode,DbStorageLocation,ImagePath,ImageUniqueID,ImageVersion,ImageUrl
	,StorageEngineUsed,CompatibilityLevel,DirectQueryMode,Parent,LastProcessed,State,IsLoaded,CreatedTimestamp
	,LastSchemaUpdate,Description,ID,Name,SiteID)
	SELECT @DatabaseId,@ServerId,@LastUpdate,@AggregationPrefix,@ProcessingPriority,@EstimatedSize,@Visible,@Language
	,@Collation,@MasterDataSourceID,@ReadWriteMode,@DbStorageLocation,@ImagePath,@ImageUniqueID,@ImageVersion,@ImageUrl
	,@StorageEngineUsed,@CompatibilityLevel,@DirectQueryMode,@Parent,@LastProcessed,@State,@IsLoaded,@CreatedTimestamp
	,@LastSchemaUpdate,@Description,@ID,@Name,@SiteID
 

 
GO

