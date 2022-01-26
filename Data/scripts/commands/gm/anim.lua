require("global");

properties = {
    permissions = 0,
    parameters = "ddd",
    description =
[[
Sets anim id for current target
!anim <animID> |
]],

}

function onTrigger(player, argc, aType, a1, a2)
	npc = player;--GetWorldManager():GetActorInWorldByUniqueId("test");
	
	aType = tonumber(aType);
	a1 = tonumber(a1);
	a2 = tonumber(a2);
	
	a1 = bit32.band(a1, 0xFFF);
	a2 = bit32.band(a2, 0xFFF);
	aType = bit32.band(aType, 0xFF);
	
	animId = bit32.bor(bit32.lshift(a2, 12), a1);
	animId = bit32.bor(bit32.lshift(aType, 24), animId);
		
	print("AHHH");
	player:PlayAnimation(0x10005000);
end;
