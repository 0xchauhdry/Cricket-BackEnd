import { _Execute } from "../DataBase/database.js";
import { LogError } from "../Services/loggerService.js";

async function Add(inningObj) {
  try {
    const procedureName = "sp_AddInning";
    return await _Execute(procedureName, inningObj);
  } catch (error) {
    await LogError('Inning', inningObj.MatchId, 'inningData.Add()', error);
  }
}

export const _Add = Add;
