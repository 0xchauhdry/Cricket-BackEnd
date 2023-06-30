import { _Add } from "../Data/officialData.js";
import { LogError } from "../Services/loggerService.js";

async function Add(officials, matchId) {
  try {
    const keys = Object.keys(officials);
    keys.forEach(async (key) => {
      officials[key].forEach(async (official) => {
        await _Add(matchId, official, key)
      })
    })
  } catch (error) {
    await LogError('Official', matchId, 'official.Add()', error);
  }
}

export const AddOfficials = Add;
