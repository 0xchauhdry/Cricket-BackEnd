IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddPlayerType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddPlayerType]
GO 

/*
Script type: SP
Created by: Ali Akbar
Created Date: 05/11/2023
Purpose: to add new player type to PlayerTypes table
*/

CREATE PROCEDURE [dbo].[sp_AddPlayerType]  
    @Type VARCHAR(50)
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlayerTypes]') AND type in (N'U'))
	BEGIN
		INSERT INTO PlayerTypes ([Type])
		VALUES (@Type)
		
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO 