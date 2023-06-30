import { _Execute } from "../DataBase/database.js";
import { LogError } from "../Services/loggerService.js";

async function Get(name) {
  try {
    const procedureName = "sp_GetEventID";
    const param = {
        EventName : name
    }
    return await _Execute(procedureName, param);
  } catch (error) {
    await LogError('Event', null, 'eventData.Get()', error);
  }
}

export const _Get = Get;
