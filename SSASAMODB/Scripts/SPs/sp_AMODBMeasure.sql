IF OBJECT_ID('sp_AMODBMeasure','P') IS NOT NULL
DROP PROC sp_AMODBMeasure
GO
CREATE PROCEDURE sp_AMODBMeasure
SELECT @MeasureId = ISNULL(MAX(MeasureId) ,0) + 1
@Visible,@DisplayFolder,@FormatString,@BackColor,@ForeColor,@FontName,@FontSize,@FontFlags,
@MeasureExpression,@Parent,@ParentCube,@ParentDatabase,@ParentServer,@Description,@SiteID
 

 
GO