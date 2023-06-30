IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddMatchType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddMatchType]
GO

/*
Script type: SP
Created by: Ali Akbar
Created Date: 05/11/2023
Purpose: to add new Match Type to the MatchTypes table
*/

CREATE PROCEDURE [dbo].[sp_AddMatchType]
	@MatchType VARCHAR (50)
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatchTypes]') AND type in (N'U'))
	BEGIN
		INSERT INTO MatchTypes (MatchType)
		VALUES (@MatchType)
		
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO 