IF OBJECT_ID('sp_AMODBProactiveCaching','P') IS NOT NULL
DROP PROC sp_AMODBProactiveCaching
GO
CREATE PROCEDURE sp_AMODBProactiveCaching@PartitionId                 int = NULL,@SilenceInterval             nvarchar(500) = NULL,@Latency                     nvarchar(500) = NULL,@SilenceOverrideInterval     nvarchar(500) = NULL,@ForceRebuildInterval        nvarchar(500) = NULL,@Enabled                     nvarchar(500) = NULL,@OnlineMode                  nvarchar(500) = NULL,@AggregationStorage          nvarchar(500) = NULL,@Source                      nvarchar(500) = NULLAS
DECLARE @ProactiveCachingId INT
SELECT @ProactiveCachingId=ISNULL(MAX(ProactiveCachingId),0) + 1 FROM dbo.ProactiveCaching
 
INSERT INTO dbo.ProactiveCaching([ProactiveCachingId],[PartitionId],[SilenceInterval],[Latency],[SilenceOverrideInterval],[ForceRebuildInterval],[Enabled],[OnlineMode],[AggregationStorage],[Source])SELECT @ProactiveCachingId,@PartitionId,@SilenceInterval,@Latency,@SilenceOverrideInterval,
@ForceRebuildInterval,@Enabled,@OnlineMode,@AggregationStorage,@Source
 

 
GO
