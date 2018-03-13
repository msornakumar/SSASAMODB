IF OBJECT_ID('sp_AMODBDataSourceView','P') IS NOT NULL
DROP PROC sp_AMODBDataSourceView
GO
CREATE PROCEDURE sp_AMODBDataSourceView
@DataSourceViewId     int OUTPUT,
@DataSourceName       nvarchar(500),
@DatabaseId			  int,
@Schema               nvarchar(500) = NULL,
@Parent               nvarchar(500) = NULL,
@ParentServer         nvarchar(500) = NULL,
@IsLoaded             nvarchar(500) = NULL,
@CreatedTimestamp     nvarchar(500) = NULL,
@LastSchemaUpdate     nvarchar(500) = NULL,
@Description          nvarchar(500) = NULL,
@ID                   nvarchar(500) = NULL,
@Name                 nvarchar(500) = NULL,
@SiteID               nvarchar(500) = NULL
AS

SELECT @DataSourceViewId = ISNULL(MAX(DataSourceViewId),0)+1
  FROM dbo.DataSourceView
 
INSERT INTO dbo.DataSourceView
(DataSourceViewId,DataSourceId,[Schema],Parent,ParentServer,IsLoaded,CreatedTimestamp,LastSchemaUpdate,
Description,ID,Name,SiteID)
SELECT @DataSourceViewId,
(SELECT DataSourceId 
   FROM DataSource 
  WHERE [ID] = @DataSourceName
    AND Databaseid = @DatabaseId),@Schema,@Parent,@ParentServer,@IsLoaded,@CreatedTimestamp,@LastSchemaUpdate,
@Description,@ID,@Name,@SiteID
 

 
GO

