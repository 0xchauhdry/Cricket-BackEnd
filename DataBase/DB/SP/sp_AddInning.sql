IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddInning]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddInning]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/11/2023
Purpose: to add detail of inning
*/

CREATE PROCEDURE [dbo].[sp_AddInning]  
    @MatchId INT,
	@TeamId INT,
	@TargetScore int,
	@TargetOvers int,
	@IsSuperOver bit = 0,
	@PenaltyRuns int = null,
	@IsForfeited bit = 0,
	@IsDeclared bit = 0

AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Innings]') AND type in (N'U'))
	BEGIN
		INSERT INTO Innings (MatchId,
			TeamId,
			TargetScore,
			TargetOvers,
			IsSuperOver,
			PenaltyRuns,
			IsForfeited,
			IsDeclared)
		VALUES (@MatchId,
			@TeamId,
			@TargetScore,
			@TargetOvers,
			@IsSuperOver,
			@PenaltyRuns,
			@IsForfeited,
			@IsDeclared)

		Select SCOPE_IDENTITY() as Id;
	END
		ELSE Select 0 as Id;
END  
GO