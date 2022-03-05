require ("global")

--[[

Quest Script

Name: 	A Bitter Oil to Swallow
Code: 	Wld0g3
Id: 	110764
Prereq: Level 17, Any Class

]]

-- Sequence Numbers
SEQ_000	= 0;  -- Kill Oilbugs.
SEQ_001	= 1;  -- Talk to Eugenaire.

-- Actor Class Ids
ENPC_EUGENAIRE 				= 1001190;
BNPC_OILBUG					= 2103910;

-- Quest Markers
MRKR_EUGENAIRE				= 11120201;
MRKR_OILBUG_AREA			= 11120202;

-- Counters
COUNTER_OIL 				= 0;

-- Quest Details
OBJECTIVE_OIL				= 8;

function onStart(player, quest)	
	quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)	
	if (sequence == SEQ_ACCEPT) then
		quest:SetENpc(ENPC_EUGENAIRE, QFLAG_PLATE);
	elseif (sequence == SEQ_000) then
        quest:SetENpc(ENPC_EUGENAIRE);
		quest:SetENpc(BNPC_OILBUG);
	elseif (sequence == SEQ_001) then
		quest:SetENpc(ENPC_EUGENAIRE, QFLAG_REWARD);
	end	
end

function onTalk(player, quest, npc, eventName)
	local npcClassId = npc.GetActorClassId();
	local seq = quest:GetSequence();
    
	-- Offer the quest
	if (npcClassId == ENPC_EUGENAIRE and seq == SEQ_ACCEPT) then
		local questAccepted = callClientFunction(player, "delegateEvent", player, quest, "processEventEugenaireStart");
		if (questAccepted == 1) then
			player:AcceptQuest(quest);
		end
		player:EndEvent();
		return;	
	-- Quest Progress
	elseif (seq == SEQ_000) then
        if (npcClassId == ENPC_EUGENAIRE) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_000");
		end
	--Quest Complete
	elseif (seq == SEQ_001) then
		if (npcClassId == ENPC_EUGENAIRE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent_010");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 200, 1, 1, 9);
            player:CompleteQuest(quest);
		end
	end
	
	quest:UpdateENPCs();	
	player:EndEvent();
end

-- TODO FINISH THIS
function onKillBNpc(player, quest, bnpc)
	if (bnpc == BNPC_OILBUG) then
		local counterAmount = quest:GetData():IncCounter(COUNTER_OIL);
		attentionMessage(player, 51062, 0, counterAmount, 4); -- You obtain <item>
        if (counterAmount >= OBJECTIVE_OIL) then
			attentionMessage(player, 25225, quest:GetQuestId()); -- Objectives complete!
			quest:StartSequence(SEQ_001);
		end
	end
end

function getJournalInformation(player, quest)
	return quest:GetData():GetCounter(COUNTER_OIL);
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
    
    if (sequence == SEQ_000) then
		return MRKR_OILBUG_AREA;
    elseif (sequence == SEQ_001) then
        return MRKR_EUGENAIRE;
    end
end