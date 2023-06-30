IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetPLayers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetPLayers]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

/*
Script type: SP
Created by: Muhammad Ali Akbar
Created Date: 05/21/2023
Purpose: to get Players Data by comma separated keyCricSheet values from Players table
*/

CREATE PROCEDURE [dbo].[sp_GetPlayers]
	@KeyCricSheetKeys nvarchar(max)
AS
BEGIN
    -- Create a temporary table to hold the IDs
    DECLARE @tempTable TABLE ([Value] NVARCHAR(100))

    -- Split the comma-separated values and insert into the temporary table
    INSERT INTO @tempTable ([Value])
    SELECT TRIM(value) AS [Value]
    FROM STRING_SPLIT(@KeyCricSheetKeys, ',')

    -- Query data based on the keyCricSheet in the temporary table
    SELECT Id, [Name], Comments as OtherName, keyCricSheet
    FROM Players
    WHERE keyCricSheet IN (SELECT [Value] FROM @tempTable)
END
GO