require("global");
require("tutorial")

--[[

Quest Script

Name: 	Treasures of the Main
Code: 	Man0l1
Id: 	110002
Prereq: Shapeless Melody (Man0l0 - 110001)

]]

-- Sequence Numbers
SEQ_000	= 0;  	-- (Private Area) Drowning Wench Echo Scene.
SEQ_003	= 3;  	-- Go attune to Camp Bearded Rock.
SEQ_005	= 5;  	-- Attuned, go back to Baderon. Info: <param1> If 1, Baderon gave you a tutorial guildleve else 0.
SEQ_006	= 6;  	-- Talk to Baderon again
SEQ_007	= 7;  	-- Find the CUL and MSK Guilds. Info: Params '0,5,20' will show the msg that you visited both guilds and to notify Baderon on the LS.
SEQ_035	= 35;	-- Go to the FSH Guild.
SEQ_040	= 40;	-- Learn hand signals from the guild
SEQ_048	= 48;	-- Travel to Zephyr Gate
SEQ_050	= 50;	-- Escort mission
SEQ_055	= 55;	-- Search lighthouse for corpse
SEQ_060	= 60;	-- Talk to Sisipu
SEQ_065	= 65;	-- Return to FSH Guild
SEQ_070	= 70;	-- Contact Baderon on LS
SEQ_075	= 75;	-- Go to the ARM and BSM Guilds.
SEQ_080	= 80;	-- Speak with H'naanza
SEQ_085	= 85;	-- Speak with Bodenolf
SEQ_090	= 90;	-- Contact Baderon on LS
SEQ_092	= 92;	-- Return to Baderon.

-- Actor Class Ids
YSHTOLA 				= 1000001;
CRAPULOUS_ADVENTURER 	= 1000075;
DUPLICITOUS_TRADER	 	= 1000076;
DEBONAIR_PIRATE 		= 1000077;
ONYXHAIRED_ADVENTURER	= 1000098;
SKITTISH_ADVENTURER		= 1000099;
RELAXING_ADVENTURER 	= 1000100;
BADERON 				= 1000137;
MYTESYN 				= 1000167;
COCKAHOOP_COCKSWAIN 	= 1001643;
SENTENIOUS_SELLSWORD 	= 1001649;
SOLICITOUS_SELLSWORD 	= 1001650;

BEARDEDROCK_AETHERYTE	= 1280002;

CHARLYS					= 1000138;
ISANDOREL				= 1000152;
MERLZIRN				= 1000472;
MSK_TRIGGER				= 1090001;

-- Quest Markers
MRKR_HOB				= 11000202;

-- Quest Flags
FLAG_SEQ007_VISITED_CUL		= 1;
FLAG_SEQ007_VISITED_MSK		= 2;
FLAG_SEQ007_MSK_CUTSCENE	= 3;
FLAG_SEQ007_MSK_CUTSCENE2	= 4;

function onStart(player, quest)	
	quest:StartSequence(SEQ_000);
	
	-- Immediately move to the Adventurer's Guild private area
	callClientFunction(player, "delegateEvent", player, quest, "processEvent010");	
	GetWorldManager():DoZoneChange(player, 133, "PrivateAreaMasterPast", 2, 15, -459.619873, 40.0005722, 196.370377, 2.010813);
	player:SendGameMessage(quest, 320, 0x20);
	player:SendGameMessage(quest, 321, 0x20);
end

function onFinish(player, quest)
end

function onSequence(player, quest, sequence)

	if (sequence == SEQ_000) then
		quest:AddENpc(YSHTOLA);
		quest:AddENpc(CRAPULOUS_ADVENTURER);
		quest:AddENpc(DUPLICITOUS_TRADER);
		quest:AddENpc(DEBONAIR_PIRATE);
		quest:AddENpc(ONYXHAIRED_ADVENTURER);
		quest:AddENpc(SKITTISH_ADVENTURER);
		quest:AddENpc(RELAXING_ADVENTURER);
		quest:AddENpc(BADERON, QFLAG_PLATE);
		quest:AddENpc(MYTESYN);
		quest:AddENpc(COCKAHOOP_COCKSWAIN);
		quest:AddENpc(SENTENIOUS_SELLSWORD);
		quest:AddENpc(SOLICITOUS_SELLSWORD);
	elseif (sequence == SEQ_003) then
		quest:AddENpc(BADERON);
	elseif (sequence == SEQ_005) then
		quest:AddENpc(BADERON, QFLAG_PLATE);
	elseif (sequence == SEQ_006) then
		quest:AddENpc(BADERON, QFLAG_PLATE);
	elseif (sequence == SEQ_007) then
		local isandorelFlag1 = not quest:GetFlag(FLAG_SEQ007_VISITED_MSK);
		local isandorelFlag2 = not quest:GetFlag(FLAG_SEQ007_MSK_CUTSCENE);
	
		quest:AddENpc(BADERON);
		quest:AddENpc(CHARLYS, not quest:GetFlag(FLAG_SEQ007_VISITED_CUL) and QFLAG_PLATE or QFLAG_NONE);
		quest:AddENpc(ISANDOREL, ((isandorelFlag1) or (quest:GetFlag(FLAG_SEQ007_MSK_CUTSCENE) and isandorelFlag2)) and QFLAG_PLATE or QFLAG_NONE);
		quest:AddENpc(MSK_TRIGGER, not quest:GetFlag(FLAG_SEQ007_MSK_CUTSCENE) and QFLAG_MAP or QFLAG_NONE, false, not quest:GetFlag(FLAG_SEQ007_MSK_CUTSCENE));
		
		quest:AddENpc(MERLZIRN);
		
		if (quest:GetFlag(FLAG_SEQ007_VISITED_CUL) and quest:GetFlag(FLAG_SEQ007_VISITED_MSK)) then
			player:SetNpcLS(1, 1);
		end
	end	
	
