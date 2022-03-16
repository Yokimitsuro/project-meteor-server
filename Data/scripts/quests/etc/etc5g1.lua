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

-- Quest Items
ITEM_WANTED_GAUWYN      = 10011243;

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
        local hasQuestItem = player:GetItemPackage(INVENTORY_NORMAL):HasItem(ITEM_WANTED_GAUWYN);
        local otopaFlag = 0;
        
        if (hasQuestItem == false) then 
            otopaFlag = 2; 
        end
        quest:SetENpc(OTOPA_POTTOPA, otopaFlag);
        quest:SetENpc(VKOROLON, QFLAG_NORM); -- Always shows despite interaction
    end
    
    if (sequence == SEQ_000) then


    elseif (sequence == SEQ_010) then 
      
    end
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
    
    if (sequence == SEQ_ACCEPT) then
        if (classId == OTOPA_POTTOPA) then
            local hasQuestItem = player:GetItemPackage(INVENTORY_NORMAL):HasItem(ITEM_WANTED_GAUWYN);
            
            if (not hasQuestItem) then
                callClientFunction(player, "delegateEvent", player, quest, "processEventOTOPAPOTTOPAStart");
                giveWantedItem(player);
                npc:SetQuestGraphic(player, QFLAG_NONE);
            else
                callClientFunction(player, "delegateEvent", player, quest, "processEventOTOPAPOTTOPAStart_2");
            end 
            player:SendGameMessage(player, GetWorldMaster(), 51148, MESSAGE_TYPE_SYSTEM, 10011243, 2075); -- Log out in The Roost w/ item.
            
        elseif (classId == VKOROLON) then
            -- This retail accurate.  No dialog functions called.
            player:SendGameMessage(player, GetWorldMaster(), 51148, MESSAGE_TYPE_SYSTEM, 10011243, 2075);
        end
        
    elseif (sequence == SEQ_000) then
       
    elseif (sequence == SEQ_010) then

    end
    
    player:EndEvent()
	quest:UpdateENPCs();
end


function onPush(player, quest, npc)
	local npcClassId = npc.GetActorClassId();
	
    player:EndEvent();
    if (npcClassId == PRIVATE_AREA_ENTRANCE) then
        GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 9999); -- Temp
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
    end
end