IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddOver]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddOver]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/11/2023
Purpose: to add detail of overs
*/

CREATE PROCEDURE [dbo].[sp_AddOver]  
    @InningId INT,
	@OverNo INT,
	@Runs INT
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Overs]') AND type in (N'U'))
	BEGIN
		INSERT INTO Overs (InningId,
			OverNo,
			Runs)
		VALUES (@InningId,
			@OverNo,
			@Runs)
			
		Select SCOPE_IDENTITY() as Id;
	END
		ELSE Select 0 as Id;
END  
GO 