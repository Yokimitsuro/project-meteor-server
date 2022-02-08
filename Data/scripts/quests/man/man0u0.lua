require("global");

--[[

Quest Script

Name:   Flowers for All 
Code:   Man0u0
Id:     110009
Prereq: None (Given on chara creation)
Notes: RURURAJI scripting handled via PopulaceChocoboLender.lua
TO-DO: Sequence 000 - Crowd NPCs.  
       Sequence 010 - Adv. Guild NPCs
]]

-- Sequence Numbers
SEQ_000 = 0;  -- On the Merchant Strip in Ul'dah; contains the basic tutorial.
SEQ_005 = 5;  -- Combat on the Sapphire Avenue Exchange
SEQ_010 = 10; -- Back on the Merchant Strip in Ul'dah

-- Actor Class Ids
ASCILIA                 = 1000042;
WARBURTON               = 1000186;
RURURAJI                = 1000840;
BIG_BELLIED_BARKER      = 1001490;
FRETFUL_FARMHAND        = 1001491;
DEBAUCHED_DEMONESS      = 1001492;
DAPPER_DAN              = 1001493;
LOUTISH_LAD             = 1001494;
GIL_DIGGING_MISTRESS    = 1001495;
TWITTERING_TOMBOY       = 1001496;
STOCKY_STRANGER         = 1001644;
EXIT_TRIGGER            = 1090372;
OPENING_STOPER_ULDAH    = 1090373;



KEEN_EYED_MERCHANT      = 1000401;
-- MUMPISH_MIQOTE = 1000992; -- Unused on this client version
HIGH_SPIRITED_FELLOW    = 1001042;
DISREPUTABLE_MIDLANDER  = 1001044;
LONG_LEGGED_LADY        = 1001112;
LARGE_LUNGED_LABORER    = 1001645;
TOOTH_GRINDING_TRAVELER = 1001646;
FULL_LIPPED_FILLE       = 1001647;
YAYATOKI                = 1500129;

BLOCKER1                = 1090372;
BLOCKER2                = 1090372;
ULDAH_OPENING_EXIT      = 1099046;
--1001114-1001140: Untargetable standby actors for sequence 000:  Add the correct ones at some point



-- Quest Markers
MRKR_YAYATOKI               = 11000901;
MRKR_ASCILIA                = 11000902;
MRKR_FRETFUL_FARMHAND       = 11000903;
MRKR_GIL_DIGGING_MISTRESS   = 11000904;
MRKR_COMBAT_TUTORIAL        = 11000905;
MRKR_ADV_GUILD              = 11000906;


-- Quest Flags
FLAG_SEQ000_MINITUT0    = 0; -- PushEvent ASCILIA
FLAG_SEQ000_MINITUT1    = 1; -- TalkEvent ASCILIA
FLAG_SEQ000_MINITUT2    = 2; -- TalkEvent FRETFUL_FARMHAND
FLAG_SEQ000_MINITUT3    = 3; -- TalkEvent GIL_DIGGING_MISTRESS

FLAG_SEQ010_TALK0       = 0; -- TalkEvent YAYATOKI


