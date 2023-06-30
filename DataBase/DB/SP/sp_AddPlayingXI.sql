IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddPlayingXI]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddPlayingXI]
GO

/*
Script type: SP
Created by: Ali Akbar
Created Date: 05/11/2023
Purpose: to add new PlayingXI to the PlayingXI table
*/

CREATE PROCEDURE [dbo].[sp_AddPlayingXI]
	@MatchId INT,
	@TeamId INT,
	@Player1 INT,
	@Player2 INT,
	@Player3 INT,
	@Player4 INT,
	@Player5 INT,
	@Player6 INT,
	@Player7 INT,
	@Player8 INT,
	@Player9 INT,
	@Player10 INT,
	@Player11 INT
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlayingXI]') AND type in (N'U'))
	BEGIN
		INSERT INTO PlayingXI (
			MatchId,
			TeamId,
			Player1,
			Player2,
			Player3,
			Player4,
			Player5,
			Player6,
			Player7,
			Player8,
			Player9,
			Player10,
			Player11)
		VALUES (
			@MatchId,
			@TeamId,
			@Player1,
			@Player2,
			@Player3,
			@Player4,
			@Player5,
			@Player6,
			@Player7,
			@Player8,
			@Player9,
			@Player10,
			@Player11)
			
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO 