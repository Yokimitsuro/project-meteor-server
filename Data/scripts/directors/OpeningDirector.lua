require("global")

function init()
	return "/Director/OpeningDirector";
end

function onEventStarted(player, actor, eventTrigger, eventName)		
	
	if (player:HasQuest(110001) == true) then
		quest = player:GetQuest("Man0l0");
		quest:OnNotice(player);
	elseif (player:HasQuest(110005) == true) then
		quest = player:GetQuest("Man0g0");
		quest:OnNotice(player);
	elseif (player:HasQuest(110009) == true) then
		quest = player:GetQuest("Man0u0");
		quest:OnNotice(player);
	end
	
end

function main()
end

function onTalkEvent(player, npc)

	if (player:HasQuest(110001) == true) then
		man0l0Quest = player:GetQuest("man0l0");
		
		if (man0l0Quest:GetQuestFlag(MAN0L0_FLAG_MINITUT_DONE1) == true and man0l0Quest:GetQuestFlag(MAN0L0_FLAG_MINITUT_DONE2) == true and man0l0Quest:GetQuestFlag(MAN0L0_FLAG_MINITUT_DONE3) == true) then
			doorNpc = GetWorldManager():GetActorInWorldByUniqueId("exit_door");		
			player:SetEventStatus(doorNpc, "pushDefault", true, 0x2);
			doorNpc:SetQuestGraphic(player, 0x3);
		end
	elseif (player:HasQuest(110005) == true) then	
		man0g0Quest = player:GetQuest("man0g0");
		if (man0g0Quest:GetQuestFlag(MAN0L0_FLAG_STARTED_TALK_TUT) == true and man0g0Quest:GetQuestFlag(MAN0G0_FLAG_MINITUT_DONE1) == false) then
			papalymo = GetWorldManager():GetActorInWorldByUniqueId("papalymo");	
			papalymo:SetQuestGraphic(player, 0x2);
		elseif (man0g0Quest:GetQuestFlag(MAN0L0_FLAG_STARTED_TALK_TUT) == true and man0g0Quest:GetQuestFlag(MAN0G0_FLAG_MINITUT_DONE1) == true) then			
			yda = GetWorldManager():GetActorInWorldByUniqueId("yda");	
			yda:SetQuestGraphic(player, 0x2);
		end
	elseif (player:HasQuest(110009) == true) then	
		man0u0Quest = player:GetQuest("man0u0");
		if (man0u0Quest:GetQuestFlag(MAN0U0_FLAG_MINITUT_DONE1) == true and man0u0Quest:GetQuestFlag(MAN0U0_FLAG_MINITUT_DONE2) == true and man0u0Quest:GetQuestFlag(MAN0U0_FLAG_MINITUT_DONE3) == true) then			
			exitTriggerNpc = GetWorldManager():GetActorInWorldByUniqueId("exit_trigger");		
			player:SetEventStatus(exitTriggerNpc, "pushDefault", true, 0x2);
			exitTriggerNpc:SetQuestGraphic(player, 0x2);					
		end
	end

end
