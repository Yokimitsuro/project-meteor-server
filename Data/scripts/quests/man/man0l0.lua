require("global");

--[[

Quest Script

Name: 	Shapeless Melody
Code: 	Man0l0
Id: 	110001
Prereq: None (Given on chara creation)

]]

-- Sequence Numbers
SEQ_000	= 0;  -- On the boat interior; contains the basics tutorial.
SEQ_005	= 5;  -- Combat on the top of the boat.
SEQ_010	= 10; -- In Limsa Lominsa's port.

-- Actor Class Ids
WELLTRAVELED_MERCHANT 	= 1000438;
TIPSY_ADVENTURER 		= 1000439;
CULTIVATED_TENDER 		= 1000440;
ANXIOUS_ADVENTURER 		= 1000441;
BABYFACED_ADVENTURER 	= 1000442;
AUSTERE_ADVENTURER 		= 1000443;
UNDIGNIFIED_ADVENTURER 	= 1000444;
SHADOWY_TRAVELER 		= 1000445;
ASTUTE_MERCHANT 		= 1000446;
VOLUPTUOUS_VIXEN 		= 1000447;
INDIFFERENT_PASSERBY 	= 1000448;
PRATTLING_ADVENTURER 	= 1000449;
LANKY_TRAVELER 			= 1000450;
GRINNING_ADVENTURER 	= 1000451;
ROSTNSTHAL 				= 1001652;
EXIT_TRIGGER 			= 1090025;

HOB						= 1000151;
GERT					= 1500004;
LORHZANT				= 1500005;
MUSCLEBOUND_DECKHAND	= 1000261;
PEARLYTOOTHED_PORTER	= 1000260;
--PASTYFACED_ADVENTURER	= 1000264; -- Missing?
PRIVAREA_PAST_EXIT		= 1290002;

-- Quest Markers
MRKR_HOB					= 11000202;
MRKR_ROSTNSTHAL 			= 11000203;
MRKR_VOLUPTUOUS_VIXEN 		= 11000204;
MRKR_BABYFACED_ADVENTURER 	= 11000205;
MRKR_TRIGGER_DOOR			= 11000206;

-- Quest Flags
FLAG_SEQ000_MINITUT0	= 0;
FLAG_SEQ000_MINITUT1	= 1;
FLAG_SEQ000_MINITUT2	= 2;
FLAG_SEQ000_MINITUT3	= 3;

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
		local rostnsthalFlag = quest:GetFlag(FLAG_SEQ000_MINITUT1) and QFLAG_NONE or QFLAG_PLATE;
		local vixenFlag = quest:GetFlag(FLAG_SEQ000_MINITUT2) and QFLAG_NONE or QFLAG_PLATE;
		local babyfaceFlag = quest:GetFlag(FLAG_SEQ000_MINITUT3) and QFLAG_NONE or QFLAG_PLATE;
		local rostnsthalCanPush = not quest:GetFlag(FLAG_SEQ000_MINITUT0);
		local exitCanPush = quest:GetFlags() == 0xF;
		local exitFlag = quest:GetFlags() == 0xF and QFLAG_PLATE or QFLAG_NONE;		
		
		quest:AddENpc(WELLTRAVELED_MERCHANT);
		quest:AddENpc(TIPSY_ADVENTURER);
		quest:AddENpc(CULTIVATED_TENDER);
		quest:AddENpc(ANXIOUS_ADVENTURER);
		quest:AddENpc(BABYFACED_ADVENTURER, babyfaceFlag);
		quest:AddENpc(AUSTERE_ADVENTURER);
		quest:AddENpc(UNDIGNIFIED_ADVENTURER);
		quest:AddENpc(SHADOWY_TRAVELER);
		quest:AddENpc(ASTUTE_MERCHANT);
		quest:AddENpc(VOLUPTUOUS_VIXEN, vixenFlag);
		quest:AddENpc(INDIFFERENT_PASSERBY);
		quest:AddENpc(PRATTLING_ADVENTURER);
		quest:AddENpc(LANKY_TRAVELER);
		quest:AddENpc(GRINNING_ADVENTURER);
		quest:AddENpc(ROSTNSTHAL, rostnsthalFlag, true, rostnsthalCanPush);
		quest:AddENpc(EXIT_TRIGGER, exitFlag, false, false, exitCanPush);
	elseif (sequence == SEQ_005) then
	elseif (sequence == SEQ_010) then		
		quest:AddENpc(HOB);
		quest:AddENpc(GERT);
		quest:AddENpc(LORHZANT);
		quest:AddENpc(MUSCLEBOUND_DECKHAND);
		quest:AddENpc(PEARLYTOOTHED_PORTER);
		quest:AddENpc(UNDIGNIFIED_ADVENTURER);
		quest:AddENpc(WELLTRAVELED_MERCHANT);
		quest:AddENpc(VOLUPTUOUS_VIXEN);
		quest:AddENpc(LANKY_TRAVELER);
		quest:AddENpc(PRIVAREA_PAST_EXIT, QFLAG_NONE, false, false, true);
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
		if (classId == EXIT_TRIGGER) then
			doExitDoor(player, quest, npc);
			return;
		elseif (classId == ROSTNSTHAL) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal002");
			player:EndEvent();
		end
	elseif (sequence == SEQ_010) then
		if (classId == PRIVAREA_PAST_EXIT) then
			if (eventName == "caution") then
				worldMaster = GetWorldMaster();
				player:SendGameMessage(player, worldMaster, 34109, 0x20);
			elseif (eventName == "exit") then		
			end
		end
	end
