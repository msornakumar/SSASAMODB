IF OBJECT_ID('sp_AMODBProactiveCaching','P') IS NOT NULL
DROP PROC sp_AMODBProactiveCaching
GO
CREATE PROCEDURE sp_AMODBProactiveCaching
DECLARE @ProactiveCachingId INT

 
INSERT INTO dbo.ProactiveCaching
@ForceRebuildInterval,@Enabled,@OnlineMode,@AggregationStorage,@Source
 

 
GO