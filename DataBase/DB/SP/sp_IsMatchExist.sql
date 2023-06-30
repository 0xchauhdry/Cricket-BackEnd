IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_IsMatchExist]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_IsMatchExist]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/31/2023
Purpose: to check if match with these parameters already exists
*/

CREATE PROCEDURE [dbo].[sp_IsMatchExist]
	@Team1 int,
	@Team2 int,
	@EventId int,
	@MatchDate date
AS  
BEGIN
    IF EXISTS (SELECT 1 FROM dbo.Matches WHERE FirstTeam in (@Team1, @Team2) and SecondTeam in (@Team1, @Team2) and 
		EventId = @EventId and MatchDate = @MatchDate)
	BEGIN
		SELECT MatchId as Id FROM dbo.Matches WHERE FirstTeam in (@Team1, @Team2) and SecondTeam in (@Team1, @Team2) and 
		EventId = @EventId and MatchDate = @MatchDate
	END
	ELSE Select 0 as Id;
END  
GO