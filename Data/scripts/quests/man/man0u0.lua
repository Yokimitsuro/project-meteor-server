require("global");

--[[

Quest Script

Name:   Flowers for All 
Code:   Man0u0
Id:     110009
Prereq: None (Given on chara creation)

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

--1001114-1001140: Untargetable standby actors:  Add the correct ones at some point for bookkeeping



-- Quest Markers
MKRK_YAYATOKI               = 11000901;
MKRK_ASCILIA                = 11000902;
MKRK_FRETFUL_FARMHAND       = 11000903;
MKRK_GIL_DIGGING_MISTRESS   = 11000904;
MKRK_UNKNOWN1               = 11000905;
MKRK_UNKNOWN2               = 11000906;


-- Quest Flags
FLAG_SEQ000_MINITUT0    = 0;
FLAG_SEQ000_MINITUT1    = 1;
FLAG_SEQ000_MINITUT2    = 2;
FLAG_SEQ000_MINITUT3    = 3;


--[[ FUNCTION LIST
processEvent000(A0_1, A1_2, A2_3)
processEvent000_2(A0_4, A1_5, A2_6)
processEvent000_3(A0_7, A1_8, A2_9)
processEvent000_4(A0_10, A1_11, A2_12)
processEvent000_5(A0_13, A1_14, A2_15)
processEvent000_6(A0_16, A1_17, A2_18)
processEvent000_6_2(A0_19, A1_20, A2_21)
processEvent000_7(A0_22, A1_23, A2_24)
processEvent000_8(A0_25, A1_26, A2_27)
processEvent000_9(A0_28, A1_29, A2_30)
processEvent000_10(A0_31, A1_32, A2_33)
processEvent000_11(A0_34, A1_35, A2_36)
processEvent000_12(A0_37, A1_38, A2_39)
processEvent000_13(A0_40, A1_41, A2_42)
processEvent000_14(A0_43, A1_44, A2_45)
processEvent010(A0_46, A1_47, A2_48)
processEvent020(A0_49, A1_50, A2_51)
processEvent020_2(A0_58, A1_59, A2_60)
processEvent020_3(A0_61, A1_62, A2_63)
processEvent020_4(A0_64, A1_65, A2_66)
processEvent020_5(A0_67, A1_68, A2_69)
processEvent020_6(A0_70, A1_71, A2_72)
processEvent020_7(A0_73, A1_74, A2_75)
processEvent020_8(A0_76, A1_77, A2_78)
processTtrNomal001withHQ(A0_79, A1_80, A2_81)
processTtrNomal001(A0_91, A1_92, A2_93)
    processTtrNomal002(A0_103, A1_104, A2_105, A3_106)
    processTtrNomal003(A0_113, A1_114, A2_115, A3_116)
processTtrAfterBtl001(A0_123, A1_124, A2_125)
processTtrMini001(A0_135, A1_136, A2_137)
processTtrMini002(A0_138, A1_139, A2_140)
processTtrMini002_first(A0_141, A1_142, A2_143)
processTtrMini003(A0_144, A1_145, A2_146)
processTtrMini003_first(A0_147, A1_148, A2_149)
processTtrBlkNml001(A0_150, A1_151, A2_152)
    processTtrBtl001(A0_153, A1_154, A2_155, A3_156)
    processTtrBtlMagic001(A0_163, A1_164, A2_165, A3_166)
    processTtrBtl002(A0_179, A1_180, A2_181, A3_182)
processTtrBtl003(A0_202, A1_203, A2_204)
processTtrBtl004(A0_214, A1_215, A2_216)
processTtrBlkNml002(A0_217, A1_218, A2_219)
processTtrBlkNml003(A0_226, A1_227, A2_228)
processEtc001(A0_235, A1_236, A2_237)
processEtc002(A0_238, A1_239, A2_240)
processEtc003(A0_241, A1_242, A2_243)
processInformDialogAsQuest(A0_244, A1_245, A2_246)

--]]



function onStart(player, quest) 
    quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onSequence(player, quest, sequence)
    quest:ClearENpcs();
    quest:ClearData();
    
    if (sequence == SEQ_000) then
        -- Setup states incase we loaded in.
        local asciliaCanPush = not quest:GetFlag(FLAG_SEQ000_MINITUT0);
        local asciliaFlag = quest:GetFlag(FLAG_SEQ000_MINITUT1) and QFLAG_NONE or QFLAG_PLATE; 
        local fretfulfarmhandFlag = quest:GetFlag(FLAG_SEQ000_MINITUT2) and QFLAG_NONE or QFLAG_PLATE;
        local gildiggingmistressFlag = quest:GetFlag(FLAG_SEQ000_MINITUT3) and QFLAG_NONE or QFLAG_PLATE; 
        
        local exitCanPush = quest:GetFlags() == 0xF;
        local exitFlag = quest:GetFlags() == 0xF and QFLAG_PLATE or QFLAG_NONE;  

        --AddENpc(classId, byte flagType=0,isTalkEnabled, isEmoteEnabled , isPushEnabled , isSpawned)
        quest:AddENpc(ASCILIA, asciliaFlag, true, false, asciliaCanPush);
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
        quest:AddENpc(EXIT_TRIGGER, exitFlag, false, false, exitCanPush);
        quest:AddENpc(OPENING_STOPER_ULDAH, QFLAG_NONE, false, false, true);

    elseif (sequence == SEQ_005) then
    elseif (sequence == SEQ_010) then 

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
end

function onPush(player, quest, npc)
    local sequence = quest:getSequence();
    local classId = npc:GetActorClassId();  
    
    if (sequence == SEQ_000) then
        if (classId == ASCILIA) then
           callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal002");	
           player:EndEvent();
        elseif (classId == OPENING_STOPER_ULDAH) then
        
        end

    
    elseif (sequence == SEQ_010) then
    end
end

function onNotice(player, quest, target)
     
        callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal001withHQ");     

    
    player:EndEvent();
end

function seq000_onTalk(player, quest, npc, classId)
    
    if (classId == ASCILIA) then
		-- Handle the talk tutorial after the push one.
		if (not quest:GetFlag(FLAG_SEQ000_MINITUT0)) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal003");
			quest:SetFlag(FLAG_SEQ000_MINITUT0);
            
			quest:UpdateENpc(ASCILIA, ENPC_PROP_CAN_PUSH, false);
			quest:UpdateENpc(ASCILIA, ENPC_PROP_QFLAG, QFLAG_PLATE);
			quest:UpdateENpc(FRETFUL_FARMHAND, ENPC_PROP_QFLAG, QFLAG_PLATE);
			quest:UpdateENpc(GIL_DIGGING_MISTRESS, ENPC_PROP_QFLAG, QFLAG_PLATE);			
		else
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini001");
			if (not quest:GetFlag(FLAG_SEQ000_MINITUT1)) then
				quest:UpdateENpc(ASCILIA, ENPC_PROP_QFLAG, QFLAG_NONE);
				quest:SetFlag(FLAG_SEQ000_MINITUT1);
			end
        end
        
        
    elseif (classId == WARBURTON) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_3");
        
    elseif (classId == RURURAJI) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_13");
        
    elseif (classId == BIG_BELLIED_BARKER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
        
    elseif (classId == FRETFUL_FARMHAND) then
        if (not quest:GetFlag(FLAG_SEQ000_MINITUT2)) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini002_first");
			quest:UpdateENpc(FRETFUL_FARMHAND, ENPC_PROP_QFLAG, QFLAG_NONE);
			quest:SetFlag(FLAG_SEQ000_MINITUT2);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini002");
		end

    elseif (classId == DEBAUCHED_DEMONESS) then
         callClientFunction(player, "delegateEvent", player, quest, "processEvent000_8");
         
    elseif (classId == DAPPER_DAN) then
    callClientFunction(player, "delegateEvent", player, quest, "processEvent000_9");
    elseif (classId == LOUTISH_LAD) then
    callClientFunction(player, "delegateEvent", player, quest, "processEvent000_10");
    
    elseif (classId == GIL_DIGGING_MISTRESS) then
        if (not quest:GetFlag(FLAG_SEQ000_MINITUT3)) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini003_first");
			quest:UpdateENpc(GIL_DIGGING_MISTRESS, ENPC_PROP_QFLAG, QFLAG_NONE);
			quest:SetFlag(FLAG_SEQ000_MINITUT3);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini003");
		end    
        
    elseif (classId == TWITTERING_TOMBOY) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_12");
    elseif (classId == STOCKY_STRANGER) then
        callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6_2"); -- TODO: Likely 6, 6_2 looks like a Stoper dialog
    end

    if (quest:GetFlags() == 0xF) then
        quest:UpdateENpc(EXIT_TRIGGER, ENPC_PROP_CAN_PUSH, true);
        quest:UpdateENpc(EXIT_TRIGGER, ENPC_PROP_QFLAG, QFLAG_MAP);
    end

    player:EndEvent();
end

function seq010_onTalk(player, quest, npc, classId) 

    player:EndEvent();
end

function getJournalMapMarkerList(player, quest)
    local sequence = quest:getSequence();
    
    if (sequence == SEQ_000) then
        return MKRK_ASCILIA, MKRK_FRETFUL_FARMHAND;
    elseif (sequence == SEQ_010) then
        --return
    end
end