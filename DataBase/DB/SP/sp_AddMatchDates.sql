IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddMatchDates]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddMatchDates]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/11/2023
Purpose: to add dates incase of test match
*/

CREATE PROCEDURE [dbo].[sp_AddMatchDates]  
    @MatchId INT,
	@Day1 date,
	@Day2 date,
	@Day3 date = null,
	@Day4 date = null,
	@Day5 date = null,
	@Day6 date = null,
	@Day7 date = null
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatchDates]') AND type in (N'U'))
	BEGIN
		INSERT INTO MatchDates (MatchId,
			Day1,
			Day2,
			Day3,
			Day4,
			Day5,
			Day6,
			Day7)
		VALUES (@MatchId,
			@Day1,
			@Day2,
			@Day3,
			@Day4,
			@Day5,
			@Day6,
			@Day7)
				
		Select SCOPE_IDENTITY();
	END
	ELSE Select 0;
END  
GO