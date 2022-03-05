require ("global")

--[[

Quest Script

Name: 	In the Name of Science
Code: 	Wld0g1
Id: 	110762
Prereq: Level 10, Any Class

]]

-- Sequence Numbers
SEQ_000	= 0;  -- Kill Sabletooth Spriggans.
SEQ_001	= 1;  -- Talk to Marcette.

-- Actor Class Ids
ENPC_MARCETTE 				= 1001583;
BNPC_SABLETOOTH_SPRIGGAN	= 2106214;

-- Quest Markers
MRKR_MARCETTE				= 11120001;
MRKR_SPRIGGAN_AREA			= 11120002;

-- Counters
COUNTER_TEETH 				= 0;

function onStart(player, quest)	
	quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)	
	if (sequence == SEQ_ACCEPT) then
		quest:SetENpc(ENPC_MARCETTE, QFLAG_PLATE);
	elseif (sequence == SEQ_000) then
        quest:SetENpc(ENPC_MARCETTE);
		quest:SetENpc(BNPC_SABLETOOTH_SPRIGGAN);
	elseif (sequence == SEQ_001) then
		quest:SetENpc(ENPC_MARCETTE, QFLAG_REWARD);
	end	
end

function onTalk(player, quest, npc, eventName)
	local npcClassId = npc.GetActorClassId();
	local seq = quest:GetSequence();
    
	-- Offer the quest
	if (npcClassId == ENPC_MARCETTE and seq == SEQ_ACCEPT) then
		local questAccepted = callClientFunction(player, "delegateEvent", player, quest, "processEventAtellouneStart");
		if (questAccepted == 1) then
			player:AcceptQuest(quest);
		end
		player:EndEvent();
		return;	
	-- Quest Progress
	elseif (seq == SEQ_000) then
        if (npcClassId == ENPC_MARCETTE) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
		end
	--Quest Complete
	elseif (seq == SEQ_001) then
		if (npcClassId == ENPC_MARCETTE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 200, 1, 1, 9);
            player:CompleteQuest(quest);
		end
	end
	
	quest:UpdateENPCs();	
	player:EndEvent();
end

-- TODO FINISH THIS
function onKillBNpc(player, quest, bnpc)
	if (bnpc == BNPC_SABLETOOTH_SPRIGGAN) then
		local counterAmount = quest:GetData():IncCounter(COUNTER_TEETH);
		attentionMessage(player, 51062, 0, counterAmount, 4); -- You have passed on word of the rite. (... of 5)
        if (counterAmount >= 4) then
			attentionMessage(player, 25225, quest:GetQuestId()); -- Objectives complete!
			quest:StartSequence(SEQ_001);
		end
	end
end

function getJournalInformation(player, quest)
	return quest:GetData():GetCounter(COUNTER_TEETH);
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
    
    if (sequence == SEQ_000) then
		return MRKR_SPRIGGAN_AREA;
    elseif (sequence == SEQ_001) then
        return MRKR_MARCETTE;
    end
end