function onStart(player, quest) 
    quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onSequence(player, quest, sequence)

    if (sequence == SEQ_000) then
        -- Setup states incase we loaded in.
        local asciliaCanPush = not quest:GetFlag(FLAG_SEQ000_MINITUT0);
        local asciliaFlag = quest:GetFlag(FLAG_SEQ000_MINITUT1) and QFLAG_NONE or QFLAG_PLATE; 
        local fretfulfarmhandFlag = quest:GetFlag(FLAG_SEQ000_MINITUT2) and QFLAG_NONE or QFLAG_PLATE;
        local gildiggingmistressFlag = quest:GetFlag(FLAG_SEQ000_MINITUT3) and QFLAG_NONE or QFLAG_PLATE; 
		
		local exitFlag = quest:GetFlags() == 0xF and QFLAG_MAP or QFLAG_NONE;

        if (asciliaCanPush) then
            fretfulfarmhandFlag = QFLAG_NONE;
            gildiggingmistressFlag = QFLAG_NONE;
        end 
            
        --AddENpc(classId, byte flagType=0,isTalkEnabled, isPushEnabled, isEmoteEnabled, isSpawned)
        quest:AddENpc(ASCILIA, asciliaFlag, true, asciliaCanPush);
        quest:AddENpc(WARBURTON);
        quest:AddENpc(RURURAJI);
        quest:AddENpc(BIG_BELLIED_BARKER);
        quest:AddENpc(FRETFUL_FARMHAND, fretfulfarmhandFlag);
        quest:AddENpc(DEBAUCHED_DEMONESS);
        quest:AddENpc(DAPPER_DAN);
        quest:AddENpc(LOUTISH_LAD);
        quest:AddENpc(GIL_DIGGING_MISTRESS, gildiggingmistressFlag);
        quest:AddENpc(TWITTERING_TOMBOY);
        quest:AddENpc(STOCKY_STRANGER);
        quest:AddENpc(EXIT_TRIGGER, exitFlag, false, true);
        quest:AddENpc(OPENING_STOPER_ULDAH, QFLAG_NONE, false, false, true);

    elseif (sequence == SEQ_010) then 
        local yayatokiFlag = quest:GetFlag(FLAG_SEQ010_TALK0) and QFLAG_NONE or QFLAG_PLATE;
        local uldahopeningexitFlag = not quest:GetFlag(FLAG_SEQ010_TALK0) and QFLAG_NONE or QFLAG_MAP;
        quest:AddENpc(KEEN_EYED_MERCHANT);
        quest:AddENpc(HIGH_SPIRITED_FELLOW);
        quest:AddENpc(DISREPUTABLE_MIDLANDER);
        quest:AddENpc(LONG_LEGGED_LADY);
        quest:AddENpc(LARGE_LUNGED_LABORER);
        quest:AddENpc(TOOTH_GRINDING_TRAVELER);
        quest:AddENpc(FULL_LIPPED_FILLE);
        quest:AddENpc(YAYATOKI, yayatokiFlag);
        quest:AddENpc(BLOCKER1, QFLAG_NONE, false, true);
       -- quest:AddENpc(BLOCKER2, QFLAG_NONE, false, true);
        quest:AddENpc(ULDAH_OPENING_EXIT, uldahopeningexitFlag, false, true);
    end
end

