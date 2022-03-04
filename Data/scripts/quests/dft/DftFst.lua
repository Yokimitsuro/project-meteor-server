require ("global")

--[[

Quest Script

Name: 	Small Talk
Code: 	DftFst
Id: 	110542

Contains all default lines for talkable npcs in the Forest Region (aka Black Shroud).
* NOTE: This quest is active for all players at all times.
]]

-- [ActorClassId] = "client_function_name"
local defaultTalkFst = {
    [1000066] = "defaultTalkWithAlixe_001",                 -- Alixe                (Gridania: LTW Guild)
    [1000067] = "defaultTalkWithDadalo_001",                -- Dadalo               (Gridania: LTW Guild)
    [1000068] = "defaultTalkWithKain_001",                  -- Kain                 (Gridania: LTW Guild)
    [1000069] = "defaultTalkWithJolline_001",               -- Jolline              (Gridania: LNC Guild)
    [1000071] = "defaultTalkWithBertennant_001",            -- Bertennant           (Gridania: Blue Badger Gate)
    [1000074] = "defaultTalkWithOnguen_001",                -- Onguen               (Gridania: BTN Guild)
    [1000230] = "defaultTalkWithMiounne_001",               -- Miounne              (Gridania: Adv. Guild)
    [1000231] = "defaultTalkWithHereward_001",              -- Hereward             (Gridania: LTW Guild)
    [1000236] = "defaultTalkWithOpyltyl_001",               -- Opyltyl              (Gridania: BTN Guild)
    [1000242] = "defaultTalkWithWillelda_001",              -- Willelda             (Gridania: LNC Guild) defaultTalkWithWillelda_002 - After signing up to the guild?
    [1000243] = "defaultTalkWithBurchard_001",              -- Burchard             (Gridania: LNC Guild)
    [1000326] = "defaultTalkWithCicely_001",                -- Cicely               (Gridania: BTN Guild)
    [1000427] = "defaultTalkWithAnene_001",                 -- Anene                (Gridania: Adv. Guild) defaultTalkWithAnene_002 / 003 (PGL informant)
    [1000428] = "defaultTalkWithSylbyrt_001",               -- Sylbyrt              (Gridania: Adv. Guild) defaultTalkWithSylbyrt_002 / 003 (MRD informant)
    [1000429] = "defaultTalkWithHongavunga_001",            -- Honga Vunga          (Gridania: Adv. Guild) defaultTalkWithHongavunga_002 / 003 (WVR informant)
    [1000430] = "defaultTalkWithNoncomananco_001",          -- Nonco Menanco        (Gridania: Adv. Guild) arg1=1 or 21, mentions checking out DoW/M, otherwise DoH.  defaultTalkWithNoncomananco_002 / 003 (GSM informant)
    [1000431] = "defaultTalkWithLtandhaa_001",              -- L'tandhaa            (Gridania: Adv. Guild) defaultTalkWithLtandhaa_002 / 003 (ALC informant)
    [1000432] = "defaultTalkWithPofufu_001",                -- Pofufu               (Gridania: Adv. Guild) defaultTalkWithPofufu_002 / 003 (MIN informant)
    [1000433] = "defaultTalkWithDrividot_001",              -- Drividot             (Gridania: Adv. Guild) defaultTalkWithDrividot_002 / 003 (FSH informant)
	[1000435] = "defaultTalkWithBasewin_001",               -- Basewin              (Gridania: Adv. Guild) defaultTalkWithBasewin_002 / 003 (BSM informant)
    [1000436] = "defaultTalkWithSeikfrae_001",              -- Seikfrae             (Gridania: Adv. Guild) defaultTalkWithSeikfrae_002 / 003 (GLD informant)
    [1000437] = "defaultTalkWithEdasshym_001",              -- E'dasshym            (Gridania: Adv. Guild) defaultTalkWithEdasshym_002 / 003 (THM informant)
    --[1000456] = "",                                         -- Tierney              (Gridania: Adv. Guild) Guildleve NPC - Will not fire, not PplStd.
    --[1000457] = "",                                         -- Gontrant             (Gridania: Adv. Guild) Guildleve NPC - Will not fire, not PplStd.
    [1000458] = "defaultTalkWithInn_Desk",                  -- V'korolon            (Gridania: Adv. Guild) - defaultTalkWithVkorolon_001 - Pre-Inn unlocked dialog
    --[1000459] = "",                                         -- Gallia             (Gridania: LTW Guild) Guildmark NPC - Will not fire, not PplStd.
    --[1000461] = "",                                         -- Kipopo             (Gridania: BTN  Guild) Guildmark NPC - Will not fire, not PplStd.
    --[1000462] = "",                                         -- Clarembald         (Gridania: LNC Guild) Guildmark NPC - Will not fire, not PplStd.
    [1000463] = "defaultTalkWithNonolato_001",              -- Nonolato             (Gridania: ARC Guild) 
    --[1000464] = "",                                         -- Cassandra          (Gridania: ARC Guild) Guildmark NPC - Will not fire, not PplStd.
    [1000465] = "defaultTalkWithAnaidjaa_001",              -- A'naidjaa            (Gridania: CRP Guild)
    --[1000466] = "",                                         -- Frances            (Gridania: CRP Guild) Guildmark NPC - Will not fire, not PplStd.
    [1000565] = "defaultTalkWithCeinguled_001",             -- Ceinguled            (Gridania: LNC Guild)
    [1000566] = "defaultTalkWithFrancis_001",               -- Francis              (Gridania: LNC Guild) arg1=1, npc recognizes you're in the LNC guild
    [1000567] = "defaultTalkWithDhemdaeg_001",              -- Dhemdaeg             (Gridania: LNC Guild)
    [1000568] = "defaultTalkWithLuitfrid_001",              -- Luitfrid             (Gridania: LNC Guild)
    [1000569] = "defaultTalkWithHaurtefert_001",            -- Haurtefert           (Gridania: LNC Guild)
    [1000570] = "defaultTalkWithZpahtalo_001",              -- Z'pahtalo            (Gridania: LNC Guild)
    [1000599] = "defaultTalkWithJmoldva_001",               -- J'moldva             (Gridania: LNC Guild)
    [1000621] = "defaultTalkWithHabreham_001",              -- Habreham             (Gridania: CRP Guild)
    [1000622] = "defaultTalkWithDecima_001",                -- Decima               (Gridania: CRP Guild)
    [1000623] = "defaultTalkWithChalyotamlyo_001",          -- Chalyo Tamlyo        (Gridania: CRP Guild)
    [1000625] = "defaultTalkWithBubuku_001",                -- Bubuku               (Gridania: ARC Guild)
    [1000626] = "defaultTalkWithPiers_001",                 -- Piers                (Gridania: ARC Guild)
    [1000627] = "defaultTalkWithAerstsyn_001",              -- Aerstsyn             (Gridania: LNC Guild)
    [1000629] = "defaultTalkWithEburhart_001",              -- Eburhart             (Gridania: BTN Guild)
    [1000630] = "defaultTalkWithNoes_001",                  -- Noes                 (Gridania: Apkallus Falls)
    [1000671] = "defaultTalkWithMiraudont_001",             -- Miraudont            (North Shroud: Camp Emerald Moss) arg1=true - Mentions Atomos
    [1000681] = "defaultTalkWithNuala_001",                 -- Nuala                (Gridania: LNC Guild)
    [1000701] = "defaultTalkWithZuzupoja_001",              -- Zuzupoja             (Gridania: CRP Guild)
    [1000821] = "defaultTalkWithNellaure_001",				-- Nellaure             (Gridania: CRP Guild)
    [1000822] = "defaultTalkWithCaplan_001",                -- Caplan               (Gridania: CRP Guild)
    [1000823] = "defaultTalkWithUlmhylt_001",               -- Ulmhylt              (Gridania: CRP Guild)
    [1000829] = "defaultTalkWithOdhinek_001",               -- O'dhinek             (Gridania: ARC Guild)
    [1000830] = "defaultTalkWithGeorjeaux_001",             -- Georjeaux            (Gridania: ARC Guild) defaultTalkWithGeorjeaux_002 - Dialog when you're part of the guild?
    [1000831] = "defaultTalkWithAlaire_001",                -- Alaire               (Gridania: ARC Guild)
    [1000832] = "defaultTalkWithMianne_001",                -- Mianne               (Gridania: ARC Guild)
    [1000951] = "defaultTalkWithLonsygg_001",               -- Lonsygg              (Gridania: Blue Badger Gate)
    [1001077] = "defaultTalkWithBeli_001",                  -- Beli                 (Gridania: LTW Guild)
    [1001078] = "defaultTalkWithMaddeline_001",             -- Maddeline            (Gridania: LTW Guild)
    [1001079] = "defaultTalkWithDyrstbrod_001",             -- Dyrstbrod            (Gridania: LTW Guild)
    [1001080] = "defaultTalkWithTatagoi_001",               -- Tatagoi              (Gridania: LTW Guild)
	[1001081] = "defaultTalkWithKhumamoshroca_001",			-- Khuma Moshroca       (Gridania: LTW Guild)
    [1001082] = "defaultTalkWithLuilda_001",                -- Luilda               (Gridania: LTW Guild)
    [1001101] = "defaultTalkWithVnabyano_001",              -- V'nabyano            (Gridania: BTN Guild)
    [1001102] = "defaultTalkWithSandre_001",                -- Sandre               (Gridania: BTN Guild)
	[1001103] = "defaultTalkWithMestonnaux_001", 			-- Mestonnaux           (Gridania: BTN Guild)
    [1001175] = "defaultTalkWithChloe_001",                 -- Chloe                (Gridania: ARC Guild)
    --[1001183] = "",                                         -- Emoni                (Gridania: Adv. Guild) Linkshell NPC - Will not fire, not PplStd.
    --[1001184] = "",                                         -- Gyles                (Gridania: Adv. Guild) Retainer NPC - Will not fire, not PplStd.
    [1001188] = "defaultTalkWithGuildleveClientG_001",      -- Maisenta             (Gridania)
    [1001189] = "defaultTalkWithGuildleveClientG_002",      -- Pukiki               (Gridania)
	[1001396] = "defaultTalkWithLefwyne_001",				-- Lefwyne              (Gridania: Shaded Bower)
	[1001430] = "defaultTalkWithKinnison_001",				-- Kinnison             - Two args (nil errors client).  If either >= 0, dialog mentions you've met Kan-E-Senna.  Position inaccurate?
    [1001431] = "defaultTalkWithGenna_001",                 -- Genna                (Gridania: Mih Khetto's Amphitheatre)
    [1001432] = "defaultTalkWithMathye_001",                -- Mathye               (Gridania: Blue Badger Gate)
    [1001433] = "defaultTalkWithUlta_001",                  -- Ulta                 (Gridania: Blue Badger Gate)
    [1000434] = "defaultTalkWithOdilie_001",                -- Odilie               (Gridania: Adv. Guild) defaultTalkWithOdilie_002 / 003 (CUL informant)
    [1001436] = "defaultTalkWithOwyne_001",                 -- Owyne                (Gridania: Aetheryte Plaza)
	[1001437] = "defaultTalkWithSybell_001",				-- Sybell               (Gridania: Aetheryte Plaza)
    [1001459] = "defaultTalkWithFlavielle_001",             -- Flavielle            (Gridania: Adv. Guild) defaultTalkWithFlavielle_002 / 003 (ARM informant)
    [1001469] = "downTownTalk",                             -- Eldid                (Gridania: Wards Entrance)
    [1001582] = "defaultTalkWithSwaenhylt_001",             -- Swaenhylt            (Gridania)
    [1001583] = "defaultTalkWithMarcette_001",              -- Marcette             (Gridania: The Knot)
    [1001470] = "defaultTalkWithYlessa_001",                -- Ylessa
    [1001706] = "defaultTalkWithMemama_001",                -- Memama               (Gridania: Adv. Guild)
    [1001707] = "defaultTalkWithPfarahr_001",               -- Pfarahr              (Gridania: Adv. Guild)
    [1001708] = "defaultTalkWithBeaudonet_001",             -- Beaudonet            (Gridania: Adv. Guild)
    [1001709] = "defaultTalkWithFryswyde_001",              -- Fryswyde             (Gridania: Adv. Guild)
    [1001710] = "defaultTalkWithWillielmus_001",            -- Willielmus           (Gridania: Adv. Guild)
    [1001806] = "defaultTalkEnie_001",                      -- Enie                 (Gridania: BTN Guild)
    [1001951] = "defaultTalkWithAnselm_001",                -- Anselm               (Gridania: Adv. Guild)
    --[1002090] = "",                                         -- Serpent Private Hodder (Gridania: Adv. Guild) - Will not fire, not PplStd.
    --[1002091] = "",                                         -- Serpent Private Daurement (Gridania: Adv. Guild) - Will not fire, not PplStd.
    [1002106] = "processEventELNAURE",                      -- Serpent Lieutenant Marette (Gridania: The Knot) - Foundation Day 2012 - Spl000 staticactor
    [1002107] = "processEventARISMONT",                     -- Serpent Sergeant Frilaix (Gridania: The Knot) - Foundation Day 2012 - Spl000 staticactor
    [1002108] = "processEventMERLIE",                       -- Serpent Private Tristelle (Gridania: The Knot) - Foundation Day 2012 - Spl000 staticactor
    --[1060022] = "",                                         -- Louisoix           (Gridania: Apkallus Falls) - Will not fire, not PplStd.
    [1500055] = "defaultTalkWithLionnellais_001",           -- Lionnellais          (Gridania: Adv. Guild) - Will not fire, not PplStd.  Pre-airship dialog?
    [1500056] = "defaultTalkWithHida_001",                  -- Hida                 (Gridania: Adv. Guild) - Will not fire, not PplStd.  Pre-airship dialog?
    --[1500061] = "",                                         -- Fruhdhem             (Gridania) Chocobo Taxi - Will not fire, not PplStd.
    [1500127] = "tribeTalk",                                -- Prosperlain          (Gridania)
    --[1500294] = "",                                         -- Gagaroon             (Gridania: Rosewood Stalls) Black Market - Will not fire, not PplStd.
    [1700001] = "defaultTalkWithPenelope_001",              -- Penelope             (Gridania: Adv. Guild)
    [1700038] = "defaultTalkWithAUBRENARD_100",             -- Aubrenard            (Gridania: Shaded Bower)
}
--[[ TO:DO - Map the remainder of these

defaultTalkWithStewart_001  -- Hodder line according to old script?
defaultTalkWithPowle_001    
defaultTalkWithSansa_001    
defaultTalkWithNicoliaux_001
defaultTalkWithAunillie_001 
defaultTalkWithElyn_001     
defaultTalkWithRyd_001
defaultTalkWithSolieine_001
defaultTalkWithHetzkin_001    
defaultTalkWithTelent_001     
defaultTalkWithKhujazhwan_001 
defaultTalkWithZerig_001
defaultTalkWithYonariumnari_001
defaultTalkWithGugula_001   
defaultTalkWithRdjongo_001  
defaultTalkWithAstrelle_001 
defaultTalkWithBiddy_001    
defaultTalkWithConcessa_001 
defaultTalkWithMaroile_001  
defaultTalkWithKinborow_001 
defaultTalkWithTnbulea_001  
defaultTalkWithFoforyo_001  
defaultTalkWithFhrudhem_001 
defaultTalkWithMitainie_001 
defaultTalkWithNicia_001    
defaultTalkWithBlandie_001          
defaultTalkWithLivith_001           
defaultTalkWithProscen_001          
defaultTalkWithTanguistl_001        
defaultTalkWithComoere_001          
defaultTalkWithLougblaet_001        
defaultTalkWithFamushidumushi_001   
defaultTalkWithDrystan_001          
defaultTalkWithEadbert_001          
defaultTalkWithWybir_001            
defaultTalkWithKeketo_001           
defaultTalkWithRadianttear_001
defaultTalkWithMyles_001
defaultTalkWithNathaniel_001
defaultTalkWithEvrardoux_001
defaultTalkWithTsehpanipahr_001
defaultTalkWithEthelinda_001   
defaultTalkWithHedheue_001     
defaultTalkWithJajajbygo_001 arg1 arg2
defaultTalkWithPepeli_001 arg1
defaultTalkWithBidelia_001
defaultTalkWithRimomo_001       
defaultTalkWithDadaneja_001     
defaultTalkWithIolaine_001      
defaultTalkWithBloisirant_001   
defaultTalkWithGylbart_001      
defaultTalkWithHonoroit_001     
defaultTalkWithGuildleveClientG_003
defQuest1g0_Bush
defQuest1g1_Bush
defaultTalkWithChamberliaux_001
defaultTalkWithFraemhar_001
defaultTalkWithXbhowaqi_001
defaultTalkWithLora_001
defaultTalkWithWawaramu_001
defaultTalkWithArnott_001
defaultTalkWithLhomujuuk_001
defaultTalkWithSholnoralno_001
defaultTalkWithTuatkk_001
defaultTalkWithAruhnsenna_001
defaultTalkWithMoogle010_001
defaultTalkWithMoogle002_001
defaultTalkWithAilith_001
defaultTalkWithQZamqo_001
defaultTalkLouisoix_001
defaultTalkWithRonanKognan_001
defaultTalkWithRonanKognan_002 arg1 arg2
defaultTalkWithRonanKognan_Hint_00 arg1
defaultTalkWithRonanKognan_Hint_01 arg1
defaultTalkWithRonanKognan_Hint_02 arg1
defaultTalkWithRonanKognan_Hint_03 arg1
defaultTalkWithRonanKognan_Hint_04 arg1
defaultTalkWithVorsaile_001 arg1
defaultTalkCaravanChocoboGri_001
bookTalk
talkIdayCap
talkIday1
talkIday2
defaultTalkWithPukwapika_001
defaultTalkWithPurumoogle_001
defaultTalkWithPirimoogle_001
defaultTalkWithPukumoogle_001
defaultTalkWithJehantel_001
defaultTalkWithJehantel_002
defaultTalkWithPukno_001
defaultTalkWithPukno_002
defaultTalkWithRayao_001
defaultTalkWithRayao_002
defaultTalkWithMoogleA_001
defaultTalkWithMoogleA_002
defaultTalkWithMppgleB_001
defaultTalkWithMppgleB_002
defaultTalkWithStewart_001
defaultTalkWithStewart_002
defaultTalkWithTrisselle_001
defaultTalkWithTrisselle_002
defaultTalkWithInn_Desk
defaultTalkWithInn_ExitDoor
defaultTalkWithExit01
defaultTalkWithLegendBsm_001 arg1
defaultTalkWithMarketNpc
defaultTalkWithHamletGuardGri_001
--]]


function onTalk(player, quest, npc, eventName)

    local npcId = npc:GetActorClassId();
	local clientFunc = defaultTalkFst[npcId];
    
    if (npcId == 1000430) then -- Nonco Menanco
        callClientFunction(player, "delegateEvent", player, quest, clientFunc, 21);
    elseif (npcId == 1001430) then -- Kinnison
        callClientFunction(player, "delegateEvent", player, quest, clientFunc, -1,-1);
    elseif ((npcId >= 1002106) and (npcId <= 1002108)) then  -- Foundation Day 2012 NPCs
        talkWithSpecial(player, npcId, clientFunc)
    else
        callClientFunction(player, "delegateEvent", player, quest, clientFunc);
    end
    
	player:EndEvent();
end

function IsQuestENPC(player, quest, npc)
	return defaultTalkFst[npc:GetActorClassId()] ~= nil;
end


function talkWithSpecial(player, npcId, clientFunc)
        local splQuest = GetStaticActor("Spl000");
        local magickedPrism = 0;
        callClientFunction(player, "delegateEvent", player, splQuest, clientFunc, magickedPrism);
end
