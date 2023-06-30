import { _Execute } from "../DataBase/database.js";
import { LogError } from "../Services/loggerService.js";

async function Add(req) {
  try {
    const procedureName = "sp_AddPlayer";
    const params = {
      PlayerName: req.playerName,
      PlayerType: req.playerType,
      keyCricSheet: req.cricSheetKey,
      keyCricInfo: req.req.cricInfoKey,
      BattingStyle: req.battingStyle,
      BowlingStyle: req.bowlingStyle,
      DateOfBirth: req.dob,
      BirthCountry: req.birthCountry,
      PlayingCountry: req.playingCountry,
      MaritialStatus: req.maritalStatus,
      Gender: req.gender,
    };

    return await _Execute(procedureName, params);
  } 
  catch (error) {
    await LogError('Player', null, 'playerData.Add()', error);
  }
}

async function GetbyId(key) {
  try {
    const procedureName = "sp_GetPlayerID";
    const params = {
      keyCricSheet: key,
    };

    return await _Execute(procedureName, params);
  } 
  catch (error) {
    await LogError('Player', null, 'playerData.GetbyId()', error);
  }
}

async function Get(playerKeys) {
  try {
    const procedureName = "sp_GetPlayers";
    const params = {
      keyCricSheetKeys : playerKeys
    };

    return await _Execute(procedureName, params);
  } 
  catch (error) {
    await LogError('Player', null, 'playerData.Get()', error);
  }
}

async function AddPlayingXI(players, teamId, matchId) {
  try {
    const procedureName = "sp_AddPlayingXI";
    const params = {
      MatchId : matchId,
      TeamId : teamId,
      Player1 : players[0].Id,
      Player2 : players[1].Id,
      Player3 : players[2].Id,
      Player4 : players[3].Id,
      Player5 : players[4].Id,
      Player6 : players[5].Id,
      Player7 : players[6].Id,
      Player8 : players[7].Id,
      Player9 : players[8].Id,
      Player10 : players[9].Id,
      Player11 : players[10].Id
    };

    return await _Execute(procedureName, params);
  } 
  catch (error) {
    await LogError('Player', matchId, 'playerData.AddPlayingXI()', error);
  }
}

async function AddAbsentHurt(playerId, inningId) {
  try {
    const procedureName = "sp_AddAbsentHurt";
    const params = {
      InningId: inningId,
      PlayerId: playerId
    };

    return await _Execute(procedureName, params);
  } 
  catch (error) {
    await LogError('Player', inningId, 'playerData.AddAbsentHurt()', error);
  }
}

export const _Add = Add;
export const _Get = Get;
export const _AddPlayingXI = AddPlayingXI;
export const _AddAbsentHurt = AddAbsentHurt;
