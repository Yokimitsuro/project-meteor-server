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

NERVOUS_BARRACUDA		= 1000096;
INTIMIDATING_BARRACUDA	= 1000097;
OVEREAGER_BARRACUDA		= 1000107;
SOPHISTICATED_BARRACUDA	= 1000108;
SMIRKING_BARRACUDA		= 1000109;
MANNSKOEN				= 1000142;
TOTORUTO				= 1000161;
ADVENTURER1				= 1000869;
ADVENTURER2				= 1000870;
ADVENTURER3				= 1000871;
ECHO_EXIT_TRIGGER		= 1090003;

-- Quest Markers
MRKR_HOB				= 11000202;

-- Quest Data
CNTR_SEQ7_CUL		= 1;
CNTR_SEQ7_MRD		= 2;

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

function onStateChange(player, quest, sequence)
	local data = quest:GetData();

	if (sequence == SEQ_000) then
		quest:SetENpc(YSHTOLA);
		quest:SetENpc(CRAPULOUS_ADVENTURER);
		quest:SetENpc(DUPLICITOUS_TRADER);
		quest:SetENpc(DEBONAIR_PIRATE);
		quest:SetENpc(ONYXHAIRED_ADVENTURER);
		quest:SetENpc(SKITTISH_ADVENTURER);
		quest:SetENpc(RELAXING_ADVENTURER);
		quest:SetENpc(BADERON, QFLAG_PLATE);
		quest:SetENpc(MYTESYN);
		quest:SetENpc(COCKAHOOP_COCKSWAIN);
		quest:SetENpc(SENTENIOUS_SELLSWORD);
		quest:SetENpc(SOLICITOUS_SELLSWORD);
	elseif (sequence == SEQ_003) then
		quest:SetENpc(BADERON);
	elseif (sequence == SEQ_005) then
		quest:SetENpc(BADERON, QFLAG_PLATE);
	elseif (sequence == SEQ_006) then
		quest:SetENpc(BADERON, QFLAG_PLATE);
	elseif (sequence == SEQ_007) then
		local subseqCUL = data:GetCounter(CNTR_SEQ7_CUL);
		local subseqMRD = data:GetCounter(CNTR_SEQ7_MRD);

		-- Always active in this seqence
		quest:SetENpc(BADERON);
		quest:SetENpc(CHARLYS, subseqCUL == 0 and QFLAG_PLATE or QFLAG_NONE);
		
		-- Down and Up the MSK guild
		quest:SetENpc(ISANDOREL, (subseqMRD == 0 or subseqMRD == 2) and QFLAG_PLATE or QFLAG_NONE);
		
		if (subseqMRD == 1) then
			quest:SetENpc(MSK_TRIGGER, QFLAG_MAP, false, true);
		elseif (subseqMRD == 2) then
			quest:SetENpc(MERLZIRN);
		end
		
		-- In Echo
		quest:SetENpc(NERVOUS_BARRACUDA);
		quest:SetENpc(INTIMIDATING_BARRACUDA);
		quest:SetENpc(OVEREAGER_BARRACUDA);
		quest:SetENpc(SOPHISTICATED_BARRACUDA);
		quest:SetENpc(SMIRKING_BARRACUDA);
		quest:SetENpc(MANNSKOEN);
		quest:SetENpc(TOTORUTO);
		quest:SetENpc(ADVENTURER1);
		quest:SetENpc(ADVENTURER2);
		quest:SetENpc(ADVENTURER3);
		quest:SetENpc(ECHO_EXIT_TRIGGER, subseqMRD == 3 and QFLAG_MAP or QFLAG_NONE, false, subseqMRD == 3);
						
		if (subseqCUL == 1 and subseqMRD == 4) then
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
		
		quest:UpdateENPCs();
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
	local data = quest:GetData();
	local subseqCUL = data:GetCounter(CNTR_SEQ7_CUL);
	local subseqMRD = data:GetCounter(CNTR_SEQ7_MRD);
	
	if (classId == BADERON) then
		if (subseqCUL == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent027_3");
		elseif (subseqMRD == 4) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent027_4");
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent027_2");
		end
	elseif (classId == CHARLYS) then
		if (subseqCUL == 0) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030");
			data:IncCounter(CNTR_SEQ7_CUL);
			--give 1000g
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent030_2");
		end
	elseif (classId == ISANDOREL) then
		if (subseqMRD == 2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
			data:IncCounter(CNTR_SEQ7_MRD);
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 3);
		elseif (subseqMRD == 0) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent035");
			data:IncCounter(CNTR_SEQ7_MRD);
		elseif (subseqMRD == 1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent035_2");
		end
	elseif (classId == MERLZIRN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent40_2");
	elseif (classId == INTIMIDATING_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
	elseif (classId == TOTORUTO) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_4");		
	elseif (classId == MANNSKOEN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_6");
	elseif (classId == NERVOUS_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_7");
	elseif (classId == OVEREAGER_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_8");
	elseif (classId == SOPHISTICATED_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_9");
	elseif (classId == SMIRKING_BARRACUDA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_10");
	elseif (classId == ADVENTURER2) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_13");
	elseif (classId == ADVENTURER3) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_14");
	elseif (classId == ADVENTURER1) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent050_15");
	end
		
	player:EndEvent();
end

function onPush(player, quest, npc)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_007) then
		if (classId == MSK_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent040");
			data:IncCounter(CNTR_SEQ7_MRD);
			player:EndEvent();
			quest:UpdateENPCs();
			GetWorldManager():DoZoneChange(player, 230, nil, 0, 15, -620.0, 29.476, -70.050, 0.791);
		elseif (classId == ECHO_EXIT_TRIGGER) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			data:IncCounter(CNTR_SEQ7_MRD);
			player:EndEvent();
			quest:UpdateENPCs();
			GetWorldManager():WarpToPublicArea(player);
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
	return 0, quest:GetData():GetCounter(CNTR_SEQ7_CUL) * 5, quest:GetData():GetCounter(CNTR_SEQ7_MRD) * 5;
end


function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
end