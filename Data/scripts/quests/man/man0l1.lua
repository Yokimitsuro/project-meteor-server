require("global");

--[[

Quest Script

Name: 	Treasures of the Main
Code: 	Man0l1
Id: 	110002
Prereq: Shapeless Melody (Man0l0 - 110001)

]]

-- Sequence Numbers
SEQ_000	= 0;  -- On the boat interior; contains the basics tutorial.
SEQ_005	= 5;  -- Combat on the top of the boat.
SEQ_010	= 10; -- In Limsa Lominsa's port.

-- Actor Class Ids
WELLTRAVELED_MERCHANT 	= 1000438;

-- Quest Markers
MRKR_HOB				= 11000202;

-- Quest Flags
FLAG_SEQ000_MINITUT0	= 0;

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
	quest:ClearENpcs();
	
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
		
	elseif (sequence == SEQ_010) then
		
	end
end

function onNotice(player, quest, target)
	local sequence = quest:getSequence();
	
	if (sequence == SEQ_000) then		
		callClientFunction(player, "delegateEvent", player, quest, "processTtrNomal001withHQ");
	end
end

function seq000_onTalk(player, quest, npc, classId)
	if (classId == WELLTRAVELED_MERCHANT) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_4");
	elseif (classId == TIPSY_ADVENTURER) then
		callClientFunction(player, "delegateEvent", player, quest, "processEvent000_5");
	end
	
	player:EndEvent();
end

function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
	if (sequence == SEQ_000) then
	--	return MRKR_ROSTNSTHAL, MRKR_BABYFACED_ADVENTURER, MRKR_VOLUPTUOUS_VIXEN;
	elseif (sequence == SEQ_010) then
	--	return MRKR_HOB;
	end
end