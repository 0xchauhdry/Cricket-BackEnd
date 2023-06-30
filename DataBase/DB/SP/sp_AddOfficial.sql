IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddOfficial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddOfficial]
GO

/*
Script type: SP
Created by: Ali Akbar
Created Date: 05/11/2023
Purpose: to add new official to the Officials table
*/

CREATE PROCEDURE [dbo].[sp_AddOfficial]
	@Name VARCHAR (50),
	@Role VARCHAR(50)
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Officials]') AND type in (N'U'))
	BEGIN
		INSERT INTO Officials (
			[Name],
			[Role])
		VALUES (
			@Name,
			@Role)
			
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO 