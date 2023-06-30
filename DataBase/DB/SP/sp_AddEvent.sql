IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddEvent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddEvent]
GO 

/*
Script type: SP
Created by: Ali Akbar
Created Date: 05/11/2023
Purpose: to add new event to the Events table
*/

CREATE PROCEDURE [dbo].[sp_AddEvent]  
    @TournamentId INT,
	@Name VARCHAR (50),
	@Country VARCHAR(50)
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Events]') AND type in (N'U'))
	BEGIN
		INSERT INTO Events (
			TournamentId,
			[Name],
			Country)
		VALUES (
			@TournamentId,
			@Name,
			@Country)
			
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO 