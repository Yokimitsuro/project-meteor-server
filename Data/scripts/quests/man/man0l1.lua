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
SEQ_075	= 75;	-- Go to the ARM and BSM Guilds. Talk to Bodenolf.
SEQ_080	= 80;	-- Speak with H'naanza
SEQ_085	= 85;	-- Speak with Bodenolf
SEQ_090	= 90;	-- Contact Baderon on LS
SEQ_092	= 92;	-- Return to Baderon.

-- Actor Class Ids
-- Echo in Adv Guild
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

-- Sequence 003
BEARDEDROCK_AETHERYTE	= 1280002;

-- Sequence 007
CHARLYS					= 1000138;
ISANDOREL				= 1000152;
MERLZIRN				= 1000472;
MSK_TRIGGER				= 1090001;

-- Echo in Mrd Guild
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

-- FSH Guild
NNMULIKA				= 1000153;
SISIPU					= 1000155;
ZEPHYR_TRIGGER			= 1900001;

-- Echo in the Bsm Guild
TATTOOED_PIRATE			= 1000111;
IOFA					= 1000135;
BODENOLF				= 1000144;
HNAANZA					= 1000145;
MIMIDOA					= 1000176;
JOELLAUT				= 1000163;
WERNER					= 1000247;
HIHINE					= 1000267;
TRINNE					= 1000268;
ECHO_EXIT_TRIGGER2		= 1090001;

-- Quest Markers

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
	elseif (sequence == SEQ_035) then
		quest:SetENpc(NNMULIKA, QFLAG_PLATE);
	elseif (sequence == SEQ_048) then
		quest:SetENpc(BADERON);
		quest:SetENpc(ZEPHYR_TRIGGER);
	elseif (sequence == SEQ_075) then	
		quest:SetENpc(BODENOLF, QFLAG_PLATE);
	elseif (sequence == SEQ_080) then	
		quest:SetENpc(HNAANZA, QFLAG_PLATE);
		quest:SetENpc(TATTOOED_PIRATE);
		quest:SetENpc(IOFA);
		quest:SetENpc(BODENOLF);
		quest:SetENpc(MIMIDOA);
		quest:SetENpc(JOELLAUT);
		quest:SetENpc(WERNER);
		quest:SetENpc(HIHINE);
		quest:SetENpc(TRINNE);
	elseif (sequence == SEQ_085) then	
		quest:SetENpc(HNAANZA);
		quest:SetENpc(TATTOOED_PIRATE);
		quest:SetENpc(WERNER);
		quest:SetENpc(HIHINE);
		quest:SetENpc(TRINNE);
		quest:SetENpc(ECHO_EXIT_TRIGGER2, QFLAG_MAP, false, true);
	elseif (sequence == SEQ_092) then	
		quest:SetENpc(BADERON, QFLAG_REWARD);
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
			player:EndEvent();
			quest:StartSequence(SEQ_006);
		end
	elseif (sequence == SEQ_006) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent027");			
			player:EndEvent();
			player:SendGameMessage(GetWorldMaster(), 25117, 0x20, 11000125); -- You obtain Baderon's Recommendation
			quest:StartSequence(SEQ_007);
		end
	elseif (sequence == SEQ_007) then
		seq007_onTalk(player, quest, npc, classId);
	elseif (sequence == SEQ_035) then
		if (classId == NNMULIKA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent602");
			callClientFunction(player, "delegateEvent", player, quest, "processEvent602_2");
			callClientFunction(player, "delegateEvent", player, quest, "processEvent602_3");
			callClientFunction(player, "delegateEvent", player, quest, "processEvent604");
			--quest:StartSequence(SEQ_040);
			player:EndEvent();
		end
	elseif (sequence == SEQ_040) then
		
	elseif (sequence == SEQ_048) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent602_3");
			player:EndEvent();
		elseif (classId == ZEPHYR_TRIGGER) then			
			local startDuty = callClientFunction(player, "delegateEvent", player, quest, "processEvent602_3");
			if (startDuty) then
			end
			player:EndEvent();
		end		
	elseif (sequence == SEQ_075) then
		if (classId == BODENOLF) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent630");
			player:EndEvent();
			quest:StartSequence(SEQ_080);
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 4, -504.985, 42.490, 433.712, 2.35);
		end
	elseif (sequence == SEQ_080) then
		if (classId == HNAANZA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent632");
			player:EndEvent();
			quest:StartSequence(SEQ_085);
		else
			seq080_085_onTalk(player, quest, npc, classId);
		end
	elseif (sequence == SEQ_085) then
		if (classId == HNAANZA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent632_2");
		else
			seq080_085_onTalk(player, quest, npc, classId);
		end
	elseif (sequence == SEQ_092) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventComplete");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:EndEvent();
			player:CompleteQuest(quest);
			return;
		end
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

function seq080_085_onTalk(player, quest, npc, classId)
	if (classId == IOFA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_2");
	elseif (classId == TRINNE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_3");
	elseif (classId == HIHINE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_4");
	elseif (classId == MIMIDOA) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_5");
	elseif (classId == WERNER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_6");
	elseif (classId == TATTOOED_PIRATE) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_7");
	elseif (classId == JOELLAUT) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_8");
	elseif (classId == BODENOLF) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent630_9");
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
	elseif (sequence == SEQ_048) then
		if (classId == ZEPHYR_TRIGGER) then
			local result = callClientFunction(player, "delegateEvent", player, quest, "contentsJoinAskInBasaClass");
			if (result == 1) then
				startMan0l1Content(player, quest);
				return;
			end
		end
	elseif (sequence == SEQ_085) then
		if (classId == ECHO_EXIT_TRIGGER2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent635");			
			player:EndEvent();
			quest:UpdateENPCs();
			GetWorldManager():WarpToPublicArea(player);
		end
	end
end

function onEmote(player, quest, npc, emoteId)
	local sequence = quest:getSequence();
	
	if (sequence == SEQ_040) then
	end
		
	quest:UpdateENPCs();
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

function startMan0l1Content(player, quest)
	quest:StartSequence(SEQ_050);
		
	local contentArea = player.CurrentArea:CreateContentArea(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "Man0l101", "SimpleContent30002", "Quest/QuestDirectorMan0l101");
		
	if (contentArea == nil) then
		return;
	end
	
	local director = contentArea:GetContentDirector();		
	
	player:AddDirector(director);		
	director:StartDirector(false);	
	player:KickEvent(director, "noticeEvent", true);
	player:SetLoginDirector(director);		
	
	GetWorldManager():DoZoneChangeContent(player, contentArea, -5, 16.35, 6, 0.5, 16);		
end

function getJournalInformation(player, quest)
	return 0, quest:GetData():GetCounter(CNTR_SEQ7_CUL) * 5, quest:GetData():GetCounter(CNTR_SEQ7_MRD) * 5;
end


function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
end