end

function onNotice(player, quest, target)
	local sequence = quest:getSequence();
	
	if (sequence == SEQ_000) then		
		callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal001withHQ");		
	end
	
	player:EndEvent();
end

function seq000_onTalk(player, quest, npc, classId)
	if (classId == WELLTRAVELED_MERCHANT) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_4");
	elseif (classId == TIPSY_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_5");
	elseif (classId == CULTIVATED_TENDER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_6");
	elseif (classId == ANXIOUS_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_7");
	elseif (classId == BABYFACED_ADVENTURER) then
		if (not quest:GetFlag(FLAG_SEQ000_MINITUT3)) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini003");
			quest:UpdateENpc(BABYFACED_ADVENTURER, ENPC_PROP_QFLAG, QFLAG_NONE);
			quest:SetFlag(FLAG_SEQ000_MINITUT3);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_8");
		end
	elseif (classId == AUSTERE_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_9");
	elseif (classId == UNDIGNIFIED_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_10");
	elseif (classId == SHADOWY_TRAVELER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_11");
	elseif (classId == ASTUTE_MERCHANT) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_12");
	elseif (classId == VOLUPTUOUS_VIXEN) then
		if (not quest:GetFlag(FLAG_SEQ000_MINITUT2)) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini002");
			quest:UpdateENpc(VOLUPTUOUS_VIXEN, ENPC_PROP_QFLAG, QFLAG_NONE);
			quest:SetFlag(FLAG_SEQ000_MINITUT2);
		else
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_13");
		end
	elseif (classId == INDIFFERENT_PASSERBY) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_14");
	elseif (classId == PRATTLING_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_15");
	elseif (classId == LANKY_TRAVELER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_16");
	elseif (classId == GRINNING_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_17");
	elseif (classId == ROSTNSTHAL) then
		-- Handle the talk tutorial after the push one.
		if (not quest:GetFlag(FLAG_SEQ000_MINITUT0)) then
			callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal003");
			quest:SetFlag(FLAG_SEQ000_MINITUT0);
			quest:UpdateENpc(ROSTNSTHAL, ENPC_PROP_CAN_PUSH, false);
			quest:UpdateENpc(ROSTNSTHAL, ENPC_PROP_QFLAG, QFLAG_PLATE);
			quest:UpdateENpc(VOLUPTUOUS_VIXEN, ENPC_PROP_QFLAG, QFLAG_PLATE);
			quest:UpdateENpc(BABYFACED_ADVENTURER, ENPC_PROP_QFLAG, QFLAG_PLATE);			
		else
			callClientFunction(player, "delegateEvent", player, quest, "processTtrMini001");
			if (not quest:GetFlag(FLAG_SEQ000_MINITUT1)) then
				quest:UpdateENpc(ROSTNSTHAL, ENPC_PROP_QFLAG, QFLAG_NONE);
				quest:SetFlag(FLAG_SEQ000_MINITUT1);
			end
		end
	end	
		
	if (quest:GetFlags() == 0xF) then
		quest:UpdateENpc(EXIT_TRIGGER, ENPC_PROP_CAN_PUSH, true);
		quest:UpdateENpc(EXIT_TRIGGER, ENPC_PROP_QFLAG, QFLAG_MAP);
	end
	
	player:EndEvent();
end

function seq010_onTalk(player, quest, npc, classId)	
	if (classId == MUSCLEBOUND_DECKHAND) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020_2");
	elseif (classId == PEARLYTOOTHED_PORTER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020_3");
	elseif (classId == UNDIGNIFIED_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020_5");
	elseif (classId == VOLUPTUOUS_VIXEN) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020_6");
	elseif (classId == WELLTRAVELED_MERCHANT) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020_7");
	elseif (classId == LANKY_TRAVELER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020_8");
	elseif (classId == HOB) then
		local choice = callClientFunction(player, "delegateEvent", player, quest, "processEvent020_9");
		if (choice == 1) then
			quest:completeAndReplace(110002);
			return;
		end
	elseif (classId == GERT) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020_10");
	elseif (classId == LORHZANT) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent020_11");
	end
	
	player:EndEvent();
end

function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
	if (sequence == SEQ_000) then
		return MRKR_ROSTNSTHAL, MRKR_BABYFACED_ADVENTURER, MRKR_VOLUPTUOUS_VIXEN;
	elseif (sequence == SEQ_010) then
		return MRKR_HOB;
	end
end

function doExitDoor(player, quest, npc)
	local choice = callClientFunction(player, "delegateEvent", player, quest, "processEventNewRectAsk", nil);	
	if (choice == 1) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2", nil);
		player:EndEvent();
		
		quest:StartSequence(SEQ_005);
		
		contentArea = player:GetZone():CreateContentArea(player, "/Area/PrivateArea/Content/PrivateAreaMasterSimpleContent", "man0l01", "SimpleContent30002", "Quest/QuestDirectorMan0l001");
		
		if (contentArea == nil) then
			return;
		end
		
		director = contentArea:GetContentDirector();		
		player:AddDirector(director);		
		director:StartDirector(false);
		
		player:KickEvent(director, "noticeEvent", true);
		player:SetLoginDirector(director);		
		
		GetWorldManager():DoZoneChangeContent(player, contentArea, -5, 16.35, 6, 0.5, 16);		
		return;
	else
		player:EndEvent();
	end
end