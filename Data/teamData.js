import { _Execute } from "../DataBase/database.js";
import { LogError } from "../Services/loggerService.js";

async function Get(name) {
  try {
    const procedureName = "sp_GetTeam";
    const param = {
        TeamName : name
    }
    return await _Execute(procedureName, param);
  } catch (error) {
    await LogError('Team', null, 'teamData.Get()', error);
  }
}

async function Add(name) {
    try {
      const procedureName = "sp_AddTeam";
      const param = {
          TeamName : name
      }
      return await _Execute(procedureName, param);
    } catch (error) {
      await LogError('Team', null, 'teamData.Add()', error);
    }
  }

export const _Get = Get;
export const _Add = Add;
