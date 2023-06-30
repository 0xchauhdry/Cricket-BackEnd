import { _Get, _Add } from "../Data/teamData.js";
import { LogError } from "../Services/loggerService.js";

async function Get(name) {
  try {
    let team = await _Get(name);
    if (team.Id < 1){
      team = await _Add(name);
      return team[0][0];
    }
    else{
      return team[0][0];
    }
  } 
  catch (error) {
    await LogError('Team', null, 'team.Get()', error);
  }
}

export const GetTeam = Get;
