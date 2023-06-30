IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddAbsentHurt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddAbsentHurt]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/21/2023
Purpose: to add detail of absent hurt players in an inning
*/

CREATE PROCEDURE [dbo].[sp_AddAbsentHurt]  
    @InningId INT,
	@PlayerId INT

AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AbsentHurts]') AND type in (N'U'))
	BEGIN
		INSERT INTO AbsentHurts (InningId, PlayerId)
		VALUES (@InningId, @PlayerId)

		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO