require ("global")
require ("quest")

--[[

Quest Script

Name: 	Beckon of the Elementals
Code: 	Man2g0
Id: 	110008
Prereq: Whispers in the Wood (Man1g0 - 110007), Level 8

]]

-- Sequence Numbers
SEQ_000	= 0;  	-- Visit the CRP guild.
SEQ_003	= 3;  	-- Go to Acorn Orchard in echo.
SEQ_004	= 4;  	-- Speak to Fye in echo.
SEQ_005	= 5;  	-- Return to CRP guild in echo.
SEQ_010	= 10;  	-- Talk to Miounne on the LS.
SEQ_015	= 15;	-- Go to BTN guild.
SEQ_020	= 20;	-- Go to the Moogle in the South Shroud.
SEQ_025	= 25;	-- ???
SEQ_030	= 30;	-- Return to the BTN guild.
SEQ_035	= 35;	-- Talk to Miounne on the LS.
SEQ_040	= 40;	-- Visit the ARC guild.
SEQ_045	= 45;	-- Speak with 
SEQ_050	= 50;	-- Talk to Miounne on the LS.
SEQ_055	= 55;	-- Return to Miounne.
SEQ_060	= 60;	-- Return to Miounne.

-- Actor Class Ids
MIOUNNE 					= 1000230;

-- CRP Guild Echo
ZEZEKUTA					= 1000240;
ANAIDJAA					= 1000465;
FRANCES						= 1000466;
DECIMA						= 1000622;
CHALYO_TAMLYO				= 1000623;
ULMHYLT						= 1000823;

-- Playground
DESERTED_DAUGHTER			= 1000827;
TROUBLESOME_TOMBOY			= 1000828;

-- Msg packs for the Npc LS
NPCLS_MSGS = {
	{57, 58, 59}, 	-- SEQ_050
	{92, 93, 94}, 	-- SEQ_070
	{140, 141}		-- SEQ_120
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
	elseif (sequence == SEQ_003) then
		quest:SetENpc(ANAIDJAA);
		quest:SetENpc(ZEZEKUTA);
		quest:SetENpc(FRANCES);		
		quest:SetENpc(DECIMA);		
		quest:SetENpc(CHALYO_TAMLYO);
		quest:SetENpc(ULMHYLT);
	elseif (sequence == SEQ_004) then
	elseif (sequence == SEQ_005) then
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
		elseif (classId == MIOUNNE) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent000_2");
		end
	elseif (sequence == SEQ_003) then
		if (classId == ZEZEKUTA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_2");
		elseif (classId == ANAIDJAA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_3");
		elseif (classId == FRANCES) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_4");
		elseif (classId == ULMHYLT) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_6" );
		elseif (classId == DECIMA) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_7");
		elseif (classId == CHALYO_TAMLYO) then
			callClientFunction(player, "delegateEvent", player, quest, "processEvent010_8");
		end
	elseif (sequence == SEQ_004) then
	elseif (sequence == SEQ_005) then
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
	end	
	
	player:EndEvent();
	quest:UpdateENPCs();
end


function onPush(player, quest, npc)
	local data = quest:GetData();
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
	
	if (sequence == SEQ_000) then
	elseif (sequence == SEQ_003) then
	elseif (sequence == SEQ_004) then
	elseif (sequence == SEQ_005) then
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
	end	
	
	player:EndEvent();
	quest:UpdateENPCs();
end

function onNpcLS(player, quest, from, msgStep)
	local sequence = quest:getSequence();
	local msgPack;

	if (from == 1) then
		-- Get the right msg pack
		if (sequence == SEQ_050 or sequence == SEQ_060) then
			msgPack = 1;
		elseif (sequence == SEQ_080 or sequence == SEQ_090) then
			msgPack = 2;
		elseif (sequence == SEQ_120 or sequence == SEQ_122) then
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
		if (sequence == SEQ_050) then
			quest:StartSequenceForNpcLs(SEQ_060);
		elseif (sequence == SEQ_080) then
			quest:StartSequenceForNpcLs(SEQ_090);
		elseif (sequence == SEQ_120) then
			quest:StartSequenceForNpcLs(SEQ_122);
		end
	end
	
	player:EndEvent();
end

function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
end