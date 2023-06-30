import { _Add } from "../Data/deliveryData.js";
import { LogError } from "../Services/loggerService.js";
import { WicketTypeEnum,
   ExtraTypeEnum } from "../Shared/Enumerations.js";

async function AddAll(over, overId, players) {
  try {
    for (let delivery of over.deliveries) {
      await Add(delivery, overId, players);
    }
    return true;
  } 
  catch (error) {
    await LogError('Delivery', overId, 'delivery.AddAll()', error);
    return false;
  }
}

async function Add(delivery, overId, players) {
  try {
    let wicketTaken = delivery.wickets !== undefined;
    let WicketType = null;
    let BatterOut = null;
    let Fielder1 = null;
    let Fielder2 = null;
    if (wicketTaken){
      let wicket = delivery.wickets[0];
      WicketType = WicketTypeEnum.indexOf(wicket.kind) + 1;
      BatterOut = players.find((obj) => obj.OtherName === wicket.player_out || obj.Name === wicket.player_out).Id;
      if (wicket.fielders){
          Fielder1 = wicket.fielders[0]?.name ? 
            players.find((obj) => obj.OtherName === wicket.fielders[0].name || obj.Name === wicket.fielders[0].name).Id
             : -1 ;
          Fielder2 = wicket.fielders[1]?.name ?
            players.find((obj) => obj.OtherName === wicket.fielders[1].name || obj.Name === wicket.fielders[1].name).Id
             : null;
      }
    }

    let deliveryObj = {
      OverId: overId,
      Batter: players.find((obj) => obj.OtherName === delivery.batter || obj.Name === delivery.batter).Id,
      NonStriker: players.find((obj) => obj.OtherName === delivery.non_striker || obj.Name === delivery.non_striker).Id,
      Bowler: players.find((obj) => obj.OtherName === delivery.bowler || obj.Name === delivery.bowler).Id,
      BatterRuns: delivery.runs.batter,
      ExtraRuns: delivery.runs.extras,
      ExtraType: delivery.runs.extras > 0 ? ExtraTypeEnum.indexOf(Object.keys(delivery.extras)[0]) + 1 : null,
      ExtraType2: delivery.runs.extras > 0 && Object.keys(delivery.extras).length > 1 ?
       ExtraTypeEnum.indexOf(Object.keys(delivery.extras)[1]) + 1 : null,
      WicketType: WicketType,
      BatterOut: BatterOut,
      Fielder1: Fielder1,
      Fielder2: Fielder2,
    };
    return await _Add(deliveryObj, overId);
  } 
  catch (error) {
    await LogError('Delivery', overId, 'delivery.Add()', error);
  }
}

export const AddDelivery = AddAll;
