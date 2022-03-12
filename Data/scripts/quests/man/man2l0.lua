require("global");

--[[

Quest Script

Name: 	Never the Twain Shall Meet
Code: 	Man2l0
Id: 	110004
Prereq: Legends Adrift (Man1l0 - 110003)

]]

-- Sequence Numbers
SEQ_000	= 0;  	-- Talk to Captain Hob.
SEQ_010	= 10;  	-- Ship instance, enter the hold.
SEQ_015	= 15;  	-- Exit the hold, go back upstairs.
SEQ_020	= 20;  	-- Duty, fight Emerick and Merodaulyn
SEQ_035	= 35;  	-- Head to Baderon and chat.
SEQ_037	= 37;  	-- Head to outcrop in La Noscea.
SEQ_040	= 40;  	-- Talk to Baderon on the Link Pearl
SEQ_042	= 42;  	-- Enter and push at the MSK guild.
SEQ_045	= 45;  	-- Talk to Isaudorel
SEQ_050	= 50;  	-- Head to God's Grip push, talk with Blackburn.
SEQ_055	= 55;  	-- Continue to the other push with Y'shtola in the subecho.
SEQ_060	= 60;  	-- Unused? Talks about spying Stahlmann, Emerick, and Merod scheming.
SEQ_065	= 65;  	-- Unused? Talks about the meteor shower and the Ascian stealing the key.
SEQ_070	= 70;  	-- Unused? Talks about heading to Ul'dah

-- Quest Actors
BADERON 					= 1000137;
YSHTOLA 					= 1000001;
HOB							= 1000151;
ISAUDOREL					= 1000152;
BARRACUDA_KNIGHT1			= 1000183;
BARRACUDA_KNIGHT2			= 1000184;
TRIGGER_SHIP1				= 1090003;
TRIGGER_SHIP2				= 1090003;
TRIGGER_MSK					= 1090003;
TRIGGER_SEAFLD1				= 1090003;
TRIGGER_SEAFLD2				= 1090003;
TRIGGER_SEAFLD3				= 1090003;

-- Quest Markers

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{40, 41} 	-- SEQ_040
};

function onStart(player, quest)	
	quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();

	if (sequence == SEQ_ACCEPT) then
		quest:SetENpc(BADERON, QFLAG_PLATE);
	elseif (sequence == SEQ_000) then
		quest:SetENpc(HOB, QFLAG_PLATE);
		quest:SetENpc(BADERON);
	elseif (sequence == SEQ_010) then
		quest:SetENpc(HOB);
		quest:SetENpc(BARRACUDA_KNIGHT1);
		quest:SetENpc(BARRACUDA_KNIGHT2);
	elseif (sequence == SEQ_015) then
		quest:SetENpc(HOB);
		quest:SetENpc(BARRACUDA_KNIGHT1);
		quest:SetENpc(BARRACUDA_KNIGHT2);
	elseif (sequence == SEQ_020) then
		-- DUTY HAPPENS HERE
	elseif (sequence == SEQ_035) then
		quest:SetENpc(BADERON, QFLAG_PLATE);
	elseif (sequence == SEQ_037) then
		quest:SetENpc(BADERON);
	elseif (sequence == SEQ_040) then
	elseif (sequence == SEQ_042) then
		quest:SetENpc(BADERON);
	elseif (sequence == SEQ_045) then
		quest:SetENpc(ISAUDOREL, QFLAG_PLATE);
	elseif (sequence == SEQ_050) then
	elseif (sequence == SEQ_055) then
		quest:SetENpc(YSHTOLA);
	end	
	
end

function onTalk(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();

	if (sequence == SEQ_ACCEPT) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000");
		end
	elseif (sequence == SEQ_000) then		
		if (classId == HOB) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
			quest:StartSequence(SEQ_010);
		elseif (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
		end
	elseif (sequence == SEQ_010) then
		if (classId == HOB) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent011_2");
		elseif (classId == BARRACUDA_KNIGHT1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent011_3");
		elseif (classId == BARRACUDA_KNIGHT2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent011_4");
		end		
	elseif (sequence == SEQ_015) then
		if (classId == HOB) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent011_2");
		elseif (classId == BARRACUDA_KNIGHT1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent011_3");
		elseif (classId == BARRACUDA_KNIGHT2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent011_4");
		end		
	elseif (sequence == SEQ_035) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050");
			quest:StartSequence(SEQ_037);
		end		
	elseif (sequence == SEQ_037) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent050_2");
		end	
	elseif (sequence == SEQ_042) then
		if (classId == BADERON) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060_2");
		end
	elseif (sequence == SEQ_045) then
		if (classId == ISAUDOREL) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent075");
			quest:StartSequence(SEQ_050);
		end
	elseif (sequence == SEQ_055) then
		if (classId == YSHTOLA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080_2");
		end
	end	
	
	player:EndEvent();
	quest:UpdateENPCs();
end

function onPush(player, quest, npc)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_037) then
		if (classId == TRIGGER_SEAFLD1) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent060");
			quest:StartSequence(SEQ_040);
		end
	elseif (sequence == SEQ_042) then
		if (classId == TRIGGER_MSK) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent070");
			quest:StartSequence(SEQ_045);
		end
	elseif (sequence == SEQ_050) then
		if (classId == TRIGGER_SEAFLD2) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent080");
			quest:StartSequence(SEQ_055);
		end
	elseif (sequence == SEQ_055) then
		if (classId == TRIGGER_SEAFLD3) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent081");
		end
	end	
	
	player:EndEvent();
	quest:UpdateENPCs();
end

function onNotice(player, quest, target)
	callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
	player:CompleteQuest(quest);
    callClientFunction(player, "delegateEvent", player, quest, "processEvent081_2", 1);
    player:EndEvent();
    quest:UpdateENPCs();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_040 or sequence == SEQ_042) then
			msgPack = 1;
		end	
				
		-- Quick way to handle all msgs nicely.
		player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1000015);
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:EndOfNpcLsMsgs();
		else
			quest:ReadNpcLsMsg();
		end
		
		-- Handle anything else
		if (sequence == SEQ_040) then
			quest:StartSequenceForNpcLs(SEQ_042);
		end
	end
	
	player:EndEvent();
end

function getJournalInformation(player, quest)
	return 40, 40, 40;
end

function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
end