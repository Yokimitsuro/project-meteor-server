require("global");

--[[

Quest Script

Name:   The Usual Suspect 
Code:   Etc5u1
Id:     110849
Prereq: Level 15. [110828 Etc5g0 / 110838 Etc5l0 / 110848 Etc5u0]
Notes:  Rewards 500 exp

]]

-- Sequence Numbers
SEQ_000 = 0;  
SEQ_010 = 10;  

-- Actor Class Ids
OTOPA_POTTOPA           = 1000864;
GAUWYN_THE_GANNET       = 1002065;
HILDIBRAND              = 1001995;
NASHU_MHAKARACCA        = 1001996;
PRIVATE_AREA_ENTRANCE   = 0;
PRIVATE_AREA_EXIT       = 0;

-- DefaultTalk NPCs?
UBOKHN                  = 1000668;
VANNES                  = 1001464;
XDHILOGO                = 1001466;
DARIUSTEL               = 1001467;
GUENCEN                 = 1001468;

-- Quest Items
ITEM_WANTED_GAUWYN      = 10011243;

-- Quest Markers
MRKR_COLISEUM           = 11092101;
MRKR_GAUWYN             = 11092102;
MRKR_OTOPA_POTTOPA      = 11092103;



function onStart(player, quest)
    quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end


function onStateChange(player, quest, sequence)
    if (sequence == SEQ_ACCEPT) then
        quest:SetENpc(OTOPA_POTTOPA, QFLAG_NORM); -- TO-DO: Check player inventory for quest-specific item before flagging?
    end
    
    if (sequence == SEQ_000) then
        quest:SetENpc(OTOPA_POTTOPA);
        quest:SetENpc(GAUWYN_THE_GANNET, QFLAG_NORM);
        quest:SetENpc(HILDIBRAND);
        quest:SetENpc(NASHU_MHAKARACCA);
        quest:SetENPC(PRIVATE_AREA_ENTRANCE, QFLAG_MAP, false, true)
        quest:SetENpc(PRIVATE_AREA_EXIT, QFLAG_NONE, false, true);
    elseif (sequence == SEQ_010) then 
        quest:SetENpc(OTOPA_POTTOPA, QFLAG_REWARD);
        quest:SetENpc(GAUWYN_THE_GANNET);
        quest:SetENpc(HILDIBRAND);
        quest:SetENpc(NASHU_MHAKARACCA);
        quest:SetENpc(PRIVATE_AREA_EXIT, QFLAG_NONE, false, true);
    end
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
    
    if (sequence == SEQ_ACCEPT) then
        if (classId == OTOPA_POTTOPA) then
            -- TO-DO: Add inventory check here?
            callClientFunction(player, "delegateEvent", player, quest, "processEventOTOPAPOTTOPAStart");
            giveWantedItem(player);
            --processEventOTOPAPOTTOPAStart_2 
        end
        
    elseif (sequence == SEQ_000) then
        if (classId == OTOPA_POTTOPA) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_000_1");
        elseif (classId == GAUWYN_THE_GANNET) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010");
            attentionMessage(player, 25225, quest.GetQuestId()); -- objectives complete!
            quest:UpdateENPCs(); -- Band-aid for a QFLAG_NORM issue
            quest:StartSequence(SEQ_010);
        elseif (classId == HILDIBRAND) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_1");
        elseif (classId == NASHU_MHAKARACCA) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_2");
        end  
        
    elseif (sequence == SEQ_010) then
        if (classId == HILDIBRAND) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_1");
        elseif (classId == NASHU_MHAKARACCA) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_2");
        elseif (classId == GAUWYN_THE_GANNET) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_3");     
        elseif (classId == OTOPA_POTTOPA) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_020"); 
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 500, 1, 1);
            player:CompleteQuest(quest); 
            player:SendGameMessage(player, GetWorldMaster(), 51148, MESSAGE_TYPE_SYSTEM, 10011243, 2075); -- Log out in The Roost w/ item.
        end
    end
    
    player:EndEvent()
	quest:UpdateENPCs();
end


function onPush(player, quest, npc)
	local npcClassId = npc.GetActorClassId();
	
    player:EndEvent();
    if (npcClassId == PRIVATE_AREA_ENTRANCE) then
        -- TO-DO: Needs spawn coordinates + Private Area arranged
        GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9999);
    elseif (npcClassId == PRIVATE_AREA_EXIT) then
        GetWorldManager():WarpToPublicArea(player);
    end
end



function getJournalInformation(player, quest)
end


function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();

    if (sequence == SEQ_000) then  
        return MRKR_COLISEUM -- TO-DO:  Add a check for that specific private area and have it return MRKR_GAUWYN?
    elseif (sequence == SEQ_010) then
        return MRKR_OTOPA_POTTOPA
    end
end


function giveWantedItem(player)

    local invCheck = player:getItemPackage(INVENTORY_NORMAL):addItem(ITEM_WANTED_GAUWYN, 1, 1);
            
    if (invCheck == INV_ERROR_FULL) then
        -- Your inventory is full.
        player:SendGameMessage(player, GetWorldMaster(), 60022, MESSAGE_TYPE_SYSTEM_ERROR);
    elseif (invCheck == INV_ERROR_ALREADY_HAS_UNIQUE) then
        -- You cannot have more than one <itemId> <quality> in your possession at any given time.
        player:SendGameMessage(player, GetWorldMaster(), 40279, MESSAGE_TYPE_SYSTEM_ERROR, ITEM_WANTED_GAUWYN, 1);
    elseif (invCheck == INV_ERROR_SYSTEM_ERROR) then
        player:SendMessage(MESSAGE_TYPE_SYSTEM, "", "[DEBUG] Server Error on adding item.");
    elseif (invCheck == INV_ERROR_SUCCESS) then
        player:SendGameMessage(player, GetWorldMaster(), 25246, MESSAGE_TYPE_SYSTEM_ERROR, ITEM_WANTED_GAUWYN, 1);
        player:SendGameMessage(player, GetWorldMaster(), 51148, MESSAGE_TYPE_SYSTEM, 10011243, 3071); -- Log out in The Hourglass w/ item.
    end
end