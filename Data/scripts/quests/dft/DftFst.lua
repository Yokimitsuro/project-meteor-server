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
    [1000071] = "defaultTalkWithBertennant_001",            -- Bertennant           (Gridania: Blue Badger Gate)
    [1000230] = "defaultTalkWithMiounne_001",               -- Miounne              (Gridania: Adv. Guild)
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
    [1000821] = "defaultTalkWithNellaure_001",				-- Nellaure
    [1000951] = "defaultTalkWithLonsygg_001",               -- Lonsygg              (Gridania: Blue Badger Gate)
	[1001081] = "defaultTalkWithKhumamoshroca_001",			-- Khuma Moshroca
	[1001103] = "defaultTalkWithMestonnaux_001", 			-- Mestonnaux
    --[1001183] = "",                                         -- Emoni                (Gridania: Adv. Guild) Linkshell NPC - Will not fire, not PplStd.
    --[1001184] = "",                                         -- Gyles                (Gridania: Adv. Guild) Retainer NPC - Will not fire, not PplStd.
	[1001396] = "defaultTalkWithLefwyne_001",				-- Lefwyne

	[1001430] = "defaultTalkWithKinnison_001",				-- Kinnison             - Two args (nil errors client).  If either >= 0, dialog mentions you've met Kan-E-Senna.
    [1001432] = "defaultTalkWithMathye_001",                -- Mathye               (Gridania: Blue Badger Gate)
    [1001433] = "defaultTalkWithUlta_001",                  -- Ulta                 (Gridania: Blue Badger Gate)
    [1000434] = "defaultTalkWithOdilie_001",                -- Odilie               (Gridania: Adv. Guild) defaultTalkWithOdilie_002 / 003 (CUL informant)
	[1001437] = "defaultTalkWithSybell_001",				-- Sybell
    [1001459] = "defaultTalkWithFlavielle_001",             -- Flavielle            (Gridania: Adv. Guild) defaultTalkWithFlavielle_002 / 003 (ARM informant)
    [1001706] = "defaultTalkWithMemama_001",                -- Memama               (Gridania: Adv. Guild)
    [1001707] = "defaultTalkWithPfarahr_001",               -- Pfarahr              (Gridania: Adv. Guild)
    [1001708] = "defaultTalkWithBeaudonet_001",             -- Beaudonet            (Gridania: Adv. Guild)
    [1001709] = "defaultTalkWithFryswyde_001",              -- Fryswyde             (Gridania: Adv. Guild)
    [1001710] = "defaultTalkWithWillielmus_001",            -- Willielmus           (Gridania: Adv. Guild)
    [1001951] = "defaultTalkWithAnselm_001",                -- Anselm               (Gridania: Adv. Guild)
    [1002091] = 
    [1500055] = "defaultTalkWithLionnellais_001",           -- Lionnellais          (Gridania: Adv. Guild) - Will not fire, not PplStd.  Pre-airship dialog?
    [1500056] = "defaultTalkWithHida_001",                  -- Hida                 (Gridania: Adv. Guild) - Will not fire, not PplStd.  Pre-airship dialog?
    --[1500334] = "",                                         -- Serpent Private Hill (Gridania: Adv. Guild) Company Warp NPC - Will not fire, not PplStd.
    --[1500393] = "",                                         -- Torsefers            (Gridania: Adv. Guild) Wards NPC - Will not fire, not PplStd.
    --[1600092] = "",                                         -- Aeduin               (Gridania: Adv. Guild) Shop - Will not fire, not PplStd.
    --[1600100] = "",                                         -- Zagylhaemr           (Gridania: Adv. Guild) Shop - Will not fire, not PplStd.
    --[1600119] = "",                                         -- Naih Khamazom        (Gridania: Adv. Guild) Shop - Will not fire, not PplStd.
    [1700001] = "defaultTalkWithPenelope_001",              -- Penelope             (Gridania: Adv. Guild)
    [1000001] = "defaultTalkWithLionnellais_001",
    
    
 --   [1000458] = "defaultTalkWithInn_Desk"

