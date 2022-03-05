function init(npc)
	return false, false, 0, 0;	
end

function onEventStarted(player, npc, eventType, eventName)
	player:EndEvent();
	
	if (eventName == "caution") then
		player:SendGameMessage(player, GetWorldMaster(), 34109, 0x20);
	elseif (eventName == "exit") then
		local activeQuests = player:GetQuestsForNpc(npc);
		print(tostring(#activeQuests));
		if (#activeQuests >= 1) then
			activeQuests[1]:OnPush(player, npc, eventName);
		end
	end
end