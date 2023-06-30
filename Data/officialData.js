import { _Execute } from "../DataBase/database.js";
import { LogError } from "../Services/loggerService.js";

async function Get(name) {
  try {
    const procedureName = "sp_GetOfficialID";
    const param = {
        officialName : name
    }
    return await _Execute(procedureName, param);
  } catch (error) {
    await LogError('Official', null, 'officialData.Get()', error);
  }
}

async function Add(matchId, Official, role) {
    try {
      const procedureName = "sp_AddMatchOfficial";
      const param = {
          MatchId : matchId,
          Official : Official,
          Role : role
      }
      return await _Execute(procedureName, param);
    } catch (error) {
      await LogError('Official', matchId, 'officialData.Add()', error);
    }
  }

export const _Add = Add;
export const _Get = Get;