--[[

-- defaultTalkWithStewart_001  -- Hodder line?


defaultTalkWithHereward_001(A0_119, A1_120, A2_121)
defaultTalkWithBeli_001(A0_122, A1_123, A2_124)
defaultTalkWithMaddeline_001(A0_125, A1_126, A2_127)
defaultTalkWithDyrstbrod_001(A0_128, A1_129, A2_130)
defaultTalkWithTatagoi_001(A0_131, A1_132, A2_133)
defaultTalkWithLuilda_001(A0_137, A1_138, A2_139)
defaultTalkWithAlixe_001(A0_140, A1_141, A2_142)
defaultTalkWithDadalo_001(A0_143, A1_144, A2_145)
defaultTalkWithKain_001(A0_146, A1_147, A2_148)
defaultTalkWithAnaidjaa_001(A0_149, A1_150, A2_151)
defaultTalkWithZuzupoja_001(A0_152, A1_153, A2_154)
defaultTalkWithCaplan_001(A0_158, A1_159, A2_160)
defaultTalkWithUlmhylt_001(A0_161, A1_162, A2_163)
defaultTalkWithHabreham_001(A0_164, A1_165, A2_166)
defaultTalkWithDecima_001(A0_167, A1_168, A2_169)
defaultTalkWithChalyotamlyo_001(A0_170, A1_171, A2_172)
defaultTalkWithPowle_001(A0_173, A1_174, A2_175)
defaultTalkWithSansa_001(A0_176, A1_177, A2_178)
defaultTalkWithNicoliaux_001(A0_179, A1_180, A2_181)
defaultTalkWithAunillie_001(A0_182, A1_183, A2_184)
defaultTalkWithElyn_001(A0_185, A1_186, A2_187)
defaultTalkWithRyd_001(A0_188, A1_189, A2_190)
defaultTalkWithWillelda_001(A0_191, A1_192, A2_193)
defaultTalkWithWillelda_002(A0_194, A1_195, A2_196)
defaultTalkWithBurchard_001(A0_197, A1_198, A2_199)
defaultTalkWithCeinguled_001(A0_200, A1_201, A2_202)
defaultTalkWithFrancis_001(A0_203, A1_204, A2_205, A3_206)
defaultTalkWithDhemdaeg_001(A0_207, A1_208, A2_209)
defaultTalkWithLuitfrid_001(A0_210, A1_211, A2_212)
defaultTalkWithHaurtefert_001(A0_213, A1_214, A2_215)
defaultTalkWithZpahtalo_001(A0_216, A1_217, A2_218)
defaultTalkWithJmoldva_001(A0_219, A1_220, A2_221)
defaultTalkWithNuala_001(A0_222, A1_223, A2_224)
defaultTalkWithJolline_001(A0_225, A1_226, A2_227)
defaultTalkWithAerstsyn_001(A0_228, A1_229, A2_230)
defaultTalkWithNonolato_001(A0_231, A1_232, A2_233)
defaultTalkWithOdhinek_001(A0_234, A1_235, A2_236)
defaultTalkWithGeorjeaux_001(A0_237, A1_238, A2_239)
defaultTalkWithGeorjeaux_002(A0_240, A1_241, A2_242)
defaultTalkWithAlaire_001(A0_243, A1_244, A2_245)
defaultTalkWithChloe_001(A0_246, A1_247, A2_248)
defaultTalkWithMianne_001(A0_249, A1_250, A2_251)
defaultTalkWithBubuku_001(A0_252, A1_253, A2_254)
defaultTalkWithPiers_001(A0_255, A1_256, A2_257)
defaultTalkWithSolieine_001(A0_258, A1_259, A2_260)
defaultTalkWithHetzkin_001(A0_261, A1_262, A2_263)
defaultTalkWithTelent_001(A0_264, A1_265, A2_266)
defaultTalkWithKhujazhwan_001(A0_267, A1_268, A2_269)
defaultTalkWithZerig_001(A0_270, A1_271, A2_272)
defaultTalkWithYonariumnari_001(A0_273, A1_274, A2_275)
defaultTalkWithGugula_001(A0_276, A1_277, A2_278)
defaultTalkWithRdjongo_001(A0_279, A1_280, A2_281)
defaultTalkWithAstrelle_001(A0_282, A1_283, A2_284)
defaultTalkWithBiddy_001(A0_285, A1_286, A2_287)
defaultTalkWithConcessa_001(A0_288, A1_289, A2_290)
defaultTalkWithMaroile_001(A0_291, A1_292, A2_293)
defaultTalkWithKinborow_001(A0_294, A1_295, A2_296)
defaultTalkWithTnbulea_001(A0_297, A1_298, A2_299)
defaultTalkWithFoforyo_001(A0_300, A1_301, A2_302)
defaultTalkWithOpyltyl_001(A0_303, A1_304, A2_305)
defaultTalkWithCicely_001(A0_306, A1_307, A2_308)
defaultTalkWithVnabyano_001(A0_309, A1_310, A2_311)
defaultTalkWithSandre_001(A0_312, A1_313, A2_314)
defaultTalkWithEburhart_001(A0_318, A1_319, A2_320)
defaultTalkWithOnguen_001(A0_321, A1_322, A2_323)
defaultTalkEnie_001(A0_324, A1_325, A2_326)

defaultTalkWithNoes_001(A0_333, A1_334, A2_335)
defaultTalkWithFhrudhem_001(A0_336, A1_337, A2_338)


defaultTalkWithMitainie_001(A0_348, A1_349, A2_350)
defaultTalkWithNicia_001(A0_351, A1_352, A2_353)
defaultTalkWithBlandie_001(A0_354, A1_355, A2_356)
defaultTalkWithGenna_001(A0_362, A1_363, A2_364)
defaultTalkWithOwyne_001(A0_365, A1_366, A2_367)
defaultTalkWithLivith_001(A0_371, A1_372, A2_373)
defaultTalkWithProscen_001(A0_374, A1_375, A2_376)
defaultTalkWithTanguistl_001(A0_377, A1_378, A2_379)
defaultTalkWithComoere_001(A0_380, A1_381, A2_382)
defaultTalkWithLougblaet_001(A0_383, A1_384, A2_385)
defaultTalkWithFamushidumushi_001(A0_386, A1_387, A2_388)
defaultTalkWithDrystan_001(A0_389, A1_390, A2_391)
defaultTalkWithEadbert_001(A0_392, A1_393, A2_394)
defaultTalkWithWybir_001(A0_395, A1_396, A2_397)
defaultTalkWithKeketo_001(A0_398, A1_399, A2_400)
defaultTalkWithRadianttear_001(A0_401, A1_402, A2_403)
defaultTalkWithMyles_001(A0_404, A1_405, A2_406)
defaultTalkWithNathaniel_001(A0_407, A1_408, A2_409)
defaultTalkWithEvrardoux_001(A0_410, A1_411, A2_412)
defaultTalkWithTsehpanipahr_001(A0_413, A1_414, A2_415)
defaultTalkWithEthelinda_001(A0_416, A1_417, A2_418)
defaultTalkWithHedheue_001(A0_419, A1_420, A2_421)
defaultTalkWithJajajbygo_001(A0_422, A1_423, A2_424, A3_425, A4_426)
defaultTalkWithPepeli_001(A0_427, A1_428, A2_429, A3_430)
defaultTalkWithBidelia_001(A0_431, A1_432, A2_433)
defaultTalkWithMiraudont_001(A0_434, A1_435, A2_436, A3_437)
defaultTalkWithRimomo_001(A0_438, A1_439, A2_440)
defaultTalkWithDadaneja_001(A0_441, A1_442, A2_443)
defaultTalkWithIolaine_001(A0_444, A1_445, A2_446)
defaultTalkWithBloisirant_001(A0_447, A1_448, A2_449)
defaultTalkWithGylbart_001(A0_450, A1_451, A2_452)
defaultTalkWithHonoroit_001(A0_453, A1_454, A2_455)
defaultTalkWithYlessa_001(A0_456, A1_457, A2_458)

defaultTalkWithSwaenhylt_001(A0_465, A1_466, A2_467)
defaultTalkWithMarcette_001(A0_468, A1_469, A2_470)
defaultTalkWithGuildleveClientG_001(A0_471, A1_472, A2_473)
defaultTalkWithGuildleveClientG_002(A0_474, A1_475, A2_476)
defaultTalkWithGuildleveClientG_003(A0_477, A1_478, A2_479)
defaultTalkWithAUBRENARD_100(A0_480, A1_481, A2_482)
defQuest1g0_Bush(A0_483, A1_484, A2_485)
defQuest1g1_Bush(A0_486, A1_487, A2_488)
defaultTalkWithChamberliaux_001(A0_489, A1_490, A2_491)
defaultTalkWithFraemhar_001(A0_492, A1_493, A2_494)
defaultTalkWithXbhowaqi_001(A0_495, A1_496, A2_497)
defaultTalkWithLora_001(A0_498, A1_499, A2_500)
defaultTalkWithWawaramu_001(A0_501, A1_502, A2_503)
defaultTalkWithArnott_001(A0_504, A1_505, A2_506)
defaultTalkWithLhomujuuk_001(A0_507, A1_508, A2_509)
defaultTalkWithSholnoralno_001(A0_510, A1_511, A2_512)
defaultTalkWithTuatkk_001(A0_513, A1_514, A2_515)
defaultTalkWithAruhnsenna_001(A0_516, A1_517, A2_518)
defaultTalkWithMoogle010_001(A0_519, A1_520, A2_521)
defaultTalkWithMoogle002_001(A0_522, A1_523, A2_524)
defaultTalkWithAilith_001(A0_525, A1_526, A2_527)

defaultTalkWithQZamqo_001(A0_543, A1_544, A2_545)
defaultTalkLouisoix_001(A0_546, A1_547, A2_548)
defaultTalkWithRonanKognan_001(A0_549, A1_550, A2_551)
defaultTalkWithRonanKognan_002(A0_552, A1_553, A2_554, A3_555, A4_556)
defaultTalkWithRonanKognan_Hint_00(A0_558, A1_559, A2_560, A3_561)
defaultTalkWithRonanKognan_Hint_01(A0_562, A1_563, A2_564, A3_565)
defaultTalkWithRonanKognan_Hint_02(A0_566, A1_567, A2_568, A3_569)
defaultTalkWithRonanKognan_Hint_03(A0_570, A1_571, A2_572, A3_573)
defaultTalkWithRonanKognan_Hint_04(A0_574, A1_575, A2_576, A3_577)
defaultTalkWithVorsaile_001(A0_578, A1_579, A2_580, A3_581)
defaultTalkCaravanChocoboGri_001(A0_582, A1_583, A2_584)
downTownTalk(A0_585, A1_586, A2_587, A3_588, A4_589, A5_590)
tribeTalk(A0_592, A1_593, A2_594)
bookTalk(A0_595, A1_596, A2_597)
talkIdayCap(A0_598, A1_599, A2_600)
talkIday1(A0_601, A1_602, A2_603)
talkIday2(A0_604, A1_605, A2_606)
defaultTalkWithPukwapika_001(A0_607, A1_608, A2_609)
defaultTalkWithPurumoogle_001(A0_610, A1_611, A2_612)
defaultTalkWithPirimoogle_001(A0_613, A1_614, A2_615)
defaultTalkWithPukumoogle_001(A0_616, A1_617, A2_618)
defaultTalkWithJehantel_001(A0_619, A1_620, A2_621)
defaultTalkWithJehantel_002(A0_622, A1_623, A2_624)
defaultTalkWithPukno_001(A0_625, A1_626, A2_627)
defaultTalkWithPukno_002(A0_628, A1_629, A2_630)
defaultTalkWithRayao_001(A0_631, A1_632, A2_633)
defaultTalkWithRayao_002(A0_634, A1_635, A2_636)
defaultTalkWithMoogleA_001(A0_637, A1_638, A2_639)
defaultTalkWithMoogleA_002(A0_640, A1_641, A2_642)
defaultTalkWithMppgleB_001(A0_643, A1_644, A2_645)
defaultTalkWithMppgleB_002(A0_646, A1_647, A2_648)
defaultTalkWithStewart_001(A0_652, A1_653, A2_654)
defaultTalkWithStewart_002(A0_655, A1_656, A2_657)
defaultTalkWithTrisselle_001(A0_658, A1_659, A2_660)
defaultTalkWithTrisselle_002(A0_661, A1_662, A2_663)
defaultTalkWithInn_Desk(A0_664, A1_665, A2_666)
defaultTalkWithInn_ExitDoor(A0_667, A1_668, A2_669)
defaultTalkWithExit01(A0_670, A1_671, A2_672)
defaultTalkWithLegendBsm_001(A0_673, A1_674, A2_675, A3_676)
defaultTalkWithMarketNpc(A0_678, A1_679, A2_680)
defaultTalkWithHamletGuardGri_001(A0_681, A1_682, A2_683)
--]]
}

function onTalk(player, quest, npc, eventName)

    local npcId = npc:GetActorClassId();
	local clientFunc = defaultTalkFst[npcId];
    
    if (npcId == 1000430) then -- Nonco Menanco
        callClientFunction(player, "delegateEvent", player, quest, clientFunc, 21);
    elseif (npcId == 1001430) then -- Kinnison
        callClientFunction(player, "delegateEvent", player, quest, clientFunc, -1,-1);
    else
        callClientFunction(player, "delegateEvent", player, quest, clientFunc);
    end
    
	player:EndEvent();
end

function IsQuestENPC(player, quest, npc)
	return defaultTalkFst[npc:GetActorClassId()] ~= nil;
end