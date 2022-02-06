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
	
end

function onTalk(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();
end

function onPush(player, quest, npc)
	local sequence = quest:getSequence();
	local classId = npc:GetActorClassId();	
	
end

function getJournalMapMarkerList(player, quest)
	local sequence = quest:getSequence();
	
end