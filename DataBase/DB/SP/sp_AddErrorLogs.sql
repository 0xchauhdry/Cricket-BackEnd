IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddErrorLogs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddErrorLogs]
GO 

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/30/2023
Purpose: to insert error logs
*/

CREATE PROCEDURE [dbo].[sp_AddErrorLogs]  
    @ModuleId INT,
	@Module VARCHAR (50),
	@ErrorIn VARCHAR(50),
	@ErrorMessage VARCHAR(max)
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLogs]') AND type in (N'U'))
	BEGIN
		INSERT INTO ErrorLogs (
			Module,
			ModuleId,
			ErrorIn,
			ErrorMessage)
		VALUES (
			@Module,
			@ModuleId,
			@ErrorIn,
			@ErrorMessage)
			
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO 