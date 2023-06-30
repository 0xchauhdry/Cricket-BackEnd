IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCityID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCityID]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Muhammad Ali Akbar
Created Date: 05/17/2023
Purpose: to get City ID
*/

CREATE PROCEDURE [dbo].[sp_GetCityID]
	@CityName varchar(50)
AS  
BEGIN
    IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cities]') AND type in (N'U'))
    BEGIN
        SELECT Id FROM dbo.Cities WHERE [Name] Like '%'+@CityName+'%';
    END
	ELSE Select 0 as Id;
END  
GO