IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddExtraType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddExtraType]
GO

/*
Script type: SP
Created by: Ali Akbar
Created Date: 05/11/2023
Purpose: to add new Extra Type to the ExtraType table
*/

CREATE PROCEDURE [dbo].[sp_AddExtraType]
	@Name VARCHAR (50)
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExtraType]') AND type in (N'U'))
	BEGIN
		INSERT INTO ExtraType ([Name])
		VALUES (@Name)
		
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO 