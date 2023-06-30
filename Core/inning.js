import { AddOver, AddPowerplays } from "./over.js";
import { _Add } from "../Data/inningData.js";
import { AddAbsentHurts } from "./player.js";
import { LogError } from "../Services/loggerService.js";

async function AddAll(innings, matchId, teams, players) {
  try {
    for (let inning of innings) {
      let team = teams.find((obj) => obj.Name == inning.team);
      let inningId = await Add(inning, matchId, team.Id); //inserting in innings table
      //Adding Absent Hurt players info if exists
      let AbsentHurts = [];
      if (inning.absent_hurt){
        for (let player of inning.absent_hurt){
          AbsentHurts.push(players.find((obj) => obj.OtherName === player || obj.Name === player))
        }
        await AddAbsentHurts(AbsentHurts, inningId);
      }
      //Add powerplay info if exists

      //Adding Overs info
      if (inning.overs){
        await AddOver(inning.overs, inningId, players);
      }

      //Add powerplay info
      if (inning.powerplays){
        await AddPowerplays(inning, inningId, team.Id);
      }
    }
    return true;
  } 
  catch (error) {
    await LogError('Inning', matchId, 'inning.AddAll()', error);
    return false;
  }
}

async function Add(inning, matchId, teamId) {
  try {
    let targetRuns = inning.target?.runs ?? null;
    let targetOvers = inning.target?.overs ?? null;
    let superover = inning.super_over ?? false;
    let paneltyRuns = null;
    if (inning.penalty_runs){
      if (inning.penalty_runs.pre) 
        paneltyRuns = inning.penalty_runs.pre
      else 
        paneltyRuns = inning.penalty_runs.post
    }
    let forfeited = inning.forfeited ?? false;
    let declared = inning.declared ?? false;

    let inningObj = {
      MatchId: matchId,
      TeamId: teamId,
      TargetScore: targetRuns,
      TargetOvers: targetOvers,
      isSuperOver: superover, 
      PenaltyRuns: paneltyRuns,
      isForfeited: forfeited,
      isDeclared: declared
    };

    let inningId = await _Add(inningObj);
    return inningId[0][0].Id;
  } 
  catch (error) {
    await LogError('Inning', matchId, 'inning.Add()', error);
  }
}

export const AddInning = AddAll;
