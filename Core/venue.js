import { _Get } from "../Data/venueData.js";
import { LogError } from "../Services/loggerService.js";

async function Get(name) {
  try {
    let venue =  await _Get(name);
    return venue[0][0];
  } catch (error) {
    await LogError('Venue', null, 'venue.Get()', error);
  }
}

export const GetVenue = Get;