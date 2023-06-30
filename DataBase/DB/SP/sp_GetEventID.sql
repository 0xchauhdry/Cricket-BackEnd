IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetEventID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetEventID]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Muhammad Ali Akbar
Created Date: 05/17/2023
Purpose: to get Event ID
*/

CREATE PROCEDURE [dbo].[sp_GetEventID]
	@EventName varchar(200)
AS  
BEGIN
    IF EXISTS (SELECT * FROM dbo.[Events] WHERE [Name] = @EventName)
    BEGIN
        SELECT Id FROM dbo.[Events] WHERE [Name] = @EventName;
    END
	ELSE Select 0 as Id;
END  
GO