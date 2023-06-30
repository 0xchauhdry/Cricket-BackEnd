IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddDelivery]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddDelivery]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/11/2023
Purpose: to add data of each delivery
*/

CREATE PROCEDURE [dbo].[sp_AddDelivery]  
    @OverId int,
	@Batter int,
	@NonStriker int,
	@Bowler int,
	@BatterRuns int,
	@ExtraRuns int,
	@ExtraType int = null,
	@ExtraType2 int = null,
	@WicketType int = null,
	@BatterOut int = null,
	@Fielder1 int = null,
	@Fielder2 int = null
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Deliveries]') AND type in (N'U'))
		BEGIN
			INSERT INTO Deliveries (OverId,
				Batter,
				NonStriker,
				Bowler,
				BatterRuns,
				ExtraRuns,
				ExtraType,
				ExtraType2,
				WicketType,
				BatterOut,
				Fielder1,
				Fielder2)
			VALUES (@OverId,
				@Batter,
				@NonStriker,
				@Bowler,
				@BatterRuns,
				@ExtraRuns,
				@ExtraType,
				@ExtraType2,
				@WicketType,
				@BatterOut,
				@Fielder1,
				@Fielder2)
				
			Select SCOPE_IDENTITY();
		END
		ELSE Select 0;
END  
GO 