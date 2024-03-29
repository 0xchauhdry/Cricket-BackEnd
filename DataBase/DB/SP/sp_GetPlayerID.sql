IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetPlayerID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetPlayerID]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Muhammad Sohaib
Created Date: 05/13/2023
Purpose: to get Player ID
*/

CREATE PROCEDURE [dbo].[sp_GetPlayerID]
	@playerKey varchar(20)
AS  
BEGIN
    IF EXISTS (SELECT * FROM dbo.Players WHERE keyCricSheet = @playerKey)
    BEGIN
        SELECT Id FROM dbo.Players WHERE keyCricSheet = @playerKey;
    END
	ELSE Select 0 as Id;
END  
GO