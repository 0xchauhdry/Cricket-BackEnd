/*
Script type: DML
Created by: Muhammad Ali Akbar
Created Date: 05/24/2023
Purpose: Insertion in ExtraType and WicketType
----------------------------------------------
Modified by: Ahmad Chauhdry
Modified Date: 05/31/2023
Purpose: Insertion in MatchTypes
*/

USE [IPLVSPSL]

SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRANSACTION;

	IF OBJECT_ID('dbo.ExtraType', 'U') IS NOT NULL
		IF NOT EXISTS (Select * from ExtraType)
		BEGIN
			INSERT INTO ExtraType ([Name])
			VALUES 
				('No-Ball'),
				('Wide'),
				('Bye'),
				('Leg-Bye'),
				('Penalty')
		END
	
	IF OBJECT_ID('dbo.MatchTypes', 'U') IS NOT NULL
		IF NOT EXISTS (Select * from MatchTypes)
		BEGIN
			insert into MatchTypes (MatchType)
			values ('T20'),('Test'),('ODI'),('IT20'),('MDM'),('ODM')
		END

	IF OBJECT_ID('dbo.WicketType', 'U') IS NOT NULL
		IF NOT EXISTS (Select * from WicketType)
		BEGIN
			INSERT INTO WicketType ([Name])
			VALUES 
				('bowled'),
			  ('caught'),
			  ('run out'),
			  ('stumped'),
			  ('retired not out'),
			  ('lbw'),
			  ('caught and bowled'),
			  ('hit wicket'),
			  ('obstructing the field'),
			  ('retired hurt'),
			  ('retired out'),
			  ('handled the ball'),
			  ('timed out'),
			  ('hitting the ball twice');

		END

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT ERROR_MESSAGE();
END CATCH;