function onTalk(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();
    
    if (sequence == SEQ_000) then
        seq000_onTalk(player, quest, npc, classId);
    elseif (sequence == SEQ_010) then
        seq010_onTalk(player, quest, npc, classId);     
    end
	quest:UpdateENPCs();
end

function onPush(player, quest, npc)

    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();  

    if (sequence == SEQ_000) then
        if (classId == ASCILIA) then
           callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal002");	
           player:EndEvent();
        elseif (classId == EXIT_TRIGGER) then
            if (quest:GetFlags() == 0xF) then
                doExitTrigger(player, quest, npc);
                return;
            else
                callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml001"); 
                GetWorldManager():DoPlayerMoveInZone(player, -22, 196, 87, 2.4, 0x11)
                player:EndEvent();
            end
        end
    elseif (sequence == SEQ_010) then
        if (classId == BLOCKER1) then
        
            posz = player:GetPos()[3];
            
            if (posz >= 71 and posz <= 95) then
                callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml002");
                GetWorldManager():DoPlayerMoveInZone(player, -22.81, 196, 87.82, 2.98, 0x11);
            else
                callClientFunction(player, "delegateEvent", player, quest, "processTtrBlkNml003");
                GetWorldManager():DoPlayerMoveInZone(player, -0.3, 196, 116, -2.7, 0x11);
            end
        elseif (classId == ULDAH_OPENING_EXIT) then  
            player:ReplaceQuest(quest, "Man0u1")
            return;
        end
    end
	quest:UpdateENPCs();
end

function onNotice(player, quest, target)
    callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal001withHQ");     
    player:EndEvent();
	quest:UpdateENPCs();
end

function seq000_onTalk(player, quest, npc, classId)
    
    if (classId == ASCILIA) then
		
		if (not quest:GetFlag(FLAG_SEQ000_MINITUT0)) then -- If Talk tutorial
			callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal003");
			quest:SetFlag(FLAG_SEQ000_MINITUT0); -- Used to disable her PushEvent / Allow for her next TalkEvent
		else
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini001");
            quest:SetFlag(FLAG_SEQ000_MINITUT1); -- Ascilia has now been talked to.
        end

    elseif (classId == FRETFUL_FARMHAND) then
        if (not quest:GetFlag(FLAG_SEQ000_MINITUT2)) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini002_first");
			quest:SetFlag(FLAG_SEQ000_MINITUT2);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini002");
		end        

    elseif (classId == GIL_DIGGING_MISTRESS) then
        if (not quest:GetFlag(FLAG_SEQ000_MINITUT3)) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini003_first");
			quest:SetFlag(FLAG_SEQ000_MINITUT3);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini003");
		end          
        
    elseif (classId == WARBURTON) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_3");
    elseif (classId == RURURAJI) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_13");
    elseif (classId == BIG_BELLIED_BARKER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
    elseif (classId == DEBAUCHED_DEMONESS) then
         callClientFunction(player, "delegateEvent", player, quest, "processEvent000_8");
    elseif (classId == DAPPER_DAN) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_9");
    elseif (classId == LOUTISH_LAD) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_10");
    elseif (classId == TWITTERING_TOMBOY) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_12");
    elseif (classId == STOCKY_STRANGER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6_2");
    end

    player:EndEvent();
end

function seq010_onTalk(player, quest, npc, classId) 

    if (classId == KEEN_EYED_MERCHANT) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
    elseif (classId == HIGH_SPIRITED_FELLOW) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
    elseif (classId == DISREPUTABLE_MIDLANDER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent020_4");
    elseif (classId == LONG_LEGGED_LADY) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_14");
    elseif (classId == LARGE_LUNGED_LABORER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEtc003");
    elseif (classId == TOOTH_GRINDING_TRAVELER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEtc001");
    elseif (classId == FULL_LIPPED_FILLE) then
        callClientFunction(player, "delegateEvent", player, quest, "processEtc002");
    elseif (classId == YAYATOKI) then
        if (not quest:GetFlag(FLAG_SEQ010_TALK0)) then
            callClientFunction(player, "delegateEvent", player, quest, "processEvent020_8");
            quest:SetFlag(FLAG_SEQ010_TALK0);
        else
            callClientFunction(player, "delegateEvent", player, quest, "processEvent020_8");
        end
    end

    player:EndEvent();
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
    local possibleMarkers = {};
    
    if (sequence == SEQ_000) then
        if (quest:GetFlag(FLAG_SEQ000_MINITUT0)) then 
            if (not quest:GetFlag(FLAG_SEQ000_MINITUT1)) then table.insert(possibleMarkers, MRKR_ASCILIA); end
            if (not quest:GetFlag(FLAG_SEQ000_MINITUT2)) then table.insert(possibleMarkers, MRKR_FRETFUL_FARMHAND); end
            if (not quest:GetFlag(FLAG_SEQ000_MINITUT3)) then table.insert(possibleMarkers, MRKR_GIL_DIGGING_MISTRESS); end
        end
    
    elseif (sequence == SEQ_010) then
        if (not quest:GetFlag(FLAG_SEQ010_TALK0)) then 
            table.insert(possibleMarkers, MRKR_YAYATOKI)
        else
            table.insert(possibleMarkers, MRKR_ADV_GUILD);
        end
    end
    
    return unpack(possibleMarkers)
end




function doExitTrigger(player, quest, npc)
    quest:ClearData();
    quest:StartSequence(SEQ_005);
    contentArea = player.CurrentArea:CreateContentArea(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man0u01", "SimpleContent30079", "Quest/QuestDirectorMan0u001");
    
    if (contentArea == nil) then
        return;
    end
    
    director = contentArea:GetContentDirector();		
    player:AddDirector(director);		
    director:StartDirector(false);
    
    player:KickEvent(director, "noticeEvent", true);
    player:SetLoginDirector(director);		
    
    GetWorldManager():DoZoneChangeContent(player, contentArea, -24.34, 192, 34.22, 0.78, 16);		
    return;
end


