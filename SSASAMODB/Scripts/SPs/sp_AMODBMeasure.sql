IF OBJECT_ID('sp_AMODBMeasure','P') IS NOT NULL
DROP PROC sp_AMODBMeasure
GO
CREATE PROCEDURE sp_AMODBMeasure@MeasureId             int OUTPUT,@MeasureGroupId        int = NULL,@ID                    nvarchar(500) = NULL,@Name                  nvarchar(500) = NULL,@IsLinked              nvarchar(500) = NULL,@AggregateFunction     nvarchar(500) = NULL,@DataType              nvarchar(500) = NULL,@Source                nvarchar(500) = NULL,@Visible               nvarchar(500) = NULL,@DisplayFolder         nvarchar(500) = NULL,@FormatString          nvarchar(500) = NULL,@BackColor             nvarchar(500) = NULL,@ForeColor             nvarchar(500) = NULL,@FontName              nvarchar(500) = NULL,@FontSize              nvarchar(500) = NULL,@FontFlags             nvarchar(500) = NULL,@MeasureExpression     nvarchar(500) = NULL,@Parent                nvarchar(500) = NULL,@ParentCube            nvarchar(500) = NULL,@ParentDatabase        nvarchar(500) = NULL,@ParentServer          nvarchar(500) = NULL,@Description           nvarchar(500) = NULL,@SiteID                nvarchar(500) = NULLAS
SELECT @MeasureId = ISNULL(MAX(MeasureId) ,0) + 1  FROM dbo.MeasureINSERT INTO dbo.Measure([MeasureId],[MeasureGroupId],[ID],[Name],[IsLinked],[AggregateFunction],[DataType],[Source],[Visible],[DisplayFolder],[FormatString],[BackColor],[ForeColor],[FontName],[FontSize],[FontFlags],[MeasureExpression],[Parent],[ParentCube],[ParentDatabase],[ParentServer],[Description],[SiteID])SELECT @MeasureId,@MeasureGroupId,@ID,@Name,@IsLinked,@AggregateFunction,@DataType,@Source,
@Visible,@DisplayFolder,@FormatString,@BackColor,@ForeColor,@FontName,@FontSize,@FontFlags,
@MeasureExpression,@Parent,@ParentCube,@ParentDatabase,@ParentServer,@Description,@SiteID
 

 
GO
