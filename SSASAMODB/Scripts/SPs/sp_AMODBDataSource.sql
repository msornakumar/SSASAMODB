IF OBJECT_ID('sp_AMODBDataSource','P') IS NOT NULL
DROP PROC sp_AMODBDataSource
GO
CREATE PROCEDURE sp_AMODBDataSource
@DataSourceId                 int OUTPUT,
@DatabaseId                   int = NULL,
@ConnectionString             nvarchar(500) = NULL,
@ConnectionStringSecurity     nvarchar(500) = NULL,
@Isolation                    nvarchar(500) = NULL,
@ManagedProvider              nvarchar(500) = NULL,
@Timeout                      nvarchar(500) = NULL,
@MaxActiveConnections         nvarchar(500) = NULL,
@Parent                       nvarchar(500) = NULL,
@ParentServer                 nvarchar(500) = NULL,
@IsLoaded                     nvarchar(500) = NULL,
@CreatedTimestamp             nvarchar(500) = NULL,
@LastSchemaUpdate             nvarchar(500) = NULL,
@Description                  nvarchar(500) = NULL,
@ID                           nvarchar(500) = NULL,
@Name                         nvarchar(500) = NULL,
@SiteID                       nvarchar(500) = NULL
AS

SELECT @DataSourceId =ISNULL(MAX(DataSourceId),0) + 1 FROM dbo.DataSource

 
INSERT INTO dbo.DataSource
(DataSourceId,DatabaseId,ConnectionString,ConnectionStringSecurity,Isolation,ManagedProvider,Timeout,
MaxActiveConnections,Parent,ParentServer,IsLoaded,CreatedTimestamp,LastSchemaUpdate,Description,ID,Name,SiteID)
SELECT @DataSourceId,@DatabaseId,@ConnectionString,@ConnectionStringSecurity,@Isolation,@ManagedProvider,@Timeout,
@MaxActiveConnections,@Parent,@ParentServer,@IsLoaded,@CreatedTimestamp,@LastSchemaUpdate,@Description,@ID,@Name,@SiteID
 

 
GO
