import { _Execute } from "../DataBase/database.js";
import { LogError } from "../Services/loggerService.js";

async function Add(deliveryObj) {
  try {
    const procedureName = "sp_AddDelivery";
    return await _Execute(procedureName, deliveryObj);
  } catch (error) {
    await LogError('Delivery', deliveryObj.OverId, 'deliveryData.Add()', error);
  }
}

export const _Add = Add;
