import { _Execute } from "../DataBase/database.js";
import { LogError } from "../Services/loggerService.js";

async function Add(overObj) {
  try {
    const procedureName = "sp_AddOver";
    return await _Execute(procedureName, overObj);
  } catch (error) {
    await LogError('Over', overObj.InningId, 'overData.Add()', error);
  }
}

async function AddPowerplay(powerplayObj) {
  try {
    const procedureName = "sp_AddPowerPlay";
    return await _Execute(procedureName, powerplayObj);
  } catch (error) {
    await LogError('Over', powerplayObj.InningId, 'overData.AddPowerplay()', error);
  }
}

export const _Add = Add;
export const _AddPowerplay = AddPowerplay;
