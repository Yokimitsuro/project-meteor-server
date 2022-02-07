require ("global")

--[[

NpcLinkshellChatCommand Script

Handler for when a player clicks a npc ls to talk to. If adding new linkshells to the handle, make sure to add
it to the handler table (with correct offset), and that your function is above the handler. If padding is needed
to hit some ID, add "nils".

--]]

function onEventStarted(player, command, eventType, eventName, npcLsId)
	player:HandleNpcLS(npcLsId);
	player:EndEvent();
end
