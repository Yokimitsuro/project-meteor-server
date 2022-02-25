require("global");

--[[

Quest Script

Name:   Souls Gone Wild  
Code:   Man0g1
Id:     110006
Prereq: Sundered Skies (Man0g0 - 110005)
Notes:



]]


-- Sequence Numbers
SEQ_000 = 0; 


-- Actor Class Ids
MIOUNNE                         = 1000230;
VKOROLON                        = 1000458;
WISPILY_WHISKERED_WOODWORKER    = 1000562;
AMIABLE_ADVENTURER              = 1001057;
MOROSE_MERCHANT                 = 1001058;
NARROW_EYED_ADVENTURER          = 1001059;
BEAMING_ADVENTURER              = 1001062;
WELL_BUNDLED_ADVENTURER         = 1001060;
UNCONCERNED_PASSERBY            = 1001648; -- I don't think this was used?

-- Quest Markers
MRKR_MIOUNNE             = 11000601;

-- Quest Items
ITEM_VELODYNA_COSMOS = 0; -- Seq_000 : 2nd journal arg.    >=5 doesn't have.


-- Quest Flags
FLAG_SEQ000     = 0; 

function onStart(player, quest) 
    quest:StartSequence(SEQ_000);
    
    -- Immediately move to the Adventurer's Guild private area
	callClientFunction(player, "delegateEvent", player, quest, "processEvent100");
	GetWorldManager():DoZoneChange(player, 155, "PrivateAreaMasterPast", 2, 15, 67.034, 4, -1205.6497, -1.074);	
	player:endEvent();
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)

    if (sequence == SEQ_000) then
        -- Setup states incase we loaded in.

        --SetENpc(classId, byte flagType=0,isTalkEnabled, isPushEnabled, isEmoteEnabled, isSpawned)        
        quest:SetENpc(MIOUNNE, QFLAG_PLATE);
       -- quest:SetENpc(VKOROLON);
        quest:SetENpc(WISPILY_WHISKERED_WOODWORKER);
        quest:SetENpc(AMIABLE_ADVENTURER);
        quest:SetENpc(MOROSE_MERCHANT);
        quest:SetENpc(NARROW_EYED_ADVENTURER);
        quest:SetENpc(BEAMING_ADVENTURER);
        quest:SetENpc(WELL_BUNDLED_ADVENTURER);
        quest:SetENpc(UNCONCERNED_PASSERBY);
        
    elseif (sequence == SEQ_005) then 
        quest:SetENpc(MIOUNNE);
    end
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
    
    if (sequence == SEQ_000) then
        seq000_onTalk(player, quest, npc, classId);
    elseif (sequence == SEQ_005) then
        seq005_onTalk(player, quest, npc, classId);     
    end
	quest:UpdateENPCs();
end

function onPush(player, quest, npc)

    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();  
    player:SendMessage(0x20, "", "Sequence: "..sequence.." Class Id: "..classId);
    if (sequence == SEQ_000) then
    
    elseif (sequence == SEQ_010) then
   
    end
	quest:UpdateENPCs();
end


function onNotice(player, quest, target)
    callClientFunction(player, "delegateEvent", player, quest, "processEvent000_1"); -- Describes what an Instance is
    player:EndEvent();
	quest:UpdateENPCs();
end


    
function seq000_onTalk(player, quest, npc, classId)
    
    if (classId == MOMODI) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
        player:EndEvent();
        quest:StartSequence(SEQ_005);
        GetWorldManager():DoZoneChange(player, 175, nil, 0, 15, player.positionX, player.positionY, player.positionZ, player.rotation);
        return;
    elseif (classId == BEAMING_ADVENTURER) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent100_6");
    elseif (classId == AMIABLE_ADVENTURER) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent100_3");
    elseif (classId == MOROSE_MERCHANT) then
        callClientFunction (player, "delegateEvent", player, quest, "processEvent100_2");
    elseif (classId == NARROW_EYED_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent100_7");
    elseif (classId == UNCONCERNED_PASSERBY) then
        callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml001"); --"processEvent100_9");
    elseif (classId == VKOROLON) then
        callClientFunction(player, "delegateEvent", player, quest, "defaultTalkWithVkorolon_001");
    elseif (classId == WELL_BUNDLED_ADVENTURER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent100_4");        
    elseif (classId == WISPILY_WHISKERED_WOODWORKER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent100_8");
    elseif (classId == MIOUNNE) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent110");        
        player:EndEvent();
        quest:StartSequence(SEQ_005);
        GetWorldManager():DoZoneChange(player, 155, nil, 0, 15, player.positionX, player.positionY, player.positionZ, player.rotation);
    end

    player:EndEvent();
end

function seq005_onTalk(player, quest, npc, classId) 
    if (classId == MOMODI) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
    end

    player:EndEvent();
end


function getJournalInformation(player, quest)
	return 0, ITEM_VELODYNA_COSMOS, ITEM_COLISEUM_PASS;
end


function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
    local possibleMarkers = {};

    if (sequence == SEQ_000) then
        table.insert(possibleMarkers, MRKR_MIOUNNE);
    elseif (sequence == SEQ_010) then

    end

    return unpack(possibleMarkers)
end


