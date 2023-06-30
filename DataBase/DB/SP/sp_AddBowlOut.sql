IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddBowlOut]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddBowlOut]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/11/2023
Purpose: to add BowlOut info
*/

CREATE PROCEDURE [dbo].[sp_AddBowlOut]  
    @MatchId INT,
	@TeamId INT = NULL,
	@Bowler INT,
	@IsHit bit

AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BowlOut]') AND type in (N'U'))
	BEGIN
		IF @TeamId is NULL
		BEGIN
			select @TeamId = dbo.GetTeamIdfromPlayingXI(@Bowler, @MatchId);
		END
		INSERT INTO BowlOut 
			(MatchId,
			TeamId,
			Bowler,
			IsHit)
		VALUES 
			(@MatchId,
			@TeamId,
			@Bowler,
			@IsHit)

		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO