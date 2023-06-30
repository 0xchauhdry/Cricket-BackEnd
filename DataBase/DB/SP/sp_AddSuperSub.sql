IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddSuperSub]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddSuperSub]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/11/2023
Purpose: to add detail of SuperSubs in a match
*/

CREATE PROCEDURE [dbo].[sp_AddSuperSub]  
    @MatchId INT,
	@TeamId INT,
	@PlayerId INT
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SuperSubs]') AND type in (N'U'))
	BEGIN
		INSERT INTO SuperSubs (MatchId,
			TeamId,
			PlayerId)
		VALUES (@MatchId,
			@TeamId,
			@PlayerId)
			
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO 