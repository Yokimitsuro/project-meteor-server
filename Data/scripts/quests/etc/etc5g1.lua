require("global");

--[[

Quest Script

Name:   In Plain Sight 
Code:   Etc5g1
Id:     110829
Prereq: Level 15. Etc5u1 (The Usual Suspect) completed.
Notes: 

]]

-- Sequence Numbers
SEQ_000 = 0;  
SEQ_010 = 10;  

-- Actor Class Ids
OTOPA_POTTOPA           = 1000864;
VKOROLON                = 1000458;
NICOLIAUX               = 1000409;
POWLE                   = 1000238;
AUNILLIE                = 1000410;
GAUWYN_THE_GANNET       = 1002065;
HILDIBRAND              = 1002067;
NASHU_MHAKARACCA        = 1001996;
PRIVATE_AREA_ENTRANCE   = 0;
PRIVATE_AREA_EXIT       = 0;

-- DefaultTalk NPCs?
SANSA                   = 1000239;
ELYN                    = 1000411;
RYD                     = 1000412;

-- Quest Markers
MRKR_ACORN_ORCHARD      = 11082101;
MRKR_NICOLIAUX          = 11082102;
MRKR_VKOROLON           = 11082103;


function onStart(player, quest)
    quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end


function onStateChange(player, quest, sequence)
    if (sequence == SEQ_ACCEPT) then
        quest:SetENpc(OTOPA_POTTOPA, QFLAG_NORM); -- TO-DO: Check player inventory for quest-specific item before flagging?
        quest:SetENpc(VKOROLON, QFLAG_NORM); -- Always shows despite interaction
    end
    
    if (sequence == SEQ_000) then
        quest:SetENpc(VKOROLON);
        quest:SetENpc(NICOLIAUX, QFLAG_NORM);
        quest:SetENpc(POWLE);
        quest:SetENpc(AUNILLIE);
        quest:SetENpc(GAUWYN_THE_GANNET);
        quest:SetENpc(HILDIBRAND);
        quest:SetENpc(NASHU_MHAKARACCA);
        quest:SetENPC(PRIVATE_AREA_ENTRANCE, QFLAG_MAP, false, true)
        quest:SetENpc(PRIVATE_AREA_EXIT, QFLAG_NONE, false, true);

    elseif (sequence == SEQ_010) then 
        quest:SetENpc(VKOROLON, QFLAG_REWARD);
        quest:SetENpc(NICOLIAUX);
        quest:SetENpc(POWLE);
        quest:SetENpc(AUNILLIE);
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
            callClientFunction(player, "delegateEvent", player, quest, "processEventOTOPAPOTTOPAStart");
            giveWantedItem(player);
        elseif (classId == VKOROLON) then
            -- This retail accurate.  No dialog functions called.
            player:SendGameMessage(player, GetWorldMaster(), 51148, MESSAGE_TYPE_SYSTEM, 10011243, 2075);
        end
        
    elseif (sequence == SEQ_000) then
        if (classId == VKOROLON) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_000_1"); -- This is a guess.
        elseif (classId == NICOLIAUX) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010")
            attentionMessage(player, 25225, quest.GetQuestId()); -- objectives complete!
            quest:UpdateENPCs(); -- Band-aid for a QFLAG_NORM issue
            quest:StartSequence(SEQ_010);            
        elseif (classId == GAUWYN_THE_GANNET) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_2");    
        elseif (classId == HILDIBRAND) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_3");  
        elseif (classId == NASHU_MHAKARACCA) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_4");  
        elseif (classId == AUNILLIE) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_5"); -- This is a guess. 
        elseif (classId == POWLE) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_6"); -- This is a guess.

        end
    elseif (sequence == SEQ_010) then
        if (classId == VKOROLON) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_020"); 
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 500, 1, 1);
            player:CompleteQuest(quest); 
            player:SendGameMessage(player, GetWorldMaster(), 51148, MESSAGE_TYPE_SYSTEM, 10011243, 1070); -- Log out in The Mizzenmast Inn w/ item.
        elseif (classId == NICOLIAUX) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_1")  -- This is a guess.            
        elseif (classId == GAUWYN_THE_GANNET) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_2");    
        elseif (classId == HILDIBRAND) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_3");  
        elseif (classId == NASHU_MHAKARACCA) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_4");  
        elseif (classId == AUNILLIE) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_5"); -- This is a guess. 
        elseif (classId == POWLE) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent_010_6"); -- This is a guess.            
        end
    end
    
    player:EndEvent()
	quest:UpdateENPCs();
end


function onPush(player, quest, npc)
	local npcClassId = npc.GetActorClassId();
	
    player:EndEvent();
    if (npcClassId == PRIVATE_AREA_ENTRANCE) then
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
        return MRKR_ACORN_ORCHARD; -- TO-DO: Check for private area and use MRKR_NICOLIAUX in place of this
    elseif (sequence == SEQ_010) then
        return MRKR_VKOROLON;
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