import { _Execute } from "../DataBase/database.js";
import { LogError } from "../Services/loggerService.js";

async function Get(name) {
  try {
    const procedureName = "sp_GetVenueID";
    const param = {
        VenueName : name
    }
    return await _Execute(procedureName, param);
  } catch (error) {
    await LogError('Venue', null, 'venueData.Get()', error);
  }
}

export const _Get = Get;
