IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddPowerPlay]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddPowerPlay]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Modified by: Muhammad Sohaib
Created Date: 05/11/2023
Purpose: to add detail of powerplay
*/

CREATE PROCEDURE [dbo].[sp_AddPowerPlay]  
    @InningId int,
	@TeamId int,
	@Type varchar(20),
	@startingOver int,
	@endingOver int

AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PowerPlay]') AND type in (N'U'))
	BEGIN
		DECLARE @powerplayRuns int;

		SELECT @powerplayRuns = ISNULL(SUM(Runs),0) FROM Overs
			WHERE InningId = @InningId
			AND OverNo >= @startingOver
			AND OverNo <= @endingOver;

		INSERT INTO PowerPlay (InningId,
			TeamId,
			[Type],
			startingOver,
			endingOver,
			runs)
		VALUES (@InningId,
			@TeamId,
			@Type,
			@startingOver,
			@endingOver,
			@powerplayRuns)
			
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO