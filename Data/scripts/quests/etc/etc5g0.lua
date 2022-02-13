require("global");

--[[

Quest Script

Name:   Waste Not Want Not
Code:   Etc5g0
Id:     110828
Prereq: Level 1 on any class.  Second MSQ completed. (110002 Man0l1 / 110006 Man0g1 / 110010 Man0u1)
Notes:  Rewards 200 gil

]]

-- Sequence Numbers
SEQ_000 = 0;  -- Talk to Pfarahr
SEQ_001 = 1;  -- Return to V'korolon

-- Actor Class Ids
VKOROLON                = 1000458;
PFARAHR                 = 1001707;

-- Quest Item
ITEM_WELL_WORN_BAG      = 11000224;

-- Quest Markers
MRKR_PFARAHR            = 11082001;
MRKR_VKOROLON           = 11082002;



function onStart(player, quest)
    -- processEventVKOROLONStart -- No means of properly accepting quests yet
    quest:StartSequence(SEQ_000);
    player:SendGameMessage(GetWorldMaster(), 25246, MESSAGE_TYPE_SYSTEM, ITEM_WELL_WORN_BAG, 1);
end

function onFinish(player, quest)
end



function onSequence(player, quest, sequence)
    if (sequence == SEQ_000) then
        quest:AddENpc(VKOROLON);
        quest:AddENpc(PFARAHR, QFLAG_PLATE);
    elseif (sequence == SEQ_001) then 
        quest:AddENpc(VKOROLON, QFLAG_PLATE);
        quest:AddENpc(PFARAHR);
    end
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
    
    if (sequence == SEQ_000) then
        if (classId == VKOROLON) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_000_1");
        elseif (classId == PFARAHR) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010");
            quest:StartSequence(SEQ_001);
            quest:DoComplete(); -- Need ref since it feels out of place. Just placing it here since original script had it.
        end
       
    elseif (sequence == SEQ_001) then
        if (classId == VKOROLON) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_020");
            --callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 200, 1); -- Reward window, shouldn't be handled by quest script
			player:CompleteQuest(quest:GetQuestId());
        elseif (classId == PFARAHR) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_1");
        end  
    end
    player:EndEvent()
	quest:UpdateENPCs();
end


function getJournalInformation(player, quest)
    local sequence = quest:getSequence();
    
    if (sequence == SEQ_000) then
        return ITEM_WELL_WORN_BAG;
    end
end


function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
    local possibleMarkers = {};
    
    if (sequence == SEQ_000) then
        table.insert(possibleMarkers, MRKR_PFARAHR);
    elseif (sequence == SEQ_001) then
        table.insert(possibleMarkers, MRKR_VKOROLON);
    end
    
    return unpack(possibleMarkers)
end



