IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.GetTeamIdfromPlayingXI') AND type = N'FN')
BEGIN
    DROP FUNCTION dbo.GetTeamIdfromPlayingXI;
END;
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/11/2023
Purpose: to add BowlOut info
*/

CREATE FUNCTION dbo.GetTeamIdfromPlayingXI
(
    @PlayerId INT,
	@MatchId INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TeamId INT;
    
    SELECT @TeamId = TeamId
    FROM PlayingXI
    WHERE (Player1 = @PlayerId
	or Player2 = @PlayerId
	or Player3 = @PlayerId
	or Player4 = @PlayerId
	or Player5 = @PlayerId
	or Player6 = @PlayerId
	or Player7 = @PlayerId
	or Player8 = @PlayerId
	or Player9 = @PlayerId
	or Player10 = @PlayerId
	or Player11 = @PlayerId)
	and MatchId = @MatchId;
    
    RETURN @TeamId;
END;
