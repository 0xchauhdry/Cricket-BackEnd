import { _Get } from "../Data/eventData.js";
import { LogError } from "../Services/loggerService.js";

async function Get(name) {
  try {
    let event =  await _Get(name);
    return event[0][0].Id;
  } catch (error) {
    await LogError('Event', null, 'event.Get()', error);
  }
}

export const GetEvent = Get;
