import { _Add, _AddDates, _AddBowlOut, _AddSuperSub, _IsMatchExist } from '../Data/matchData.js';
import { GetPlayers, AddPlayingXI } from './player.js';
import { GetTeam } from './team.js';
import { GetEvent } from './event.js';
import { GetVenue } from './venue.js';
import { AddOfficials } from './official.js';
import { AddInning } from './inning.js';
import { MatchTypeEnum } from "../Shared/Enumerations.js";
import { LogError } from "../Services/loggerService.js";

let players = []; //because it's needed in more than one functions
let teams = []; //because it's needed in more than one functions

async function Add(reqs) {
  let matchId;
  try {
    // Getting Ids from db to insert data in our tables
    let req = reqs.body;
    let eventId = null;
    if (req.info?.event){
      eventId = await GetEvent(req.info.event?.name.replace("â€™", "'") ?? ''); //get eventId
    }
    teams = [];
    teams.push(await GetTeam(req.info.teams[0]));
    teams.push(await GetTeam(req.info.teams[1]));

    matchId = await IsMatchExist(teams, eventId, req.info.dates[0]);
    if (matchId > 0){
      return matchId; 
    }
    else{
      //insert data in match table
      matchId = await InsertMatchData(req, eventId);

      // if multiple dates exists
      if (req.info.dates.length > 1){
        await AddDates(req.info.dates, matchId);
      }

      //insert data of match officials
      if (req.info.officials){
        await AddOfficials(req.info.officials, matchId);
      }

      //insert data in playingXI table
      await AddPlayingXI(players, req.info.players, matchId, teams);

      //Add Bowl Out info if exists
      if (req.info.bowl_out){
        await AddBowlOut(req.info.bowl_out, matchId)
      }

      //Add SuperSubs info if exists
      if (req.info.supersubs){
        await AddSuperSubs(req.info.supersubs, matchId)
      }

      //insert data in innings table
      await AddInning(req.innings, matchId, teams, players);

      return matchId;
    }    
  }
  catch (error) {
    await LogError('Match', matchId, 'match.Add()', error);
  }
}

async function IsMatchExist(teams, eventId, MatchDate){
  try {
    return await _IsMatchExist(teams, eventId, MatchDate);
  }
  catch (error) {
    await LogError('Match', null, 'match.IsMatchExist()', error);
  }
}

async function InsertMatchData(req, eventId){
  try{
    players = [];
    players = await GetPlayers(req.info.registry.people); //get players data from db
    let winnerTeam = null;
      if (req.info.outcome.winner || req.info.outcome.eliminator || req.info.outcome.bowl_out){   //check if winner exists in data
        if(req.info.outcome.winner){
          winnerTeam = teams.find(obj => obj.Name === req.info.outcome.winner);
        }
        else if (req.info.outcome.eliminator){
          winnerTeam = teams.find(obj => obj.Name === req.info.outcome.eliminator);
        } 
        else{
          winnerTeam = teams.find(obj => obj.Name === req.info.outcome.bowl_out);
        }
      }
      let tossWon = teams.find(obj => obj.Name === req.info.toss.winner); //get team from teams array
      let playerOfMatch = null;
      let playerOfMatch2 = null;
      if (req.info.player_of_match){
        playerOfMatch = players.find(obj => obj.OtherName === req.info.player_of_match[0] || obj.Name === req.info.player_of_match[0]); //get players from players array
        if(req.info.player_of_match.length > 1){ // if 2 player of the match exists
          playerOfMatch2 = players.find(obj => obj.OtherName === req.info.player_of_match[1] || obj.Name === req.info.player_of_match[1]);
        }
      }
      let matchVenue = await GetVenue(req.info.venue.trim()); //get venue id
      let wickets = null
      let runs = null
      if (req.info.outcome.by){ // if 'by' exists in outcome 
        if(req.info.outcome.by.wickets){ // if match was won by wickets
          wickets = req.info.outcome.by.wickets;
        }
        else { // if match was won by runs
          runs = req.info.outcome.by.runs;
        }
      } 
      let isByInning = false;
      if (req.info.outcome?.innings) isByInning = true;
      // filling objects to pass to addmatch sp 
      let matchObj = {
        EventId : eventId,
        MatchDate : req.info.dates[0],
        WinnerTeam : winnerTeam?.Id ?? null,
        Wickets : wickets,
        Runs : runs,
        BallsPerOver : req.info.balls_per_over,
        PlayerOfMatch : playerOfMatch?.Id ?? null,
        PlayerOfMatch2 : playerOfMatch2?.Id ?? null,
        DataVersion : req.meta.data_version,
        CreationDate : req.meta.created,
        Revision : req.meta.revision,
        MatchTypeNumber : req.info.match_type_number,
        EventMatchNo : req.info?.event?.match_number ?? null,
        FirstTeam : teams[0].Id,
        SecondTeam : teams[1].Id,
        TossWon : tossWon.Id,
        IsBatFirst : req.info.toss.decision == 'bat' ? 1 : 0,
        Season : req.info.season,
        Venue : matchVenue.Id,
        Overs : req.info.overs ? req.info.overs : null,
        Outcome : req.info.outcome?.result ?? null,
        ByInning : isByInning,
        IsMale : req.info.gender == 'male',
        MatchType : MatchTypeEnum.indexOf(req.info.match_type) + 1,
        Comments : req.meta?.file_name ?? null
      }
      let matchID =  await _Add(matchObj); // inserting data in matches table and getting matchId as return
      return matchID[0][0].Id;
    }
    catch (error) {
      await LogError('Match', null, 'match.InsertMatchData()', error);
    }
}

async function AddDates(dates, matchId) {
  try {
    let datesList = []
    for (let date of dates){
      datesList.push(date)
    }
    await _AddDates(datesList, matchId);
  }
  catch (error) {
    await LogError('Match', matchId, 'match.AddDates()', error);
  }
}

async function AddBowlOut(bowlOut, matchId) {
  try {
    for (let obj of bowlOut){
      let player = players.find((x) => x.OtherName === obj.bowler || x.Name === obj.bowler);
      let isHit = obj.outcome == 'hit';
      await _AddBowlOut(player.Id, isHit, matchId)
    }
  }
  catch (error) {
    await LogError('Match', matchId, 'match.AddBowlOut()', error);
  }
}

async function AddSuperSubs(superSubs, matchId) {
  try {
    for (let team in superSubs){
      let teamId = teams.find(obj => obj.Name === team).Id;
      let playerId = players.find(obj => obj.OtherName === superSubs[team] || obj.Name === superSubs[team]).Id;
      await _AddSuperSub(playerId, teamId, matchId);
    }
  }
  catch (error) {
    await LogError('Match', matchId, 'match.AddSuperSubs()', error);
  }
}

export const AddMatch = Add;