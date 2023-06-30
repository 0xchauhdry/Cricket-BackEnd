import { _ExecuteNonQuery } from "../DataBase/database.js";

async function Add(module, moduleId, errorIn, errorMsg) {
  try {
    const procedureName = "sp_AddErrorLogs";
    let params = {
        Module : module,
        ModuleId : moduleId,
        ErrorIn : errorIn,
        ErrorMessage : errorMsg.toString()
      };
    console.log(params)
    await _ExecuteNonQuery(procedureName, params);
    throw errorMsg;
  } catch (error) {
    console.log(`Error in loggerService.Add() WTF\nError: ${error}`);
    throw error;
  }
}

export const LogError = Add;