require ("global")

--[[

Quest Script

Name: 	Seeing the Seers
Code: 	Etc3g0
Id: 	110674
Prereq: Level 5, Any Class

]]

-- Sequence Numbers
SEQ_000	= 0;  -- Talk to all the seers.
SEQ_001	= 1;  -- Return to Kinnison.

-- Actor Class Ids
KINNISON 		= 1001430;
SYBELL 			= 1001437;
KHUMA_MOSHROCA	= 1001081;
NELLAURE 		= 1000821;
MESTONNAUX 		= 1001103;
LEFWYNE 		= 1001396;

-- Quest Markers
MRKR_KINNISON		= 11080001
MRKR_SYBELL			= 11080002
MRKR_KHUMA_MOSHROCA	= 11080003
MRKR_NELLAURE		= 11080004
MRKR_MESTONNAUX		= 11080005
MRKR_LEFWYNE		= 11080006

-- Quest Flags
FLAG_TALKED_MESTONNAUX 		= 0;
FLAG_TALKED_SYBELL 			= 1;
FLAG_TALKED_NELLAURE 		= 2;
FLAG_TALKED_KHUMA_MOSHROCA 	= 3;
FLAG_TALKED_LEFWYNE 		= 4;

-- Quest Counters
COUNTER_TALKED              = 0;

--offerQuestResult = callClientFunction(player, "delegateEvent", player, quest, "processEventOffersStart");

function onStart(player, quest)	
	quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onSequence(player, quest, sequence)	
	if (sequence == SEQ_000) then
        quest:AddENpc(KINNISON);
		quest:AddENpc(SYBELL,           (not quest:GetFlag(FLAG_TALKED_SYBELL) and QFLAG_PLATE or QFLAG_NONE));
		quest:AddENpc(KHUMA_MOSHROCA,   (not quest:GetFlag(FLAG_TALKED_KHUMA_MOSHROCA) and QFLAG_PLATE or QFLAG_NONE));
		quest:AddENpc(NELLAURE,         (not quest:GetFlag(FLAG_TALKED_NELLAURE) and QFLAG_PLATE or QFLAG_NONE));
		quest:AddENpc(MESTONNAUX,       (not quest:GetFlag(FLAG_TALKED_MESTONNAUX) and QFLAG_PLATE or QFLAG_NONE));
		quest:AddENpc(LEFWYNE,          (not quest:GetFlag(FLAG_TALKED_LEFWYNE) and QFLAG_PLATE or QFLAG_NONE));
	elseif (sequence == SEQ_001) then
		quest:AddENpc(KINNISON, QFLAG_PLATE);
	end	
end


function onTalk(player, quest, npc, eventName)
	local npcClassId = npc.GetActorClassId();
	local seq = quest:GetSequence();
	local incCounter = false;
    
	if (seq == SEQ_000) then
        if (npcClassId == KINNISON) then
            callClientFunction(player, "delegateEvent", player, quest, "processEventOffersAfter");
		elseif (npcClassId == SYBELL) then
			if (not quest:GetFlag(FLAG_TALKED_SYBELL)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEventSybellSpeak");
				quest:SetFlag(FLAG_TALKED_SYBELL);
                incCounter = true;
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEventSybellSpeakAfter");
			end
		elseif (npcClassId == KHUMA_MOSHROCA) then
			if (not quest:GetFlag(FLAG_TALKED_KHUMA_MOSHROCA)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEventKhumaSpeak");
				quest:SetFlag(FLAG_TALKED_KHUMA_MOSHROCA);
               incCounter = true;
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEventKhumaSpeakAfter");
			end
		elseif (npcClassId == NELLAURE) then
			if (not quest:GetFlag(FLAG_TALKED_NELLAURE)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEventNellaureSpeak");
				quest:SetFlag(FLAG_TALKED_NELLAURE);	
                incCounter = true;
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEventNellaureSpeakAfter");
			end
		elseif (npcClassId == MESTONNAUX) then
			if (not quest:GetFlag(FLAG_TALKED_MESTONNAUX)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEventMestonnauxSpeak");
				quest:SetFlag(FLAG_TALKED_MESTONNAUX);
                incCounter = true;                
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEventMestonnauxSpeakAfter");
			end
		elseif (npcClassId == LEFWYNE) then
			if (not quest:GetFlag(FLAG_TALKED_LEFWYNE)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEventLefwyneSpeak");
				quest:SetFlag(FLAG_TALKED_LEFWYNE);	
                incCounter = true;
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEventLefwyneSpeakAfter");
			end
		end
		
        
		-- Increase objective counter & play relevant messages
		if (incCounter == true) then
            quest:IncCounter(COUNTER_TALKED);
            local counterAmount = quest:GetCounter(COUNTER_TALKED);

            attentionMessage(player, 51061, 0, counterAmount, 5); -- You have heard word of the Seedseers. (... of 5)
            
            if (seq000_checkCondition(quest)) then -- All Seers spoken to
                attentionMessage(player, 25225, 110674); -- "Seeing the Seers" objectives complete!
                quest:UpdateENPCs(); -- Band-aid for a QFLAG_PLATE issue
                quest:StartSequence(SEQ_001);
            end
        end
        
	elseif (seq == SEQ_001) then
		--Quest Complete
		if (npcClassId == KINNISON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventClear");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 200, 1, 1, 9);
            player:CompleteQuest(quest:GetQuestId());
		end
	end
	quest:UpdateENPCs();	
	player:EndEvent();
end


-- Check if all seers are talked to
function seq000_checkCondition(quest)
	return (quest:GetFlag(FLAG_TALKED_SYBELL) and
			quest:GetFlag(FLAG_TALKED_KHUMA_MOSHROCA) and
			quest:GetFlag(FLAG_TALKED_NELLAURE) and
			quest:GetFlag(FLAG_TALKED_MESTONNAUX) and
			quest:GetFlag(FLAG_TALKED_LEFWYNE));
end


function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
    local possibleMarkers = {};
    
    if (sequence == SEQ_000) then
        if (not quest:GetFlag(FLAG_TALKED_SYBELL)) then table.insert(possibleMarkers, MRKR_SYBELL); end
        if (not quest:GetFlag(FLAG_TALKED_KHUMA_MOSHROCA)) then table.insert(possibleMarkers, MRKR_KHUMA_MOSHROCA); end
        if (not quest:GetFlag(FLAG_TALKED_NELLAURE)) then table.insert(possibleMarkers, MRKR_NELLAURE); end
        if (not quest:GetFlag(FLAG_TALKED_MESTONNAUX)) then table.insert(possibleMarkers, MRKR_MESTONNAUX); end
        if (not quest:GetFlag(FLAG_TALKED_LEFWYNE)) then table.insert(possibleMarkers, MRKR_LEFWYNE); end
    elseif (sequence == SEQ_001) then
        table.insert(possibleMarkers, MRKR_KINNISON);
    end
    
    return unpack(possibleMarkers)
end