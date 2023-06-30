import { _Add, _AddPowerplay } from "../Data/overData.js";
import { AddDelivery } from "./delivery.js";
import { LogError } from "../Services/loggerService.js";

async function AddAll(overs, inningId, players) {
  try {
    for (let over of overs) {
      let runs = calculateRuns(over);
      let overId = await Add(inningId, over.over + 1, runs);
      await AddDelivery(over, overId, players);
    }
    return true;
  } catch (error) {
    await LogError('Over', inningId, 'over.AddAll()', error);
  }
}

function calculateRuns(over) {
  try {
    let runs = 0;
    for (let ball of over.deliveries) {
      runs += ball.runs.total;
    }
    return runs;
  } catch (error) {
    console.log(`Error in over.calculateRuns()\nError: ${error}`);
    throw error;
  }
}

async function Add(inningId, overNo, runs) {
  try {
    let overObj = {
      InningId: inningId,
      OverNo: overNo,
      Runs: runs,
    };

    let overId = await _Add(overObj);
    return overId[0][0].Id;
  } catch (error) {
    await LogError('Over', inningId, 'over.Add()', error);
  }
}

async function AddAllPowerplays(inning, inningId, teamId) {
  try {
    for (let powerplay of inning.powerplays) {
      await AddPowerplay(powerplay, inningId, teamId);
    }
    return true;
  } catch (error) {
    await LogError('Over', inningId, 'over.AddAllPowerplays()', error);
  }
}

async function AddPowerplay(powerplay, inningId, teamId) {
  try {
    let powerplayObj = {
      InningId: inningId,
      TeamId: teamId,
      Type: powerplay.type,
      startingOver: Math.ceil(powerplay.from),
      endingOver: Math.ceil(powerplay.to)
    };
    return await _AddPowerplay(powerplayObj);
  } catch (error) {
    await LogError('Over', inningId, 'over.AddPowerplay()', error);
  }
}

export const AddOver = AddAll;
export const AddPowerplays = AddAllPowerplays;
