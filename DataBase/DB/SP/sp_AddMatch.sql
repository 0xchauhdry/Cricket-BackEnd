IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddMatch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddMatch]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/11/2023
Purpose: to add header data to matches table
*/

CREATE PROCEDURE [dbo].[sp_AddMatch]  
    @EventId INT,
	@MatchDate DATETIME,
	@WinnerTeam INT,
	@Wickets INT,
	@Runs int,
	@BallsPerOver int,
	@IsMale bit,
	@PlayerOfMatch int,
	@PlayerOfMatch2 int = 0,
	@DataVersion varchar(10),
	@CreationDate date,
	@Revision int,
	@MatchType int,
	@MatchTypeNumber int,
	@EventMatchNo int,
	@FirstTeam int,
	@SecondTeam int,
	@TossWon int,
	@IsBatFirst bit,
	@Season varchar(15),
	@Venue int,
	@Overs int,
	@Outcome varchar(20),
	@ByInning bit,
	@Comments varchar(200)
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Matches]') AND type in (N'U'))
	BEGIN
		INSERT INTO Matches (EventId,
			MatchDate,
			WinnerTeam,
			Wickets,
			Runs,
			BallsPerOver,
			IsMale,
			PlayerOfMatch,
			PlayerOfMatch2,
			DataVersion,
			CreationDate,
			Revision,
			MatchType,
			MatchTypeNumber,
			EventMatchNo,
			FirstTeam,
			SecondTeam,
			TossWon,
			IsBatFirst,
			Season,
			Venue,
			Overs,
			Outcome,
			ByInning,
			Comments)
		VALUES (@EventId,
			@MatchDate,
			@WinnerTeam,
			@Wickets,
			@Runs,
			@BallsPerOver,
			@IsMale,
			@PlayerOfMatch,
			@PlayerOfMatch2,
			@DataVersion,
			@CreationDate,
			@Revision,
			@MatchType,
			@MatchTypeNumber,
			@EventMatchNo,
			@FirstTeam,
			@SecondTeam,
			@TossWon,
			@IsBatFirst,
			@Season,
			@Venue,
			@Overs,
			@Outcome,
			@ByInning,
			@Comments)
			
			Select SCOPE_IDENTITY() as Id;
		END
		ELSE Select 0 as Id;
END  
GO 