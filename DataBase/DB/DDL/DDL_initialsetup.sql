/*
Script type: DDL
Created by: Ahmad Chauhdry
Created Date: 05/09/2023
Purpose: Creating IPLvsPSL database and all of the db structure
*/

IF NOT EXISTS (SELECT 1 FROM master.sys.databases WHERE name = N'IPLVSPSL')
BEGIN
	CREATE DATABASE IPLVSPSL
END
GO
------------------------------------------------------------
------------------------------------------------------------

USE [IPLVSPSL]
GO
------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Countries', 'U') IS NULL
BEGIN
CREATE TABLE Countries (
	Id int IDENTITY(1,1),
	[Name] varchar(100),
	Abbreviation varchar(20)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Cities', 'U') IS NULL
BEGIN
CREATE TABLE Cities (
	Id int IDENTITY(1,1),
	[Name] varchar(100),
	Country int FOREIGN KEY REFERENCES Countries(Id),
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Venues', 'U') IS NULL
BEGIN
CREATE TABLE Venues (
	Id int IDENTITY(1,1),
	City int FOREIGN KEY REFERENCES Cities(Id),
	Venue varchar (200)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.PlayerTypes', 'U') IS NULL
BEGIN
CREATE TABLE PlayerTypes (
	Id int IDENTITY(1,1),
	[Type] varchar(50)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Players', 'U') IS NULL
BEGIN
CREATE TABLE Players (
	Id int IDENTITY(1,1),
	[Name] varchar(100),
	[Type] int NULL FOREIGN KEY REFERENCES PlayerTypes(Id),
	keyCricSheet varchar(50),
	keyCricInfo varchar(50),
	[BattingStyle] varchar(50),
	[BowlingStyle] varchar(50),
	DOB date,
	BirthCountry int,
	PlayingCountry int,
	MaritialStatus varchar(50),
	IsMale bit,
	Comments varchar(100)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
	IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='idx_Players_keyCricSheet' AND object_id = OBJECT_ID('dbo.Players'))
	BEGIN
		CREATE UNIQUE NONCLUSTERED INDEX idx_Players_keyCricSheet
		ON Players(keyCricSheet)
		WHERE keyCricSheet IS NOT NULL
	END

	IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='idx_Players_keyCricInfo' AND object_id = OBJECT_ID('dbo.Players'))
	BEGIN
		CREATE UNIQUE NONCLUSTERED INDEX idx_Players_keyCricInfo
		ON Players(keyCricInfo)
		WHERE keyCricInfo IS NOT NULL
	END
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Teams', 'U') IS NULL
BEGIN
CREATE TABLE Teams (
	Id int IDENTITY(1,1),
	[Name] varchar(100),
	CreatedDate date,
	Country int,
	City int,
	TeamType varchar(50)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END
------------------------------------------------------------
------------------------------------------------------------


IF OBJECT_ID('dbo.Tournaments', 'U') IS NULL
BEGIN
CREATE TABLE Tournaments (
	Id int IDENTITY(1,1),
	[Name] varchar(100),
	[Type] varchar(100)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Events', 'U') IS NULL
BEGIN
CREATE TABLE Events (
	Id int IDENTITY(1,1),
	TournamentId int NULL FOREIGN KEY REFERENCES Tournaments(Id),
	[Name] varchar (300),
	Country Int
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Careers', 'U') IS NULL
BEGIN
CREATE TABLE Careers (
	Id int IDENTITY(1,1),
	PlayerId int FOREIGN KEY REFERENCES Players(Id),
	StartFrom int,
	EndAt int,
	Runs int,
	wickets int,
	Team int FOREIGN KEY REFERENCES Teams(Id)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Officials', 'U') IS NULL
BEGIN
CREATE TABLE Officials (
	Id int IDENTITY(1,1),
	[Name] varchar (100),
	[Role] varchar (50)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------


IF OBJECT_ID('dbo.MatchTypes', 'U') IS NULL
BEGIN
CREATE TABLE MatchTypes (
	Id int IDENTITY(1,1),
	MatchType varchar (100)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Matches', 'U') IS NULL
BEGIN
	CREATE TABLE Matches (
		MatchId int IDENTITY(1,1),
		EventId int NULL FOREIGN KEY REFERENCES Events(Id),
		MatchDate date,
		WinnerTeam int,
		Wickets int,
		Runs int,
		FirstTeam int FOREIGN KEY REFERENCES Teams(Id),
		SecondTeam int FOREIGN KEY REFERENCES Teams(Id),
		TossWon int,
		IsBatFirst bit,
		MatchType int FOREIGN KEY REFERENCES MatchTypes(Id),
		Outcome varchar(20),
		ByInning bit,
		BallsPerOver int,
		IsMale bit,
		PlayerOfMatch int,
		PlayerOfMatch2 int,
		MatchTypeNumber int,
		EventMatchNo int,
		Season varchar(15),
		Venue int,
		Overs int,
		Comments varchar(200),
		DataVersion varchar (10),
		CreationDate date,
		Revision int
		
		PRIMARY KEY CLUSTERED (MatchId ASC)
	)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.MatchDates', 'U') IS NULL
BEGIN
	CREATE TABLE MatchDates (
		Id int IDENTITY(1,1),
		MatchId int FOREIGN KEY REFERENCES Matches(MatchId),
		Day1 date,
		Day2 date,
		Day3 date,
		Day4 date,
		Day5 date,
		Day6 date,
		Day7 date,
		
		PRIMARY KEY CLUSTERED (Id ASC)
	)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.MatchOfficials', 'U') IS NULL
BEGIN
CREATE TABLE MatchOfficials (
	Id int IDENTITY(1,1),
	MatchId int FOREIGN KEY REFERENCES Matches(MatchId),
	Official int FOREIGN KEY REFERENCES Officials(Id),
	[Role] varchar(30)

	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.PlayingXI', 'U') IS NULL
BEGIN
CREATE TABLE PlayingXI (
	Id int IDENTITY(1,1),
	MatchId int FOREIGN KEY REFERENCES Matches(MatchId),
	TeamId int FOREIGN KEY REFERENCES Teams(Id),
	Player1 int FOREIGN KEY REFERENCES Players(Id),
	Player2 int FOREIGN KEY REFERENCES Players(Id),
	Player3 int FOREIGN KEY REFERENCES Players(Id),
	Player4 int FOREIGN KEY REFERENCES Players(Id),
	Player5 int FOREIGN KEY REFERENCES Players(Id),
	Player6 int FOREIGN KEY REFERENCES Players(Id),
	Player7 int FOREIGN KEY REFERENCES Players(Id),
	Player8 int FOREIGN KEY REFERENCES Players(Id),
	Player9 int FOREIGN KEY REFERENCES Players(Id),
	Player10 int FOREIGN KEY REFERENCES Players(Id),
	Player11 int FOREIGN KEY REFERENCES Players(Id)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.SuperSubs', 'U') IS NULL
BEGIN
CREATE TABLE SuperSubs (
	Id int IDENTITY(1,1),
	MatchId int FOREIGN KEY REFERENCES Matches(MatchId),
	TeamId int FOREIGN KEY REFERENCES Teams(Id),
	PlayerId int FOREIGN KEY REFERENCES Players(Id)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.BowlOut', 'U') IS NULL
BEGIN
CREATE TABLE BowlOut (
	Id int IDENTITY(1,1),
	MatchId int FOREIGN KEY REFERENCES Matches(MatchId),
	TeamId int NULL FOREIGN KEY REFERENCES Teams(Id),
	Bowler int FOREIGN KEY REFERENCES Players(Id),
	IsHit bit
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Innings', 'U') IS NULL
BEGIN
CREATE TABLE Innings (
	Id int IDENTITY(1,1),
	MatchId int FOREIGN KEY REFERENCES Matches(MatchId),
	TeamId int FOREIGN KEY REFERENCES Teams(Id),
	TargetScore int,
	TargetOvers int,
	IsSuperOver bit,
	PenaltyRuns int,
	IsForfeited bit,
	IsDeclared bit
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.AbsentHurts', 'U') IS NULL
BEGIN
CREATE TABLE AbsentHurts (
	Id int IDENTITY(1,1),
	InningId int FOREIGN KEY REFERENCES Innings(Id),
	PlayerId int FOREIGN KEY REFERENCES Players(Id)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.PowerPlay', 'U') IS NULL
BEGIN
CREATE TABLE PowerPlay (
	Id int IDENTITY(1,1),
	InningId int FOREIGN KEY REFERENCES Innings(Id),
	TeamId int FOREIGN KEY REFERENCES Teams(Id),
	[Type] varchar(20),
	startingOver int,
	endingOver int,
	runs int
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Overs', 'U') IS NULL
BEGIN
CREATE TABLE Overs (
	Id int IDENTITY(1,1),
	InningId int FOREIGN KEY REFERENCES Innings(Id),
	OverNo int,
	Runs int
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END
------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.WicketType', 'U') IS NULL
BEGIN
CREATE TABLE WicketType (
	Id int IDENTITY(1,1),
	[Name] varchar(50)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END
------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.ExtraType', 'U') IS NULL
BEGIN
CREATE TABLE ExtraType (
	Id int IDENTITY(1,1),
	[Name] varchar(20)
	
	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.Deliveries', 'U') IS NULL
BEGIN
CREATE TABLE Deliveries (
	Id int IDENTITY(1,1),
	OverId int FOREIGN KEY REFERENCES Overs(Id),
	Batter int,
	NonStriker int,
	Bowler int,
	BatterRuns int,
	ExtraRuns int,
	ExtraType int,
	ExtraType2 int,
	WicketType int,
	BatterOut int,
	Fielder1 int,
	Fielder2 int

	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------

IF OBJECT_ID('dbo.ErrorLogs', 'U') IS NULL
BEGIN
CREATE TABLE ErrorLogs (
	Id int IDENTITY(1,1),
	Module varchar(50),
	ModuleId int,
	ErrorIn varchar(100),
	ErrorMessage varchar(max),
	CreatedDateTime datetime default GETUTCDATE()

	PRIMARY KEY CLUSTERED (Id ASC)
)
END

------------------------------------------------------------
------------------------------------------------------------
