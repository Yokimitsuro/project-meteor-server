require ("global")
require ("quests/man/man0l1")

function init()
	return "/Director/Quest/QuestDirectorMan0l101";
end

function onCreateContentArea(players, director, contentArea, contentGroup)

	sisipu = contentArea:SpawnActor(2290007, "sisipu", -8, 16.35, 6, 0.5);
	
	mob1 = contentArea:SpawnActor(2205403, "mob1", -3.02+3, 17.35, 14.24, -2.81);
	mob2 = contentArea:SpawnActor(2205403, "mob2", -3.02, 17.35, 14.24, -2.81);
	mob3 = contentArea:SpawnActor(2205403, "mob3", -3.02-3, 17.35, 14.24, -2.81);
	
	for _, player in pairs(players) do
        contentGroup:AddMember(player);
    end;
	
	contentGroup:AddMember(director);
	contentGroup:AddMember(yshtola);
	contentGroup:AddMember(stahlmann);
	contentGroup:AddMember(mob1);
	contentGroup:AddMember(mob2);
	contentGroup:AddMember(mob3);
	
end

function onEventStarted(player, director, triggerName)	

	local man0l1Quest = player:GetQuest("Man0l1");
	
	callClientFunction(player, "delegateEvent", player, man0l1Quest, "processEvent604");
	player:EndEvent();
	
	
end
