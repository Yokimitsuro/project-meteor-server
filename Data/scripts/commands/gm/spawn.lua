require("global");

properties = {
    permissions = 0,
    parameters = "d",
    description = "Spawns a actor",
}

function onTrigger(player, argc, actorClassId, width, height)

    if (actorClassId == nil) then
        player:SendMessage(0x20, "", "No actor class id provided.");
        return;
    end 

    local pos = player:GetPos();
    local x = pos[1];
    local y = pos[2];
    local z = pos[3];
    local rot = pos[4];
    local zone = pos[5];
         
<<<<<<< HEAD
    actorClassId = tonumber(actorClassId);
    
    if (actorClassId ~= nil) then       
        zone = player:GetZone();
        local w = tonumber(width) or 0;
=======
	actorClassId = tonumber(actorClassId);
	
	if (actorClassId ~= nil) then
		local w = tonumber(width) or 0;
>>>>>>> ioncannon/quest_system
        local h = tonumber(height) or 0;
        printf("%f %f %f", x, y, z);
        --local x, y, z = player.GetPos();
        for i = 0, w do
            for j = 0, h do
<<<<<<< HEAD
                actor = zone:SpawnActor(actorClassId, "test", x + (i - (w / 2) * 3), y, z + (j - (h / 2) * 3), rot);
                actor.SetAppearance(1001149)
            end
        end
    end
    
    if (actor == nil) then
        player:SendMessage(0x20, "", "This actor class id cannot be spawned.");
    end
    
=======
				actor = player.CurrentArea:SpawnActor(actorClassId, "test", pos[0] + (i - (w / 2) * 3), pos[1], pos[2] + (j - (h / 2) * 3), pos[3]);
				actor.SetAppearance(1001149)
			end
		end
	end
	
	if (actor == nil) then
		player:SendMessage(0x20, "", "This actor class id cannot be spawned.");
	end
	
>>>>>>> ioncannon/quest_system
end;