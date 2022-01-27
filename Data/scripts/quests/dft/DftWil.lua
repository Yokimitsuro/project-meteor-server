require ("global")

--[[

Quest Script

Name: 	Small Talk
Code: 	DftWil
Id: 	110543

Contains all default lines for talkable npcs in the Wilderness Region (aka Thanalan).
* NOTE: This quest is active for all players at all times.
]]

-- [ActorClassId] = "client_function_name"
local defaultTalkWil = {
    [1000046] = "defaultTalkWithGogofu_001",            -- Gogofu
    [1000047] = "defaultTalkWithHahayo_001",            -- Hahayo
    [1000070] = "defaultTalkWithKukumuko_001",          -- Kukumuko
    [1000293] = "defaultTalkWithDeaustie_001",          -- Deaustie     - defaultTalkWithDeaustie_002 (flavor for being on WVR?)
    [1000374] = "defaultTalkWithRorojaru_001",          -- Rorojaru
    [1000597] = "defaultTalkWithNogeloix_001",          -- Nogeloix
    [1000638] = "defaultTalkWithHawazizowazi_001",      -- Hawazi Zowazi
    [1000639] = "defaultTalkWithIsabella_001",          -- Isabella
    [1000640] = "defaultTalkWithCiceroix_001",          -- Ciceroix
    [1000641] = "defaultTalkWithXaunbolo_001",          -- Xau Nbolo
    [1000642] = "defaultTalkWithOefyrblaet_001",        -- Oefyrblaet
    [1000643] = "defaultTalkWithBabaki_001",            -- Babaki
    [1000644] = "defaultTalkWithLohwaeb_001",           -- Lohwaeb
    [1000645] = "defaultTalkWithMargarete_001",         -- Margarete
    [1000646] = "defaultTalkWithRinhmaimhov_001",       -- Rinh Maimhov
    [1000647] = "defaultTalkWithLyngwaek_001",          -- Lyngwaek
    [1000648] = "defaultTalkWithWawaton_001",           -- Wawaton
    [1000651] = "defaultTalkWithPopori_001",            -- Popori
    [1000652] = "defaultTalkWithMamaza_001",            -- Mamaza
    [1000653] = "defaultTalkWithNhagiamariyo_001",      -- Nhagi Amariyo
    [1000654] = "defaultTalkWithJajanzo_001",           -- Jajanzo
    [1000655] = "defaultTalkWithJeger_001",             -- Jeger
    [1000656] = "defaultTalkWithMartine_001",           -- Martine
    [1000658] = "defaultTalkWithGairbert_001",          -- Gairbert
    [1000659] = "defaultTalkWithDrew_001",              -- Drew 
    [1000665] = "defaultTalkWithRosalind_001",          -- Rosalind
    [1000666] = "defaultTalkWithOcoco_001",             -- Ococo
    [1000668] = "defaultTalkWithUbokhn_001",            -- U'bokhn
    [1000780] = "defaultTalkWithKiora_001",             -- Kiora
    [1000781] = "defaultTalkWithOpondhao_001",          -- O'pondhao
    [1000782] = "defaultTalkWithBertram_001",           -- Bertram
    [1000783] = "defaultTalkWithMinerva_001",           -- Minvera
    [1000784] = "defaultTalkWithZoengterbin_001",       -- Zoengterbin  - defaultTalkWithZoengterbin_002 / defaultTalkWithZoengterbin_003 (informs about LNC guild)
    [1000785] = "defaultTalkWithStyrmoeya_001",         -- Styrmoeya
    [1000786] = "defaultTalkWithYhahamariyo_001",       -- Yhah Amariyo
    [1000787] = "defaultTalkWithHildie_001",            -- Hildie
    [1000788] = "defaultTalkWithLettice_001",           -- Lettice
    [1000789] = "defaultTalkWithTyon_001",              -- Tyon         - defaultTalkWithTyon_002 / defaultTalkWithTyon_003 (informs about BTN guild)
    [1000840] = "defaultTalkWithRururaji_001",          -- Rururaji     - Presumably dialog pre-Chocobo update. Will not fire due to actor class change since then.
    [1000841] = "defaultTalkWithMomodi_001",            -- Momodi
    [1000846] = "defaultTalkWithYayake_001",            -- Yayake
    [1000847] = "defaultTalkWithIllofii_001",           -- I'llofii
    [1000861] = "defaultTalkWithLinette_001",           -- Linette
    [1000862] = "defaultTalkWithGagaruna_001",          -- Gagaruna
    [1000863] = "defaultTalkWithLulutsu_001",           -- Lulutsu
    [1000864] = "defaultTalkWithInn_Desk",              -- Otopa Pottopa
    [1000915] = "defaultTalkWithCahernaut_001",         -- Cahernaut
    [1000916] = "defaultTalkWithAspipi_001",            -- Aspipi
    [1000917] = "defaultTalkWithGloiucen_001",          -- Gloiucen
    [1000934] = "defaultTalkWithTitinin_001",           -- Titinin
    [1000950] = "defaultTalkWithElecotte_001",          -- Elecotte
    [1000955] = "defaultTalkWithNaidazamaida_001",      -- Naida Zamaida
    [1000962] = "defaultTalkWithPapawa_001",            -- Papawa
    [1000963] = "defaultTalkWithGaleren_001",           -- Galeren
    [1000964] = "defaultTalkWithFhruybolg_001",         -- Fruhybolg
    [1000965] = "defaultTalkWithAbylgohamylgo_001",     -- Abylgo Hamylgo
    [1000966] = "defaultTalkWithFinecoromanecco_001",   -- Fineco Romanecco
    [1000967] = "defaultTalkWithSwerdahrm_001",         -- Swerdahrm
    [1000968] = "defaultTalkWithWannore_001",           -- Wannore
    [1000969] = "defaultTalkWithQmhalawi_001",          -- Q'mhalawai
    [1000994] = "defaultTalkWithLefchild_001",          -- Lefchild
    [1001007] = "defaultTalkWithHalstein_001",          -- Halstein
    [1001009] = "defaultTalkWithMelisie_001",           -- Melisie
    [1001012] = "defaultTalkWithShamanilohmani_001",    -- Shamani Lohmani
    [1001022] = "defaultTalkWithSungikelungi_001",      -- Sungi Kelungi
    [1001055] = "defaultTalkWithBouchard_001",          -- Bouchard
    [1001056] = "defaultTalkWithHolbubu_001",           -- Holbubu
    [1001073] = "defaultTalkWithObilitambili_001",      -- Obili Tambili
    [1001074] = "defaultTalkWithMiyaya_001",            -- Miyaya
    [1001075] = "defaultTalkWithBerthar_001",           -- Berthar
    [1001141] = "defaultTalkWithTutubuki_001",          -- Tutubuki
    [1001142] = "defaultTalkWithKamlitohalito_001",     -- Kamlito Halito
    [1001143] = "defaultTalkWithTotono_001",            -- Totono
    [1001144] = "defaultTalkWithFyrilsunn_001",         -- Fyrilsunn
    [1001145] = "defaultTalkWithSinette_001",           -- Sinette
    [1001165] = "defaultTalkWithMumukiya_001",          -- Mumukiya
    [1001166] = "defaultTalkWithYuyubesu_001",          -- Yuyubesu
    [1001167] = "defaultTalkWithChachai_001",           -- Chachai
    [1001168] = "defaultTalkWithFifilo_001",            -- Fifilo
    [1001169] = "defaultTalkWithPierriquet_001",        -- Pierriquet
    [1001170] = "defaultTalkWithMohtfryd_001",          -- Mothfryd
    [1001171] = "defaultTalkWithQhotanbolo_001",        -- Qhota Nbolo
    [1001191] = "defaultTalkWithGuildleveClientU_001",  -- Roarich
    [1001192] = "defaultTalkWithGuildleveClientU_002",  -- Claroise
    [1001193] = "defaultTalkWithGuildleveClientU_003",  -- Uwilsyng
    [1001200] = "defaultTalkWithJannie_001",            -- Jannie
    [1001201] = "defaultTalkWithDylise_001",            -- Dylise
    [1001202] = "defaultTalkWithBarnabaix_001",         -- Barnabaix
    [1001203] = "defaultTalkWithTyagomoui_001",         -- Tyago Moui
    [1001256] = "defaultTalkWithMaginfred_001",         -- Gunnulf
    [1001257] = "defaultTalkWithOrisic_001",            -- Heibert
    [1001260] = "defaultTalkWithKlamahni_001",          -- I'paghlo
    [1001415] = "defaultTalkWithAnthoinette_001",       -- Anthoinette
    [1001416] = "defaultTalkWithWisemoon_001",          -- Wise Moon
    [1001417] = "defaultTalkWithApachonaccho_001",      -- Apacho Naccho
    [1001418] = "defaultTalkWithWyznguld_001",          -- Wyznguld
    [1001419] = "defaultTalkWithNeymumu_001",           -- Neymumu
    [1001420] = "defaultTalkWithSafufu_001",            -- Safufu
    [1001421] = "defaultTalkWithPenelizuneli_001",      -- Peneli Zuneli
    [1001422] = "defaultTalkWithMilgogo_001",           -- Milgogo
    [1001423] = "defaultTalkWithMumutano_001",          -- Mumutano
    [1001424] = "defaultTalkWithGegeissa_001",          -- Gegeissa
    [1001426] = "defaultTalkWithHehena_001",            -- Hehena
    [1001427] = "defaultTalkWithGuillaunaux_001",       -- Guillaunaux
    [1001428] = "defaultTalkWithYuyuhase_001",          -- Yuyuhase
    [1001429] = "defaultTalkWithLulumo_001",            -- Lulumo
    [1001438] = "defaultTalkWithNokksushanksu_001",     -- Nokksu Shanksu
    [1001439] = "defaultTalkWithThimm_001",             -- Thimm
    [1001440] = "defaultTalkWithQaruru_001",            -- Qaruru
    [1001441] = "defaultTalkWithWracwulf_001",          -- Wracwulf
    [1001442] = "defaultTalkWithWenefreda_001",         -- Wenefreda
    [1001443] = "defaultTalkWithJudithe_001",           -- Judithe
    [1001444] = "defaultTalkWithRobyn_001",             -- Robyn
    [1001445] = "defaultTalkWithSingleton_001",         -- Singleton
    [1001451] = "defaultTalkWithDoll001_001",           -- Mammet (Eshtaime's Lapidaries [GSM])
    [1001452] = "defaultTalkWithDoll002_001",           -- Mammet (Eshtaime's Lapidaries [GSM] #2)
    [1001453] = "defaultTalkWithDoll003_001",           -- Mammet (Sunsilk Tapestries [WVR])
    [1001454] = "defaultTalkWithDoll004_001",           -- Mammet (Frondale's Phrontistery [ALC])
    [1001455] = "defaultTalkWithDoll005_001",           -- Mammet (Merchant Strip)
    [1001462] = "defaultTalkWithQatanelhah_001",        -- Qata Nelhah
    [1001463] = "defaultTalkWithKukusi_001",            -- Kukusi
    [1001464] = "defaultTalkWithVannes_001",            -- Vannes
    [1001465] = "defaultTalkWithTatasha_001",           -- Tatasha
    [1001466] = "defaultTalkWithXdhilogo_001",          -- X'dhilogo
    -- [1001467] = "",                                  -- Dariustel    - No dialog. Supposed to be flagged as untargetable
    -- [1001468] = "",                                  -- Guencen      - No dialog. Supposed to be flagged as untargetable
    [1001475] = "defaultTalkWithDiriaine_001",          -- Diriaine
    [1001476] = "defaultTalkWithCrhabye_001",           -- C'rhabye
    [1001471] = "downTownTalk",                         -- Kokobi
    [1001472] = "defaultTalkWithMimishu_001",           -- Mimishu
    [1001565] = "defaultTalkWithEleanor_001",           -- Eleanor
    [1001712] = "defaultTalkWithGuillestet_001",        -- Guillestet
    [1001713] = "defaultTalkWithHCidjaa_001",           -- H'cidjaa
    [1001717] = "defaultTalkWithGoodife_001",           -- Goodife
    [1001726] = "defaultTalkWithAistan_001",            -- Aistan
    [1001770] = "defaultTalkWithEara_001",              -- Eara
    [1001771] = "defaultTalkWithLiaime_001",            -- Liaime
    [1001932] = "defaultTalkWithSIBOLD_001",            -- Sibold
    [1001953] = "defaultTalkWithBerndan_001",           -- Berndan
    [1002047] = "defaultTalkWithInn_Desk_2",            -- Kopuru Fupuru - Inn NPC.
    [1002101] = "defaultTalkWithDuraltharal_001",       -- Dural Tharal
    [1060042] = "defaultTalkWithJenlyns_001",           -- Jenlyns      - defaultTalkWithJenlyns_002 (PLD-unlocked specific dialog?)
    [1500126] = "tribeTalk",                            -- Vavaki
    [1500129] = "defaultTalkWithYayatoki_001",          -- Yayatoki
    [1700039] = "defaultTalkWithBATERICH_100"           -- Baterich
 
--[[ Fix Later
    [1002110] = "processEventSOMBER", arg1,             -- Flame Lieutenant Somber Meadow   - uses Spl000 staticactor not dftWil
    [1002111] = "processEventMIMIO",                    -- Flame Sergeant Mimio Mio         - uses Spl000 staticactor not dftWil
    [1002112] = "processEventSISIMUZA",                 -- Flame Private Sisimuza Tetemuza  - uses Spl000 staticactor not dftWil
--]]  
    
}    
 
    


function onTalk(player, quest, npc, eventName)

    local npcId = npc:GetActorClassId();
	local clientFunc = defaultTalkWil[npcId];
    
    if (npcId == 1002047) then -- Kopuru Fupuru - Inn NPC
        local choice = callClientFunction(player, "delegateEvent", player, quest, clientFunc);
        
        if (choice == 1) then
            GetWorldManager():DoZoneChange(player, 244, nil, 0, 15, 0.048, 0, -5.737, 0);
        elseif (choice == 2) then
            if (player:GetHomePointInn() ~= 3) then
                player:SetHomePointInn(3);
                player:SendGameMessage(GetWorldMaster(), 60019, 0x20, 3071); --Secondary homepoint set to the Hourglass
            else			
                player:SendGameMessage(GetWorldMaster(), 51140, 0x20); --This inn is already your Secondary Homepoint
            end
        end
    else
        callClientFunction(player, "delegateEvent", player, quest, clientFunc);
    end
    
	player:EndEvent();
end

function IsQuestENPC(player, quest, npc)
	return defaultTalkWil[npc:GetActorClassId()] ~= nil;
end