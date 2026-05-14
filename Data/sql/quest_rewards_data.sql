-- Quest Reward Data Population
-- Updates expReward, gilReward, and item rewards for quests.
-- Covers ~80 sidequests, 19 MSQ, and ~69 Grand Company quests.
-- Run AFTER migration_quest_rewards.sql on existing databases.
-- For fresh installs, this data should be merged into gamedata_quests.sql.
-- GC seal items: Storm Seal=1000201, Serpent Seal=1000202, Flame Seal=1000203.

USE `ffxiv_server`;

-- =============================================
-- COERTHAS SIDEQUESTS (4)
-- =============================================
UPDATE `gamedata_quests` SET `expReward` = 1620, `gilReward` = 0, `itemReward1` = 3010009, `itemReward1Qty` = 12 WHERE `id` = 110706;    -- Counting Sheep (Lv25) — Grilled Dodo x12
UPDATE `gamedata_quests` SET `expReward` = 1620, `gilReward` = 12500 WHERE `id` = 110707; -- A Hypocritical Oath (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0 WHERE `id` = 110819;    -- What Glitters Always Isn't Gold (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0 WHERE `id` = 110708;    -- Blood Price (Lv45)

-- =============================================
-- GRIDANIA SIDEQUESTS (28)
-- =============================================
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 0, `itemReward1` = 8080617, `itemReward1Qty` = 1 WHERE `id` = 110654;     -- Proceed with Caution (Lv10) — Dodoskin Shoes
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 0, `itemReward1` = 8050503, `itemReward1Qty` = 1 WHERE `id` = 110659;     -- The Search for Sicksa (Lv10) — Dodoskin Subligar
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 0, `itemReward1` = 8090402, `itemReward1Qty` = 1 WHERE `id` = 110655;     -- Playing with Fire (Lv15) — Rope Belt
UPDATE `gamedata_quests` SET `expReward` = 1890, `gilReward` = 0, `itemReward1` = 8090405, `itemReward1Qty` = 1 WHERE `id` = 110656;    -- A Well-Balanced Diet (Lv25) — Velveteen Rope Belt
UPDATE `gamedata_quests` SET `expReward` = 3040, `gilReward` = 0, `itemReward1` = 8031822, `itemReward1Qty` = 1 WHERE `id` = 110662;    -- Say it with Wolf Tails (Lv30) — Linen Cowl
UPDATE `gamedata_quests` SET `expReward` = 2660, `gilReward` = 0, `itemReward1` = 8080517, `itemReward1Qty` = 1 WHERE `id` = 110658;    -- The Penultimate Prank (Lv30) — Boarskin Crakows
UPDATE `gamedata_quests` SET `expReward` = 3360, `gilReward` = 0, `itemReward1` = 8050125, `itemReward1Qty` = 1 WHERE `id` = 110660;    -- The Ultimate Prank (Lv35) — Linen Trousers
UPDATE `gamedata_quests` SET `expReward` = 200, `gilReward` = 0, `itemReward1` = 8070807, `itemReward1Qty` = 1 WHERE `id` = 110674;     -- Seeing the Seers (Lv5) — Sheepskin Mitts
UPDATE `gamedata_quests` SET `expReward` = 1170, `gilReward` = 10000, `itemReward1` = 8030821, `itemReward1Qty` = 1 WHERE `id` = 110666; -- Stone Deaf (Lv10) — Cotton Acton
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 2500, `itemReward1` = 8031514, `itemReward1Qty` = 1 WHERE `id` = 110762;  -- In the Name of Science (Lv10) — Dodoskin Harness
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 0, `itemReward1` = 8012011, `itemReward1Qty` = 1, `itemReward2` = 3010201, `itemReward2Qty` = 12 WHERE `id` = 110763; -- Hearing Confession (Lv10) — Straw Hat + Flatbread x12
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 7500, `itemReward1` = 8071201, `itemReward1Qty` = 1 WHERE `id` = 110735;  -- Scrubbing the Soul (Lv15) — Dodoskin Ringbands
UPDATE `gamedata_quests` SET `expReward` = 1750, `gilReward` = 0, `itemReward1` = 3920003, `itemReward1Qty` = 100 WHERE `id` = 110667;  -- Hunting the Hunters (Lv24) — Steel Arrow x100
UPDATE `gamedata_quests` SET `expReward` = 2660, `gilReward` = 0, `itemReward1` = 1000013, `itemReward1Qty` = 20 WHERE `id` = 110663;   -- Embarrassing Excerpts (Lv30) — Lightning Crystal x20
UPDATE `gamedata_quests` SET `expReward` = 2660, `gilReward` = 0, `itemReward1` = 3910305, `itemReward1Qty` = 12 WHERE `id` = 110664;   -- A Forbidden Love (Lv30) — Bronze Azagai x12
UPDATE `gamedata_quests` SET `expReward` = 4260, `gilReward` = 0, `itemReward1` = 1000012, `itemReward1Qty` = 20 WHERE `id` = 110665;   -- Last Respects (Lv40) — Earth Crystal x20
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 5000, `itemReward1` = 8011815, `itemReward1Qty` = 1 WHERE `id` = 110765;  -- Spores on the Brain (Lv11) — Cotton Scarf
UPDATE `gamedata_quests` SET `expReward` = 960, `gilReward` = 0, `itemReward1` = 8031227, `itemReward1Qty` = 1 WHERE `id` = 110764;     -- A Bitter Oil to Swallow (Lv17) — Cotton Doublet Vest
UPDATE `gamedata_quests` SET `expReward` = 2700, `gilReward` = 14000 WHERE `id` = 110668; -- To Deskunk a Beer (Lv31)
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 0, `itemReward1` = 8031121, `itemReward1Qty` = 1 WHERE `id` = 110737;     -- A Slippery Stone (Lv15) — Cotton Tabard
UPDATE `gamedata_quests` SET `expReward` = 1400, `gilReward` = 10000 WHERE `id` = 110736; -- Disorganized Crime (Lv21)
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0 WHERE `id` = 110627;    -- Ifrit Bleeds, We Can Kill It (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0 WHERE `id` = 110816;    -- A Feast of Fools (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0 WHERE `id` = 110867;    -- Taming the Tempest (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 4400, `gilReward` = 0 WHERE `id` = 110868;    -- A Relic Reborn (Lv50) — Relic weapon handled by script
UPDATE `gamedata_quests` SET `expReward` = 2430, `gilReward` = 0 WHERE `id` = 110669;    -- Losing One's Thread (Lv10) — Undyed Hempen Cloth x10 (item not in DB)
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0, `itemReward1` = 9050074, `itemReward1Qty` = 1, `itemReward2` = 9050073, `itemReward2Qty` = 1, `itemReward3` = 9050070, `itemReward3Qty` = 1 WHERE `id` = 110869; -- Living on a Prayer (Lv45) — Althyk's+Azeyma's+Byregot's Ring (3 of 12; rest need script)
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0, `itemReward1` = 9030063, `itemReward1Qty` = 1 WHERE `id` = 110870;    -- The Raven, Nevermore (Lv45) — White Ravens

-- =============================================
-- LIMSA LOMINSA SIDEQUESTS (21)
-- =============================================
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 0, `itemReward1` = 8011815, `itemReward1Qty` = 1 WHERE `id` = 110634;     -- Bridging the Gap (Lv10) — Cotton Scarf
UPDATE `gamedata_quests` SET `expReward` = 1440, `gilReward` = 0, `itemReward1` = 8070514, `itemReward1Qty` = 1 WHERE `id` = 110633;    -- Assessing the Damage (Lv20) — Fingerless Leather Gloves
UPDATE `gamedata_quests` SET `expReward` = 1440, `gilReward` = 0, `itemReward1` = 8071015, `itemReward1Qty` = 1 WHERE `id` = 110638;    -- Till Death Do Us Part (Lv20) — Dodoskin Wristguards
UPDATE `gamedata_quests` SET `expReward` = 1440, `gilReward` = 0, `itemReward1` = 8090704, `itemReward1Qty` = 1 WHERE `id` = 110639;    -- Beryl Overboard (Lv20) — Tarred Velveteen Longsash
UPDATE `gamedata_quests` SET `expReward` = 3040, `gilReward` = 0, `itemReward1` = 8030320, `itemReward1Qty` = 1 WHERE `id` = 110640;    -- Have You Seen My Son (Lv30) — Steel Chainmail
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0, `itemReward1` = 8050130, `itemReward1Qty` = 1 WHERE `id` = 110636;    -- Revenge on the Reavers (Lv45) — Felt Trousers
UPDATE `gamedata_quests` SET `expReward` = 200, `gilReward` = 0, `itemReward1` = 8011515, `itemReward1Qty` = 1 WHERE `id` = 110653;     -- The Tug of the Whorl (Lv5) — Dodoskin Pot Helm
UPDATE `gamedata_quests` SET `expReward` = 200, `gilReward` = 2500, `itemReward1` = 8030819, `itemReward1Qty` = 1 WHERE `id` = 110771;  -- Trading Tongueflaps (Lv5) — Hempen Acton
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 7500, `itemReward1` = 8090402, `itemReward1Qty` = 1 WHERE `id` = 110744;  -- Winds of Change (Lv15) — Rope Belt
UPDATE `gamedata_quests` SET `expReward` = 1280, `gilReward` = 0, `itemReward1` = 8030920, `itemReward1Qty` = 1 WHERE `id` = 110644;    -- Moonstruck (Lv20) — Leather Jacket
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 5000, `itemReward1` = 8050609, `itemReward1Qty` = 1 WHERE `id` = 110772;  -- Letting Out Orion's Belt (Lv10) — Hempen Kecks
UPDATE `gamedata_quests` SET `expReward` = 1120, `gilReward` = 10000, `itemReward1` = 8080224, `itemReward1Qty` = 1 WHERE `id` = 110641; -- Food for Thought (Lv20) — Padded Sheepskin Duckbills
UPDATE `gamedata_quests` SET `expReward` = 1120, `gilReward` = 0, `itemReward1` = 8010523, `itemReward1Qty` = 1, `itemReward2` = 3010103, `itemReward2Qty` = 12 WHERE `id` = 110642; -- Seashells by the Seashore (Lv20) — Cotton Coif + Boiled Crayfish x12
UPDATE `gamedata_quests` SET `expReward` = 1890, `gilReward` = 0, `itemReward1` = 3940007, `itemReward1Qty` = 50 WHERE `id` = 110643;   -- Fishing for Answers (Lv25) — Crab Ball x50
UPDATE `gamedata_quests` SET `expReward` = 840, `gilReward` = 0, `itemReward1` = 8011517, `itemReward1Qty` = 1 WHERE `id` = 110773;     -- Sour Grapes (Lv17) — Leather Pot Helm
UPDATE `gamedata_quests` SET `expReward` = 1400, `gilReward` = 10000 WHERE `id` = 110745; -- Shot Through the Heart (Lv21)
UPDATE `gamedata_quests` SET `expReward` = 3100, `gilReward` = 0, `itemReward1` = 10013004, `itemReward1Qty` = 2 WHERE `id` = 110774;   -- Sniffing Out a Profit (Lv37) — Grade 4 Dark Matter x2
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 0, `itemReward1` = 8031121, `itemReward1Qty` = 1 WHERE `id` = 110746;     -- What a Pirate Wants (Lv15) — Cotton Tabard
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 0, `itemReward1` = 8051118, `itemReward1Qty` = 1 WHERE `id` = 110810;     -- Call of Booty (Lv15) — Cotton Shepherd's Slops
UPDATE `gamedata_quests` SET `expReward` = 840, `gilReward` = 0 WHERE `id` = 110646;     -- A Misty Past (Lv17)
UPDATE `gamedata_quests` SET `expReward` = 4800, `gilReward` = 0, `itemReward1` = 10004114, `itemReward1Qty` = 1 WHERE `id` = 110648;   -- Carving a Name (Lv47) — Turquoise

-- =============================================
-- UL'DAH SIDEQUESTS (27)
-- =============================================
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 0, `itemReward1` = 8031915, `itemReward1Qty` = 1 WHERE `id` = 110676;     -- Sleepless in Eorzea (Lv10) — Cotton Shepherd's Tunic
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 0, `itemReward1` = 9040023, `itemReward1Qty` = 1 WHERE `id` = 110680;     -- An Inconvenient Dodo (Lv15) — Brass Gorget
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 0, `itemReward1` = 8031121, `itemReward1Qty` = 1 WHERE `id` = 110681;     -- Besmitten and Besmirched (Lv15) — Cotton Tabard
UPDATE `gamedata_quests` SET `expReward` = 2660, `gilReward` = 0, `itemReward1` = 8010810, `itemReward1Qty` = 1 WHERE `id` = 110679;    -- The Customer Comes First (Lv30) — Mythril Spectacles
UPDATE `gamedata_quests` SET `expReward` = 3360, `gilReward` = 0, `itemReward1` = 9030038, `itemReward1Qty` = 1 WHERE `id` = 110675;    -- A Knock in the Night (Lv35) — Pearl Earrings
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0, `itemReward1` = 8031825, `itemReward1Qty` = 1 WHERE `id` = 110677;    -- Dressed to Be Killed (Lv45) — Woolen Cowl
UPDATE `gamedata_quests` SET `expReward` = 200, `gilReward` = 0, `itemReward1` = 8081118, `itemReward1Qty` = 1 WHERE `id` = 110695;     -- A Call to Arms (Lv5) — Sheepskin Leggings
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 0, `itemReward1` = 8071015, `itemReward1Qty` = 1 WHERE `id` = 110753;     -- Of Archons and Muses (Lv10) — Dodoskin Wristguards
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 5000, `itemReward1` = 8081016, `itemReward1Qty` = 1 WHERE `id` = 110684;  -- Best Flower Ever (Lv10) — Dodoskin Caligae
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 7500, `itemReward1` = 8010703, `itemReward1Qty` = 1 WHERE `id` = 110726;  -- Quid Pro Quo (Lv15) — Ash Mask
UPDATE `gamedata_quests` SET `expReward` = 1440, `gilReward` = 0, `itemReward1` = 8030423, `itemReward1Qty` = 1 WHERE `id` = 110685;    -- The Unheard Horizon (Lv20) — Cotton Dalmatica
UPDATE `gamedata_quests` SET `expReward` = 2170, `gilReward` = 0, `itemReward1` = 3010304, `itemReward1Qty` = 12 WHERE `id` = 110754;   -- Sanguine Studies (Lv27) — Blood Currant Tart x12
UPDATE `gamedata_quests` SET `expReward` = 3180, `gilReward` = 0, `itemReward1` = 3020516, `itemReward1Qty` = 6 WHERE `id` = 110682;    -- Clasping to Hope (Lv34) — Hi-potion of Vitality x6
UPDATE `gamedata_quests` SET `expReward` = 3540, `gilReward` = 0, `itemReward1` = 3020528, `itemReward1Qty` = 6 WHERE `id` = 110683;    -- Traumaturgy (Lv36) — Hi-potion of Piety x6
UPDATE `gamedata_quests` SET `expReward` = 960, `gilReward` = 0, `itemReward1` = 8070809, `itemReward1Qty` = 1 WHERE `id` = 110755;     -- Secrets Unearthed (Lv17) — Leather Mitts
UPDATE `gamedata_quests` SET `expReward` = 1980, `gilReward` = 13000, `itemReward1` = 9030038, `itemReward1Qty` = 1 WHERE `id` = 110756; -- Rustproof (Lv28) — Pearl Earrings
UPDATE `gamedata_quests` SET `expReward` = 2820, `gilReward` = 0, `itemReward1` = 4020006, `itemReward1Qty` = 1 WHERE `id` = 110686;    -- Freedom Isn't Free (Lv32) — Crabshell Hora
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 0, `itemReward1` = 8031121, `itemReward1Qty` = 1 WHERE `id` = 110728;     -- Cutthroat Prices (Lv15) — Cotton Tabard
UPDATE `gamedata_quests` SET `expReward` = 780, `gilReward` = 1000, `itemReward1` = 8081120, `itemReward1Qty` = 1 WHERE `id` = 110811;  -- Risky Business (Lv18) — Leather Leggings
UPDATE `gamedata_quests` SET `expReward` = 780, `gilReward` = 0, `itemReward1` = 2001001, `itemReward1Qty` = 1 WHERE `id` = 110812;     -- Forging the Spirit (Lv18) — Materia Assimilator
UPDATE `gamedata_quests` SET `expReward` = 780, `gilReward` = 0 WHERE `id` = 110813;     -- Joining the Spirit (Lv18) — Fingerprints of the Gods (item not in DB)
UPDATE `gamedata_quests` SET `expReward` = 780, `gilReward` = 0, `itemReward1` = 2001002, `itemReward1Qty` = 1 WHERE `id` = 110814;     -- Waking the Spirit (Lv18) — Materia Melder
UPDATE `gamedata_quests` SET `expReward` = 1401, `gilReward` = 10000 WHERE `id` = 110727; -- There Might Be Blood (Lv21)
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 0 WHERE `id` = 110818;    -- A Light in the Dark (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 0, `itemReward1` = 9010055, `itemReward1Qty` = 1 WHERE `id` = 110690;     -- No Other Dodo Will Do (Lv15) — Dodoskin Wristbands
UPDATE `gamedata_quests` SET `expReward` = 2970, `gilReward` = 0, `itemReward1` = 7010104, `itemReward1Qty` = 1 WHERE `id` = 110687;    -- Ore for an Ore (Lv28) — Iron Sledgehammer
UPDATE `gamedata_quests` SET `expReward` = 5340, `gilReward` = 8000, `itemReward1` = 3020608, `itemReward1Qty` = 20 WHERE `id` = 110734; -- Monster of Maw Most Massive (Lv45) — Magicked Prism (Mythril Eye) x20

-- =============================================
-- MAIN SCENARIO QUESTS — LIMSA LOMINSA (4)
-- =============================================
UPDATE `gamedata_quests` SET `expReward` = 0, `gilReward` = 0, `itemReward1` = 11000001, `itemReward1Qty` = 1 WHERE `id` = 110001;      -- Shapeless Melody (Lv1) — Balloonfish (key item)
UPDATE `gamedata_quests` SET `expReward` = 200, `gilReward` = 6000 WHERE `id` = 110002;   -- Treasures of the Main (Lv1) — + Adventurers' Guild linkpearl (script)
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 15000 WHERE `id` = 110003;  -- Legends Adrift (Lv8)
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 30000 WHERE `id` = 110004;  -- Never the Twain Shall Meet (Lv13) — + Unlocks Parley (script)

-- =============================================
-- MAIN SCENARIO QUESTS — GRIDANIA (4)
-- =============================================
UPDATE `gamedata_quests` SET `expReward` = 0, `gilReward` = 0, `itemReward1` = 11000088, `itemReward1Qty` = 1 WHERE `id` = 110005;      -- Sundered Skies (Lv1) — Treant Vine (key item)
UPDATE `gamedata_quests` SET `expReward` = 200, `gilReward` = 6000 WHERE `id` = 110006;   -- Souls Gone Wild (Lv1) — + Adventurers' Guild linkpearl (script)
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 15000 WHERE `id` = 110007;  -- Whispers in the Wood (Lv8)
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 30000 WHERE `id` = 110008;  -- Beckon of the Elementals (Lv13) — + Unlocks Parley (script)

-- =============================================
-- MAIN SCENARIO QUESTS — UL'DAH (4)
-- =============================================
UPDATE `gamedata_quests` SET `expReward` = 0, `gilReward` = 0, `itemReward1` = 11000089, `itemReward1Qty` = 1 WHERE `id` = 110009;      -- Flowers for All (Lv1) — Velodyna Cosmos (key item)
UPDATE `gamedata_quests` SET `expReward` = 200, `gilReward` = 6000 WHERE `id` = 110010;   -- Court in the Sands (Lv1)
UPDATE `gamedata_quests` SET `expReward` = 300, `gilReward` = 15000 WHERE `id` = 110011;  -- Golden Sacrifices (Lv8)
UPDATE `gamedata_quests` SET `expReward` = 500, `gilReward` = 30000 WHERE `id` = 110012;  -- Calamity Cometh (Lv13) — + Unlocks Parley (script)

-- =============================================
-- MAIN SCENARIO QUESTS — PATH OF THE TWELVE (7)
-- =============================================
UPDATE `gamedata_quests` SET `expReward` = 6500, `gilReward` = 45000 WHERE `id` = 110013;   -- Fade to White (Lv18) — + Path Companion, linkpearl, class quests (script)
UPDATE `gamedata_quests` SET `expReward` = 11000, `gilReward` = 60000 WHERE `id` = 110014;  -- Together We Stand (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 19000, `gilReward` = 90000 WHERE `id` = 110015;  -- Toll of the Warden (Lv30) — + Ashcrown Consortium linkpearl (script)
UPDATE `gamedata_quests` SET `expReward` = 26500, `gilReward` = 102000 WHERE `id` = 110016; -- Forever Taken (Lv34)
UPDATE `gamedata_quests` SET `expReward` = 32500, `gilReward` = 114000 WHERE `id` = 110017; -- Lord Errant (Lv38)
UPDATE `gamedata_quests` SET `expReward` = 39000, `gilReward` = 126000 WHERE `id` = 110018; -- Of Men They Sing (Lv42)
UPDATE `gamedata_quests` SET `expReward` = 46000, `gilReward` = 136000 WHERE `id` = 110019; -- Futures Perfect (Lv46)

-- =============================================
-- NOTES:
-- - "Losing One's Thread" (110669): Undyed Hempen Cloth not found in gamedata_items. Reward skipped.
-- - "Joining the Spirit" (110813): Fingerprints of the Gods not found in gamedata_items. Reward skipped.
-- - "A Relic Reborn" (110868): Relic weapon varies by class; must be handled in quest script.
-- - "Living on a Prayer" (110869): Gives 12 deity rings; only 3 fit in DB slots. Rest need script.
-- - Starter quest key items (Treant Vine, Balloonfish, Velodyna Cosmos) are DummyItems used during subsequent quests.
-- - Linkpearls, Parley unlock, Path Companion, and class quest unlocks are handled by quest scripts, not DB rewards.
-- =============================================

-- =============================================================================
-- GRAND COMPANY QUESTS — IMMORTAL FLAMES (23 quests)
-- Flame Seal = 1000203, Platinum Scales = 2001030, Commemorative Coin = 10011251
-- =============================================================================

-- Main Quests
UPDATE `gamedata_quests` SET `expReward` = 1760 WHERE `id` = 111801;                                                                                      -- Career Opportunities (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1100, `itemReward1` = 1000203, `itemReward1Qty` = 250 WHERE `id` = 111802;                                      -- Kindling a Flame (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1100 WHERE `id` = 111803;                                                                                       -- Burning a Hole in One's Pocket (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1760, `itemReward1` = 1000203, `itemReward1Qty` = 500 WHERE `id` = 111804;                                      -- Arms Race (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000203, `itemReward1Qty` = 300 WHERE `id` = 111805;                                      -- Burning Man (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000203, `itemReward1Qty` = 300 WHERE `id` = 111806;                                      -- Know Your Enemy (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 1080, `itemReward1` = 1000203, `itemReward1Qty` = 1000 WHERE `id` = 111807;                                     -- By Fire Reborn (Lv25) — rank up to Private 3rd
UPDATE `gamedata_quests` SET `expReward` = 3040, `itemReward1` = 1000203, `itemReward1Qty` = 1000 WHERE `id` = 111816;                                     -- It Kills with Fire (Ul'dah) (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4970, `itemReward1` = 1000203, `itemReward1Qty` = 1000 WHERE `id` = 111827;                                     -- Like Father, Like Son (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 1000203, `itemReward1Qty` = 1500 WHERE `id` = 111829;                                     -- Careless Whispers (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000203, `itemReward1Qty` = 2000 WHERE `id` = 111830;                                     -- In for Garuda Wakening (Ul'dah) (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000203, `itemReward1Qty` = 2000 WHERE `id` = 111831;                                     -- Don't Hate the Messenger (Ul'dah) (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6231, `itemReward1` = 1000203, `itemReward1Qty` = 5000 WHERE `id` = 111832;                                     -- United We Stand (Ul'dah) (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 1000203, `itemReward1Qty` = 6000 WHERE `id` = 111833;                                     -- To Kill a Raven (Ul'dah) (Lv45)

-- Rank Advancement Quests
UPDATE `gamedata_quests` SET `expReward` = 6231 WHERE `id` = 111828;                                                                                       -- Gore a Lizard, Hurry (Lv45) — rank up to Sergeant 3rd
UPDATE `gamedata_quests` SET `expReward` = 6600, `itemReward1` = 1000203, `itemReward1Qty` = 5000, `itemReward2` = 2001030, `itemReward2Qty` = 1, `itemReward3` = 10011251, `itemReward3Qty` = 1 WHERE `id` = 111834; -- Mess with the Goat (Lv50) — rank up + Platinum Scales + Commemorative Coin

-- Sidequests
UPDATE `gamedata_quests` SET `expReward` = 2160, `itemReward1` = 1000203, `itemReward1Qty` = 1000 WHERE `id` = 111810;                                    -- Imperial Devices (Ul'dah) (Lv25) — unlocks Toto-Rak
UPDATE `gamedata_quests` SET `expReward` = 6231, `itemReward1` = 1000203, `itemReward1Qty` = 4000 WHERE `id` = 111811;                                     -- Into the Dark (Ul'dah) (Lv45) — unlocks Dzemael Darkhold
UPDATE `gamedata_quests` SET `expReward` = 1891, `itemReward1` = 1000203, `itemReward1Qty` = 300 WHERE `id` = 111818;                                      -- Different Strokes (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 1891, `itemReward1` = 1000203, `itemReward1Qty` = 300 WHERE `id` = 111817;                                      -- Prying Eyes (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 4260, `itemReward1` = 1000203, `itemReward1Qty` = 1000 WHERE `id` = 111819;                                     -- A Weaver and a Mummer (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 4450, `itemReward1` = 1000203, `itemReward1Qty` = 700 WHERE `id` = 111820;                                      -- When Alchemists Cry (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6600, `itemReward1` = 1000203, `itemReward1Qty` = 700 WHERE `id` = 111826;                                      -- Challenge Accepted (Lv50)

-- =============================================================================
-- GRAND COMPANY QUESTS — MAELSTROM (24 quests)
-- Storm Seal = 1000201, Aquamarine Cross = 2001028, Commemorative Coin = 10011251
-- =============================================================================

-- Main Quests
UPDATE `gamedata_quests` SET `expReward` = 1760 WHERE `id` = 111401;                                                                                       -- The Price of Integrity (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1100, `itemReward1` = 1000201, `itemReward1Qty` = 250 WHERE `id` = 111402;                                      -- Testing the Waters (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1100 WHERE `id` = 111403;                                                                                       -- Seals for the Whorl (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1540, `itemReward1` = 1000201, `itemReward1Qty` = 500 WHERE `id` = 111404;                                      -- Engineering Victory (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000201, `itemReward1Qty` = 300 WHERE `id` = 111405;                                      -- An Officer and a Wise Man (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000201, `itemReward1Qty` = 300 WHERE `id` = 111406;                                      -- Ceruleum Shock (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 1080, `itemReward1` = 1000201, `itemReward1Qty` = 1000 WHERE `id` = 111407;                                     -- Till Sea Swallows All (Lv25) — rank up to Private 3rd
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000201, `itemReward1Qty` = 4000 WHERE `id` = 111416;                                     -- It Kills with Fire (Limsa) (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4970, `itemReward1` = 1000201, `itemReward1Qty` = 1000 WHERE `id` = 111427;                                     -- Alive (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 1000201, `itemReward1Qty` = 1500 WHERE `id` = 111429;                                     -- Deus ex Machina (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000201, `itemReward1Qty` = 2000 WHERE `id` = 111430;                                     -- In for Garuda Wakening (Limsa) (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000201, `itemReward1Qty` = 2000 WHERE `id` = 111431;                                     -- Don't Hate the Messenger (Limsa) (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000201, `itemReward1Qty` = 5000 WHERE `id` = 111432;                                     -- United We Stand (Limsa) (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 1000201, `itemReward1Qty` = 6000 WHERE `id` = 111433;                                     -- To Kill a Raven (Limsa) (Lv45)

-- Rank Advancement Quests
UPDATE `gamedata_quests` SET `expReward` = 6230 WHERE `id` = 111428;                                                                                       -- The Weakest Link (Lv45) — rank up to Sergeant 3rd
UPDATE `gamedata_quests` SET `expReward` = 6600, `itemReward1` = 1000201, `itemReward1Qty` = 5000, `itemReward2` = 2001028, `itemReward2Qty` = 1, `itemReward3` = 10011251, `itemReward3Qty` = 1 WHERE `id` = 111434; -- Patrol, Interrupted (Lv50) — rank up + Aquamarine Cross + Commemorative Coin

-- Sidequests
UPDATE `gamedata_quests` SET `expReward` = 2160, `itemReward1` = 1000201, `itemReward1Qty` = 1000 WHERE `id` = 111410;                                    -- Imperial Devices (Limsa) (Lv25) — unlocks Toto-Rak
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000201, `itemReward1Qty` = 4000 WHERE `id` = 111411;                                     -- Into the Dark (Limsa) (Lv45) — unlocks Dzemael Darkhold
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000201, `itemReward1Qty` = 300 WHERE `id` = 111418;                                      -- Saving the Stead Instead (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000201, `itemReward1Qty` = 300 WHERE `id` = 111417;                                      -- The Cove (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 4260, `itemReward1` = 1000201, `itemReward1Qty` = 1000 WHERE `id` = 111419;                                     -- It's a Piece of Cake to Bake a Poison Cake (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 4450, `itemReward1` = 1000201, `itemReward1Qty` = 700 WHERE `id` = 111420;                                      -- Kobold and the Beautiful (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6600, `itemReward1` = 1000201, `itemReward1Qty` = 700 WHERE `id` = 111426;                                      -- Oil Crisis (Lv50)

-- =============================================================================
-- GRAND COMPANY QUESTS — ORDER OF THE TWIN ADDER (23 quests)
-- Serpent Seal = 1000202, Emerald Bough = 2001029, Commemorative Coin = 10011251
-- =============================================================================

-- Main Quests
UPDATE `gamedata_quests` SET `expReward` = 1540 WHERE `id` = 111601;                                                                                       -- Breaking the Seals (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1100, `itemReward1` = 1000202, `itemReward1Qty` = 250 WHERE `id` = 111602;                                      -- Why Did It Have to Be Snakes (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1100 WHERE `id` = 111603;                                                                                       -- Adder's Nest Egg (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1540, `itemReward1` = 1000202, `itemReward1Qty` = 500 WHERE `id` = 111604;                                      -- The Mail Must Get Through (Lv22)
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000202, `itemReward1Qty` = 300 WHERE `id` = 111605;                                      -- Their Finest Hour (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000202, `itemReward1Qty` = 300 WHERE `id` = 111606;                                      -- Appetite for Destruction (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 1080, `itemReward1` = 1000202, `itemReward1Qty` = 1000 WHERE `id` = 111607;                                     -- Serenity, Purity, Sanctity (Lv25) — rank up to Private 3rd
UPDATE `gamedata_quests` SET `expReward` = 3040, `itemReward1` = 1000202, `itemReward1Qty` = 1000 WHERE `id` = 111616;                                     -- It Kills with Fire (Gridania) (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4970, `itemReward1` = 1000202, `itemReward1Qty` = 1000 WHERE `id` = 111627;                                     -- Two Vans are Better than One (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 1000202, `itemReward1Qty` = 1500 WHERE `id` = 111629;                                     -- Shadow of the Raven (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000202, `itemReward1Qty` = 2000 WHERE `id` = 111630;                                     -- In for Garuda Wakening (Gridania) (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000202, `itemReward1Qty` = 2000 WHERE `id` = 111631;                                     -- Don't Hate the Messenger (Gridania) (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000202, `itemReward1Qty` = 5000 WHERE `id` = 111632;                                     -- United We Stand (Gridania) (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 1000202, `itemReward1Qty` = 6000 WHERE `id` = 111633;                                     -- To Kill a Raven (Gridania) (Lv45)

-- Rank Advancement Quests
UPDATE `gamedata_quests` SET `expReward` = 6230 WHERE `id` = 111628;                                                                                       -- You Don't Have the Rite (Lv45) — rank up to Sergeant 3rd
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000202, `itemReward1Qty` = 5000, `itemReward2` = 2001029, `itemReward2Qty` = 1, `itemReward3` = 10011251, `itemReward3Qty` = 1 WHERE `id` = 111634; -- Cure for the Common Pox (Lv50) — rank up + Emerald Bough + Commemorative Coin

-- Sidequests
UPDATE `gamedata_quests` SET `expReward` = 2160, `itemReward1` = 1000202, `itemReward1Qty` = 1000 WHERE `id` = 111610;                                    -- Imperial Devices (Gridania) (Lv25) — unlocks Toto-Rak
UPDATE `gamedata_quests` SET `expReward` = 6230, `itemReward1` = 1000202, `itemReward1Qty` = 4000 WHERE `id` = 111611;                                     -- Into the Dark (Gridania) (Lv45) — unlocks Dzemael Darkhold
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000202, `itemReward1Qty` = 300 WHERE `id` = 111618;                                      -- The Pen Is Mightier Than the Spear (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 1890, `itemReward1` = 1000202, `itemReward1Qty` = 300 WHERE `id` = 111617;                                      -- Eternal Recurrence (Lv25)
UPDATE `gamedata_quests` SET `expReward` = 4260, `itemReward1` = 1000202, `itemReward1Qty` = 1000 WHERE `id` = 111619;                                     -- Woes of the Botanist (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 4450, `itemReward1` = 1000202, `itemReward1Qty` = 700 WHERE `id` = 111620;                                      -- Gone with the Wind (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 6600, `itemReward1` = 1000202, `itemReward1Qty` = 700 WHERE `id` = 111626;                                      -- A Taste for Death (Lv50)

-- =============================================
-- GC QUEST NOTES:
-- - Rank advancement (promotion) is handled by quest scripts, not DB. DB only stores EXP/seal/item rewards.
-- - Dungeon unlocks (Toto-Rak, Dzemael Darkhold) are handled by quest scripts.
-- - "When Alchemists Cry" / "Kobold and the Beautiful" / "Gone with the Wind" give seals matching the quest's company.
-- - Maelstrom "It Kills with Fire" has higher rewards (4000 seals, 6230 EXP) than IF/TA versions (1000 seals, 3040 EXP).
-- - GC seal items: Storm Seal=1000201, Serpent Seal=1000202, Flame Seal=1000203.
-- - GC rank-up items: Aquamarine Cross=2001028 (Maelstrom), Emerald Bough=2001029 (Twin Adder), Platinum Scales=2001030 (IF).
-- =============================================

-- =============================================================================
-- BATTLE CLASS QUESTS (21 quests — 7 classes x 3 quests each)
-- Lv20 quests give a weapon + linkpearl (linkpearl handled by script).
-- =============================================================================

-- Pugilist
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 4020208, `itemReward1Qty` = 1 WHERE `id` = 110060;   -- The House Always Wins (Lv20) — Spiked Knuckles
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110061;                                                    -- Here There Be Pirates (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110062;                                                    -- Two Sides to Every Chip (Lv36)

-- Gladiator
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 4030203, `itemReward1Qty` = 1 WHERE `id` = 110080;   -- All Bark and No Bite (Lv20) — Iron Shortsword
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110081;                                                    -- Unalienable Rights (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110082;                                                    -- Thrill of the Fight (Lv36)

-- Marauder
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 4040405, `itemReward1Qty` = 1 WHERE `id` = 110100;   -- Bloody Baptism (Lv20) — Iron Bill
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110101;                                                    -- Two-man Crew (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110102;                                                    -- Captain's Orders (Lv36)

-- Archer
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 4070011, `itemReward1Qty` = 1 WHERE `id` = 110160;   -- Filling the Quiver (Lv20) — Elm Velocity Bow
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110161;                                                    -- The Foreboding Forest (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110162;                                                    -- There Can Be Only One (Lv36)

-- Lancer
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 4080406, `itemReward1Qty` = 1 WHERE `id` = 110180;   -- A Wailing Welcome (Lv20) — Iron Guisarme
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110181;                                                    -- Culture Shock (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110182;                                                    -- Necessary Evils (Lv36)

-- Thaumaturge
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 5020210, `itemReward1Qty` = 1 WHERE `id` = 110240;   -- The Big Payback (Lv20) — Wind Brand
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110241;                                                    -- Revelry in Rivalry (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110242;                                                    -- Law and the Order (Lv36)

-- Conjurer
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 5030306, `itemReward1Qty` = 1 WHERE `id` = 110260;   -- Dendrological Duties (Lv20) — Yew Radical
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110261;                                                    -- Good Knight, Sweet Dreams (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110262;                                                    -- The Call of Nature (Lv36)

-- =============================================
-- CLASS QUEST NOTES:
-- - Lv20 class quests also give a guild linkpearl; handled by quest script, not DB.
-- - All 7 classes follow the same EXP/gil pattern: 1760/20k, 3420/30k, 4720/36k.
-- =============================================

-- =============================================
-- JOB QUESTS (42 quests: 7 jobs x 6 quests each)
-- Soul Stones: PLD=2000201, MNK=2000202, WAR=2000203, DRG=2000204, BRD=2000205, WHM=2000206, BLM=2000207
-- Keeper's Hymn: 3020410
-- AF Gear Sets: Gallant (PLD), Temple (MNK), Fighter's (WAR), Drachen (DRG), Choral (BRD), Healer's (WHM), Wizard's (BLM)
-- NOTE: Lv45 AF gear quests give all 4 pieces via itemReward1-4.
-- NOTE: Abilities are always granted by quest script, not DB.
-- NOTE: No gil rewards for job quests.
-- =============================================

-- Warrior (111201-111206)
UPDATE `gamedata_quests` SET `expReward` = 2660, `itemReward1` = 2000203, `itemReward1Qty` = 1, `itemReward2` = 3020410, `itemReward2Qty` = 1 WHERE `id` = 111201;  -- Pride and Duty (Lv30) — Soul of the Warrior + Keeper's Hymn
UPDATE `gamedata_quests` SET `expReward` = 3360 WHERE `id` = 111202;                                                                                                  -- Embracing the Beast (Lv35)
UPDATE `gamedata_quests` SET `expReward` = 4260 WHERE `id` = 111203;                                                                                                  -- Curious Gorge Goes to the Bazaar (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 8013503, `itemReward1Qty` = 1, `itemReward2` = 8051403, `itemReward2Qty` = 1, `itemReward3` = 8071403, `itemReward3Qty` = 1, `itemReward4` = 8081803, `itemReward4Qty` = 1 WHERE `id` = 111204;  -- Looking the Part (Lv45) — Fighter's Burgeonet + Breeches + Gauntlets + Jackboots
UPDATE `gamedata_quests` SET `expReward` = 5340 WHERE `id` = 111205;                                                                                                  -- Proof is in the Pudding (Lv45)
UPDATE `gamedata_quests` SET `itemReward1` = 8032703, `itemReward1Qty` = 1 WHERE `id` = 111206;                                                                        -- How to Quit You (Lv50) — Fighter's Cuirass

-- Monk (111221-111226)
UPDATE `gamedata_quests` SET `expReward` = 2660, `itemReward1` = 2000202, `itemReward1Qty` = 1, `itemReward2` = 3020410, `itemReward2Qty` = 1 WHERE `id` = 111221;  -- Brother from Another Mother (Lv30) — Soul of the Monk + Keeper's Hymn
UPDATE `gamedata_quests` SET `expReward` = 3360 WHERE `id` = 111222;                                                                                                  -- Insulted Intelligence (Lv35)
UPDATE `gamedata_quests` SET `expReward` = 4260 WHERE `id` = 111223;                                                                                                  -- The Pursuit of Power (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340 WHERE `id` = 111224;                                                                                                  -- Good Vibrations (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 8013502, `itemReward1Qty` = 1, `itemReward2` = 8051402, `itemReward2Qty` = 1, `itemReward3` = 8071402, `itemReward3Qty` = 1, `itemReward4` = 8081802, `itemReward4Qty` = 1 WHERE `id` = 111225;  -- Five Easy Pieces (Lv45) — Temple Circlet + Gaskins + Gloves + Boots
UPDATE `gamedata_quests` SET `itemReward1` = 8032702, `itemReward1Qty` = 1 WHERE `id` = 111226;                                                                        -- Return of the King...of Ruin (Lv50) — Temple Cyclas

-- White Mage (111241-111246)
UPDATE `gamedata_quests` SET `expReward` = 2660, `itemReward1` = 2000206, `itemReward1Qty` = 1, `itemReward2` = 3020410, `itemReward2Qty` = 1 WHERE `id` = 111241;  -- Seeds of Initiative (Lv30) — Soul of the White Mage + Keeper's Hymn
UPDATE `gamedata_quests` SET `expReward` = 3360 WHERE `id` = 111242;                                                                                                  -- When Sheep Attack (Lv35)
UPDATE `gamedata_quests` SET `expReward` = 4260 WHERE `id` = 111243;                                                                                                  -- Lost in Rage (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340 WHERE `id` = 111244;                                                                                                  -- The Wheel of Disaster (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 8013506, `itemReward1Qty` = 1, `itemReward2` = 8051406, `itemReward2Qty` = 1, `itemReward3` = 8071406, `itemReward3Qty` = 1, `itemReward4` = 8081806, `itemReward4Qty` = 1 WHERE `id` = 111245;  -- In Search of Succor (Lv45) — Healer's Circlet + Culottes + Gloves + Boots
UPDATE `gamedata_quests` SET `itemReward1` = 8032706, `itemReward1Qty` = 1 WHERE `id` = 111246;                                                                        -- The Chorus of Cataclysm (Lv50) — Healer's Robe

-- Black Mage (111261-111266)
UPDATE `gamedata_quests` SET `expReward` = 2660, `itemReward1` = 2000207, `itemReward1Qty` = 1, `itemReward2` = 3020410, `itemReward2Qty` = 1 WHERE `id` = 111261;  -- Hearing Voices (Lv30) — Soul of the Black Mage + Keeper's Hymn
UPDATE `gamedata_quests` SET `expReward` = 3360 WHERE `id` = 111262;                                                                                                  -- A Time to Kill (Lv35)
UPDATE `gamedata_quests` SET `expReward` = 4260 WHERE `id` = 111263;                                                                                                  -- International Relations (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340 WHERE `id` = 111264;                                                                                                  -- The Voidgate Breathes Gloomy (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 8013507, `itemReward1Qty` = 1, `itemReward2` = 8051407, `itemReward2Qty` = 1, `itemReward3` = 8071407, `itemReward3Qty` = 1, `itemReward4` = 8081807, `itemReward4Qty` = 1 WHERE `id` = 111265;  -- Gearing Up (Lv45) — Wizard's Petasos + Tonban + Gloves + Crakows
UPDATE `gamedata_quests` SET `itemReward1` = 8032707, `itemReward1Qty` = 1 WHERE `id` = 111266;                                                                        -- Always Bet on Black (Lv50) — Wizard's Coat

-- Paladin (111281-111286)
UPDATE `gamedata_quests` SET `expReward` = 2660, `itemReward1` = 2000201, `itemReward1Qty` = 1, `itemReward2` = 3020410, `itemReward2Qty` = 1 WHERE `id` = 111281;  -- Paladin's Pledge (Lv30) — Soul of the Paladin + Keeper's Hymn
UPDATE `gamedata_quests` SET `expReward` = 3360 WHERE `id` = 111282;                                                                                                  -- Honor Lost (Lv35)
UPDATE `gamedata_quests` SET `expReward` = 4260 WHERE `id` = 111283;                                                                                                  -- Power Struggles (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 8013501, `itemReward1Qty` = 1, `itemReward2` = 8051401, `itemReward2Qty` = 1, `itemReward3` = 8071401, `itemReward3Qty` = 1, `itemReward4` = 8081801, `itemReward4Qty` = 1 WHERE `id` = 111284;  -- Poisoned Hearts (Lv45) — Gallant Coronet + Cuisses + Gauntlets + Sollerets
UPDATE `gamedata_quests` SET `expReward` = 5340 WHERE `id` = 111285;                                                                                                  -- Parley on High Ground (Lv45)
UPDATE `gamedata_quests` SET `itemReward1` = 8032701, `itemReward1Qty` = 1 WHERE `id` = 111286;                                                                        -- Keeping the Oath (Lv50) — Gallant Surcoat

-- Bard (111301-111306)
UPDATE `gamedata_quests` SET `expReward` = 2660, `itemReward1` = 2000205, `itemReward1Qty` = 1, `itemReward2` = 3020410, `itemReward2Qty` = 1 WHERE `id` = 111301;  -- A Song of Bards and Bowmen (Lv30) — Soul of the Bard + Keeper's Hymn
UPDATE `gamedata_quests` SET `expReward` = 3360 WHERE `id` = 111302;                                                                                                  -- The Archer's Anthem (Lv35)
UPDATE `gamedata_quests` SET `expReward` = 4260 WHERE `id` = 111303;                                                                                                  -- Bard's-eye View (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340 WHERE `id` = 111304;                                                                                                  -- Doing It the Bard Way (Lv45)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 8013505, `itemReward1Qty` = 1, `itemReward2` = 8051405, `itemReward2Qty` = 1, `itemReward3` = 8071405, `itemReward3Qty` = 1, `itemReward4` = 8081805, `itemReward4Qty` = 1 WHERE `id` = 111305;  -- Pieces of the Past (Lv45) — Choral Chapeau + Tights + Ringbands + Sandals
UPDATE `gamedata_quests` SET `itemReward1` = 8032705, `itemReward1Qty` = 1 WHERE `id` = 111306;                                                                        -- Requiem for the Fallen (Lv50) — Choral Shirt

-- Dragoon (111321-111326)
UPDATE `gamedata_quests` SET `expReward` = 2660, `itemReward1` = 2000204, `itemReward1Qty` = 1, `itemReward2` = 3020410, `itemReward2Qty` = 1 WHERE `id` = 111321;  -- Eye of the Dragon (Lv30) — Soul of the Dragoon + Keeper's Hymn
UPDATE `gamedata_quests` SET `expReward` = 3360 WHERE `id` = 111322;                                                                                                  -- Lance of Fury (Lv35)
UPDATE `gamedata_quests` SET `expReward` = 4260 WHERE `id` = 111323;                                                                                                  -- Unfading Scars (Lv40)
UPDATE `gamedata_quests` SET `expReward` = 5340, `itemReward1` = 8013504, `itemReward1Qty` = 1, `itemReward2` = 8051404, `itemReward2Qty` = 1, `itemReward3` = 8071404, `itemReward3Qty` = 1, `itemReward4` = 8081804, `itemReward4Qty` = 1 WHERE `id` = 111324;  -- Double Dragoon (Lv45) — Drachen Armet + Breeches + Gauntlets + Greaves
UPDATE `gamedata_quests` SET `expReward` = 5340 WHERE `id` = 111325;                                                                                                  -- Fatal Seduction (Lv45)
UPDATE `gamedata_quests` SET `itemReward1` = 8032704, `itemReward1Qty` = 1 WHERE `id` = 111326;                                                                        -- Into the Dragon's Maw (Lv50) — Drachen Mail

-- =============================================
-- JOB QUEST NOTES:
-- - Lv30 quests grant soul stone + Keeper's Hymn + first job ability (script).
-- - Lv35/40/45 ability-only quests grant EXP + ability (script).
-- - Lv45 AF gear quests give all 4 pieces via DB (head/legs/hands/feet in itemReward1-4).
-- - Lv50 quests give body piece + capstone ability (script). No EXP at level cap.
-- - DRG/PLD/WAR get AF gear on quest 4, ability on quest 5.
-- - BRD/BLM/MNK/WHM get ability on quest 4, AF gear on quest 5.
-- =============================================

-- =============================================
-- CRAFTING CLASS QUESTS (Disciplines of the Hand)
-- 8 classes x 3 quests each = 24 quests
-- Same EXP/gil pattern as battle classes: Lv20 (1760/20000 + tool), Lv30 (3420/30000), Lv36 (4720/36000)
-- Lv20 quests also give a guild linkpearl; handled by quest script, not DB.
-- BSM/ARM share the same quest chain (110320-110322); Lv20 gives both tools.
-- =============================================

-- Carpenter
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 6010011, `itemReward1Qty` = 1 WHERE `id` = 110300;   -- The Mouths of Babes (Lv20) — Bas-relief Iron Saw
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110301;                                                    -- Hide and Seek Shenanigans (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110302;                                                    -- Spanning the Spectrum (Lv36)

-- Blacksmith / Armorer (shared quests)
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 6020009, `itemReward1Qty` = 1, `itemReward2` = 6030012, `itemReward2Qty` = 1 WHERE `id` = 110320;  -- An Ear for Quality (Lv20) — Crowsbeak Hammer + Iron Raising Hammer
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110321;                                                    -- Song of the Sirens (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110322;                                                    -- The Sound of Silence (Lv36)

-- Goldsmith
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 6040012, `itemReward1Qty` = 1 WHERE `id` = 110360;   -- She Walks in Beauty (Lv20) — Iron Ornamental Hammer
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110361;                                                    -- F'lhaminn's Flower (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110362;                                                    -- Struck Through the Heart (Lv36)

-- Leatherworker
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 6050011, `itemReward1Qty` = 1 WHERE `id` = 110380;   -- The Silent Partners (Lv20) — Iron Round Knife
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110381;                                                    -- Design Imposters (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110382;                                                    -- Head of the Class (Lv36)

-- Weaver
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 6060010, `itemReward1Qty` = 1 WHERE `id` = 110400;   -- Hoodwinked (Lv20) — Brass Needle
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110401;                                                    -- Dance the Night Away (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110402;                                                    -- A Fruitful Murder (Lv36)

-- Alchemist
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 6070011, `itemReward1Qty` = 1 WHERE `id` = 110420;   -- Sleep, Cousin of Death (Lv20) — Iron Alembic
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110421;                                                    -- The Boy and the Dragon Gay (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110422;                                                    -- Dream On, Dream Away (Lv36)

-- Culinarian
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 6080011, `itemReward1Qty` = 1 WHERE `id` = 110440;   -- Showdown (Lv20) — Iron Frypan
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110441;                                                    -- Mystery of the Gastronome Gone Home (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110442;                                                    -- Something in the Soup (Lv36)

-- =============================================
-- GATHERING CLASS QUESTS (Disciplines of the Land)
-- 3 classes x 3 quests each = 9 quests
-- Same EXP/gil pattern: Lv20 (1760/20000 + tool), Lv30 (3420/30000), Lv36 (4720/36000)
-- Lv20 quests also give a guild linkpearl; handled by quest script, not DB.
-- Fisher Lv30 gives Star-Spangled Subligar as bonus item.
-- =============================================

-- Miner
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 7010010, `itemReward1Qty` = 1 WHERE `id` = 110460;   -- A Piece of History (Lv20) — Iron Dolabra
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110461;                                                    -- Little Saboteurs (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110462;                                                    -- Runaway Little Girl (Lv36)

-- Botanist
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 7020011, `itemReward1Qty` = 1 WHERE `id` = 110480;   -- Gridanian Roots (Lv20) — Brass Hatchet
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000 WHERE `id` = 110481;                                                    -- The Grass is Always Greener (Lv30)
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110482;                                                    -- A Moogle Bouquet (Lv36)

-- Fisher
UPDATE `gamedata_quests` SET `expReward` = 1760, `gilReward` = 20000, `itemReward1` = 7030011, `itemReward1Qty` = 1 WHERE `id` = 110500;   -- To Fight a Fishback (Lv20) — Yew Fishing Rod
UPDATE `gamedata_quests` SET `expReward` = 3420, `gilReward` = 30000, `itemReward1` = 8050521, `itemReward1Qty` = 1 WHERE `id` = 110501;   -- The Beast of the Barrel (Lv30) — Star-Spangled Subligar
UPDATE `gamedata_quests` SET `expReward` = 4720, `gilReward` = 36000 WHERE `id` = 110502;                                                    -- Polishing the Mast (Lv36)

-- =============================================
-- SEASONAL EVENT QUESTS (12 quests)
-- No EXP/gil for seasonal quests (cosmetic item rewards only).
-- Quests giving 5+ items: first 4 in DB, rest need quest script.
-- =============================================

-- Hatching-tide (2011) — Gospel quests (1 item each)
UPDATE `gamedata_quests` SET `itemReward1` = 8012801, `itemReward1Qty` = 1 WHERE `id` = 110794;  -- The Dreamer's Gospel (Gridania) — Pristine Egg Cap
UPDATE `gamedata_quests` SET `itemReward1` = 8012801, `itemReward1Qty` = 1 WHERE `id` = 110804;  -- The Dreamer's Gospel (Limsa Lominsa) — Pristine Egg Cap
UPDATE `gamedata_quests` SET `itemReward1` = 8012801, `itemReward1Qty` = 1 WHERE `id` = 110789;  -- The Dreamer's Gospel (Ul'dah) — Pristine Egg Cap

-- Hatching-tide (2011) — Dilemma quests (5 items, 4 in DB) [script: Chocobo Egg Cap 8012805]
UPDATE `gamedata_quests` SET `itemReward1` = 8012801, `itemReward1Qty` = 1, `itemReward2` = 8012802, `itemReward2Qty` = 1, `itemReward3` = 8012803, `itemReward3Qty` = 1, `itemReward4` = 8012804, `itemReward4Qty` = 1 WHERE `id` = 110795;  -- The Dreamer's Dilemma (Gridania) — Pristine + Vibrant + Brilliant + Midnight Egg Cap
UPDATE `gamedata_quests` SET `itemReward1` = 8012801, `itemReward1Qty` = 1, `itemReward2` = 8012802, `itemReward2Qty` = 1, `itemReward3` = 8012803, `itemReward3Qty` = 1, `itemReward4` = 8012804, `itemReward4Qty` = 1 WHERE `id` = 110805;  -- The Dreamer's Dilemma (Limsa Lominsa) — Pristine + Vibrant + Brilliant + Midnight Egg Cap
UPDATE `gamedata_quests` SET `itemReward1` = 8012801, `itemReward1Qty` = 1, `itemReward2` = 8012802, `itemReward2Qty` = 1, `itemReward3` = 8012803, `itemReward3Qty` = 1, `itemReward4` = 8012804, `itemReward4Qty` = 1 WHERE `id` = 110790;  -- The Dreamer's Dilemma (Ul'dah) — Pristine + Vibrant + Brilliant + Midnight Egg Cap

-- Firefall Faire (8 items, 4 in DB) [script: Red Lion 10012018, Blue Spinner 10012019, Green Comet 10012020, Azeyma's Candle 10012021]
UPDATE `gamedata_quests` SET `itemReward1` = 8032405, `itemReward1Qty` = 1, `itemReward2` = 8032410, `itemReward2Qty` = 1, `itemReward3` = 8051305, `itemReward3Qty` = 1, `itemReward4` = 8051310, `itemReward4Qty` = 1 WHERE `id` = 110799;  -- The Heat Is On — Lunar Summer Top + Halter + Trunks + Tanga

-- All Saints' Wake (4 items, all fit)
UPDATE `gamedata_quests` SET `itemReward1` = 8013301, `itemReward1Qty` = 1, `itemReward2` = 8013302, `itemReward2Qty` = 1, `itemReward3` = 8013303, `itemReward3Qty` = 1, `itemReward4` = 8013304, `itemReward4Qty` = 1 WHERE `id` = 110800;  -- Impish Impositions — 4 Pumpkin Heads

-- Starlight Celebration (2 items)
UPDATE `gamedata_quests` SET `itemReward1` = 8012502, `itemReward1Qty` = 1, `itemReward2` = 8032102, `itemReward2Qty` = 1 WHERE `id` = 110801;  -- Winter Is Not Coming — Reindeer Antlers + Suit

-- Heavensturn (1 item)
UPDATE `gamedata_quests` SET `itemReward1` = 8012604, `itemReward1Qty` = 1 WHERE `id` = 110802;  -- Gone with the Snow — Dragon Kabuto

-- Hatching-tide (2012) (5 items, 4 in DB) [script: Chocobo Egg Ring 9050062]
UPDATE `gamedata_quests` SET `itemReward1` = 9050058, `itemReward1Qty` = 1, `itemReward2` = 9050059, `itemReward2Qty` = 1, `itemReward3` = 9050060, `itemReward3Qty` = 1, `itemReward4` = 9050061, `itemReward4Qty` = 1 WHERE `id` = 110859;  -- Scrambled Eggs — Pristine + Midnight + Brilliant + Vibrant Egg Ring

-- Moonfire Faire (2012) (4 items, all fit)
UPDATE `gamedata_quests` SET `itemReward1` = 8032834, `itemReward1Qty` = 1, `itemReward2` = 8032837, `itemReward2Qty` = 1, `itemReward3` = 8051521, `itemReward3Qty` = 1, `itemReward4` = 8051524, `itemReward4Qty` = 1 WHERE `id` = 110860;  -- Bombard Backlash — Lord's Yukata (Blue) + Lady's Yukata (Red) + Lord's Drawers (Black) + Lady's Knickers (Black)

-- =============================================
-- HILDIBRAND QUESTS (8 quests)
-- Inn access rewards are handled by quest script, not DB.
-- =============================================

UPDATE `gamedata_quests` SET `expReward` = 200 WHERE `id` = 110838;                                                                          -- The Ink Thief (Lv1) — inn access via script
UPDATE `gamedata_quests` SET `expReward` = 200 WHERE `id` = 110828;                                                                          -- Waste Not Want Not (Lv1) — inn access via script
UPDATE `gamedata_quests` SET `expReward` = 200 WHERE `id` = 110848;                                                                          -- Ring of Deceit (Lv1) — inn access via script
UPDATE `gamedata_quests` SET `expReward` = 500 WHERE `id` = 110849;                                                                          -- The Usual Suspect (Lv15)
UPDATE `gamedata_quests` SET `expReward` = 500, `itemReward1` = 10011243, `itemReward1Qty` = 1 WHERE `id` = 110829;                          -- In Plain Sight (Lv15) — Wanted: Gauwyn the Gannet
UPDATE `gamedata_quests` SET `expReward` = 500 WHERE `id` = 110839;                                                                          -- Private Eyes (Lv15)
UPDATE `gamedata_quests` SET `expReward` = 1120, `itemReward1` = 10011252, `itemReward1Qty` = 1 WHERE `id` = 110840;                         -- Mysteries of the Red Moon (Lv20) — Unsealed Memorandum
UPDATE `gamedata_quests` SET `expReward` = 1120, `itemReward1` = 9030064, `itemReward1Qty` = 1 WHERE `id` = 110841;                          -- Prophecy Inspection (Lv20) — Manderville Earring