end

function onTalk(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_000) then
		seq000_onTalk(player, quest, npc, classId);
	elseif (sequence == SEQ_003) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
			player:EndEvent();
		end
	elseif (sequence == SEQ_005) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent026");
			quest:StartSequence(SEQ_006);
			player:EndEvent();
		end
	elseif (sequence == SEQ_006) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent027");			
			quest:StartSequence(SEQ_007);
			player:EndEvent();
		end
	elseif (sequence == SEQ_007) then
		seq007_onTalk(player, quest, npc, classId);
	end
	
	quest:UpdateENPCs();
end


-- !warp 133 -459.619873 40.0005722 196.370377 PrivateAreaMasterPast 2

function seq000_onTalk(player, quest, npc, classId)
	if     (classId == CRAPULOUS_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
	elseif (classId == SKITTISH_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_3");
	elseif (classId == DUPLICITOUS_TRADER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_4");	
	elseif (classId == DEBONAIR_PIRATE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_5");
	elseif (classId == ONYXHAIRED_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_6");
	elseif (classId == RELAXING_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_7");
	elseif (classId == YSHTOLA) then		
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_8");
	elseif (classId == BADERON) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020");
		player:SetNpcLS(1, 3);
		quest:StartSequence(SEQ_003);
		player:EndEvent();		
		
		local director = GetWorldManager():GetArea(133):CreateDirector("AfterQuestWarpDirector", false);		
		player:AddDirector(director);
		director:StartDirector(true);
		player:SetLoginDirector(director);		
		player:KickEvent(director, "noticeEvent", true);
		
		GetWorldManager():DoZoneChange(player, 133, nil, 0, 15, player.positionX, player.positionY, player.positionZ, player.rotation);
		return;
	elseif (classId == MYTESYN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent010_7");	
	elseif (classId == COCKAHOOP_COCKSWAIN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEtc001");
	elseif (classId == SOLICITOUS_SELLSWORD) then
		callClientFunction(player, "delegateEvent", player, quest, "processEtc002");
	elseif (classId == SENTENIOUS_SELLSWORD) then
		callClientFunction(player, "delegateEvent", player, quest, "processEtc003");
	end
	
	player:EndEvent();
end

function seq007_onTalk(player, quest, npc, classId)
	if (classId == BADERON) then
			if (quest:GetFlag(FLAG_SEQ007_VISITED_CUL)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent027_3");
			elseif (quest:GetFlag(FLAG_SEQ007_VISITED_MSK)) then
				callClientFunction(player, "delegateEvent", player, quest, "processEvent027_4");
			else
				callClientFunction(player, "delegateEvent", player, quest, "processEvent027_2");
			end
			player:EndEvent();
	elseif (classId == CHARLYS) then
		if (not quest:GetFlag(FLAG_SEQ007_VISITED_CUL)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			quest:SetFlag(FLAG_SEQ007_VISITED_CUL);
			--give 100gil
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_2");
		end
		player:EndEvent();
	elseif (classId == ISANDOREL) then
		if (quest:GetFlag(FLAG_SEQ007_VISITED_MSK) and quest:GetFlag(FLAG_SEQ007_MSK_CUTSCENE)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
			quest:SetFlag(FLAG_SEQ007_MSK_CUTSCENE2);
			player:EndEvent();
			local pos = player:GetPos();
			GetWorldManager():DoZoneChange(player, 230, "PrivateAreaMasterPast", 3, 15, pos[1], pos[2], pos[3], pos[4]);
		elseif (not quest:GetFlag(FLAG_SEQ007_VISITED_MSK)) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent035");
			quest:SetFlag(FLAG_SEQ007_VISITED_MSK);			
		else			
			callClientFunction(player, "delegateEvent", player, quest, "processEvent035_2");
		end
		player:EndEvent();
	elseif (classId == MERLZIRN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent40_2");
		player:EndEvent();
	end
end

function onPush(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_007) then
		if (classId == MSK_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			quest:SetFlag(FLAG_SEQ007_MSK_CUTSCENE);	
			player:EndEvent();
			GetWorldManager():DoZoneChange(player, 230, nil, 0, 15, -620.0, 29.476, -70.050, 0.791);
		end
	end
end

function onNotice(player, quest, target)
	local sequence = quest:getSequence();
	
	if (sequence == SEQ_003) then
		player:EndEvent();
	end
		
	quest:UpdateENPCs();
end

function onNpcLS(player, quest, npcLSId)
	local sequence = quest:getSequence();
	
	if (npcLSId == 1) then
		player:SetNpcLS(1, 1);
			
		if (sequence == SEQ_003) then
			player:SendGameMessageLocalizedDisplayName(quest, 298, 39, 1000015, nil);
			endTutorialMode(player);
		elseif (sequence == SEQ_007) then
			player:SendGameMessageLocalizedDisplayName(quest, 80, 39, 1000015, nil);
			player:SendGameMessageLocalizedDisplayName(quest, 81, 39, 1000015, nil);
			player:SendGameMessageLocalizedDisplayName(quest, 82, 39, 1000015, nil);
			quest:StartSequence(SEQ_035);
		end
	end
end

function getJournalInformation(player, quest)
	if (quest:GetFlag(FLAG_SEQ007_VISITED_CUL) and quest:GetFlag(FLAG_SEQ007_VISITED_MSK)) then
		return 0, 5, 20;
	else
		return;
	end
end


function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
end