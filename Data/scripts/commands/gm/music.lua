properties = {
    permissions = 0,
    parameters = "ss",
    description =
[[
Plays music <id> to player.
!music <id>
!music <id> <transition_type>
]],
}

function onTrigger(player, argc, music, transition)
    music = tonumber(music) or 0;
    transition = tonumber(transition) or nil;
    player:SendMessage(0x20, "", tostring(argc).." "..tostring(music).." "..tostring(transition));
    player:ChangeMusic(music, transition);
end;