import { _Execute, _ExecuteNonQuery } from '../DataBase/database.js';
import { LogError } from "../Services/loggerService.js";

async function Add(matchObj) {
  try {
    const procedureName = 'sp_AddMatch';
    return await _Execute(procedureName, matchObj);
  }
  catch (error) {
    await LogError('Match', null, 'matchData.Add()', error);
  }
}

async function AddDates(dates, matchId) {
  try {
    const procedureName = 'sp_AddMatchDates';
    const params = {
        MatchId: matchId,
        Day1 : dates[0],
        Day2 : dates[1],
        Day3 : dates[2] ?? null,
        Day4 : dates[3] ?? null,
        Day5 : dates[4] ?? null,
        Day6 : dates[5] ?? null,
        Day7 : dates[6] ?? null
    };
    await _ExecuteNonQuery(procedureName, params);
  }
  catch (error) {
    await LogError('Match', matchId, 'matchData.AddDates()', error);
  }
}

async function AddBowlOut(playerId, isHit, matchId) {
  try {
    const procedureName = 'sp_AddBowlOut';
    const params = {
        MatchId : matchId,
        Bowler : playerId,
        IsHit : isHit
    };

    await _ExecuteNonQuery(procedureName, params);
  }
  catch (error) {
    await LogError('Match', matchId, 'matchData.AddBowlOut()', error);
  }
}

async function AddSuperSub(playerId, teamId, matchId) {
  try {
    const procedureName = 'sp_AddSuperSub';
    const params = {
        MatchId : matchId,
        PlayerId : playerId,
        TeamId : teamId
    };

    await _ExecuteNonQuery(procedureName, params);
  }
  catch (error) {
    await LogError('Match', matchId, 'matchData.AddSuperSub()', error);
  }
}

async function IsMatchExist(teams, eventId, matchDate) {
  try {
    const procedureName = 'sp_IsMatchExist';
    const params = {
        Team1 : teams[0].Id,
        Team2 : teams[1].Id,
        EventId : eventId,
        MatchDate : matchDate
    };

    let matchId = await _Execute(procedureName, params);
    return matchId[0][0].Id;
  }
  catch (error) {
    await LogError('Match', null, 'matchData.IsMatchExist()', error);
  }
}

export const _Add = Add;
export const _AddDates = AddDates;
export const _AddBowlOut = AddBowlOut;
export const _AddSuperSub = AddSuperSub;
export const _IsMatchExist = IsMatchExist;