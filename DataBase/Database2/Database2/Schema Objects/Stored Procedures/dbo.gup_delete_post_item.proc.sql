﻿CREATE PROCEDURE [dbo].[gup_delete_post_item]
	@UnitUID	bigint	
,	@iOK		int = 0
AS
SET NOCOUNT ON;

DECLARE @sdtNow	smalldatetime
SELECT	@sdtNow	= DATEADD(MI, 1, GETDATE())

BEGIN TRAN
	
	UPDATE dbo.GPost
		SET DELDATE = @sdtNow
			WHERE ToUnitUID = @UnitUID
	IF @@ERROR <> 0
		BEGIN	SELECT	@iOK = -1	GOTO FAIL_TRAN	END

COMMIT TRAN

GOTO END_PROC

FAIL_TRAN:
ROLLBACK TRAN

END_PROC:
SELECT @iOK

