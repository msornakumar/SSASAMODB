IF OBJECT_ID('sp_AMODBKPI','P') IS NOT NULL
DROP PROC sp_AMODBKPI
GO
CREATE PROCEDURE sp_AMODBKPI
@CubeId                       int = NULL,
@ID                           nvarchar(500) = NULL,
@Name                         nvarchar(500) = NULL,
@DisplayFolder                nvarchar(500) = NULL,
@AssociatedMeasureGroupID     nvarchar(500) = NULL,
@Value                        nvarchar(500) = NULL,
@Goal                         nvarchar(500) = NULL,
@Status                       nvarchar(500) = NULL,
@Trend                        nvarchar(500) = NULL,
@Weight                       nvarchar(500) = NULL,
@TrendGraphic                 nvarchar(500) = NULL,
@StatusGraphic                nvarchar(500) = NULL,
@CurrentTimeMember            nvarchar(500) = NULL,
@ParentKpiID                  nvarchar(500) = NULL,
@Parent                       nvarchar(500) = NULL,
@ParentDatabase               nvarchar(500) = NULL,
@ParentServer                 nvarchar(500) = NULL,
@Description                  nvarchar(500) = NULL,
@SiteID                       nvarchar(500) = NULL
AS

DECLARE @KPIId int

SELECT @KPIId = ISNULL(MAX(KPIId),0 ) + 1 FROM dbo.KPI

 
INSERT INTO dbo.KPI
([KPIId],[CubeId],[ID],[Name],[DisplayFolder],[AssociatedMeasureGroupID],[Value],[Goal],
[Status],[Trend],[Weight],[TrendGraphic],[StatusGraphic],[CurrentTimeMember],[ParentKpiID],[Parent],
[ParentDatabase],[ParentServer],[Description],[SiteID])
SELECT @KPIId,@CubeId,@ID,@Name,@DisplayFolder,
(SELECT MeasureGroupId
   FROM MeasureGroup
  WHERE [ID] = @AssociatedMeasureGroupID
    AND CubeId = @CubeId )
,@Value,@Goal,
@Status,@Trend,@Weight,@TrendGraphic,@StatusGraphic,@CurrentTimeMember,@ParentKpiID,@Parent,
@ParentDatabase,@ParentServer,@Description,@SiteID
 

 
GO
