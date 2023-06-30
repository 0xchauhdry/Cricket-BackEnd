IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetVenueID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetVenueID]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Muhammad Ali Akbar
Created Date: 05/17/2023
Purpose: to get Venue ID
*/

CREATE PROCEDURE [dbo].[sp_GetVenueID]
	@VenueName varchar(200)
AS  
BEGIN
    IF EXISTS (SELECT * FROM dbo.Venues WHERE Venue = @VenueName)
    BEGIN
        SELECT Id FROM dbo.Venues WHERE Venue = @VenueName;
    END
	ELSE Select 0 as Id;
END  
GO