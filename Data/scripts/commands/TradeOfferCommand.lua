--[[

TradeOfferCommand Script

Handles what happens when you invite to trade

--]]

function onEventStarted(player, actor, triggerName, name, arg1, arg2, arg3, actorId)	

	local otherActor = nil;

	--ActorID Search
	if (actorId ~= nil) then
		otherActor = player.CurrentArea):FindActorInArea(actorId);
	--Name Search
	elseif (name ~= nil) then
		otherActor = player.CurrentArea:FindPCInZone(name);
	end
	
	if (otherActor ~= nil) then
		GetWorldManager():CreateTradeGroup(player, otherActor);
	else
	end
	
	player:EndEvent();	
end