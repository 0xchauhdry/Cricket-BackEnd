IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetTeam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetTeam]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Muhammad Ali Akbar
Created Date: 05/17/2023
Purpose: to get Team ID
*/

CREATE PROCEDURE [dbo].[sp_GetTeam]
	@TeamName varchar(50)
AS  
BEGIN
    IF EXISTS (SELECT * FROM dbo.Teams WHERE [Name] = @TeamName)
    BEGIN
        SELECT Id, [Name] FROM dbo.Teams WHERE [Name] = @TeamName;
    END
	ELSE Select 0 as Id, '' as Name;
END  
GO