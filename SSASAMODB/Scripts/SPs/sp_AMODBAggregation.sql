IF OBJECT_ID('sp_AMODBAggregation','P') IS NOT NULL
DROP PROC sp_AMODBAggregation
GO
CREATE PROCEDURE sp_AMODBAggregation@AggregationId           int OUTPUT,@AggregationDesignId     int = NULL,@ID                      nvarchar(500) = NULL,@Name                    nvarchar(500) = NULL,@Parent                  nvarchar(500) = NULL,@ParentMeasureGroup      nvarchar(500) = NULL,@ParentCube              nvarchar(500) = NULL,@ParentDatabase          nvarchar(500) = NULL,@ParentServer            nvarchar(500) = NULL,@Description             nvarchar(500) = NULL,@SiteID                  nvarchar(500) = NULLAS
SELECT @AggregationId = ISNULL(MAX(AggregationID),0) + 1 FROM dbo.Aggregation 
INSERT INTO dbo.Aggregation([AggregationId],[AggregationDesignId],[ID],[Name],[Parent],[ParentMeasureGroup],[ParentCube],[ParentDatabase],[ParentServer],[Description],[SiteID])SELECT @AggregationId,@AggregationDesignId,@ID,@Name,@Parent,@ParentMeasureGroup,@ParentCube,
@ParentDatabase,@ParentServer,@Description,@SiteID
 

 
GO
