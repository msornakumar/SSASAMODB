IF OBJECT_ID('sp_AMODBServer','P') IS NOT NULL
DROP PROC sp_AMODBServer
GO
CREATE PROCEDURE sp_AMODBServer
@ServerName     sysname = NULL
,@ServerId       int OUTPUT
AS

	SELECT @ServerId = isnull(MAX(ServerID),0) + 1
	  FROM [Server]
 
	INSERT INTO dbo.Server
	(Id,Name)
	SELECT @ServerId,@ServerName
 

 
GO
