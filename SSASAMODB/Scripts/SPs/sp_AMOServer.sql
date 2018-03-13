IF OBJECT_ID('sp_AMODBServer','P') IS NOT NULL
DROP PROC sp_AMODBServer
GO
CREATE PROCEDURE sp_AMODBServer
@ServerId             int OUTPUT,
@ID                   nvarchar(500) = NULL,
@Name                 nvarchar(500) = NULL,
@ConnectionString     nvarchar(500) = NULL,
@ConnectionInfo       nvarchar(500) = NULL,
@SessionID            nvarchar(500) = NULL,
@CaptureXml           nvarchar(500) = NULL,
@CaptureLog           nvarchar(500) = NULL,
@Connected            nvarchar(500) = NULL,
@SessionTrace         nvarchar(500) = NULL,
@Version              nvarchar(500) = NULL,
@Edition              nvarchar(500) = NULL,
@EditionID            nvarchar(500) = NULL,
@ProductLevel         nvarchar(500) = NULL,
@ProductName          nvarchar(500) = NULL,
@ServerMode           nvarchar(500) = NULL,
@IsLoaded             nvarchar(500) = NULL,
@CreatedTimestamp     nvarchar(500) = NULL,
@LastSchemaUpdate     nvarchar(500) = NULL,
@Description          nvarchar(500) = NULL,
@SiteID               nvarchar(500) = NULL,
@Parent               nvarchar(500) = NULL
AS

IF EXISTS (SELECT 1 FROM dbo.Server
WHERE ID                   = @ID
 )
BEGIN
 
UPDATE dbo.Server
   SET ID                   = @ID,
       Name                 = @Name,
       ConnectionString     = @ConnectionString,
       ConnectionInfo       = @ConnectionInfo,
       SessionID            = @SessionID,
       CaptureXml           = @CaptureXml,
       CaptureLog           = @CaptureLog,
       Connected            = @Connected,
       SessionTrace         = @SessionTrace,
       Version              = @Version,
       Edition              = @Edition,
       EditionID            = @EditionID,
       ProductLevel         = @ProductLevel,
       ProductName          = @ProductName,
       ServerMode           = @ServerMode,
       IsLoaded             = @IsLoaded,
       CreatedTimestamp     = @CreatedTimestamp,
       LastSchemaUpdate     = @LastSchemaUpdate,
       Description          = @Description,
       SiteID               = @SiteID,
       Parent               = @Parent
 WHERE ID                   = @ID
 
    SELECT @ServerId = ServerId
	  FROM [Server]
	  WHERE ID       = @ID
 
END
ELSE
BEGIN

	SELECT @ServerId = ISNULL(MAX(ServerId),0) + 1
	  FROM [Server]
 
	INSERT INTO dbo.Server
	([ServerId],[ID],[Name],[ConnectionString],[ConnectionInfo],[SessionID],[CaptureXml],[CaptureLog],
	[Connected],[SessionTrace],[Version],[Edition],[EditionID],[ProductLevel],[ProductName],[ServerMode],
	[IsLoaded],[CreatedTimestamp],[LastSchemaUpdate],[Description],[SiteID],[Parent])
	SELECT @ServerId,@ID,@Name,@ConnectionString,@ConnectionInfo,@SessionID,@CaptureXml,@CaptureLog,
	@Connected,@SessionTrace,@Version,@Edition,@EditionID,@ProductLevel,@ProductName,@ServerMode,
	@IsLoaded,@CreatedTimestamp,@LastSchemaUpdate,@Description,@SiteID,@Parent
 
END
 
GO
