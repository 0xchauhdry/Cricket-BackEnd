IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddPlayer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddPlayer]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Muhammad Sohaib
Created Date: 05/13/2023
Purpose: to add Player info
*/

CREATE PROCEDURE [dbo].[sp_AddPlayer]
	@PlayerName varchar(100),
	@PlayerType int,
	@keyCricSheet varchar(20),
	@keyCricInfo varchar(20),
	@BattingStyle varchar(50),
	@BowlingStyle varchar(50),
	@DateOfBirth date,
	@BirthCountry int,
	@PlayingCountry int,
	@MaritialStatus varchar(50),
	@IsMale bit

AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Players]') AND type in (N'U'))
    BEGIN
        INSERT INTO dbo.Players (
            [Name],
            [Type],
            keyCricSheet,
            keyCricInfo,
            [BattingStyle],
            [BowlingStyle],
            DOB,
            BirthCountry,
            PlayingCountry,
            MaritialStatus,
            IsMale
        )
        VALUES (
            @PlayerName,
            @PlayerType,
            @keyCricSheet,
            @keyCricInfo,
            @BattingStyle,
            @BowlingStyle,
            @DateOfBirth,
            @BirthCountry,
            @PlayingCountry,
            @MaritialStatus,
            @IsMale
        )
		
		Select SCOPE_IDENTITY();
    END
		ELSE Select 0;
END  
GO