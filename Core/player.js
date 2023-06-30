import { _Add, _Get , _AddPlayingXI, _AddAbsentHurt } from "../Data/playerData.js";
import { LogError } from "../Services/loggerService.js";

async function Add(req) {
  try {
    return await _Add(req);
  } 
  catch (error) {
    await LogError('Player', null, 'player.Add()', error);
  }
}

async function Get(people) {
  try {
    const playerKeys = Object.values(people).join(',');
    let players = await _Get(playerKeys);
    return players[0];
  } 
  catch (error) {
    await LogError('Player', null, 'player.Get()', error);
  }
}

async function AddXI(players, teams, matchId, teamList) {
  try {
    for (let team in teams){
      let playingXI = [];
      for(let player of teams[team]){
        playingXI.push(players.find(obj => obj.OtherName === player || obj.Name === player))
      }
      let teamId = teamList.find(obj => obj.Name === team).Id;
      await _AddPlayingXI(playingXI, teamId, matchId);
    }
  } 
  catch (error) {
    await LogError('Player', matchId, 'player.AddXI()', error);
  }
}

async function AddAbsentHurt(AbsentHurts, inningId) {
  try {
    for (let player of AbsentHurts){
      await _AddAbsentHurt(player.Id, inningId);
    }
  } 
  catch (error) {
    await LogError('Player', inningId, 'player.AddAbsentHurt()', error);
  }
}

export const AddPlayer = Add;
export const GetPlayers = Get;
export const AddPlayingXI = AddXI;
export const AddAbsentHurts = AddAbsentHurt;
