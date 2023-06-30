IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AddMatchOfficial]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AddMatchOfficial]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Ahmad Chauhdry
Created Date: 05/11/2023
Purpose: to add detail of Match Officials
*/

CREATE PROCEDURE [dbo].[sp_AddMatchOfficial]  
    @MatchId INT,
	@Official varchar(100),
	@Role varchar(30)
AS  
BEGIN  
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MatchOfficials]') AND type in (N'U'))
	BEGIN
		Declare @Id INT;
		IF EXISTS(Select 1 from Officials where [Name] = @Official)
			Select @Id = Id from Officials where [Name] = @Official;
		ELSE
		BEGIN
			Insert INTO Officials ([Name]) values (@Official)
			Select @Id = SCOPE_IDENTITY();
		END

		INSERT INTO MatchOfficials (MatchId,
			Official,
			[Role])
		VALUES (@MatchId,
			@Id,
			@Role)
			
		Select SCOPE_IDENTITY();
	END
		ELSE Select 0;
END  
GO 