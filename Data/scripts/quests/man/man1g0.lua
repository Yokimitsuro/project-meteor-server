require ("global")
require ("quest")

--[[

Quest Script

Name: 	Whispers in the Wood
Code: 	Man1g0
Id: 	110007
Prereq: Souls Gone Wild (Man0g1 - 110006), Level 8

]]

-- Sequence Numbers
SEQ_000	= 0;  	-- Visit the CRP guild.
SEQ_005	= 5;  	-- Go to Acorn Orchard in echo.
SEQ_010	= 10;  	-- Speak to Fye in echo.
SEQ_015	= 15;  	-- Return to CRP guild in echo.
SEQ_020	= 20;  	-- Talk to Miounne on the LS.
SEQ_025	= 25;	-- Go to BTN guild.
SEQ_030	= 30;	-- Go to the Moogle in the South Shroud.
SEQ_035	= 35;	-- ???
SEQ_040	= 40;	-- Return to the BTN guild.
SEQ_045	= 45;	-- Talk to Miounne on the LS.
SEQ_050	= 50;	-- Visit the ARC guild.
SEQ_055	= 55;	-- Speak with 
SEQ_060	= 60;	-- Talk to Miounne on the LS.
SEQ_065	= 65;	-- Return to Miounne.

-- Actor Class Ids
MIOUNNE 					= 1000230;

-- CRP Guild Echo
ANAIDJAA					= 1000465;
CAPLAN						= 1000465;
FRANCES						= 1000465;
SQUEALING_SPRAT				= 1000465;
SUGARSTUNG_SCHOOLGIRL		= 1000465;
UNDERPRIVILIDGE_URCHIN		= 1000465;
DESERTED_DAUGHTER			= 1000465;

-- Playground

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{96, 97, 98},		-- SEQ_020
	{170, 171, 172},	-- SEQ_045
	{231, 232}			-- SEQ_060
};

function onStart(player, quest)	
	quest:StartSequence(SEQ_000);
end

function onFinish(player, quest)
end

function onStateChange(player, quest, sequence)
	local data = quest:GetData();
	if (sequence == SEQ_ACCEPT) then
		quest:SetENpc(MIOUNNE, QFLAG_TALK);
	elseif (sequence == SEQ_000) then
		quest:SetENpc(ANAIDJAA, QFLAG_TALK);
		quest:SetENpc(MIOUNNE);
	elseif (sequence == SEQ_005) then
	elseif (sequence == SEQ_010) then
	elseif (sequence == SEQ_010) then
	elseif (sequence == SEQ_020) then
	elseif (sequence == SEQ_025) then
	elseif (sequence == SEQ_030) then
	elseif (sequence == SEQ_035) then
	elseif (sequence == SEQ_040) then
	elseif (sequence == SEQ_045) then
	elseif (sequence == SEQ_050) then
	elseif (sequence == SEQ_055) then
	elseif (sequence == SEQ_060) then
	elseif (sequence == SEQ_065) then
		quest:SetENpc(MIOUNNE, QFLAG_REWARD);
	end	
	
end

function onTalk(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();

	if (sequence == SEQ_ACCEPT) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventMiounneStart");
			player:EndEvent();
			player:AcceptQuest(quest, true);
			return;
		end
	elseif (sequence == SEQ_000) then
		if (classId == ANAIDJAA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010");
			player:EndEvent();
			quest:StartSequence(SEQ_005);
			GetWorldManager():WarpToPrivateArea(player, "PrivateAreaMasterPast", 5);
		elseif (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
		end
	elseif (sequence == SEQ_005) then
		if (classId == ANAIDJAA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2")
		elseif (classId == ZEZEKUTA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
		elseif (classId == CAPLAN) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
		elseif (classId == FRANCES) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
		elseif (classId == Z) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
		elseif (classId == Z) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
		end
	elseif (sequence == SEQ_010) then
	elseif (sequence == SEQ_010) then
	elseif (sequence == SEQ_020) then
	elseif (sequence == SEQ_025) then
	elseif (sequence == SEQ_030) then
	elseif (sequence == SEQ_035) then
	elseif (sequence == SEQ_040) then
	elseif (sequence == SEQ_045) then
	elseif (sequence == SEQ_050) then
	elseif (sequence == SEQ_055) then
	elseif (sequence == SEQ_060) then
	elseif (sequence == SEQ_065) then
		if (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEventComplete");
			callClientFunction(player, "delegateEvent", player, quest, "sqrwa", 300, 1, 1, 2);
			player:EndEvent();
			player:CompleteQuest(quest);
			return;
		end
	end	
	
	player:EndEvent();
	quest:UpdateENPCs();
end


function onPush(player, quest, npc)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_000) then
	elseif (sequence == SEQ_005) then
	elseif (sequence == SEQ_010) then
	elseif (sequence == SEQ_010) then
	elseif (sequence == SEQ_020) then
	elseif (sequence == SEQ_025) then
	elseif (sequence == SEQ_030) then
	elseif (sequence == SEQ_035) then
	elseif (sequence == SEQ_040) then
	elseif (sequence == SEQ_045) then
	elseif (sequence == SEQ_050) then
	elseif (sequence == SEQ_055) then
	elseif (sequence == SEQ_060) then
	elseif (sequence == SEQ_065) then
	end	
	
	player:EndEvent();
	quest:UpdateENPCs();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_020 or sequence == SEQ_025) then
			msgPack = 1;
		elseif (sequence == SEQ_045 or sequence == SEQ_050) then
			msgPack = 2;
		elseif (sequence == SEQ_060 or sequence == SEQ_065) then
			msgPack = 3;
		end	
				
		-- Quick way to handle all msgs nicely.
		player:SendGameMessageLocalizedDisplayName(quest, NPCLS_MSGS[msgPack][msgStep], MESSAGE_TYPE_NPC_LINKSHELL, 1000015);
		if (msgStep >= #NPCLS_MSGS[msgPack]) then
			quest:EndOfNpcLsMsgs();
		else
			quest:ReadNpcLsMsg();
		end
		
		-- Handle anything else
		if (sequence == SEQ_020) then
			quest:StartSequenceForNpcLs(SEQ_025);
		elseif (sequence == SEQ_045) then
			quest:StartSequenceForNpcLs(SEQ_050);
		elseif (sequence == SEQ_060) then
			quest:StartSequenceForNpcLs(SEQ_065);
		end
	end
	
	player:EndEvent();
end

function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
end