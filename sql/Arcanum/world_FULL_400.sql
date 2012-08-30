set names utf8;

-- Instances

-- Blackfathom Deeps
-- Door Fix
UPDATE `gameobject_template` SET `flags`=18 WHERE entry=21117;

-- Uldaman
-- Door Fix
UPDATE `gameobject_template` SET `flags`=18 WHERE entry=124372;

-- Magisters Terace
-- Door Fix
UPDATE `gameobject_template` SET `flags`=18 WHERE entry=187896;

-- Blackrock Deepth
-- Door Fix
UPDATE `gameobject_template` SET `flags`=18 WHERE entry=170577;

-- AhnQiraj Temple
UPDATE `creature_template` SET `ScriptName` = 'npc_argent_champion' WHERE `entry` = 15299;

-- Culling of Stratholme
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (52480, 58825);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) 
VALUES
(13, 52480, 18, 1, 27733),
(13, 58825, 18, 1, 27733);

UPDATE creature_template SET scriptname = 'npc_cos_chromie' where entry in (27915,26527);
DELETE FROM `creature_addon` WHERE guid IN (138237,138239,138287,138288);
DELETE FROM `creature_formations` WHERE leaderGUID IN (138237,138288);
-- spawn some mobs
DELETE FROM `creature` WHERE `id` IN (27737,27729,27734,27736,28199,28200,28201,28249,28409,32273);

INSERT IGNORE INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
('28409','595','2','1','0','0','2338.47','1280.28','133.323','3.58524','30','0','0','8982','0','0','0','0','0'),
('32273','595','2','1','0','1839','2335.1','1278.2','132.885','3.43131','86400','0','0','417911','0','0','0','0','0'),
('27737','595','3','1','25543','0','2319.89','1285.78','131.407','1.72169','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','10979','0','2308.12','1304.21','127.601','4.39662','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','25542','0','2335.47','1262.04','132.921','1.42079','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','25543','0','2297.73','1338.75','124.622','2.5574','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','10979','0','2322.65','1265.39','133.033','5.6524','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','10973','0','2277.83','1331.92','124.19','3.48045','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','25543','0','2294.18','1316.93','125.672','6.05649','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','10973','0','2310.56','1369','128.372','5.03364','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','10979','0','2306.15','1322.85','125.708','4.99133','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','10973','0','2320.14','1297.48','129.694','1.35248','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','25542','0','2291.57','1327.27','124.545','5.32358','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','25542','0','2308.04','1352.65','126.907','5.83741','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','10979','0','2329.44','1281.11','132.636','2.25207','60','10','0','630','0','1','0','0','0'),
('27737','595','3','1','0','0','2407.32','1423.8','131.522','6.24743','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2417.26','1428.41','131.652','6.20423','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2420.48','1419.99','130.716','0.0977616','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2426.63','1413.41','130.464','0.404064','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2430.46','1417.6','130.557','0.125247','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2433.94','1427.03','131.18','0.0584885','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2446.5','1428.37','131.013','6.10606','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2449.49','1423.35','130.588','5.77619','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2441.92','1424.41','130.606','6.07857','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2450.6','1438.61','132.213','4.74889','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2460.17','1436.46','131.501','4.73711','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2444.68','1421.68','130.324','6.01338','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2456.87','1419.07','130.488','5.39763','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2464.27','1422.15','130.976','5.22092','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2468.21','1403.06','130.39','5.6364','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2460.88','1406.8','130.508','5.96234','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2485.77','1398.35','130.795','4.71591','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2485.79','1380.46','130.15','5.02928','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2475.77','1396.31','130.124','4.84079','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2476.92','1387.21','129.401','5.05128','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2483.24','1389.37','130.123','4.74104','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2480.2','1370.15','129.533','5.79583','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2481.54','1375.11','129.642','5.4644','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2489.44','1359.42','131.233','5.378','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2486.59','1356.19','131.876','5.7275','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2495.53','1348.61','133.072','5.52722','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2504.48','1349.65','132.856','5.11881','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2493.11','1380.29','130.24','4.93189','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2487.18','1392.64','130.512','4.93818','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2506.49','1336.89','132.794','5.19343','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2518.2','1306.39','130.623','4.81723','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2513.4','1299.67','130.868','4.4206','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2511.45','1291.47','130.808','5.00729','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2518.56','1292.32','130.528','5.16438','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2515.49','1279.85','129.214','5.28847','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2514.37','1285.92','129.934','5.70473','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2522.65','1274.29','128.576','5.44634','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2535.38','1275.77','127.42','5.49817','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2537.59','1273.1','127.05','5.02693','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2547.49','1261.7','126.44','4.78425','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2534.36','1261.06','127.125','4.3994','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2532.69','1251.44','127.452','5.4479','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2551.84','1252.35','125.455','5.04342','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2536.1','1244','126.928','5.16515','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2543.63','1247.23','126.131','5.19735','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2554.21','1238.95','125.475','4.64836','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2548.89','1227.37','126.375','5.31517','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2560.46','1225.4','125.496','4.85335','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2555.11','1218.55','125.944','5.11646','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2561.91','1211.56','125.38','5.5877','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2568.67','1202.96','125.509','4.96095','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2571.93','1193.48','125.619','5.07641','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2577.77','1180.88','125.562','4.64522','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2574.2','1166.63','126.089','4.44966','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2564.78','1166.82','127.092','4.2266','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2577.56','1158.41','126.385','4.07738','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2567.93','1176.56','126.2','4.7489','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2559.28','1189.46','126.642','4.73319','60','10','0','756','0','1','0','0','0'),
('27737','595','3','1','0','0','2554.14','1213.37','126.599','5.13845','60','10','0','706','0','1','0','0','0'),
('27737','595','3','1','0','0','2560.58','1218.48','125.281','4.97351','60','10','0','730','0','1','0','0','0'),
('27737','595','3','1','0','0','2570.2','1170.58','126.311','4.64365','60','10','0','756','0','1','0','0','0'),
('27729','595','3','1','0','0','2496.57','1354.66','132.217','5.13691','120','5','0','63000','0','1','0','0','0'),
('27729','595','3','1','0','0','2494.22','1365.17','130.812','5.15654','120','5','0','63000','0','1','0','0','0'),
('27729','595','3','1','0','0','2440.41','1434.46','131.456','5.69372','120','5','0','63000','0','1','0','0','0'),
('27729','595','3','1','0','0','2433.18','1421.13','130.644','0.046706','120','5','0','63000','0','1','0','0','0'),
('27734','595','3','1','0','0','2546.07','1239.17','125.945','5.07801','120','5','0','63000','0','1','0','0','0'),
('27734','595','3','1','0','0','2458.58','1426.22','131.056','5.42984','120','5','0','63000','0','1','0','0','0'),
('27736','595','3','1','0','0','2488.11','1364.91','130.402','5.35524','120','5','0','130330','0','1','0','0','0'),
('28199','595','3','1','0','0','2527.63','1267.59','128.168','5.12906','120','5','0','63000','0','1','0','0','0'),
('28199','595','3','1','0','0','2528.06','1284.34','128.877','5.14869','120','5','0','63000','0','1','0','0','0'),
('28199','595','3','1','0','0','2466.27','1414.57','130.977','5.18637','120','5','0','63000','0','1','0','0','0'),
('28200','595','3','1','0','0','2570.51','1181.4','125.809','4.61855','120','5','0','50400','44070','1','0','0','0'),
('28200','595','3','1','0','0','2560.45','1202.05','126.031','4.85417','120','5','0','50400','44070','1','0','0','0'),
('28200','595','3','1','0','0','2487.85','1373.29','130.236','5.078','120','5','0','50400','44070','1','0','0','0'),
('28200','595','3','1','0','0','2416.7','1416.52','130.379','0.191224','120','5','0','50400','44070','1','0','0','0'),
('28200','595','3','1','0','0','2424.42','1422.68','130.868','0.25327','120','5','0','50400','44070','1','0','0','0'),
('28201','595','3','1','0','0','2540.67','1254.82','126.274','4.97198','120','5','0','130330','0','1','0','0','0'),
('28201','595','3','1','0','0','2410.03','1417.19','130.577','0.191229','120','5','0','130330','0','1','0','0','0'),
('28249','595','3','1','0','0','2562.66','1177.9','126.716','4.77171','120','5','0','63000','0','1','0','0','0'),
('28249','595','3','1','0','0','2566.72','1190.41','125.837','4.7992','120','5','0','63000','0','1','0','0','0'),
('28249','595','3','1','0','0','2472.34','1404.76','130.752','5.20601','120','5','0','63000','0','1','0','0','0'),
('28249','595','3','1','0','0','2460.59','1413.26','130.46','5.4377','120','5','0','63000','0','1','0','0','0'),
('28249','595','3','1','0','0','2415.04','1423.52','131.111','0.214785','120','5','0','63000','0','1','0','0','0');

-- immunitys
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|8|16|32|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 WHERE `entry` IN (26529,26530,26532,26533,31211,31212,31215,31217,32313);

-- boss melee dmg
UPDATE `creature_template` SET `dmg_multiplier` = 20 WHERE `entry` IN (31211,31212,31215,31217,32313);

-- abzeichen
UPDATE `creature_loot_template` SET `item` = 40752 WHERE `entry` IN (31211,31212,31215,32313) AND `item` = 47241;
UPDATE `gameobject_loot_template` SET `item` = 40752 WHERE `entry` = 24589 AND `item` = 47241;

-- malganis-kisten respawn
UPDATE `gameobject` SET `spawntimesecs` = 86400 WHERE `id` IN (190663,193597);

-- try to fix infinite hunter spam some cast
UPDATE `creature_ai_scripts` SET `event_param3` = 10, `event_param4` = 10 WHERE `id` IN (2774302,2774303);

-- make a trigger not visible
UPDATE `creature_template` SET `flags_extra` = `flags_extra`|128 WHERE `entry` = 20562;

-- ?
UPDATE `creature` SET `spawnMask` = 3 WHERE `id` IN (27915,30997);
UPDATE `creature` SET `id`=27737, `modelid`=0, `spawntimesecs`=30, `spawndist`=5, `MovementType`=1 WHERE `id` IN (28167,28169);
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=7180;

-- Pit of Saron
DELETE FROM script_texts WHERE entry IN (-1658074, -1658075, -1658076, -1658077, -1658078, -1658080, -1658081, -1658082, -1658084, -1658085, -1658086, -1658087, -1658088);

INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES 
('0', '-1658074', 'Intruders have entered the masters domain. Signal the alarms!', 16747, 1, 0, 0, 'Tyrannus Opening'),
('0', '-1658075', 'Hmph fodder Not even fit to labor in the quarry. Relish these final moments for soon you will be nothing more than mindless undead', 16748, 1, 0, 0, 'Tyrannus Opening'),
('0', '-1658076', 'Soldiers of the Horde, attack!', 17045, 1, 0, 0, 'Sylvanas Opening'),
('0', '-1658077', 'Heroes of the Alliance, attack!', 16626, 1, 0, 0, 'Jaina Opening'),
('0', '-1658078', 'Your last waking memory will be of agonizing pain', 16749, 1, 0, 0, 'Tyrannus Opening'),
('0', '-1658080', 'Pathetic weaklings', 17046, 1, 0, 0, 'Sylvanas Opening'),
('0', '-1658081', 'NO! YOU MONSTER!', 16627, 1, 0, 0, 'Jaina Opening'),
('0', '-1658082', 'Minions, destroy these interlopers!', 16751, 1, 0, 0, 'Tyrannus Opening'),
('0', '-1658084', 'I do what i must. Please forgive me noble soldiers', 16628, 1, 0, 0, 'Jaina Opening'),
('0', '-1658085', 'You will have to battle your way through this cesspit on your own.', 17047, 0, 0, 0, 'Sylvanas Opening'),
('0', '-1658086', 'You will have to make your way across this quarry on your own.', 16629, 0, 0, 0, 'Jaina Opening'),
('0', '-1658087', 'Free any horde slaves that you come across. We will most certainly need there assistance in battling Tyrannus. I will gather reinforcements and join you on the other side of the quarry.', 17048, 0, 0, 0, 'Sylvanas Opening'),
('0', '-1658088', 'Free any Alliance slaves that you come across. We will most certainly need there assistance in battling Tyrannus. I will gather reinforcements and join you on the other side of the quarry.', 16630, 0, 0, 0, 'Jaina Opening');

UPDATE script_texts SET content_loc8='Воины Орды, в атаку!' WHERE entry = -1658076;
UPDATE script_texts SET content_loc8='Вам одним придется пройти через эту выгребную Яму' WHERE entry = -1658085;
UPDATE script_texts SET content_loc8='Жалкие слабаки' WHERE entry = -1658080;
UPDATE script_texts SET content_loc8='Освобождайте рабов - ордынцев, которые встретятся вам на пути. Они пригодятся нам в битве с Тиранием. Я соберу подкрепление и присоединюсь к вам на другой стороне рудника.' WHERE entry = -1658087;
UPDATE script_texts SET content_loc8='Герои Альянса, в атаку!' WHERE entry = -1658077;
UPDATE script_texts SET content_loc8='Нет! Ах ты чудовище!' WHERE entry = -1658081;
UPDATE script_texts SET content_loc8='Вам придется пройти через рудник без меня' WHERE entry = -1658187;
UPDATE script_texts SET content_loc8='Освобождайте рабов орды, которые встретятся вам на пути. Они пригодятся нам в битве с Тиранием. Я соберу подкрепление и присоединюсь к вам на другой стороне рудника.' WHERE entry = -1658087;
UPDATE script_texts SET content_loc8='Чужаки проникли во владение господина. Поднять тревогу!' WHERE entry = -1658074;
UPDATE script_texts SET content_loc8='Последнее, что вам запомнится, это агония.' WHERE entry = -1658078;
UPDATE script_texts SET content_loc8='Вот падаль. Вы даже для работы на рудниках не годитесь. Запомните свои последние минуты - скоро вы будете безмозглой нежитью.' WHERE entry = -1658075;
UPDATE script_texts SET content_loc8='Прислужники, убейте этих наглецов!' WHERE entry = -1658082;


DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (36794);

UPDATE creature_template SET scriptname = "pitofsaron_start" WHERE entry IN (36794);
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES 
(367880, 37609, 0, 0, 0, 0, 22196, 0, 0, 0, 'Deathwhisper Necrolyte', 'Cult of the Damned', '', 0, 80, 80, 2, 21, 21, 0, 1.5, 1.14286, 1, 1, 307, 459, 0, 115, 9.6, 2000, 2000, 8, 32832, 8, 0, 0, 0, 0, 0, 246, 367, 92, 7, 0, 36788, 0, 0, 0, 0, 0, 0, 0, 0, 69578, 69577, 69577, 70270, 0, 0, 0, 0, 0, 0, 6705, 6705, 'SmartAI', 2, 3, 16, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2014, 1, 0, '', 12340);
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (36796, 37657, 0, 0, 0, 0, 9785, 0, 0, 0, 'Corrupted Champion', '', '', 0, 80, 80, 2, 14, 14, 0, 1, 1.14286, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 8, 0, 0, 0, 0, 0, 1, 2, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 8388624, 0, '', 12340);
UPDATE creature_template SET type_flags = 192 WHERE entry = 36661;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('203465','36788','658','2','64','0','2014','500.296','205.471','528.709','0.308489','300','0','0','302400','8814','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('203884','36788','658','1','128','0','2014','504.241','209.88','528.71','6.14493','300','0','0','161280','8814','2','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('124337','36788','658','3','1','22196','0','677.835','200.002','508.507','0.833533','7200','0','0','302400','8814','2','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('124336','36788','658','3','1','22196','0','613.756','121.853','507.693','1.17976','7200','0','0','302400','8814','2','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('124338','36788','658','3','1','22196','0','762.657','-42.8069','508.525','3.7459','7200','0','0','302400','8814','2','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125677','36788','658','3','1','22196','0','559.615','143.49','516.209','5.55015','7200','0','0','302400','8814','2','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125690','36788','658','3','1','22196','0','602.344','300.214','506.946','4.6153','7200','0','0','302400','8814','2','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('204240','36788','658','2','128','0','2014','499.366','205.466','528.71','6.24154','300','0','0','302400','8814','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('201550','36788','658','1','64','0','2014','504.444','211.062','528.71','6.17006','300','0','0','161280','8814','2','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('124326','36794','658','3','1','27982','0','906.905','-49.0381','618.802','1.79769','7200','0','0','107848','4169','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('204246','36794','658','2','128','0','0','494.439','223.624','535.979','3.35285','300','0','0','107848','4169','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('203440','36794','658','2','64','0','0','499.549','226.895','542.988','3.33399','300','0','0','107848','4169','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('200586','36794','658','1','64','0','0','530.315','227.842','547.769','3.29551','300','0','0','107848','4169','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('203861','36794','658','1','128','0','0','520.005','226.382','542.703','3.24603','300','0','0','107848','4169','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('204242','36788','658','2','128','0','2014','493.31','250.667','528.709','0.578034','300','0','0','302400','8814','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('203886','36788','658','1','128','0','2014','489.779','246.912','528.709','0.871771','300','0','0','161280','8814','2','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('202512','36788','658','1','64','0','2014','487.464','246.891','528.709','0.0416026','300','0','0','161280','8814','2','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('203463','36788','658','2','64','0','2014','494.272','251.478','528.709','0.467289','300','0','0','302400','8814','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207618','36764','658','2','128','0','254','722.254','177.784','511.468','1.94884','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207616','36764','658','2','128','0','254','710.517','192.395','513.241','2.00382','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207614','36764','658','2','128','0','254','691.783','208.938','511.734','1.2302','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207612','36764','658','2','128','0','254','684.361','223.07','511.097','2.43657','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207610','36764','658','2','128','0','254','664.916','229.741','510.033','2.02031','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207608','36764','658','2','128','0','254','636.156','260.379','509.442','1.42891','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207579','36764','658','2','128','0','254','638.037','307.148','509.06','1.56556','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207577','36764','658','2','128','0','254','614.689','329.023','508.287','3.22118','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207575','36764','658','2','128','0','254','594.213','315.169','508.704','3.41203','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207573','36764','658','2','128','0','254','579.673','312.303','508.587','2.446','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207445','36764','658','2','128','0','254','539.858','331.055','508.627','1.36921','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207401','36764','658','2','128','0','254','537.672','322.103','508.606','3.60367','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207357','36764','658','2','128','0','254','534.879','302.256','508.827','4.33017','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206683','36764','658','1','128','0','254','722.169','178.082','511.491','2.21992','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206681','36764','658','1','128','0','254','710.392','192.689','513.238','2.0864','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206679','36764','658','1','128','0','254','691.751','209.091','511.684','1.71334','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206677','36764','658','1','128','0','254','684.248','223.137','511.097','2.34166','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206675','36764','658','1','128','0','254','664.762','229.865','510.027','2.43591','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206643','36764','658','1','128','0','254','637.795','307.43','508.977','1.65208','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206641','36764','658','1','128','0','254','614.044','328.953','508.287','3.25037','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206639','36764','658','1','128','0','254','594.206','315.202','508.7','3.3564','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206637','36764','658','1','128','0','254','540.099','331.287','508.627','1.22875','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206635','36764','658','1','128','0','254','537.652','322.217','508.609','4.17792','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206633','36764','658','1','128','0','254','535.057','302.368','508.842','4.44103','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206631','36764','658','1','128','0','254','579.554','312.338','508.584','2.52859','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104371','36764','658','3','128','0','0','750.149','-107.019','513.02','5.77704','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104370','36764','658','3','128','0','0','546.786','77.5','527.738','3.66519','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104363','36764','658','3','128','0','0','636.259','-70.6215','512.671','3.90954','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104140','36764','658','3','128','0','0','834.316','-17.3299','509.567','4.01426','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104141','36764','658','3','128','0','0','698.283','-119.566','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104359','36764','658','3','128','0','0','692.682','-118.651','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104362','36764','658','3','128','0','0','723.545','-169.236','526.813','5.45946','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125728','36764','658','3','128','0','0','681.099','-120.312','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125708','36764','658','3','128','0','0','704.797','-119.415','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125737','36764','658','3','128','0','0','688.446','-120.693','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104369','36764','658','3','128','0','0','572.309','168.01','509.939','3.4383','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104368','36764','658','3','128','0','0','587.977','198.151','509.651','2.93215','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104367','36764','658','3','128','0','0','581.635','-5.30382','512.681','3.42085','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104366','36764','658','3','128','0','0','581.865','-16.9219','512.681','2.77507','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104372','36764','658','3','128','0','0','721.189','-70.2917','492.521','4.2586','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104373','36764','658','3','128','0','0','721.995','-43.9149','479.963','5.35816','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('104374','36764','658','3','128','0','0','691.132','-46','486.064','4.67748','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207622','36765','658','2','128','0','254','732.296','152.235','511.174','2.5371','300','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('207620','36765','658','2','128','0','254','729.335','147.948','511.161','2.54103','300','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206710','36765','658','1','128','0','254','727.387','152.566','511.227','2.25448','300','0','0','37800','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('206685','36765','658','1','128','0','254','722.456','148.052','511.413','2.64718','300','0','0','37800','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118232','36765','658','3','128','30372','0','748.805','53.4028','463.444','1.8326','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125725','36765','658','3','128','30372','0','683.92','-58.8646','507.507','3.35103','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205928','36770','658','1','64','0','254','614.338','329.129','508.287','2.94286','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205926','36770','658','1','64','0','254','594.251','315.229','508.699','3.47222','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205963','36770','658','1','64','0','254','684.179','223.06','511.097','2.54781','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205961','36770','658','1','64','0','254','664.751','229.798','510.012','2.4889','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205959','36770','658','1','64','0','254','636.149','260.458','509.44','1.5802','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205922','36770','658','1','64','0','254','539.963','331.564','508.626','1.6234','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205920','36770','658','1','64','0','254','537.562','322.079','508.607','3.72355','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205918','36770','658','1','64','0','254','534.937','302.367','508.846','4.04949','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205517','36770','658','2','64','0','254','722.076','178.338','511.509','2.07658','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205515','36770','658','2','64','0','254','710.502','192.782','513.28','1.73257','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205513','36770','658','2','64','0','254','691.636','208.909','511.621','1.68152','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205511','36770','658','2','64','0','254','684.229','223.269','511.097','2.44571','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205509','36770','658','2','64','0','254','664.678','229.842','510.007','2.37031','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205507','36770','658','2','64','0','254','652.947','241.898','514.99','2.20852','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205505','36770','658','2','64','0','254','636.075','260.372','509.401','1.59199','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205969','36770','658','1','64','0','254','722.097','178.352','511.511','2.11348','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205967','36770','658','1','64','0','254','710.496','192.953','513.296','2.24307','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205965','36770','658','1','64','0','254','691.318','209.295','511.521','1.67994','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205930','36770','658','1','64','0','254','637.852','307.146','508.972','2.12605','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205924','36770','658','1','64','0','254','579.421','312.414','508.579','2.51011','300','0','0','37800','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205474','36770','658','2','64','0','254','614.41','328.99','508.287','2.98999','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205470','36770','658','2','64','0','254','579.499','312.468','508.577','2.258','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205472','36770','658','2','64','0','254','594.233','315.182','508.703','3.44788','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118229','36770','658','3','64','30383','0','834.316','-17.3299','509.567','4.01426','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118225','36770','658','3','64','30380','0','692.682','-118.651','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118224','36770','658','3','64','30382','0','698.283','-119.566','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118227','36770','658','3','64','30383','0','688.446','-120.693','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125741','36770','658','3','64','30380','0','704.797','-119.415','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125727','36770','658','3','64','30380','0','681.099','-120.313','513.96','4.74729','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125729','36770','658','3','64','30380','0','723.545','-169.236','526.813','5.45946','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125706','36770','658','3','64','30381','0','636.259','-70.6215','512.671','3.90954','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('135304','36770','658','3','64','30382','0','581.865','-16.9219','512.681','2.77507','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125739','36770','658','3','64','30380','0','581.635','-5.30382','512.681','3.42085','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125707','36770','658','3','64','30383','0','587.977','198.151','509.651','2.93215','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125703','36770','658','3','64','30382','0','572.309','168.01','509.939','3.4383','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125702','36770','658','3','64','30382','0','546.786','77.5','527.738','3.66519','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118223','36770','658','3','64','30381','0','750.149','-107.019','513.02','5.77704','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118205','36770','658','3','64','30380','0','721.189','-70.2917','492.521','4.2586','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118206','36770','658','3','64','30383','0','721.995','-43.9149','479.963','5.35816','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118209','36770','658','3','64','30382','0','691.132','-46','486.064','4.67748','7200','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205445','36770','658','2','64','0','254','539.956','331.329','508.627','1.50009','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205442','36770','658','2','64','0','254','537.337','322.066','508.609','3.22404','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205356','36770','658','2','64','0','254','534.622','302.448','508.871','3.25153','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('205476','36770','658','2','64','0','254','638.021','307.324','509.072','1.57628','300','0','0','63000','0','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125713','36771','658','3','64','30384','0','725.977','149.089','511.345','1.11701','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118231','36771','658','3','64','30384','0','866.153','-11.3438','509.741','5.46288','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118228','36771','658','3','64','30385','0','777.953','6.66146','489.561','6.03884','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118235','36771','658','3','64','30384','0','676.29','168.757','508.003','0.139626','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125685','36771','658','3','64','30385','0','632.587','-59.5139','512.672','2.77507','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('123688','36771','658','3','64','30384','0','591.67','-23.7361','512.714','5.61996','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125738','36771','658','3','64','30385','0','586.727','6.61111','512.674','3.35103','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125698','36771','658','3','64','30384','0','548.403','89.5608','525.462','2.75762','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('125711','36771','658','3','64','30384','0','754.168','-95.066','512.83','0.069813','7200','0','0','63000','3994','0','0','0','0');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('118210','36771','658','3','64','30385','0','647.373','-112.151','513.411','2.70526','7200','0','0','63000','3994','0','0','0','0');

update gameobject_template set ScriptName = '' where entry = 201969;
update creature_template set ScriptName = '' where entry IN (36765, 36771);

UPDATE creature_template SET scriptname = "pos_intro" WHERE entry IN (36990, 36993);

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5578,5579,5580,5573,5598,5599);
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(5578,'at_ymirjar_flamebearer_pos'),
(5579,'at_fallen_warrior_pos'),
(5580,'at_ice_cicle_pos'),
(5573,'at_pos_intro'),
(5598,'at_slave_rescued_pos'),
(5599,'at_geist_ambusher_pos');

UPDATE creature_template SET ScriptName = 'pos_outro' WHERE entry IN (38189, 38188);
UPDATE creature_template SET ScriptName = '' WHERE entry = 36886;

SET @ENTRY1=36840;
SET @ENTRY2=36892;
SET @ENTRY3=36893;
SET @ENTRY4=36841;
SET @ENTRY5=36842;
SET @ENTRY6=37584;
SET @ENTRY7=37588;
SET @ENTRY8=37587;
SET @ENTRY9=37496;
SET @ENTRY10=37497;
SET @ENTRY11=37729;
SET @ENTRY12=37728;
SET @ENTRY13=36877;

DELETE FROM creature WHERE id IN (@ENTRY1, @ENTRY2, @ENTRY3, @ENTRY4, @ENTRY5, @ENTRY6, @ENTRY7, @ENTRY8, @ENTRY9, @ENTRY10, @ENTRY11, @ENTRY12, @ENTRY13);
DELETE FROM script_texts WHERE entry IN(-1658022, -1658023);
INSERT INTO script_texts (entry,content_default,sound,type,language,emote,comment) VALUES
(-1658022,'%s lance un rocher saronite massive sur vous !',0,5,0,0,'garfrost EMOTE_THROW_SARONITE'),
(-1658023,'%s jette Deep Freeze sur $N.',0,3,0,0,'garfrost EMOTE_DEEP_FREEZE');

DELETE FROM `script_texts` WHERE entry = -1658071;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(36888,-1658071,'This way! We\'re about to mount an assault on the Scourgelord\'s location!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'SAY_RESCOUD_HORDE_ALLIANCE');
UPDATE creature_template SET unit_flags = 32832, faction_A = 21, faction_H = 21 where entry IN (36830, 36892);
UPDATE gameobject_template SET flags = 1, faction = 1375 WHERE entry = 201848;
UPDATE creature_template SET scriptname = '' WHERE entry IN (36794);
UPDATE creature_template SET MovementType = 2 where entry IN (36788, 367880);

-- Forge of Souls
-- Spiteful Apparition
UPDATE `creature` SET `MovementType` = 1, `SpawnDist` = 15 WHERE `id` = 36551;
UPDATE `creature_template` SET `flags_extra` = 0, `unit_flags` = 33554688, `MovementType` = 1, `InhabitType` = 1 WHERE `entry` = 36551;

-- Halls of Reflection
-- Creature Templates
SET @NPC_UTHER              := 37225;
SET @NPC_JAINA_INTRO        := 37221;
SET @NPC_SYLVANA_INTRO      := 37223;
SET @NPC_JAINA_OUTRO        := 36955;
SET @NPC_SYLVANA_OUTRO      := 37554;
SET @NPC_FROSTWORN_GENERAL  := 36723;
SET @NPC_LICH_KING_EVENT    := 36954;
SET @NPC_LICH_KING_BOSS     := 37226;

DELETE FROM `creature` WHERE `guid` = 663195;
DELETE FROM `creature` WHERE `guid` = 663191;
DELETE FROM `creature` WHERE `guid` = 663194;
DELETE FROM `creature` WHERE `guid` = 663204;
DELETE FROM `creature` WHERE `guid` = 663203;


DELETE FROM `transports` WHERE `entry` = 201598;
DELETE FROM `transports` WHERE `entry` = 201599;

DELETE FROM `gameobject_template` WHERE `entry` = 500003;
DELETE FROM `gameobject_template` WHERE `entry` = 500002;

UPDATE `creature_template` SET `speed_walk`='1.8', `speed_run`='2.0' WHERE `entry` IN (@NPC_LICH_KING_EVENT, @NPC_LICH_KING_BOSS);

-- Creature Templates 
UPDATE `creature_template` SET `faction_A` = '16',`faction_H` = '16' WHERE `entry`=37720;
UPDATE `creature_template` SET `unit_flags` = '0',`lootid` = '36620' WHERE `entry` IN ( 38175, 38172, 38177, 38173, 38176);  
UPDATE `creature_template` SET `faction_A` = '16',`faction_H` = '16',`type_flags` = '0',`lootid` = '3662001',`Health_mod` = '10',`dmg_multiplier` = '10' WHERE `entry` IN ( 3817501, 3817201, 3817701, 3817301, 3817601);
UPDATE `creature_template` SET `equipment_id` = '14' WHERE `entry` IN ( 38175, 3817501);
UPDATE `creature_template` SET `equipment_id` = '1218' WHERE `entry` IN ( 38177, 3817701);
UPDATE `creature_template` SET `equipment_id` = '107' WHERE `entry` IN ( 38173, 3817301);
UPDATE `creature_template` SET `equipment_id` = '2147' WHERE `entry` IN ( 38176, 3817601);

UPDATE `creature_template` SET `speed_walk`='1.5', `speed_run`='2.0' WHERE `entry` in (36954, 37226);
UPDATE `creature_template` SET `Scriptname`='npc_jaina_hor_part1' WHERE `entry`=37221;
UPDATE `creature_template` SET `Scriptname`='npc_sylvanas_hor_part1' WHERE `entry`=37223;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry`=38112;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry`=38113;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_lich_king_hr' WHERE `entry`=36954;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hor' WHERE `entry`=37226;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_hor_part2' WHERE `entry` in (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_raging_gnoul' WHERE `entry`=36940;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_risen_witch_doctor' WHERE `entry`=36941;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_abon' WHERE `entry`=37069;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_ghostly_priest' WHERE `entry`=38175;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_phantom_mage' WHERE `entry`=38172;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_phantom_hallucination' WHERE `entry`=38567;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_shadowy_mercenary' WHERE `entry`=38177;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_spectral_footman' WHERE `entry`=38173;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_ghostly_priest' WHERE `entry`=38176;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_tortured_rifleman' WHERE `entry`=38176;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_quest_quel_dellar' WHERE `entry`=37158;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_quest_quel_uther' WHERE `entry`=37225;
UPDATE `creature_template` SET `ScriptName` = 'npc_capitan_gunship' WHERE `entry` IN (37182,37833);

UPDATE `creature_template` SET `unit_flags` = 32784, `AIName` = '', `ScriptName` = 'npc_spiritual_reflection', `difficulty_entry_1` = 37721 WHERE `entry` = 37107;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `unit_flags` = 32784, `mindmg` = '422', `maxdmg` = '586', `attackpower` = '642', `dmg_multiplier` = '13' WHERE `entry` = 37721;
UPDATE `creature_template` SET `flags_extra` = 1 WHERE `entry` = @NPC_FROSTWORN_GENERAL;
UPDATE `creature_template` SET `flags_extra` = 257 WHERE `entry` = @NPC_FROSTWORN_GENERAL;

UPDATE `creature_template` SET `scale`='0.8', `equipment_id`='1221' WHERE `entry` IN (@NPC_JAINA_INTRO, @NPC_JAINA_OUTRO);
UPDATE `creature_template` SET `equipment_id`='1290' WHERE `entry` IN (@NPC_SYLVANA_INTRO, @NPC_SYLVANA_OUTRO);
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=@NPC_LICH_KING_EVENT;
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (@NPC_UTHER, @NPC_SYLVANA_INTRO, @NPC_LICH_KING_BOSS, @NPC_SYLVANA_OUTRO);

DELETE FROM `script_texts` WHERE `entry` IN (-1652000, -1652002, -1652008);
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES 
(37225, -1652000,'Ты понимаешь, что наделал?', 0, 1, 0, 0,''),
-- Тут и в конце залов должен быть текст, скоро схожу туда на оффе, отсниффаю.
(37225, -1652002,"Пока ты здесь, Кель\'Делар впитывает зло, которым пронизано это место.", 0, 1, 0, 0,''),
(37225, -1652008,'Есть лишь один способ очистить оружие. Поспеши к Солнечному Колодцу и окуни меч в его воды.', 0, 1, 0, 0,'');

-- ХЗ что и как, но модель Кельделара не та, опять же, буду сниффать...
-- UPDATE `creature_template` SET `modelid1`=30457 WHERE entry = 37158;
-- UPDATE `creature_template` SET `equipment_id`='6666' WHERE `entry`=37158;
-- INSERT INTO `creature_equip_template`(`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES ('6666','50047','0','0');

-- delete lichking, sylvanas, jaina from hor
DELETE FROM creature WHERE id IN (37226,37554,36955);
-- Creature Spawns
SET @GUID_CREATURE := 202284;
DELETE FROM creature WHERE map=668 AND id IN (14881, 36723, 37221, 37704, 37906, 38112, 38113);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID_CREATURE+1,'37704','668','3','1','17612','0','5309.08','2006.32','711.422','3.93429','604800','0','0','12600','0','0','0','0','0'),
(@GUID_CREATURE+2,'14881','668','3','1','1160','0','5337.6','2012.14','707.695','3.52509','604800','0','0','8','0','0','0','0','0'),
(@GUID_CREATURE+3,'14881','668','3','1','2536','0','5268.91','1969.17','707.696','0.321519','604800','0','0','8','0','0','0','0','0'),
(@GUID_CREATURE+4,'14881','668','3','1','1160','0','5386.99','2080.5','707.695','4.67797','604800','0','0','8','0','0','0','0','0'),
(@GUID_CREATURE+5,'38112','668', '3', '1', '0', '0', '5276.81', '2037.45', '709.32', '5.58779', '604800', '0', '0', '377468', '0', '0', '0', '0', '0'),
(@GUID_CREATURE+6,'38113','668', '3', '1', '0', '0', '5341.72', '1975.74', '709.32', '2.40694', '604800', '0', '0', '539240', '0', '0', '0', '0', '0'),
(@GUID_CREATURE+7,'37221','668','3','1','0','0','5236.67','1929.91','707.695','0.837758','604800','0','0','5040000','881400','0','0','0','0'),
(@GUID_CREATURE+8,'36723','668','3','1','0','0','5413.9','2116.65','707.695','3.94765','604800','0','0','315000','0','0','0','0','0'); -- Найти правильный ИД для equipment_id

UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` IN (197341, 202302, 201385, 201596);

-- Waipoints to escort event on Halls of reflection
DELETE FROM script_waypoint WHERE entry IN (@NPC_JAINA_OUTRO,@NPC_LICH_KING_BOSS,@NPC_SYLVANA_OUTRO);
INSERT INTO script_waypoint VALUES

-- Jaina
   (@NPC_JAINA_OUTRO, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (@NPC_JAINA_OUTRO, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (@NPC_JAINA_OUTRO, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (@NPC_JAINA_OUTRO, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'),
   (@NPC_JAINA_OUTRO, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (@NPC_JAINA_OUTRO, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (@NPC_JAINA_OUTRO, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (@NPC_JAINA_OUTRO, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (@NPC_JAINA_OUTRO, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (@NPC_JAINA_OUTRO, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (@NPC_JAINA_OUTRO, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (@NPC_JAINA_OUTRO, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (@NPC_JAINA_OUTRO, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (@NPC_JAINA_OUTRO, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (@NPC_JAINA_OUTRO, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (@NPC_JAINA_OUTRO, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (@NPC_JAINA_OUTRO, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (@NPC_JAINA_OUTRO, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (@NPC_JAINA_OUTRO, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Sylvana
   (@NPC_SYLVANA_OUTRO, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (@NPC_SYLVANA_OUTRO, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (@NPC_SYLVANA_OUTRO, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (@NPC_SYLVANA_OUTRO, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'),
   (@NPC_SYLVANA_OUTRO, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (@NPC_SYLVANA_OUTRO, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (@NPC_SYLVANA_OUTRO, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (@NPC_SYLVANA_OUTRO, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (@NPC_SYLVANA_OUTRO, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (@NPC_SYLVANA_OUTRO, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (@NPC_SYLVANA_OUTRO, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (@NPC_SYLVANA_OUTRO, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (@NPC_SYLVANA_OUTRO, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (@NPC_SYLVANA_OUTRO, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (@NPC_SYLVANA_OUTRO, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (@NPC_SYLVANA_OUTRO, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (@NPC_SYLVANA_OUTRO, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (@NPC_SYLVANA_OUTRO, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (@NPC_SYLVANA_OUTRO, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Lich King
   (@NPC_LICH_KING_BOSS, 1, 5577.19, 2236, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 2, 5580.57, 2232.22, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 3, 5586.67, 2225.54, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 4, 5590.45, 2221.41, 733.012, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 5, 5595.75, 2215.62, 732.101, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 6, 5601.21, 2206.49, 731.54, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 7, 5605.01, 2197.9, 731.667, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 8, 5606.55, 2191.39, 730.977, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 9, 5604.68, 2186.11, 730.998, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 10, 5602.26, 2179.9, 730.967, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 11, 5600.06, 2174.38, 730.924, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 12, 5597.29, 2166.81, 730.924, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 13, 5596.25, 2160.36, 730.931, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 14, 5591.79, 2152.87, 731.008, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 15, 5585.47, 2146.63, 731.109, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 16, 5579.1, 2140.34, 731.18, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 17, 5572.56, 2134.21, 731.092, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 18, 5564.08, 2126.53, 730.816, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 19, 5559.04, 2117.64, 730.812, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 20, 5555.77, 2111.88, 730.995, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 21, 5550.82, 2103.14, 731.123, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 22, 5546.02, 2094.68, 731.16, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 23, 5541.53, 2084.42, 730.999, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 24, 5537.5, 2075.18, 730.901, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 25, 5533.76, 2063.84, 730.87, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 26, 5530.97, 2052.98, 730.981, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 27, 5526.75, 2041.73, 731.193, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 28, 5522.88, 2031.65, 731.7, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 29, 5521.01, 2023.02, 732.396, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 30, 5516.55, 2015.36, 733.12, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 31, 5513.06, 2007.33, 733.99, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 32, 5510.43, 1997.9, 735.016, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 33, 5504.53, 1990.39, 735.748, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 34, 5499.34, 1983.78, 736.29, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 35, 5493.11, 1975.86, 736.852, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 36, 5487.58, 1968.81, 737.394, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 37, 5483.12, 1961.78, 738.06, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 38, 5478.33, 1954.2, 739.343, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 39, 5475.2, 1945.84, 740.697, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 40, 5472.15, 1938.02, 741.884, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 41, 5469.26, 1931.34, 742.813, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 42, 5464.23, 1922.25, 744.055, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 43, 5458.43, 1912.96, 745.229, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 44, 5452.26, 1902.95, 747.091, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 45, 5442.44, 1892.51, 749.208, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 46, 5435.67, 1879.7, 751.776, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 47, 5429.03, 1870.73, 753.151, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 48, 5423.72, 1862.16, 754.263, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 49, 5417.21, 1851.7, 755.507, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 50, 5408.94, 1838.38, 757.002, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 51, 5398.8, 1829.61, 757.742, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 52, 5388.47, 1817.95, 759.285, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 53, 5378.23, 1808.5, 760.316, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 54, 5368.5, 1801.35, 760.845, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 55, 5360.86, 1793.16, 762.271, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 56, 5353.62, 1785.4, 763.868, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 57, 5344.78, 1776.09, 765.759, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 58, 5336.38, 1768.67, 767.324, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 59, 5327.56, 1760.12, 769.332, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 60, 5319.62, 1750.7, 771.487, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 61, 5313.12, 1742.99, 773.424, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 62, 5305.41, 1735.79, 775.473, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 63, 5298.93, 1728.16, 777.573, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 64, 5292.54, 1720.37, 779.862, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 65, 5287.11, 1713.96, 781.667, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 66, 5280.14, 1705.21, 784.65, 0, 'HoR WP LichKing'),
   (@NPC_LICH_KING_BOSS, 67, 5277.98, 1701.28, 785.224, 0, 'HoR WP LichKing');

-- AreaTrigger for waves restarter
DELETE FROM `areatrigger_scripts` WHERE `entry` = 5697;
INSERT INTO `areatrigger_scripts` VALUES
(5697, 'at_hor_waves_restarter');

DELETE FROM `gameobject_loot_template` WHERE (`entry`=27993);
INSERT INTO `gameobject_loot_template` VALUES 
(27993, 43102, 100, 1, 0, 1, 1),
(27993, 47241, 100, 1, 0, 1, 1),
(27993, 50302, 0, 1, 1, 1, 1),
(27993, 50303, 0, 1, 1, 1, 1),
(27993, 50304, 0, 1, 2, 1, 1),
(27993, 50305, 0, 1, 2, 1, 1),
(27993, 50306, 0, 1, 1, 1, 1),
(27993, 50308, 0, 1, 2, 1, 1),
(27993, 50309, 0, 1, 1, 1, 1),
(27993, 50310, 0, 1, 2, 1, 1),
(27993, 50311, 0, 1, 2, 1, 1),
(27993, 50312, 0, 1, 2, 1, 1),
(27993, 50313, 0, 1, 1, 1, 1),
(27993, 50314, 0, 1, 1, 1, 1);

DELETE FROM `gameobject_loot_template` WHERE (`entry`=27985);
INSERT INTO `gameobject_loot_template` VALUES 
(27985, 47241, 100, 1, 0, 1, 1),
(27985, 49839, 0, 1, 1, 1, 1),
(27985, 49840, 0, 1, 1, 1, 1),
(27985, 49841, 0, 1, 2, 1, 1),
(27985, 49842, 0, 1, 2, 1, 1),
(27985, 49843, 0, 1, 2, 1, 1),
(27985, 49844, 0, 1, 1, 1, 1),
(27985, 49845, 0, 1, 1, 1, 1),
(27985, 49846, 0, 1, 1, 1, 1),
(27985, 49847, 0, 1, 2, 1, 1),
(27985, 49848, 0, 1, 2, 1, 1),
(27985, 49849, 0, 1, 1, 1, 1),
(27985, 49851, 0, 1, 2, 1, 1);

-- GameObjects
-- Templates
DELETE FROM gameobject_template WHERE entry IN (201709, 202211, 190236, 196391, 196392, 197341, 197342, 197343, 201385, 201596, 201710, 201747, 201756, 201885, 201976, 202079, 202212, 202236, 202302, 202336, 202337, 202396, 500001, 500002, 500003);
INSERT INTO `gameobject_template` (`entry`, `TYPE`, `displayId`, `NAME`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
('201596','0','9223','Cave In','','','','1375','4','2','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('197342','0','9124','Doodad_IceCrown_Door_02','','','','1375','36','1','0','0','0','0','0','0','1','0','3','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('197343','0','9124','Doodad_IceCrown_Door_03','','','','1375','36','1','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201976','0','9124','Doodad_IceCrown_Door_04','','','','114','32','1','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('196391','31','8196','Doodad_InstanceNewPortal_Purple01','','','','0','0','2.72','0','0','0','0','0','0','632','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201747','31','8196','Doodad_InstanceNewPortal_Purple01','','','','0','0','2.72','0','0','0','0','0','0','668','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('196392','31','8197','Doodad_InstanceNewPortal_Purple_Skull01','','','','0','0','2.72','0','0','0','0','0','0','632','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201756','31','8197','Doodad_InstanceNewPortal_Purple_Skull01','','','','0','0','2.72','0','0','0','0','0','0','668','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202302','0','9301','Frostmourne','','','','1375','32','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202236','0','9294','Frostmourne Altar','','','','114','32','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('190236','0','7876','Gate','','','','114','32','0.88','0','0','0','0','0','0','0','0','3000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201385','0','9214','Ice Wall','','','','1375','1','2.5','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('500001','0','9214','Ice Wall','','','','1375','1','2.5','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1'),
('201885','0','9214','Ice Wall','','','','0','1','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202396','0','9214','Ice Wall','','','','114','33','2','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('197341','0','9124','Impenetrable Door','','','','1375','32','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202079','22','8111','Portal to Dalaran','','','','0','0','1','0','0','0','0','0','0','53141','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('201710','3','9280','The Captain\'s Chest','','','','1732','0','1','0','0','0','0','0','0','57','27985','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','12340'),
('202337','3','9281','The Captain\'s Chest','','','','1735','0','1','0','0','0','0','0','0','57','27993','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','12340'),
('202336','3','9280','The Captain\'s Chest','','','','1732','0','1','0','0','0','0','0','0','57','27993','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','12340'),
('202212','3','9281','The Captain\'s Chest','','','','1735','0','1','0','0','0','0','0','0','57','27985','0','1','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','0','','','11723'),
('201709','5','9288','Gunship Stairs','','','','0','1','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340'),
('202211','5','9289','Gunship Stairs','','','','0','1','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','12340');

-- Spawns
DELETE FROM gameobject WHERE map = 668 AND id IN (190236, 196391, 196392, 197341, 197342, 197343, 201385, 201596, 201710, 201747, 201756, 201885, 201976, 202079, 202212, 202236, 202302, 202336, 202337, 202396, 500001, 500002, 500003);
SET @GUID_GO := 153000;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GUID_GO,201747,668,3,1,5231.04,1923.79,707.044,0.810935,0,0,-0.370856,0.928691,6000,100,1),
(@GUID_GO+1,201756,668,3,1,5231.04,1923.79,707.044,0.810935,0,0,-0.370856,0.928691,6000,100,1),
(@GUID_GO+2,190236,668,3,1,4926.09,1554.96,163.292,-2.26562,0,0,0.999999,-0.001655,6000,100,1),
(@GUID_GO+3,202302,668,3,1,5309.51,2006.64,709.341,5.50041,0,0,0.381473,-0.92438,604800,100,1),
(@GUID_GO+4,202236,668,3,1,5309.51,2006.64,709.341,5.53575,0,0,0.365077,-0.930977,604800,100,1),
(@GUID_GO+5,201596,668,3,1,5275.28,1694.23,786.147,0.981225,0,0,0.471166,0.882044,25,0,0),
(@GUID_GO+6,500001,668,3,1,5323.61,1755.85,770.305,0.784186,0,0,0.382124,0.924111,604800,100,0),
(@GUID_GO+7,196391,668,3,1,5232.31,1925.57,707.695,0.815481,0,0,0.396536,0.918019,300,0,1),
(@GUID_GO+8,196392,668,3,1,5232.31,1925.57,707.695,0.815481,0,0,0.396536,0.918019,300,0,1),
(@GUID_GO+9,202396,668,3,1,5434.27,1881.12,751.303,0.923328,0,0,0.445439,0.895312,604800,100,0),
(@GUID_GO+10,201885,668,3,1,5494.3,1978.27,736.689,1.0885,0,0,0.517777,0.855516,604800,100,0),
(@GUID_GO+11,197341,668,3,1,5359.24,2058.35,707.695,3.96022,0,0,0.917394,-0.397981,300,100,1),
(@GUID_GO+12,201976,668,3,1,5264.6,1959.55,707.695,0.736951,0,0,0.360194,0.932877,300,100,0),
(@GUID_GO+13,197342,668,3,1,5520.72,2228.89,733.011,0.778581,0,0,0.379532,0.925179,300,100,1),
(@GUID_GO+14,197343,668,3,1,5582.96,2230.59,733.011,5.49098,0,0,0.385827,-0.922571,300,100,1),
(@GUID_GO+15,201385,668,3,1,5540.39,2086.48,731.066,1.00057,0,0,0.479677,0.877445,604800,100,0);

-- Fixed Ice Wall, which can be opened by the players
UPDATE `gameobject_template` SET `faction`=1375 WHERE entry=202396;

-- Icecrown Citadel

-- ICC intro
UPDATE creature SET npcflag = 1 WHERE id = 37187 AND `modelid` = 30583; -- Флаг госсипа ТОЛЬКО для ВП Саурфанга, который заспаунен для битвы с Саурфангом Смертоносным
UPDATE creature_template SET `npcflag` = 0 WHERE entry = 37187; -- При входе в инсту у ВП Саурфанга НЕ должно быть госсипов начали ивента с Саурфангом Смертоносным
UPDATE `creature` SET `phaseMask`='1' WHERE `guid`='136293';
SET @GUID := 136293;
SET @PATH_ID := @GUID*10;
DELETE FROM `waypoint_data` WHERE `id`=@PATH_ID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH_ID,0,-39.2257,2211.269,27.90252,0,0,0,100,0),
(@PATH_ID,1,-27.3663,2211.575,30.11564,0,0,0,100,0),
(@PATH_ID,2,-15.8420,2211.618,30.11566,0,0,0,100,0),
(@PATH_ID,3,2.744797,2211.411,30.11566,0,0,0,100,0),
(@PATH_ID,4,24.05210,2211.306,30.11566,0,0,0,100,0),
(@PATH_ID,5,64.72570,2211.561,30.11567,0,0,0,100,0);

-- Event before Sindragosa
UPDATE `creature_template` SET `ScriptName` = "sindragosas_ward" WHERE `entry` = 37503;
UPDATE `creature_template` SET `InhabitType`='4' WHERE `entry` IN (37501, 37232);
UPDATE `creature` SET `position_x` = 4180.43, `position_y` = 2485.01, `position_z` = 211.033, `orientation` = 3.15007, `phaseMask` = 1 WHERE id = 37503;

-- Trigger for zone buff
DELETE FROM `areatrigger_scripts` WHERE `entry` = 5608;
INSERT INTO `areatrigger_scripts`(`entry`,`ScriptName`) VALUES ('5608','at_zone_buff_checker');

-- NPC's for zone buff
UPDATE `creature_template` SET `ScriptName`='npc_hellscream_or_wyrnn_icc' WHERE `entry` IN (39371,39372);

-- Fix some slimes immunities
UPDATE `creature_template` SET `mechanic_immune_mask`='617299839' WHERE `entry` IN (37562,37697);
UPDATE `creature_template` SET `ScriptName`='npc_gas_cloud' WHERE `entry` = 37562;

-- Fix Lich teleport coordinates
UPDATE `spell_target_position` SET `target_position_z`='1045.857' WHERE `id`='70860';

-- Fix Sindragosa aggro
UPDATE `creature_template` SET `unit_flags` = 0 WHERE entry IN (36853, 38265, 38266, 38267);

-- Fix for prince loot
UPDATE creature_template SET dynamicflags = 8 WHERE entry IN (37970, 38401, 38784, 38785);

-- fix crash with NPC 38068 cast spel (recursion)
UPDATE `creature_template` SET `ScriptName`="", `spell1`='0' WHERE `entry` = 38068;

-- fix aggro for Rimefang and Spinestalker
UPDATE `creature_template` SET `InhabitType`=5 WHERE `entry` IN (37533, 37534);

-- Fix start Valithria encounter while enconter is DONE
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (38752, 16980);

-- Eat Slime Puddle
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES
('13', '70346', '18', '1', '37672', 'Mutated Abomination - Eat Slime Puddle'),
('13', '72456', '18', '1', '38285', 'Mutated Abomination - Eat Slime Puddle'),
('13', '72868', '18', '1', '37672', 'Mutated Abomination - Eat Slime Puddle'),
('13', '72869', '18', '1', '38285', 'Mutated Abomination - Eat Slime Puddle');

UPDATE `creature_template` SET `AIName` = 'PassiveAI', `flags_extra` = 2 WHERE `entry` IN (38309, 38308);
UPDATE `creature_template` SET `unit_flags` = 33554688 WHERE `entry` IN (36678, 38431, 38585, 38586);
DELETE FROM `creature_template_addon` WHERE `entry` IN (37133, 38133, 37127, 37134, 37132, 38125, 38126, 38131, 38132, 38133, 38130, 37122, 37123, 37124, 37125, 38298, 38299, 38303, 38304);

/* AREA TRIGGERS */
REPLACE INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES 
(5604, 'at_sindragosa_lair'),
(5698, 'at_icc_saurfang_portal'),
(5649, 'at_icc_shutdown_traps'),
(5729, 'at_icc_start_blood_quickening'),
(5616, 'at_icc_start_frostwing_gauntlet'),
(5617, 'at_icc_start_frostwing_gauntlet'),
(5618, 'at_icc_start_frostwing_gauntlet');

/* SCRIPT NAMES */
UPDATE `instance_template` SET `script`='instance_icecrown_citadel' WHERE `map`=631;
UPDATE `gameobject_template` SET `ScriptName`='icecrown_citadel_teleport' WHERE `entry` IN (202223,202235,202242,202243,202244,202245,202246);
UPDATE `creature_template` SET `ScriptName`='npc_highlord_tirion_fordring_lh' WHERE `entry`=37119;
UPDATE `creature_template` SET `ScriptName`='boss_lord_marrowgar' WHERE `entry`=36612;
UPDATE `creature_template` SET `ScriptName`='npc_coldflame' WHERE `entry`=36672;
UPDATE `creature_template` SET `ScriptName`='npc_bone_spike' WHERE `entry` IN (36619,38711,38712);
UPDATE `creature_template` SET `ScriptName`='boss_lady_deathwhisper' WHERE `entry`=36855;
UPDATE `creature_template` SET `ScriptName`='npc_cult_fanatic' WHERE `entry` IN (37890,38009,38135);
UPDATE `creature_template` SET `ScriptName`='npc_cult_adherent' WHERE `entry` IN(37949,38010,38136);
UPDATE `creature_template` SET `ScriptName`='npc_vengeful_shade' WHERE `entry`=38222;
UPDATE `creature_template` SET `ScriptName`='npc_darnavan' WHERE `entry` IN (38472,38485);
UPDATE `creature_template` SET `ScriptName`='npc_rotting_frost_giant' WHERE `entry` IN (38490,38494);
UPDATE `creature_template` SET `ScriptName`='boss_deathbringer_saurfang' WHERE `entry`=37813;
UPDATE `creature_template` SET `ScriptName`='npc_high_overlord_saurfang_icc' WHERE `entry`=37187;
UPDATE `creature_template` SET `ScriptName`='npc_muradin_bronzebeard_icc' WHERE `entry`=37200;
UPDATE `creature_template` SET `ScriptName`='npc_saurfang_event' WHERE `entry` IN (37920,37830);
UPDATE `creature_template` SET `ScriptName`='npc_frost_freeze_trap' WHERE `entry`=37744;
UPDATE `creature_template` SET `ScriptName`='npc_alchemist_adrianna' WHERE `entry`=38501;
UPDATE `creature_template` SET `ScriptName`='boss_festergut' WHERE `entry`=36626;
UPDATE `creature_template` SET `ScriptName`='npc_stinky_icc' WHERE `entry`=37025;
UPDATE `creature_template` SET `ScriptName`='boss_rotface' WHERE `entry`=36627;
UPDATE `creature_template` SET `ScriptName`='npc_little_ooze' WHERE `entry`=36897;
UPDATE `creature_template` SET `ScriptName`='npc_big_ooze' WHERE `entry`=36899;
UPDATE `creature_template` SET `ScriptName`='npc_precious_icc' WHERE `entry`=37217;
UPDATE `creature_template` SET `ScriptName`='boss_professor_putricide' WHERE `entry`=36678;
UPDATE `creature_template` SET `ScriptName`='npc_volatile_ooze' WHERE `entry`=37697;
UPDATE `creature_template` SET `ScriptName`='boss_blood_council_controller' WHERE `entry`=38008;
UPDATE `creature_template` SET `ScriptName`='boss_prince_keleseth_icc' WHERE `entry`=37972;
UPDATE `creature_template` SET `ScriptName`='boss_prince_taldaram_icc' WHERE `entry`=37973;
UPDATE `creature_template` SET `ScriptName`='boss_prince_valanar_icc' WHERE `entry`=37970;
UPDATE `creature_template` SET `ScriptName`='npc_blood_queen_lana_thel' WHERE `entry`=38004;
UPDATE `creature_template` SET `ScriptName`='npc_kinetic_bomb' WHERE `entry`=38454;
UPDATE `creature_template` SET `ScriptName`='npc_dark_nucleus' WHERE `entry`=38369;
UPDATE `creature_template` SET `ScriptName`='npc_ball_of_flame' WHERE `entry` IN (38332,38451);
UPDATE `creature_template` SET `ScriptName`='boss_blood_queen_lana_thel' WHERE `entry`=37955;
UPDATE `creature_template` SET `ScriptName`='boss_sister_svalna' WHERE `entry`=37126;
UPDATE `creature_template` SET `ScriptName`='npc_crok_scourgebane' WHERE `entry`=37129;
UPDATE `creature_template` SET `ScriptName`='npc_captain_arnath' WHERE `entry`=37122;
UPDATE `creature_template` SET `ScriptName`='npc_captain_brandon' WHERE `entry`=37123;
UPDATE `creature_template` SET `ScriptName`='npc_captain_grondel' WHERE `entry`=37124;
UPDATE `creature_template` SET `ScriptName`='npc_captain_rupert' WHERE `entry`=37125;
UPDATE `creature_template` SET `ScriptName`='npc_frostwing_vrykul' WHERE `entry` IN (37132,38125,37127,37134,37133);
UPDATE `creature_template` SET `ScriptName`='npc_impaling_spear' WHERE `entry`=38248;
UPDATE `creature_template` SET `ScriptName`='boss_valithria_dreamwalker' WHERE `entry`=36789;
UPDATE `creature_template` SET `ScriptName`='npc_green_dragon_combat_trigger' WHERE `entry`=38752;
UPDATE `creature_template` SET `ScriptName`='npc_the_lich_king_controller' WHERE `entry`=16980;
UPDATE `creature_template` SET `ScriptName`='npc_risen_archmage' WHERE `entry`=37868;
UPDATE `creature_template` SET `ScriptName`='npc_blazing_skeleton' WHERE `entry`=36791;
UPDATE `creature_template` SET `ScriptName`='npc_suppresser' WHERE `entry`=37863;
UPDATE `creature_template` SET `ScriptName`='npc_blistering_zombie' WHERE `entry`=37934;
UPDATE `creature_template` SET `ScriptName`='npc_gluttonous_abomination' WHERE `entry`=37886;
UPDATE `creature_template` SET `ScriptName`='npc_dream_portal' WHERE `entry` IN (37945,38430);
UPDATE `creature_template` SET `ScriptName`='npc_dream_cloud' WHERE `entry` IN (37985,38421);
UPDATE `creature_template` SET `ScriptName`='boss_sindragosa' WHERE `entry`=36853;
UPDATE `creature_template` SET `ScriptName`='npc_ice_tomb' WHERE `entry`=36980;
UPDATE `creature_template` SET `ScriptName`='npc_spinestalker' WHERE `entry`=37534;
UPDATE `creature_template` SET `ScriptName`='npc_rimefang_icc' WHERE `entry`=37533;
UPDATE `creature_template` SET `ScriptName`='npc_sindragosa_trash' WHERE `entry` IN (37531,37532);
UPDATE `creature_template` SET `mindmg` = '1100',`maxdmg` = '1300' WHERE `entry` =37007;
UPDATE `creature_template` SET `mindmg` = '1100',`maxdmg` = '1200' WHERE `entry` =38031;
UPDATE `creature_template` SET `dmg_multiplier` = '10.5' WHERE `entry` =36724;
UPDATE `creature_template` SET `dmg_multiplier` = '19' WHERE `entry` =38057;
UPDATE `creature_template` SET `dmg_multiplier` = '10' WHERE `entry` =37012;
UPDATE `creature_template` SET `dmg_multiplier` = '17.5' WHERE `entry` =38059;
UPDATE `creature_template` SET `dmg_multiplier` = '10' WHERE `entry` =37011;
UPDATE `creature_template` SET `dmg_multiplier` = '16' WHERE `entry` =38061;
UPDATE `creature_template` SET `ScriptName` = 'npc_ancient_skeletal_soldier' WHERE `entry` IN (37012);
UPDATE `creature_template` SET `ScriptName` = 'npc_deathbound_ward' WHERE `entry` IN (37007);
UPDATE `creature_template` SET `ScriptName` = 'npc_servant_of_the_throne' WHERE `entry` IN (36724);
UPDATE `creature_template` SET `ScriptName` = 'npc_the_damned' WHERE `entry` IN (37011);
UPDATE `creature_template` SET `ScriptName` = 'npc_pustulating_horror' WHERE `entry` IN (10404);
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_servant' WHERE `entry` IN (36805);
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_disciple' WHERE `entry` IN (36807);
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_zealot' WHERE `entry` IN (36808);
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_attendant' WHERE `entry` IN (36811);
UPDATE `creature_template` SET `ScriptName` = 'npc_deathspeaker_high_priest' WHERE `entry` IN (36829);
UPDATE `creature_template` SET `ScriptName` = 'npc_blighted_abomination' WHERE `entry` IN (37022);
UPDATE `creature_template` SET `ScriptName` = 'npc_plague_scientist' WHERE `entry` IN (37023);
UPDATE `creature_template` SET `ScriptName` = 'npc_vengeful_fleshreapert' WHERE `entry` IN (37038);
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_advisor' WHERE `entry` IN (37571);
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_blood_knight' WHERE `entry` IN (37595);
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_commander' WHERE `entry` IN (37662);
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_noble' WHERE `entry` IN (37663);
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_archmage' WHERE `entry` IN (37664);
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_lieutenant' WHERE `entry` IN (37665);
UPDATE `creature_template` SET `ScriptName` = 'npc_darkfallen_tactician' WHERE `entry` IN (37666);
REPLACE INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
( 69057, 'spell_marrowgar_bone_spike_graveyard'),
( 70826, 'spell_marrowgar_bone_spike_graveyard'),
( 72088, 'spell_marrowgar_bone_spike_graveyard'),
( 72089, 'spell_marrowgar_bone_spike_graveyard'),
( 69140, 'spell_marrowgar_coldflame'),
( 72705, 'spell_marrowgar_coldflame'),
( 69146, 'spell_marrowgar_coldflame_damage'),
( 70823, 'spell_marrowgar_coldflame_damage'),
( 70824, 'spell_marrowgar_coldflame_damage'),
( 70825, 'spell_marrowgar_coldflame_damage'),
( 69075, 'spell_marrowgar_bone_storm'),
( 70834, 'spell_marrowgar_bone_storm'),
( 70835, 'spell_marrowgar_bone_storm'),
( 70836, 'spell_marrowgar_bone_storm'),
( 70842, 'spell_deathwhisper_mana_barrier'),
( 70903, 'spell_cultist_dark_martyrdom'),
( 72498, 'spell_cultist_dark_martyrdom'),
( 72499, 'spell_cultist_dark_martyrdom'),
( 72500, 'spell_cultist_dark_martyrdom'),
( 71236, 'spell_cultist_dark_martyrdom'),
( 72495, 'spell_cultist_dark_martyrdom'),
( 72496, 'spell_cultist_dark_martyrdom'),
( 72497, 'spell_cultist_dark_martyrdom'),
( 72864, 'spell_frost_giant_death_plague'),
( 72202, 'spell_deathbringer_blood_link'),
( 72178, 'spell_deathbringer_blood_link_aura'),
( 72371, 'spell_deathbringer_blood_power'),
( 72409, 'spell_deathbringer_rune_of_blood'),
( 72447, 'spell_deathbringer_rune_of_blood'),
( 72448, 'spell_deathbringer_rune_of_blood'),
( 72449, 'spell_deathbringer_rune_of_blood'),
( 72380, 'spell_deathbringer_blood_nova'),
( 72438, 'spell_deathbringer_blood_nova'),
( 72439, 'spell_deathbringer_blood_nova'),
( 72440, 'spell_deathbringer_blood_nova'),
( 72378, 'spell_deathbringer_blood_nova_targeting'),
( 73058, 'spell_deathbringer_blood_nova_targeting'),
( 72255, 'spell_deathbringer_mark_of_the_fallen_champion'),
( 72444, 'spell_deathbringer_mark_of_the_fallen_champion'),
( 72445, 'spell_deathbringer_mark_of_the_fallen_champion'),
( 72446, 'spell_deathbringer_mark_of_the_fallen_champion'),
( 72155, 'spell_icc_harvest_blight_specimen'),
( 72162, 'spell_icc_harvest_blight_specimen'),
( 71123, 'spell_stinky_precious_decimate'),
( 73032, 'spell_festergut_pungent_blight'),
( 73031, 'spell_festergut_pungent_blight'),
( 71219, 'spell_festergut_pungent_blight'),
( 69195, 'spell_festergut_pungent_blight'),
( 72219, 'spell_festergut_gastric_bloat'),
( 72551, 'spell_festergut_gastric_bloat'),
( 72552, 'spell_festergut_gastric_bloat'),
( 72553, 'spell_festergut_gastric_bloat'),
( 69290, 'spell_festergut_blighted_spores'),
( 71222, 'spell_festergut_blighted_spores'),
( 73033, 'spell_festergut_blighted_spores'),
( 73034, 'spell_festergut_blighted_spores'),
( 69159, 'spell_festergut_gaseous_blight'),
( 70135, 'spell_festergut_gaseous_blight'),
( 70136, 'spell_festergut_gaseous_blight'),
( 70137, 'spell_festergut_gaseous_blight'),
( 69161, 'spell_festergut_gaseous_blight'),
( 70138, 'spell_festergut_gaseous_blight'),
( 70139, 'spell_festergut_gaseous_blight'),
( 70140, 'spell_festergut_gaseous_blight'),
( 69163, 'spell_festergut_gaseous_blight'),
( 70468, 'spell_festergut_gaseous_blight'),
( 70469, 'spell_festergut_gaseous_blight'),
( 70470, 'spell_festergut_gaseous_blight'),
( 69782, 'spell_rotface_ooze_flood'),
( 69796, 'spell_rotface_ooze_flood'),
( 69798, 'spell_rotface_ooze_flood'),
( 69801, 'spell_rotface_ooze_flood'),
( 69538, 'spell_rotface_little_ooze_combine'),
( 69553, 'spell_rotface_large_ooze_combine'),
( 69610, 'spell_rotface_large_ooze_buff_combine'),
( 69839, 'spell_rotface_unstable_ooze_explosion_init'),
( 69832, 'spell_rotface_unstable_ooze_explosion'),
( 71441, 'spell_rotface_unstable_ooze_explosion_suicide'),
( 69507, 'spell_rotface_slime_spray'),
( 71213, 'spell_rotface_slime_spray'),
( 73189, 'spell_rotface_slime_spray'),
( 73190, 'spell_rotface_slime_spray'),
( 70701, 'spell_putricide_expunged_gas'),
( 70343, 'spell_putricide_slime_puddle'),
( 70351, 'spell_putricide_unstable_experiment'),
( 71966, 'spell_putricide_unstable_experiment'),
( 71967, 'spell_putricide_unstable_experiment'),
( 71968, 'spell_putricide_unstable_experiment'),
( 71412, 'spell_putricide_ooze_summon'),
( 71415, 'spell_putricide_ooze_summon'),
( 70672, 'spell_putricide_gaseous_bloat'),
( 72455, 'spell_putricide_gaseous_bloat'),
( 72832, 'spell_putricide_gaseous_bloat'),
( 72833, 'spell_putricide_gaseous_bloat'),
( 70447, 'spell_putricide_ooze_channel'),
( 72836, 'spell_putricide_ooze_channel'),
( 72837, 'spell_putricide_ooze_channel'),
( 72838, 'spell_putricide_ooze_channel'),
( 70672, 'spell_putricide_ooze_channel'),
( 72455, 'spell_putricide_ooze_channel'),
( 72832, 'spell_putricide_ooze_channel'),
( 72833, 'spell_putricide_ooze_channel'),
( 70459, 'spell_putricide_ooze_eruption_searcher'),
( 71255, 'spell_putricide_choking_gas_bomb'),
( 70920, 'spell_putricide_unbound_plague'),
( 70360, 'spell_putricide_eat_ooze'),
( 72527, 'spell_putricide_eat_ooze'),
( 72451, 'spell_putricide_mutated_plague'),
( 72463, 'spell_putricide_mutated_plague'),
( 72671, 'spell_putricide_mutated_plague'),
( 72672, 'spell_putricide_mutated_plague'),
( 70308, 'spell_putricide_mutation_init'),
( 70311, 'spell_putricide_mutated_transformation'),
( 71503, 'spell_putricide_mutated_transformation'),
( 70405, 'spell_putricide_mutated_transformation_dismiss'),
( 72508, 'spell_putricide_mutated_transformation_dismiss'),
( 72509, 'spell_putricide_mutated_transformation_dismiss'),
( 72510, 'spell_putricide_mutated_transformation_dismiss'),
( 70402, 'spell_putricide_mutated_transformation_dmg'),
( 72511, 'spell_putricide_mutated_transformation_dmg'),
( 72512, 'spell_putricide_mutated_transformation_dmg'),
( 72513, 'spell_putricide_mutated_transformation_dmg'),
( 70539, 'spell_putricide_regurgitated_ooze'),
( 72457, 'spell_putricide_regurgitated_ooze'),
( 72875, 'spell_putricide_regurgitated_ooze'),
( 72876, 'spell_putricide_regurgitated_ooze'),
( 71598, 'spell_creature_permanent_feign_death'),
( 71806, 'spell_taldaram_glittering_sparks'),
( 71718, 'spell_taldaram_summon_flame_ball'),
( 72040, 'spell_taldaram_summon_flame_ball'),
( 55891, 'spell_taldaram_flame_ball_visual'),
( 55947, 'spell_taldaram_flame_ball_visual'),
( 71756, 'spell_taldaram_ball_of_inferno_flame'),
( 72782, 'spell_taldaram_ball_of_inferno_flame'),
( 72783, 'spell_taldaram_ball_of_inferno_flame'),
( 72784, 'spell_taldaram_ball_of_inferno_flame'),
( 72080, 'spell_valanar_kinetic_bomb'),
( 72087, 'spell_valanar_kinetic_bomb_knockback'),
( 72054, 'spell_valanar_kinetic_bomb_absorb'),
( 73001, 'spell_blood_council_shadow_prison'),
( 72999, 'spell_blood_council_shadow_prison_damage'),
( 70877, 'spell_blood_queen_frenzied_bloodthirst'),
( 71474, 'spell_blood_queen_frenzied_bloodthirst'),
( 70946, 'spell_blood_queen_vampiric_bite'),
( 71475, 'spell_blood_queen_vampiric_bite'),
( 71476, 'spell_blood_queen_vampiric_bite'),
( 71477, 'spell_blood_queen_vampiric_bite'),
( 71899, 'spell_blood_queen_bloodbolt'),
( 71900, 'spell_blood_queen_bloodbolt'),
( 71901, 'spell_blood_queen_bloodbolt'),
( 71902, 'spell_blood_queen_bloodbolt'),
( 71390, 'spell_blood_queen_pact_of_the_darkfallen'),
( 71340, 'spell_blood_queen_pact_of_the_darkfallen_dmg'),
( 71341, 'spell_blood_queen_pact_of_the_darkfallen_dmg_target'),
( 70078, 'spell_svalna_caress_of_death'),
( 70053, 'spell_svalna_revive_champion'),
( 71462, 'spell_svalna_remove_spear'),
( 71085, 'spell_dreamwalker_mana_void'),
( 70915, 'spell_dreamwalker_decay_periodic_timer'),
( 70912, 'spell_dreamwalker_decay_periodic_timer'),
( 70916, 'spell_dreamwalker_decay_periodic_timer'),
( 70913, 'spell_dreamwalker_decay_periodic_timer'),
( 70921, 'spell_dreamwalker_summoner'),
( 70912, 'spell_dreamwalker_summon_suppresser'),
( 71032, 'spell_dreamwalker_summoner'),
( 71078, 'spell_dreamwalker_summoner'),
( 70933, 'spell_dreamwalker_summoner'),
( 72224, 'spell_dreamwalker_summon_dream_portal'),
( 72480, 'spell_dreamwalker_summon_nightmare_portal'),
( 71970, 'spell_dreamwalker_nightmare_cloud'),
( 72868, 'spell_putricide_slime_puddle_aura'),
( 72869, 'spell_putricide_slime_puddle_aura'),
( 71357, 'spell_frostwarden_handler_order_whelp'),
( 71350, 'spell_frostwarden_handler_focus_fire'),
( 71376, 'spell_rimefang_icy_blast'),
( 70598, 'spell_sindragosa_s_fury'),
( 69762, 'spell_sindragosa_unchained_magic'),
( 69766, 'spell_sindragosa_instability'),
( 70126, 'spell_sindragosa_frost_beacon'),
( 69712, 'spell_sindragosa_ice_tomb'),
( 69675, 'spell_sindragosa_ice_tomb_dummy'),
( 70157, 'spell_sindragosa_ice_tomb_trap'),
( 69845, 'spell_sindragosa_collision_filter'),
( 71053, 'spell_sindragosa_collision_filter'),
( 71054, 'spell_sindragosa_collision_filter'),
( 71055, 'spell_sindragosa_collision_filter'),
( 70127, 'spell_sindragosa_collision_filter'),
( 72528, 'spell_sindragosa_collision_filter'),
( 72529, 'spell_sindragosa_collision_filter'),
( 72530, 'spell_sindragosa_collision_filter'),
( 70117, 'spell_sindragosa_collision_filter'),
( 70117, 'spell_sindragosa_icy_grip'),
( 70733, 'spell_icc_stoneform'),
( 70546, 'spell_icc_sprit_alarm'),
( 70536, 'spell_icc_sprit_alarm'),
( 70545, 'spell_icc_sprit_alarm'),
( 70547, 'spell_icc_sprit_alarm');

DELETE FROM `creature_text` WHERE `entry` IN (16980,36789,37491,37493,37494,37495);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(16980,0,0, 'Intruders have breached the inner sanctum. Hasten the destruction of the green dragon! Leave only bones and sinew for the reanimation!',14,0,0,0,0,17251,'The Lich King - SAY_LICH_KING_INTRO'),
(36789,0,0, 'Heroes, lend me your aid. I... I cannot hold them off much longer. You must heal my wounds!',14,0,0,0,0,17064,'Valithria Dreamwalker - SAY_VALITHRIA_ENTER_COMBAT'),
(36789,1,0, 'I have opened a portal into the Dream. Your salvation lies within, heroes...',14,0,0,0,0,17068,'Valithria Dreamwalker - SAY_VALITHRIA_DREAM_PORTAL'),
(36789,2,0, 'My strength is returning! Press on, heroes!',14,0,0,0,0,17070,'Valithria Dreamwalker - SAY_VALITHRIA_75_PERCENT'),
(36789,3,0, 'I will not last much longer!',14,0,0,0,0,17069,'Valithria Dreamwalker - SAY_VALITHRIA_25_PERCENT'),
(36789,4,0, 'Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!',14,0,0,0,0,17072,'Valithria Dreamwalker - SAY_VALITHRIA_DEATH'),
(36789,5,0, 'A tragic loss...',14,0,0,0,0,17066,'Valithria Dreamwalker - SAY_VALITHRIA_PLAYER_DEATH'),
(36789,6,0, 'FAILURES!',14,0,0,0,0,17067,'Valithria Dreamwalker - SAY_VALITHRIA_BERSERK'),
(36789,7,0, 'I am renewed! Ysera grants me the favor to lay these foul creatures to rest!',14,0,0,0,0,17071,'Valithria Dreamwalker - SAY_VALITHRIA_SUCCESS'),
(37491,1,0, 'You miserable fools never did manage to select a decent bat wing.',1,0,0,0,0,16587, 'Captain Arnath - SAY_ARNATH_RESURRECTED'),
(37491,2,0, 'THAT was for bringing me spoiled spider ichor!',1,0,0,0,0,16588, 'Captain Arnath - SAY_ARNATH_KILL'),
(37491,3,0, 'Don''t... let Finklestein use me... for his potions...',1,0,0,0,0,16589, 'Captain Arnath - SAY_ARNATH_SECOND_DEATH'),
(37493,1,0, 'What? This strength...? All of the pain is gone! You... must join me in the eternal embrace of death!',1,0,0,0,0,16811, 'Captain Brandon - SAY_BRANDON_RESURRECTED'),
(37493,2,0, 'It doesn''t hurt anymore, does it?',1,0,0,0,0,16812, 'Captain Brandon - SAY_BRANDON_KILL'),
(37493,3,0, 'I''m sorry...',1,0,0,0,0,16813, 'Captain Brandon - SAY_BRANDON_SECOND_DEATH'),
(37494,1,0, 'No! Why was I denied a death by flame? You must all BURN!',1,0,0,0,0,16845, 'Captain Grondel - SAY_GRONDEL_RESURRECTED'),
(37494,2,0, 'Can you feel the burn?',1,0,0,0,0,16846, 'Captain Grondel - SAY_GRONDEL_KILL'),
(37494,3,0, 'What... have I done? No!',1,0,0,0,0,16847, 'Captain Grondel - SAY_GRONDEL_SECOND_DEATH'),
(37495,1,0, 'There is no escaping the Lich King''s will. Prepare for an explosive encounter!',1,0,0,0,0,16999, 'Captain Rupert - SAY_RUPERT_RESURRECTED'),
(37495,2,0, 'So that''s what happens when you stand too close to a bomb!',1,0,0,0,0,17000, 'Captain Rupert - SAY_RUPERT_KILL'),
(37495,3,0, 'What an... explosive ending!',1,0,0,0,0,17001, 'Captain Rupert - SAY_RUPERT_SECOND_DEATH');

DELETE FROM `creature_text` WHERE `entry`=36853;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(36853,0,0, 'You are fools to have come to this place! The icy winds of Northrend will consume your souls!',1,0,0,0,0,17007, 'Sindragosa - SAY_AGGRO'),
(36853,1,0, 'Suffer, mortals, as your pathetic magic betrays you!',1,0,0,0,0,17014, 'Sindragosa - SAY_UNCHAINED_MAGIC'),
(36853,2,0, '%s prepares to unleash a wave of blistering cold!',3,0,0,0,0,0, 'Sindragosa - EMOTE_WARN_BLISTERING_COLD'),
(36853,3,0, 'Can you feel the cold hand of death upon your heart?',1,0,0,0,0,17013, 'Sindragosa - SAY_BLISTERING_COLD'),
(36853,4,0, 'Aaah! It burns! What sorcery is this?!',1,0,0,0,0,17015, 'Sindragosa - SAY_RESPITE_FOR_A_TORMENTED_SOUL'),
(36853,5,0, 'Your incursion ends here! None shall survive!',1,0,0,0,0,17012, 'Sindragosa - SAY_AIR_PHASE'),
(36853,6,0, 'Now feel my master''s limitless power and despair!',1,0,0,0,0,17016, 'Sindragosa - SAY_PHASE_2'),
(36853,7,0, '%s fires a frozen orb towards $N!',3,0,0,0,0,0, 'Sindragosa - EMOTE_WARN_FROZEN_ORB'),
(36853,8,0, 'Perish!',1,0,0,0,0,17008, 'Sindragosa - SAY_KILL 1'),
(36853,8,1, 'A flaw of mortality...',1,0,0,0,0,17009, 'Sindragosa - SAY_KILL 2'),
(36853,9,0, 'Enough! I tire of these games!',1,0,0,0,0,17011, 'Sindragosa - SAY_BERSERK'),
(36853,10,0, 'Free...at last...',1,0,0,0,0,17010, 'Sindragosa - SAY_DEATH');

-- [10468] ICC texts (Shauren)
DELETE FROM `creature_text` WHERE `entry` IN (36612,36626,36627,36678,36855,37187,37188,37200,37813,37879,37970,37972,37973,38004);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`sound`,`language`,`probability`,`emote`,`duration`,`comment`) VALUES
(36612,0,0,'This is the beginning AND the end, mortals. None may enter the master''s sanctum!',1,16950,0,0,0,0,'Lord Marrowgar - SAY_ENTER_ZONE'),
(36612,1,0,'The Scourge will wash over this world as a swarm of death and destruction!',1,16941,0,0,0,0,'Lord Marrowgar - SAY_AGGRO'),
(36612,2,0,'BONE STORM!',1,16946,0,0,0,0,'Lord Marrowgar - SAY_BONE_STORM'),
(36612,3,0,'Bound by bone!',1,16947,0,0,0,0,'Lord Marrowgar - SAY_BONESPIKE_1'),
(36612,3,1,'Stick Around!',1,16948,0,0,0,0,'Lord Marrowgar - SAY_BONESPIKE_2'),
(36612,3,2,'The only escape is death!',1,16949,0,0,0,0,'Lord Marrowgar - SAY_BONESPIKE_3'),
(36612,4,0,'More bones for the offering!',1,16942,0,0,0,0,'Lord Marrowgar - SAY_KILL_1'),
(36612,4,1,'Languish in damnation!',1,16943,0,0,0,0,'Lord Marrowgar - SAY_KILL_2'),
(36612,5,0,'I see... only darkness...',1,16944,0,0,0,0,'Lord Marrowgar - SAY_DEATH'),
(36612,6,0,'THE MASTER''S RAGE COURSES THROUGH ME!',1,16945,0,0,0,0,'Lord Marrowgar - SAY_BERSERK'),
(36612,7,0,'Lord Marrowgar creates a whirling storm of bone!',3,0,0,0,0,0,'Lord Marrowgar - SAY_BONE_STORM_EMOTE'),
(36626,0,0,'NOOOO! You kill Stinky! You pay!',1,16907,0,0,0,0,'Festergut - SAY_STINKY_DEAD'),
(36626,1,0,'Fun time!',1,16901,0,0,0,0,'Festergut - SAY_AGGRO'),
(36626,2,0,'%s farts.',2,16911,0,0,0,0,'Festergut - EMOTE_GAS_SPORE'),
(36626,3,0,'%s releases Gas Spores!',3,0,0,0,0,0,'Festergut - EMOTE_WARN_GAS_SPORE'),
(36626,4,0,'Gyah! Uhhh, I not feel so good...',1,16906,0,0,0,0,'Festergut - SAY_PUNGENT_BLIGHT'),
(36626,5,0,'%s begins to cast |cFFFF7F00Pungent Blight!|r',3,0,0,0,0,0,'Festergut - EMOTE_WARN_PUNGENT_BLIGHT'),
(36626,6,0,'%s vomits.',2,0,0,0,0,0,'Festergut - EMOTE_PUNGENT_BLIGHT'),
(36626,7,0,'Daddy, I did it!',1,16902,0,0,0,0,'Festergut - SAY_KILL_1'),
(36626,7,1,'Dead, dead, dead!',1,16903,0,0,0,0,'Festergut - SAY_KILL_2'),
(36626,8,0,'Fun time over!',1,16905,0,0,0,0,'Festergut - SAY_BERSERK'),
(36626,9,0,'Da ... Ddy...',1,16904,0,0,0,0,'Festergut - SAY_DEATH'),
(36627,0,0,'What? Precious? Noooooooooo!!!',1,16993,0,0,0,0,'Rotface - SAY_PRECIOUS_DIES'),
(36627,1,0,'WEEEEEE!',1,16986,0,0,0,0,'Rotface - SAY_AGGRO'),
(36627,2,0,'%s begins to cast Slime Spray!',3,0,0,0,0,0,'Rotface - EMOTE_SLIME_SPRAY'),
(36627,3,0,'Icky sticky.',1,16991,0,0,0,0,'Rotface - SAY_SLIME_SPRAY'),
(36627,4,0,'|TInterfaceIconsspell_shadow_unstableaffliction_2.blp:16|t%s begins to cast |cFFFF0000Unstable Ooze Explosion!|r',3,0,0,0,0,0,'Rotface - EMOTE_UNSTABLE_EXPLOSION'),
(36627,5,0,'I think I made an angry poo-poo. It gonna blow!',1,16992,0,0,0,0,'Rotface - SAY_UNSTABLE_EXPLOSION'),
(36627,6,0,'Daddy make toys out of you!',1,16988,0,0,0,0,'Rotface - SAY_KILL_1'),
(36627,6,1,'I brokes-ded it...',1,16987,0,0,0,0,'Rotface - SAY_KILL_2'),
(36627,7,0,'Sleepy Time!',1,16990,0,0,0,0,'Rotface - SAY_BERSERK'),
(36627,8,0,'Bad news daddy...',1,16989,0,0,0,0,'Rotface - SAY_DEATH'),
(36678,0,0,'Just an ordinary gas cloud. But watch out, because that''s no ordinary gas cloud!',1,17119,0,0,432,0,'Professor Putricide - SAY_GASEOUS_BLIGHT'),
(36678,1,0,'Oh, Festergut. You were always my favorite. Next to Rotface. The good news is you left behind so much gas, I can practically taste it!',1,17124,0,0,0,0,'Professor Putricide - SAY_FESTERGUT_DEATH'),
(36678,2,0,'Great news, everyone! The slime is flowing again!',1,17126,0,0,1,0,'Professor Putricide - SAY_ROTFACE_OOZE_FLOOD1'),
(36678,2,1,'Good news, everyone! I''ve fixed the poison slime pipes!',1,17123,0,0,1,0,'Professor Putricide - SAY_ROTFACE_OOZE_FLOOD2'),
(36678,3,0,'Terrible news, everyone, Rotface is dead! But great news everyone, he left behind plenty of ooze for me to use! Whaa...? I''m a poet, and I didn''t know it? Astounding!',1,17146,0,0,0,0,'Professor Putricide - SAY_ROTFACE_DEATH'),
(36678,4,0,'Good news, everyone! I think I perfected a plague that will destroy all life on Azeroth!',1,17114,0,0,0,0,'Professor Putricide - SAY_AGGRO'),
(36678,5,0,'%s begins to cast Unstable Experiment!',3,0,0,0,0,0,'Professor Putricide - EMOTE_UNSTABLE_EXPERIMENT'),
(36678,6,0,'Two oozes, one room! So many delightful possibilities...',1,17122,0,0,0,0,'Professor Putricide - SAY_PHASE_TRANSITION_HEROIC'),
(36678,7,0,'Hmm. I don''t feel a thing. Whaa...? Where''d those come from?',1,17120,0,0,15,0,'Professor Putricide - SAY_TRANSFORM_1'),
(36678,8,0,'Tastes like... Cherry! Oh! Excuse me!',1,17121,0,0,15,0,'Professor Putricide - SAY_TRANSFORM_2'),
(36678,9,0,'|TInterfaceIconsinv_misc_herb_evergreenmoss.blp:16|t%s cast |cFF00FF00Malleable Goo!|r',3,0,0,0,0,0,'Professor Putricide - EMOTE_MALLEABLE_GOO'),
(36678,10,0,'%s cast |cFFFF7F00Choking Gas Bomb!|r',3,0,0,0,0,0,'Professor Putricide - EMOTE_CHOKING_GAS_BOMB'),
(36678,11,0,'Hmm... Interesting...',1,17115,0,0,0,0,'Professor Putricide - SAY_KILL_1'),
(36678,11,1,'That was unexpected!',1,17116,0,0,0,0,'Professor Putricide - SAY_KILL_2'),
(36678,12,0,'Great news, everyone!',1,17118,0,0,0,0,'Professor Putricide - SAY_BERSERK'),
(36678,13,0,'Bad news, everyone! I don''t think I''m going to make it.',1,17117,0,0,0,0,'Professor Putricide - SAY_DEATH'),
(36855,0,0,'You have found your way here, because you are among the few gifted with true vision in a world cursed with blindness.',1,17272,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_1'),
(36855,1,0,'You can see through the fog that hangs over this world like a shroud, and grasp where true power lies.',1,17273,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_2'),
(36855,2,0,'Fix your eyes upon your crude hands: the sinew, the soft meat, the dark blood coursing within.',1,16878,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_3'),
(36855,3,0,'It is a weakness; a crippling flaw.... A joke played by the Creators upon their own creations.',1,17268,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_4'),
(36855,4,0,'The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it.',1,17269,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_5'),
(36855,5,0,'Through our Master, all things are possible. His power is without limit, and his will unbending.',1,17270,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_6'),
(36855,6,0,'Those who oppose him will be destroyed utterly, and those who serve -- who serve wholly, unquestioningly, with utter devotion of mind and soul -- elevated to heights beyond your ken.',1,17271,0,0,0,0,'Lady Deathwhisper - SAY_INTRO_7'),
(36855,7,0,'What is this disturbance?! You dare trespass upon this hallowed ground? This shall be your final resting place.',1,16868,0,0,0,0,'Lady Deathwhisper - SAY_AGGRO'),
(36855,8,0,'Enough! I see I must take matters into my own hands!',1,16877,0,0,0,0,'Lady Deathwhisper - SAY_PHASE_2'),
(36855,9,0,'%s''s Mana Barrier shimmers and fades away!',3,0,0,0,0,0,'Lady Deathwhisper - SAY_PHASE_2_EMOTE'),
(36855,10,0,'You are weak, powerless to resist my will!',1,16876,0,0,0,0,'Lady Deathwhisper - SAY_DOMINATE_MIND'),
(36855,11,0,'Take this blessing and show these intruders a taste of our master''s power.',1,16873,0,0,0,0,'Lady Deathwhisper - SAY_DARK_EMPOWERMENT'),
(36855,12,0,'I release you from the curse of flesh!',1,16874,0,0,0,0,'Lady Deathwhisper - SAY_DARK_TRANSFORMATION'),
(36855,13,0,'Arise and exult in your pure form!',1,16875,0,0,0,0,'Lady Deathwhisper - SAY_ANIMATE_DEAD'),
(36855,14,0,'Do you yet grasp of the futility of your actions?',1,16869,0,0,0,0,'Lady Deathwhisper - SAY_KILL_1'),
(36855,14,1,'Embrace the darkness... Darkness eternal!',1,16870,0,0,0,0,'Lady Deathwhisper - SAY_KILL_2'),
(36855,15,0,'This charade has gone on long enough.',1,16872,0,0,0,0,'Lady Deathwhisper - SAY_BERSERK'),
(36855,16,0,'All part of the masters plan! Your end is... inevitable!',1,16871,0,0,0,0,'Lady Deathwhisper - SAY_DEATH'),
(37187,0,0,'Kor''kron, move out! Champions, watch your backs. The Scourge have been...',1,17103,0,0,22,0,'High Overlord Saurfang - SAY_INTRO_HORDE_1'),
(37187,1,0,'My boy died at the Wrath Gate. I am here only to collect his body.',0,17097,0,0,397,0,'High Overlord Saurfang - SAY_INTRO_HORDE_3'),
(37187,2,0,'We named him Dranosh. It means \"Heart of Draenor\" in orcish. I would not let the warlocks take him. My boy would be safe, hidden away by the elders of Garadar.',0,17098,0,0,1,0,'High Overlord Saurfang - SAY_INTRO_HORDE_5'),
(37187,3,0,'I made a promise to his mother before she died; that I would cross the Dark Portal alone - whether I lived or died, my son would be safe. Untainted...',0,17099,0,0,1,0,'High Overlord Saurfang - SAY_INTRO_HORDE_6'),
(37187,4,0,'Today, I fulfill that promise.',0,17100,0,0,397,0,'High Overlord Saurfang - SAY_INTRO_HORDE_7'),
(37187,5,0,'High Overlord Saurfang charges!',2,17104,0,0,53,0,'High Overlord Saurfang - SAY_INTRO_HORDE_8'),
(37187,6,0,'Behind you lies the body of my only son. Nothing will keep me from him.',0,17094,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_8'),
(37187,7,0,'High Overlord Saurfang walks over to his son and kneels before his son''s body.',2,0,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_12'),
(37187,8,0,'[Orcish] No''ku kil zil''nok ha tar.',0,17096,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_13'),
(37187,9,0,'Higher Overlord Saurfang picks up the body of his son and walks over towards Varian',2,0,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_14'),
(37187,10,0,'I will not forget this... kindness. I thank you, Highness',0,17095,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_ALLIANCE_15'),
(37187,11,0,'%s coughs.',2,17105,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_HORDE_1'),
(37187,12,0,'%s weeps over the corpse of his son.',2,17106,0,0,15,0,'High Overlord Saurfang - SAY_OUTRO_HORDE_2'),
(37187,13,0,'You will have a proper ceremony in Nagrand next to the pyres of your mother and ancestors.',0,17101,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_HORDE_3'),
(37187,14,0,'Honor, young heroes... no matter how dire the battle... Never forsake it!',0,17102,0,0,0,0,'High Overlord Saurfang - SAY_OUTRO_HORDE_4'),
(37187,15,0, 'The paladin still lives? Is it possible, Highlord? Could he have survived?',0,0,0,6,0,17107, 'High Overlord Saurfang - SAY_SAURFANG_INTRO_1'),
(37187,16,0, 'Then we must save him! If we rescue Bolvar Fordragon, we may quell the unrest between the Alliance and the Horde.',0,0,0,5,0,17108, 'High Overlord Saurfang - SAY_SAURFANG_INTRO_2'),
(37187,17,0, 'Our mission is now clear: The Lich King will answer for his crimes and we will save Highlord Bolvar Fordragon!',0,0,0,15,0,17109, 'High Overlord Saurfang - SAY_SAURFANG_INTRO_3'),
(37187,18,0, 'Kor''kron, prepare Orgrim''s Hammer for its final voyage! Champions, our gunship will find a point to dock on the upper reaches of the citadel. Meet us there!',1,0,0,22,0,17110, 'High Overlord Saurfang - SAY_SAURFANG_INTRO_4'),
(37188,0,0,'%s cries.',2,16651,0,0,18,0,'Lady Jaina Proudmoore - SAY_OUTRO_ALLIANCE_17'),
(37188,1,0,'It was nothing, your majesty. Just... I''m proud of my king.',0,16652,0,0,0,0,'Lady Jaina Proudmoore - SAY_OUTRO_ALLIANCE_19'),
(37200,0,0,'Let''s get a move on then! Move ou...',1,16974,0,0,0,0,'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_1'),
(37200,1,0,'A lone orc against the might of the Alliance???',1,16970,0,0,0,0,'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_4'),
(37200,2,0,'Charge!!!',1,16971,0,0,0,0,'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_5'),
(37200,3,0,'%s gasps for air.',2,16975,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_1'),
(37200,4,0,'That was Saurfang''s boy - the Horde commander at the Wrath Gate. Such a tragic end...',0,16976,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_2'),
(37200,5,0,'What in the... There, in the distance!',0,16977,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_3'),
(37200,6,0,'A Horde Zeppelin flies up to the rise.',2,0,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_4'),
(37200,7,0,'Soldiers, fall in! Looks like the Horde are comin'' to take another shot!',1,16978,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_5'),
(37200,8,0,'The Zeppelin docks, and High Overlord Saurfang hops out, confronting the Alliance soldiers and Muradin',2,0,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_6'),
(37200,9,0,'Don''t force me hand, orc. We can''t let ye pass.',0,16972,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_7'),
(37200,10,0,'I... I can''t do it. Get back on yer ship and we''ll spare yer life.',0,16973,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_9'),
(37200,11,0,'A mage portal from Stormwind appears between the two and Varian Wrynn and Jaina Proudmoore emerge.',2,0,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_10'),
(37200,12,0,'Right away, yer majesty!',0,16979,0,0,0,0,'Muradin Bronzebeard - SAY_OUTRO_ALLIANCE_21'),
(37200,13,0, 'Could it be, Lord Fordring? If Bolvar lives, mayhap there is hope fer peace between the Alliance and the Horde. We must reach the top o'' this cursed place and free the paladin!',0,0,0,6,0,16980, 'Muradin Bronzebeard - SAY_SAURFANG_INTRO_2'),
(37200,14,0, 'Prepare the Skybreaker fer an aerial assault on the citadel!',1,0,0,5,0,16981, 'Muradin Bronzebeard - SAY_SAURFANG_INTRO_3'),
(37200,15,0, 'Heroes, ye must fight yer way to a clear extraction point within Icecrown. We''ll try an'' rendezvous on the ramparts!',1,0,0,22,0,16982, 'Muradin Bronzebeard - SAY_SAURFANG_INTRO_4'),
(37813,0,0,'For every Horde soldier that you killed -- for every Alliance dog that fell, the Lich King''s armies grew. Even now the val''kyr work to raise your fallen as Scourge.',1,16701,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_ALLIANCE_2'),
(37813,1,0,'Things are about to get much worse. Come, taste the power that the Lich King has bestowed upon me!',1,16702,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_ALLIANCE_3'),
(37813,2,0,'Dwarves...',1,16703,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_ALLIANCE_6'),
(37813,3,0,'%s immobilizes Muradin and his guards.',2,0,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_ALLIANCE_7'),
(37813,4,0,'Join me, father. Join me and we will crush this world in the name of the Scourge -- for the glory of the Lich King!',1,16704,0,0,0,0,'Deathbringer Saurfang - SAY_INTRO_HORDE_2'),
(37813,5,0,'Stubborn and old. What chance do you have? I am stronger, and more powerful than you ever were.',1,16705,0,0,5,0,'Deathbringer Saurfang - SAY_INTRO_HORDE_4'),
(37813,6,0,'Pathetic old orc. Come then heroes. Come and face the might of the Scourge!',1,16706,0,0,15,0,'Deathbringer Saurfang - SAY_INTRO_HORDE_9'),
(37813,7,0,'BY THE MIGHT OF THE LICH KING!',1,16694,0,0,0,0,'Deathbringer Saurfang - SAY_AGGRO'),
(37813,8,0,'The ground runs red with your blood!',1,16699,0,0,0,0,'Deathbringer Saurfang - SAY_MARK_OF_THE_FALLEN_CHAMPION'),
(37813,9,0,'Feast, my minions!',1,16700,0,0,0,0,'Deathbringer Saurfang - SAY_BLOOD_BEASTS'),
(37813,10,0,'You are nothing!',1,16695,0,0,0,0,'Deathbringer Saurfang - SAY_KILL_1'),
(37813,10,1,'Your soul will find no redemption here!',1,16696,0,0,0,0,'Deathbringer Saurfang - SAY_KILL_2'),
(37813,11,0,'%s goes into frenzy!',3,0,0,0,0,0,'Deathbringer Saurfang - SAY_FRENZY'),
(37813,12,0,'I have become...DEATH!',1,16698,0,0,0,0,'Deathbringer Saurfang - SAY_BERSERK'),
(37813,13,0,'I... Am... Released.',1,16697,0,0,0,0,'Deathbringer Saurfang - SAY_DEATH'),
(37879,0,0,'Stand down, Muradin. Let a grieving father pass.',0,16690,0,0,0,0,'King Varian Wrynn - SAY_OUTRO_ALLIANCE_11'),
(37879,1,0,'I... I was not at the Wrath Gate, but the soldiers who survived told me much of what happened. Your son fought with honor. He died a hero''s death. He deserves a hero''s burial.',0,16691,0,0,0,0,'King Varian Wrynn - SAY_OUTRO_ALLIANCE_16'),
(37879,2,0,'Jaina? Why are you crying?',0,16692,0,0,0,0,'King Varian Wrynn - SAY_OUTRO_ALLIANCE_18'),
(37879,3,0,'Bah! Muradin, secure the deck and prepare our soldiers for an assault on the upper citadel. I''ll send out another regiment from Stormwind.',0,16693,0,0,0,0,'King Varian Wrynn - SAY_OUTRO_ALLIANCE_20'),
(37970,0,0,'Naxxanar was merely a setback! With the power of the orb, Valanar will have his vengeance!',1,16685,0,0,0,0,'Prince Valanar - SAY_VALANAR_INVOCATION'),
(37970,1,0,'Invocation of Blood jumps to Prince Valanar!',3,0,0,0,0,0,'Prince Valanar - EMOTE_VALANAR_INVOCATION'),
(37970,2,0,'My cup runneth over.',1,16686,0,0,0,0,'Prince Valanar - SAY_VALANAR_SPECIAL'),
(37970,3,0,'%s begins casting Empowered Schock Vortex!',3,0,0,0,0,0,'Prince Valanar - EMOTE_VALANAR_SHOCK_VORTEX'),
(37970,4,0,'Dinner... is served.',1,16681,0,0,0,0,'Prince Valanar - SAY_VALANAR_KILL_1'),
(37970,4,1,'Do you see NOW the power of the Darkfallen?',1,16682,0,0,0,0,'Prince Valanar - SAY_VALANAR_KILL_2'),
(37970,5,0,'BOW DOWN BEFORE THE SAN''LAYN!',1,16684,0,0,0,0,'Prince Valanar - SAY_VALANAR_BERSERK'),
(37970,6,0,'...why...?',1,16683,0,0,0,0,'Prince Valanar - SAY_VALANAR_DEATH'),
(37972,0,0,'Such wondrous power! The Darkfallen Orb has made me INVINCIBLE!',1,16727,0,0,0,0,'Prince Keleseth - SAY_KELESETH_INVOCATION'),
(37972,1,0,'Invocation of Blood jumps to Prince Keleseth!',3,0,0,0,0,0,'Prince Keleseth - EMOTE_KELESETH_INVOCATION'),
(37972,2,0,'Blood will flow!',1,16728,0,0,0,0,'Prince Keleseth - SAY_KELESETH_SPECIAL'),
(37972,3,0,'Were you ever a threat?',1,16723,0,0,0,0,'Prince Keleseth - SAY_KELESETH_KILL_1'),
(37972,3,1,'Truth is found in death.',1,16724,0,0,0,0,'Prince Keleseth - SAY_KELESETH_KILL_2'),
(37972,4,0,'%s cackles maniacally!',2,16726,0,0,0,0,'Prince Keleseth - EMOTE_KELESETH_BERSERK'),
(37972,5,0,'My queen... they come...',1,16725,0,0,0,0,'Prince Keleseth - SAY_KELESETH_DEATH'),
(37973,0,0,'Tremble before Taldaram, mortals, for the power of the orb flows through me!',1,16857,0,0,0,0,'Prince Taldaram - SAY_TALDARAM_INVOCATION'),
(37973,1,0,'Invocation of Blood jumps to Prince Taldaram!',3,0,0,0,0,0,'Prince Taldaram - EMOTE_TALDARAM_INVOCATION'),
(37973,2,0,'Delight in the pain!',1,16858,0,0,0,0,'Prince Taldaram - SAY_TALDARAM_SPECIAL'),
(37973,3,0,'Inferno Flames speed toward $N!',3,0,0,0,0,0,'Prince Taldaram - EMOTE_TALDARAM_FLAME'),
(37973,4,0,'Worm food.',1,16853,0,0,0,0,'Prince Taldaram - SAY_TALDARAM_KILL_1'),
(37973,4,1,'Beg for mercy!',1,16854,0,0,0,0,'Prince Taldaram - SAY_TALDARAM_KILL_2'),
(37973,5,0,'%s laughs.',2,16856,0,0,0,0,'Prince Taldaram - EMOTE_TALDARAM_BERSERK'),
(37973,6,0,'%s gurgles and dies.',2,16855,0,0,0,0,'Prince Taldaram - EMOTE_TALDARAM_DEATH'),
(38004,0,0,'Foolish mortals. You thought us defeated so easily? The San''layn are the Lich King''s immortal soldiers! Now you shall face their might combined!',1,16795,0,0,1,0,'Blood-Queen Lana''thel - SAY_INTRO_1'),
(38004,1,0,'Rise up, brothers, and destroy our enemies.',1,16796,0,0,0,0,'Blood-Queen Lana''thel - SAY_INTRO_2');

DELETE FROM `creature_template_addon` WHERE (`entry`=37122);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (37122, 0, 0, 0, 1, 0, '');
DELETE FROM `creature_template_addon` WHERE (`entry`=37123);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (37123, 0, 0, 0, 0, 0, '');
DELETE FROM `creature_template_addon` WHERE (`entry`=37124);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (37124, 0, 0, 0, 0, 0, '');
DELETE FROM `creature_template_addon` WHERE (`entry`=37125);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (37125, 0, 0, 0, 0, 0, '');
DELETE FROM `creature_template_addon` WHERE (`entry`=37133);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (37133, 0, 0, 0, 0, 0, 71244);
DELETE FROM `creature_template_addon` WHERE (`entry`=37134);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (37134, 0, 0, 0, 0, 0, '');
DELETE FROM `creature_addon` WHERE (`guid`=83235);

DELETE FROM `creature_template_addon` WHERE `entry` IN (36789,38174,37934,37950,38068,37918,37907,38168,38726,38736,37945,38430,38186,38429,37985,38421);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(36789,0,0x0000000,1,0,'72724 70904'),
(38174,0,0x0000000,1,0,'72724 70904'),
(37934,0,0x0000000,1,0,'70749'),
(37950,0,0x3000000,1,0,''),
(38068,0,0x0000000,1,0,'71085'),
(37918,0,0x0000000,1,0,'70715'),
(37907,0,0x0000000,1,0,'72962'),
(38168,0,0x0000000,1,0,'72962'),
(38726,0,0x0000000,1,0,'72962'),
(38736,0,0x0000000,1,0,'72962'),
(37945,0,0x0000000,1,0,'70763'), -- Dream Portal
(38430,0,0x0000000,1,0,'71994'), -- Nightmare Portal
(38186,0,0x0000000,1,0,'71304'), -- Dream Portal (Pre-effect)
(38429,0,0x0000000,1,0,'71986'), -- Nightmare Portal (Pre-effect)
(37985,0,0x3000000,1,0,'70876'), -- Dream Cloud
(38421,0,0x3000000,1,0,'71939 71970'); -- Nightmre Cloud

UPDATE `creature_template` SET `minlevel`=83,`maxlevel`=83,`exp`=2,`unit_class`=1,`faction_A`=1665,`faction_H`=1665,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`scale`=1,`InhabitType`=7 WHERE `entry`=37950; -- Valithria Dreamwalker
UPDATE `creature_template` SET `minlevel`=60,`maxlevel`=60,`unit_class`=1,`faction_A`=14,`faction_H`=14,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`flags_extra`=`flags_extra`|128 WHERE `entry`=38068; -- Mana Void
UPDATE `creature_template` SET `minlevel`=60,`maxlevel`=60,`unit_class`=1,`faction_A`=14,`faction_H`=14,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`flags_extra`=`flags_extra`|128 WHERE `entry`=37918; -- Column of Frost
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`unit_class`=1,`faction_A`=35,`faction_H`=35,`npcflag`=`npcflag`|16777216 WHERE `entry` IN (37945,38430); -- Dream Portal and Nightmare Portal
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`faction_A`=35,`faction_H`=35,`unit_flags`=`unit_flags`|33554432,`npcflag`=`npcflag`|16777216,`baseattacktime`=2000 WHERE `entry`=38186; -- Dream Portal (Pre-effect)
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`faction_A`=35,`faction_H`=35,`unit_flags`=`unit_flags`|33554432,`npcflag`=`npcflag`|16777216,`baseattacktime`=2000 WHERE `entry`=38429; -- Nightmare Portal (Pre-effect)
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`unit_class`=1,`faction_A`=2022,`faction_H`=2022,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`InhabitType`=7,`flags_extra`=`flags_extra`|128 WHERE `entry`=37985; -- Dream Cloud
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`unit_class`=1,`faction_A`=2022,`faction_H`=2022,`unit_flags`=`unit_flags`|33554432,`baseattacktime`=2000,`InhabitType`=7,`flags_extra`=`flags_extra`|128 WHERE `entry`=38421; -- Nightmare Cloud
UPDATE `creature_template` SET `minlevel`=83,`maxlevel`=83,`exp`=2,`unit_class`=1,`faction_A`=35,`faction_H`=35,`npcflag`=`npcflag`|3,`baseattacktime`=2000,`scale`=1 WHERE `entry`=38589; -- Valithria Dreamwalker (questgiver)

SET @GUID := 200200;
UPDATE `creature` SET `phaseMask`=`phaseMask`|4 WHERE `id`=36789;
-- Add The Lich King and Green Dragon Combat Trigger to all encounter phases, fixes evading when all players enter portals
UPDATE `creature` SET `phaseMask`=`phaseMask`|16 WHERE `id` IN (16980, 38752);

DELETE FROM `creature` WHERE `id` IN (37950,37985,38421) OR `guid` BETWEEN @GUID+00 AND @GUID+27 OR `guid` IN (200230, 200231);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(200230,37950,631,15,20,0,0,4202.847,2484.917,383.8368,0.00000,604800,0,0,0,0,0,0,0,0), -- Valithria Dreamwalker (dream phase)
(200231,22515,631,10,1,0,0,4166.170,2411.520,364.9520,1.57080,120,0,0,0,0,0,0,0,0), -- World Trigger
-- Dream Cloud
(@GUID+00,37985,631,3,16,0,0,4155.51,2478.76,382.494,4.97053,30,10,0,0,0,1,0,0,0),
(@GUID+01,37985,631,3,16,0,0,4158.75,2494.08,384.334,2.31129,30,10,0,0,0,1,0,0,0),
(@GUID+02,37985,631,3,16,0,0,4172.57,2464.47,385.368,3.72021,30,10,0,0,0,1,0,0,0),
(@GUID+03,37985,631,3,16,0,0,4173.67,2504.13,386.174,2.67313,30,10,0,0,0,1,0,0,0),
(@GUID+04,37985,631,3,16,0,0,4181.62,2514.91,386.374,2.65209,30,10,0,0,0,1,0,0,0),
(@GUID+05,37985,631,3,16,0,0,4186.72,2450.97,388.373,4.95968,30,10,0,0,0,1,0,0,0),
(@GUID+06,37985,631,3,16,0,0,4200.96,2456.00,387.128,3.58291,30,10,0,0,0,1,0,0,0),
(@GUID+07,37985,631,3,16,0,0,4202.23,2508.00,383.985,2.09137,30,10,0,0,0,1,0,0,0),
(@GUID+08,37985,631,3,16,0,0,4220.35,2515.16,388.649,2.34469,30,10,0,0,0,1,0,0,0),
(@GUID+09,37985,631,3,16,0,0,4222.26,2455.20,385.568,0.00000,30,10,0,0,0,1,0,0,0),
(@GUID+10,37985,631,3,16,0,0,4231.61,2464.44,389.011,0.00000,30,10,0,0,0,1,0,0,0),
(@GUID+11,37985,631,3,16,0,0,4236.75,2500.62,383.373,5.97527,30,10,0,0,0,1,0,0,0),
(@GUID+12,37985,631,3,16,0,0,4243.29,2476.89,386.076,0.00000,30,10,0,0,0,1,0,0,0),
(@GUID+13,37985,631,3,16,0,0,4244.83,2493.18,387.677,4.29139,30,10,0,0,0,1,0,0,0),
-- Nightmare Cloud
(@GUID+14,38421,631,12,20,0,0,4155.51,2478.76,382.494,4.97053,30,10,0,0,0,1,0,0,0),
(@GUID+15,38421,631,12,20,0,0,4158.75,2494.08,384.334,2.31129,30,10,0,0,0,1,0,0,0),
(@GUID+16,38421,631,12,20,0,0,4172.57,2464.47,385.368,3.72021,30,10,0,0,0,1,0,0,0),
(@GUID+17,38421,631,12,20,0,0,4181.62,2514.91,386.374,2.65209,30,10,0,0,0,1,0,0,0),
(@GUID+18,38421,631,12,20,0,0,4200.96,2456.00,387.128,3.58291,30,10,0,0,0,1,0,0,0),
(@GUID+19,38421,631,12,20,0,0,4202.23,2508.00,383.985,2.09137,30,10,0,0,0,1,0,0,0),
(@GUID+20,38421,631,12,20,0,0,4220.35,2515.16,388.649,2.34469,30,10,0,0,0,1,0,0,0),
(@GUID+21,38421,631,12,20,0,0,4222.26,2455.20,385.568,0.00000,30,10,0,0,0,1,0,0,0),
(@GUID+22,38421,631,12,20,0,0,4236.75,2500.62,383.373,5.97527,30,10,0,0,0,1,0,0,0),
(@GUID+23,38421,631,12,20,0,0,4243.29,2476.89,386.076,0.00000,30,10,0,0,0,1,0,0,0);

-- GUIDs for YTDB!!!
DELETE FROM `linked_respawn` WHERE `guid`=111453 AND `linkType`=0;
INSERT INTO `linked_respawn` (`guid`,`linkedGuid`,`linkType`) VALUES
(111453,10718,0); -- The Lich King link to Green Dragon Combat Trigger

UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (37534, 37533, 16980, 38752);

-- Mutated Abomination abilities
UPDATE `creature_template` SET `spell1` = 70360, `spell2` = 70539, `spell3` = 70542, `spell4` = 0, `spell5` = 0, `spell6` = 71516, `spell7` = 0, `spell8` = 0 WHERE `entry` IN (37672, 38605, 38786, 38787);
UPDATE `creature_template` SET `spell1` = 72527, `spell2` = 72457, `spell3` = 70542, `spell4` = 0, `spell5` = 0, `spell6` = 71516, `spell7` = 0, `spell8` = 0 WHERE `entry` IN (38285, 38788, 38789, 38790);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (37945,38430,38186,38429);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(37945,70766,3,0), -- Dream Portal
(38430,70766,3,0), -- Nightmare Portal
(38186,70766,3,0), -- Dream Portal (Pre-effect)
(38429,70766,3,0); -- Nightmare Portal (Pre-effect)

-- Update creature_text to use proper text values
UPDATE `creature_text` SET `type`=12 WHERE `type`=0;
UPDATE `creature_text` SET `type`=14 WHERE `type`=1;
UPDATE `creature_text` SET `type`=16 WHERE `type`=2;
UPDATE `creature_text` SET `type`=41 WHERE `type`=3;
UPDATE `creature_text` SET `type`=15 WHERE `type`=4;
UPDATE `creature_text` SET `type`=42 WHERE `type`=5;

-- Fix Tirion's immunitie's
UPDATE `creature_template` SET `mechanic_immune_mask`='0' WHERE `entry`='38995';

-- Fix Terenas Menethil equipment
UPDATE `creature_template` SET `equipment_id`='2475' WHERE `entry` IN (36823,38579,39217);
DELETE FROM `creature_equip_template` WHERE `entry` = 2475;
INSERT INTO `creature_equip_template`(`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES ('2475','39659','0','0');

-- Offlike rusification
DELETE FROM `locales_creature_text` WHERE `entry` IN (36855,36612,36948,36939,37030,37033,37032,37003,37026,36998,37813,37187,37181,37183,37187,37200);
INSERT INTO `locales_creature_text`(`entry`,`textGroup`,`id`,`text_loc1`,`text_loc2`,`text_loc3`,`text_loc4`,`text_loc5`,`text_loc6`,`text_loc7`,`text_loc8`) VALUES
(36855,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы здесь потому, что наделены особым знанием: вы понимаете, что на мир пало проклятье слепоты!'),
(36855,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вам удалось сквозь пелену лжи разглядеть источник истиной силы!'),
(36855,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Посмотрите на свои руки, задумайтесь над нелепостью их строения!'),
(36855,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кожа, мускулы, кровь, что пульсирует в жилах, все это говорит о вашем несовершенстве, вашей слабости. Создатели жестоко пошутили над вами!'),
(36855,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Чем раньше вы осознаете собственную ущербность, тем скорее выберете иной путь!'),
(36855,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Для нашего господина нет ничего невозможного, его сила не знает границ, ничто не может сломить его волю!'),
(36855,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Тот, кто откажется повиноваться будет уничтожен. Тот же, кто будет служить ему верой и правдой, достигнет таких высот, о которых вы не в силах даже помыслить!'),
(36855,7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как вы смеете ступать в эти священные покои, это место станет вашей могилой!'),
(36855,8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Довольно! Пришла пора взять все в свои руки!'),
(36855,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты не в силах противится моей воле!'),
(36855,11,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Прими это благословение и покажи чужакам мощь нашего господина!'),
(36855,12,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я освобождаю тебя от проклятья плоти, мой верный слуга!'),
(36855,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Восстань и обрети истинную форму!'),
(36855,14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы осознали бессмысленность своих действий?'),
(36855,14,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ступай во тьму... Вечную тьму!'),
(36855,15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мне надоел этот фарс!'),
(36855,16,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'На все воля господина...Ваша смерть неизбежна...'),

(36612,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Смертные! Ваш путь закончится, так и не начавшись. Никто не смеет входить в обитель господина!'),
(36612,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Плеть накроет этот мир волной смерти и разрушения!'),
(36612,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ВИХРЬ КОСТЕЙ!'),
(36612,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Костяная хватка!'),
(36612,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Постой-ка тут!'),
(36612,3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Единственный выход – это смерть!'),
(36612,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кости для жертвоприношений!'),
(36612,4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сгинь в вечных муках!'),
(36612,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я вижу... лишь тьму.'),

(36948,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Запускайте двигатели! Летим навстречу судьбе.'),
(36948,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Держите шлемы крепче!'),
(36948,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Это еще что?! Дайте мне подзорную трубу!'),
(36948,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Клянусь бородой! Корабль Орды несется на нас на всех парах!'),
(36948,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Маневрируем! Пушки – заррряжай!'),
(36948,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ах вы псы трусливые! Напали исподтишка!'),
(36948,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Не моя битва? Я не знаю, кем ты там себя возомнил, господин хороший, но у меня с Артасом особые счеты! ПАЛИ ИЗО ВСЕХ ОРУДИЙ! ОГОНЬ! ОГОНЬ!'),
(36948,7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Двигай свою калошу, не то мы ее прямо в небе взорвем! Орде тут делать нечего!'),
(36948,8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Да что ж такое! Не сдадим мы без боя дитя Стальгорна!'),
(36948,9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пехота, сержанты, в бой!'),
(36948,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ружейники, ОГОНЬ!'),
(36948,11,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мортирщики, заряжай!'),
(36948,12,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Корабль под обстрелом! Заклинателя сюда, пусть заткнет эти пушки!'),
(36948,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ну не говорите потом, что я не предупреждал. В атаку, братья и сестры!'),
(36948,14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Капитан Бартлетт, уводите корабль! Он слишком поврежден и долго не протянет.'),

(36939,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Воспряньте, сыны и дочери Орды! Сегодня мы будем биться со смертельным врагом! ЛОК\'ТАР ОГАР!'),
(36939,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кор\'крон, взлетаем!'),
(36939,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы видите? Что это там вдалеке?'),
(36939,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'БОЕВОЙ КОРАБЛЬ АЛЬЯНСА! ВСЕ НА ПАЛУБУ!'),
(36939,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты скоро поймешь, какие у нас тут дела! Кор\'крон, уничтожить их!'),
(36939,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Разрушители, сержанты, в бой!'),
(36939,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как ты СМЕЕШЬ ступать на мой корабль? Сейчас ты умрешь.'),
(36939,7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Метатели топоров, поживее!'),
(36939,8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ракетчики, заряжай!'),
(36939,9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Корабль под обстрелом! Боевого мага сюда, пусть заткнет эти пушки!'),
(36939,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Альянс повержен. Вперед, к Королю-личу!'),
(36939,11,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Оценить повреждения! Потушить огонь! Орда так просто не отступится!'),
(36939,12,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Это не твоя битва, дворф. Отступи, иначе нам придется разнести твой корабль.'),

(37030,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Благодарю духов, что они послали нам вас. \"Усмиритель небес\" уже улетел. Быстрее, на борт \"Молота Оргрима\". Если вы поспешите, то еще сможете его нагнать.'),

(37033,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вот это поможет!'),

(37032,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Капитан Саурфанг будет рад видеть вас на борту \"Молота Оргрима\". Мы будем сдерживать Альянс, пока вы не будете готовы к взлету.'),
(37032,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ака\'Магош, храбрые воины. Солдат Альянса тут очень много.'),

(37003,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как хорошо, что вы прибыли именно сейчас, герои. \"Молот Оргрима\" уже улетел. Быстрее, на борт \"Усмирителя небес\". Если вы поспешите, то еще сможете его нагнать.'),

(37026,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Это должно помочь!'),

(36998,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Благодарю вас. Пока вы не прибыли, силы были не равны.'),
(36998,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Капитан Мурадин ждет вас на борту \"Усмирителя небес\". Мы будем сдерживать Орду, пока вы не подготовитесь к взлету.'),
(36998,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пехота \"Усмирителя\", занять позицию!'),

(37813,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Все павшие воины Орды, все дохлые псы Альянса – все пополнят армию Короля-лича. Даже сейчас валь\'киры воскрешают ваших покойников, чтобы те стали частью Плети!'),
(37813,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сейчас все будет еще хуже! Идите сюда, я покажу вам, какой силой меня наделил Король-лич!'),
(37813,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Дворфы…'),
(37813,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Присоединись ко мне, отец. Перейди на мою сторону, и вместе мы разрушим этот мир во имя Плети и во славу Короля-лича!'),
(37813,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Старый упрямец. У тебя нет шансов. Я сильнее и могущественнее, чем ты можешь представить.'),
(37813,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Жалкий старик! Ну что ж, герои. Хотите узнать, сколь могущественна Плеть?'),
(37813,7,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ВО ИМЯ КОРОЛЯ-ЛИЧА!'),(37813,8,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Земля обагрится вашей кровью!'),
(37813,9,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Веселитесь, слуги мои!'),(37813,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты ничтожество!'),
(37813,10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Твоя душа не обретет покоя!'),(37813,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я… освободился…'),

(37187,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мой мальчик погиб у Врат Гнева. Я здесь, чтобы забрать его тело.'),
(37187,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы назвали его Дранош – на орочьем это значит \"Сердце Дренора\". Я бы не позволил чернокнижникам забрать его. Он был бы в безопасности в Гарадаре под защитой старейшин.'),
(37187,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я пообещал его матери, когда она умирала, что пройду через Темный портал один. Не важно, умер бы я или выжил – мой сын остался бы цел. И чист…'),
(37187,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сегодня я исполняю это обещание.'),
(37187,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'У тебя за спиной лежит тело моего сына. Ничто не помешает мне его забрать.'),
(37187,10,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я не забуду вашей доброты… благодарю, Ваше Величество.'),
(37187,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы похороним тебя как подобает, в Награнде, рядом с матерью и предками…'),
(37187,14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Помните о чести, герои… какой бы жестокой ни была битва… никогда не отрекайтесь от нее.'),

(37181,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы находитесь в самом сердце земель плети. Здесь вас не защитит свет. Ничто вас не защитит...'),
(37181,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты бы мог стать величайшим из моих рыцарей, Фордринг: Той силой тьмы, которая прокатилась бы по этому миру и перевернула страницу истории.'),
(37181,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сломить его было очень трудно. И я подверг его душу ужасным мучениям. Он так долго сопротивлялся, но скоро он склонится перед своим королем.'),
(37181,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'В конце-концов все вы будете служить мне.'),
(37181,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Но тебе уже не суждено им стать. Скоро у меня будет другой рыцарь.'),

(37183,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Никогда... Я никогда... Не буду служить тебе...'),

(37187,15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Паладин еще жив? Верховный лорд, возможно ли это?'),
(37187,16,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы должны спасти его! Если мы спасем Болвара Фордрагона, напряжение между Ордой и Альянсом спадет.'),
(37187,17,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Теперь наша задача ясна: мы заставим Короля-лича ответить за все злодеяния и спасем паладина.'),
(37187,18,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кор\'крон, готовьте \"Молот Оргрима\" к последнему полету! Герои, мы попробуем подлететь к стене цитадели и будем ждать вас там!'),

(37200,13,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Что же это? Если Болвар жив, то, может, есть еще надежда на мир между Альянсом и Ордой? Нам нужно попасть на верхушку этой проклятой башни и освободить паладина!'),
(37200,14,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Подготовить \"Усмиритель небес\" к воздушной атаке на цитадель!'),
(37200,15,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Герои, попытайтесь выбраться на бастион! Попробуем встретиться с вами там!'),

(37119,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вот мы и на месте. То, что произойдет здесь, войдет в легенды. Не важно, каким будет исход: для истории мы будем героями, сражавшимися за свободу и покой своего народа.'),
(37119,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Помните, герои: страх – ваш самый опасный противник в этих проклятых залах. Скрепите свои сердца, и ваши души воссияют ярче тысячи солнц. Завидев вас, враг отступит. Враг падет, когда Свет праведности коснется его!'),
(37119,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Наш поход на Цитадель Ледяной Короны начинается!'),
(37119,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'АРТАС! Я поклялся, что ты умрешь, а Плеть будет разбита! Я закончу то, что начал у Часовни Последней Надежды.'),
(37119,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сила Света не ведает преград, Саурфанг. Его душа безмерно страдает, и все же пока он жив.'),
(37119,5,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Да будет так, во имя Света.');

-- Ruby Sanctum
-- Halion
UPDATE `creature_template` SET `ScriptName`='boss_halion_real', `AIName` ='' WHERE `entry`=39863;
UPDATE `creature_template` SET `ScriptName`='boss_halion_twilight', `AIName` ='' WHERE `entry`=40142;
UPDATE `creature_template` SET `ScriptName`='mob_halion_meteor', `AIName` ='' WHERE `entry` = 40029;
UPDATE `creature_template` SET `ScriptName`='mob_halion_flame', `AIName` ='' WHERE `entry` IN (40041);
UPDATE `creature_template` SET `ScriptName`='mob_halion_control', `AIName` ='' WHERE `entry` IN (40146);
UPDATE `creature_template` SET `ScriptName`='mob_halion_orb', `AIName` ='' WHERE `entry` IN (40083,40100);
UPDATE `creature_template` SET `ScriptName`='mob_orb_rotation_focus', `AIName` ='' WHERE `entry` = 40091;
UPDATE `creature_template` SET `ScriptName`='mob_orb_carrier', `AIName` ='' WHERE `entry` = 40081;
UPDATE `creature_template` SET `ScriptName`='mob_fiery_combustion', `AIName` ='' WHERE `entry` = 40001;
UPDATE `creature_template` SET `ScriptName`='mob_soul_consumption', `AIName` ='' WHERE `entry` = 40135;
UPDATE `creature_template` SET `ScriptName`='', `AIName` ='' WHERE `entry` IN (40143, 40144, 40145);

-- spell_halion_fiery_combustion 74562
DELETE FROM `spell_script_names` WHERE `spell_id`=74562 AND `ScriptName`='spell_halion_fiery_combustion';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (74562,'spell_halion_fiery_combustion');

-- spell_halion_soul_consumption 74792
DELETE FROM `spell_script_names` WHERE `spell_id`=74792 AND `ScriptName`='spell_halion_soul_consumption';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (74792,'spell_halion_soul_consumption');


UPDATE `gameobject_template` SET `data10` = 74807, `faction` = '0', `ScriptName` = 'go_halion_portal_twilight' WHERE `gameobject_template`.`entry` IN (202794,202795);
UPDATE `gameobject_template` SET `faction` = '0', `ScriptName` = 'go_halion_portal_real' WHERE `gameobject_template`.`entry` IN (202796);

-- Baltharus
UPDATE `creature_template` SET `ScriptName`='boss_baltharus', `AIName` ='', `dmg_multiplier` = 80  WHERE `entry`=39751;
UPDATE `creature_template` SET `ScriptName`='mob_baltharus_clone', `AIName` ='', `dmg_multiplier` = 80  WHERE `entry`=39899;

-- zarithrian
UPDATE `creature_template` SET `ScriptName`='boss_zarithrian', `AIName` ='' WHERE `entry`=39746;
UPDATE `creature` SET `position_x` = '3008.552734',`position_y` = '530.471680',`position_z` = '89.195290',`orientation` = '6.16' WHERE `id` = 39746;
UPDATE `creature_template` SET `ScriptName`='mob_flamecaller_ruby', `AIName` ='' WHERE `entry`=39814;

-- Saviana Ragefire
UPDATE `creature_template` SET `ScriptName`='boss_ragefire', `AIName` ='' WHERE `entry`=39747;
DELETE FROM `conditions` WHERE `SourceEntry`=74455;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(13,0,74455,0,18,1,39747,0,0, '', 'Ragefire - Conflagration');

-- Xerestrasza
UPDATE `creature_template` SET `ScriptName`='mob_xerestrasza', `AIName` ='' WHERE `entry`=40429;

-- fix Halion spawn
DELETE FROM `creature` WHERE `id` = 39863;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(39863, 724, 15, 1, 0, 0, 3144.93, 527.233, 72.8887, 0.110395, 300, 0, 0, 11156000, 0, 0, 0, 0, 0);

-- Trial of Champion
UPDATE `creature_template` SET `AIName`='PassiveAI' WHERE `entry` IN (35332,35330,35328,35327,35331,35329,35325,35314,35326,35323);
UPDATE `instance_template` SET `script`='instance_trial_of_the_champion' WHERE `map`=650;
UPDATE `creature_template` SET `ScriptName`='generic_vehicleAI_toc5' WHERE `entry` IN (33299, 35637,35633,35768,34658,35636,35638,35635,35640,35641,35634,33298,33416,33297,33414,33301,33408,33300,33409,33418);
UPDATE `creature_template` SET `ScriptName`='boss_warrior_toc5' WHERE `entry` IN (34705,35572);
UPDATE `creature_template` SET `ScriptName`='boss_mage_toc5' WHERE `entry` IN (34702,35569);
UPDATE `creature_template` SET `ScriptName`='boss_shaman_toc5' WHERE `entry` IN (35571,34701);
UPDATE `creature_template` SET `ScriptName`='boss_hunter_toc5' WHERE `entry` IN (35570,34657);
UPDATE `creature_template` SET `ScriptName`='boss_rouge_toc5' WHERE `entry` IN (35617,34703);
UPDATE `creature_template` SET `ScriptName`='npc_announcer_toc5' WHERE `entry`IN (35004,35005);
UPDATE `creature_template` SET `ScriptName`='npc_risen_ghoul' WHERE `entry` IN (35545,35564);
UPDATE `creature_template` SET `ScriptName`='boss_black_knight' WHERE `entry`=35451;
UPDATE `creature_template` SET `ScriptName`='boss_eadric' WHERE `entry`=35119;
UPDATE `creature_template` SET `ScriptName`='boss_paletress' WHERE `entry`=34928;
UPDATE `creature_template` SET `ScriptName`='npc_memory' WHERE `entry` IN (35052,35041,35033,35046,35043,35047,35044,35039,35034,35049,35030,34942,35050,35042,35045,35037,35031,35038,35029,35048,35032,35028,35040,35036,35051);
UPDATE `creature_template` SET `ScriptName`='npc_argent_soldier'  WHERE `entry` IN (35309,35305,35307);
UPDATE `creature_template` SET `ScriptName`='npc_black_knight_skeletal_gryphon' WHERE `entry`=35491;

-- Open Entrance Door
UPDATE `gameobject` SET `state` = 0 WHERE `guid` = 1804;

-- Mounts
DELETE FROM `vehicle_template_accessory` WHERE `entry` in (35491,33299,33418,33409,33300,33408,33301,33414,33297,33416,33298);
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`) VALUES
(35491,35451,0,0, 'Black Knight'),
(33299,35323,0,1, 'Darkspear Raptor'),
(33418,35326,0,1, 'Silvermoon Hawkstrider'),
(33409,35314,0,1, 'Orgrimmar Wolf'),
(33300,35325,0,1, 'Thunder Bluff Kodo'),
(33408,35329,0,1, 'Ironforge Ram'),
(33301,35331,0,1, 'Gnomeregan Mechanostrider'),
(33414,35327,0,1, 'Forsaken Warhorse'),
(33297,35328,0,1, 'Stormwind Steed'),
(33416,35330,0,1, 'Exodar Elekk'),
(33298,35332,0,1, 'Darnassian Nightsaber');
DELETE FROM `vehicle_template_accessory` WHERE `entry` in (33318,33319,33316,33317,33217,33324,33322,33320,33323,33321);
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`minion`,`description`) VALUES 
('33318', '35330', '1', 'Exodar Elekk'),
('33319', '35332', '1', 'Darnassian Nightsaber'),
('33316', '35329', '1', 'Ironforge Ram'),
('33317', '35331', '1', 'Gnomeregan Mechanostrider'),
('33217', '35328', '1', 'Stormwind Steed'),
('33324', '35327', '1', 'Forsaken Warhorse'),
('33322', '35325', '1', 'Thunder Bluff Kodo'),
('33320', '35314', '1', 'Orgrimmar Wolf'),
('33323', '35326', '1', 'Silvermoon Hawkstrider'),
('33321', '35323', '1', 'Darkspear Raptor');

UPDATE `creature_template` SET `minlevel` = 80,`maxlevel` = 80 WHERE `entry` in (33298,33416,33297,33301,33408,35640,33299,33300,35634,33418,35638,33409,33414,33299,35635,35641);
UPDATE `creature_template` SET `faction_A` = 14,`faction_H` = 14 WHERE `entry` in (33318, 33319, 33316, 33317, 33217, 33324, 33322, 33320, 33323, 33321, 33298,33416,33297,33301,33408,35545,33299,35564,35590,35119,34928,35309,35305,33414,35307,35325,33300,35327,35326,33418,35638,35314,33409,33299,35635,35640,35641,35634,35633,35636,35768,35637,34658);
UPDATE `creature_template` SET `Health_mod` = 10,`mindmg` = 20000,`maxdmg` = 30000 WHERE `entry` in (33298,33416,33297,33301,33408,33409,33418,33300,33414,33299,33298,33416,33297,33301,33408,35640,35638,35634,35635,35641,35633,35636,35768,35637,34658);
UPDATE `creature_template` SET `speed_run` = 2,`Health_mod` = 40,`mindmg` = 10000,`maxdmg` = 20000,`spell1` =68505,`spell2` =62575,`spell3` =68282,`spell4` =66482 WHERE `entry` in (35644,36558, 36559, 36557);
UPDATE `creature` SET `spawntimesecs` = 86400 WHERE `id` in (35644,36558, 36559, 36557);
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` in (35644,36558, 36559, 36557);
-- VehicleId
UPDATE `creature_template` SET `VehicleId`=486 WHERE `entry` in (36558, 35644, 36559, 36557);
-- faction for Vehicle
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35 WHERE `entry` in (36558, 35644, 36559, 36557);
UPDATE `creature` SET `id` = 35644 WHERE `id` = 36557;
UPDATE `creature` SET `id` = 36558 WHERE `id` = 36559;

-- Texts
DELETE FROM `script_texts` WHERE `entry` <= -1999926 and `entry` >= -1999956;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(0,-1999926, 'Coming out of the gate Grand Champions other faction.  ' ,0,0,0,1, '' ),
(0,-1999927, 'Good work! You can get your award from Crusader\'s Coliseum chest!.  ' ,0,1,0,1, '' ),
(0,-1999928, 'You spoiled my grand entrance. Rat.' ,16256,1,0,5, '' ),
(0,-1999929, 'Did you honestly think an agent if the Lich King would be bested on the field of your pathetic little tournament?' ,16257,1,0,5, '' ),
(0,-1999930, 'I have come to finish my task ' ,16258,1,0,5, '' ),
(0,-1999931, 'This farce ends here!' ,16259,1,0,5, '' ),
(0,-1999932, '[Zombie]Brains.... .... ....' ,0,1,0,5, '' ),
(0,-1999933, 'My roting flash was just getting in the way!' ,16262,1,0,5, '' ),
(0,-1999934, 'I have no need for bones to best you!' ,16263,1,0,5, '' ),
(0,-1999935, 'No! I must not fail...again...' ,16264,1,0,5, '' ),
(0,-1999936, 'What\'s that. up near the rafters ?' ,0,1,0,5, '' ),
(0,-1999937, 'Please change your weapon! Next battle will be start now!' ,0,3,0,5, '' ),
(0,-1999939, 'Excellent work!' ,0,1,0,1, '' ),
(0,-1999940, 'Coming out of the gate Crusader\'s Coliseum Champion.' ,0,0,0,1, '' ),
(0,-1999941, 'Excellent work! You are win Argent champion!' ,0,3,0,0, '' ),
(0,-1999942, 'The Sunreavers are proud to present their representatives in this trial by combat.' ,0,0,0,1, '' ),
(0,-1999943, 'Welcome, champions. Today, before the eyes of your leeders and peers, you will prove youselves worthy combatants.' ,0,0,0,1, '' ),
(0,-1999944, 'Fight well, Horde! Lok\'tar Ogar!' ,0,1,0,5, '' ),
(0,-1999945, 'Finally, a fight worth watching.' ,0,1,0,5, '' ),
(0,-1999946, 'I did not come here to watch animals tear at each other senselessly, Tirion' ,0,1,0,5, '' ),
(0,-1999947, 'You will first be facing three of the Grand Champions of the Tournament! These fierce contenders have beaten out all others to reach the pinnacle of skill in the joust.' ,0,1,0,5, '' ),
(0,-1999948, 'Will tought! You next challenge comes from the Crusade\'s own ranks. You will be tested against their consederable prowess.' ,0,1,0,5, '' ),
(0,-1999949, 'You may begin!' ,0,0,0,5, '' ),
(0,-1999950, 'Well, then. Let us begin.' ,0,1,0,5, '' ),
(0,-1999951, 'Take this time to consider your past deeds.' ,16248,1,0,5, '' ),
(0,-1999952, 'What is the meaning of this?' ,0,1,0,5, '' ),
(0,-1999953, 'No...I\'m still too young' ,0,1,0,5, '' ),
(0,-1999954, 'Excellent work! You are win Argent champion!' ,0,3,0,0, '' );

-- Griphon of black Knight
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(35491, 0, 0, 0, 0, 0, 29842, 0, 0, 0, 'Black Knight\'s Skeletal Gryphon', '', '', 0, 80, 80, 2, 35, 35, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 33554432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1048576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486, 0, 0, '', 0, 4, 15, 1, 0, 0, 0, 0, 0, 0, 0, 164, 1, 0, 0, 0, 'npc_black_knight_skeletal_gryphon');
DELETE FROM `script_waypoint` WHERE `entry`=35491;
INSERT INTO `script_waypoint` VALUES
(35491,1,781.513062, 657.989624, 466.821472,0,''),
(35491,2,759.004639, 665.142029, 462.540771,0,''),
(35491,3,732.936646, 657.163879, 452.678284,0,''),
(35491,4,717.490967, 646.008545, 440.136902,0,''),
(35491,5,707.570129, 628.978455, 431.128632,0,''),
(35491,6,705.164063, 603.628418, 422.956635,0,''),
(35491,7,716.350891, 588.489746, 420.801666,0,''),
(35491,8,741.702881, 580.167725, 420.523010,0,''),
(35491,9,761.634033, 586.382690, 422.206207,0,''),
(35491,10,775.982666, 601.991943, 423.606079,0,''),
(35491,11,769.051025, 624.686157, 420.035126,0,''),
(35491,12,756.582214, 631.692322, 412.529785,0,''),
(35491,13,744.841,634.505,411.575,0,'');
-- Griphon of black Knight before battle start
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(35492, 0, 0, 0, 0, 0, 29842, 0, 0, 0, 'Black Knight\'s Skeletal Gryphon', '', '', 0, 80, 80, 2, 35, 35, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 33554432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1048576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486, 0, 0, '', 0, 3, 15, 1, 0, 0, 0, 0, 0, 0, 0, 164, 1, 0, 0, 0, 'npc_gr');
DELETE FROM `script_waypoint` WHERE `entry`=35492;
INSERT INTO `script_waypoint` VALUES
(35492,1,741.067078, 634.471558, 411.569366,0,''),
(35492,2,735.726196, 639.247498, 414.725555,0,''),
(35492,3,730.187256, 653.250977, 418.913269,0,''),
(35492,4,734.517700, 666.071350, 426.259247,0,''),
(35492,5,739.638489, 675.339417, 438.226776,0,''),
(35492,6,741.833740, 698.797302, 456.986328,0,''),
(35492,7,734.647339, 711.084778, 467.165314,0,''),
(35492,8,715.388489, 723.820862, 470.333588,0,''),
(35492,9,687.178711, 730.140503, 470.569336,0,'');
-- Announcer for start event
DELETE FROM `creature_template` WHERE `entry` in (35591,35592);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(35591, 0, 0, 0, 0, 0, 29894, 0, 0, 0, 'Jaeren Sunsworn', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 2000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart'),
(35592, 0, 0, 0, 0, 0, 29893, 0, 0, 0, 'Arelas Brightstar', '', '', 0, 75, 75, 2, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'npc_anstart');
-- Spawn Announcer in normal/heroic mode
DELETE FROM `creature` WHERE `id` in (35004, 35005);
DELETE FROM `creature` WHERE `guid` in (180100, 180101);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(180100, 35591, 650, 3, 64, 0, 0, 746.626, 618.54, 411.09, 4.63158, 86400, 0, 0, 10635, 0, 0),
(180101, 35592, 650, 3, 128, 0, 0, 746.626, 618.54, 411.09, 4.63158, 86400, 0, 0, 10635, 0, 0);
-- Addons
REPLACE INTO `creature_template_addon` VALUES
-- Argent
(35309, 0, 0, 0, 1, 0, '63501'),
(35310, 0, 0, 0, 1, 0, '63501'),
(35305, 0, 0, 0, 1, 0, '63501'),
(35306, 0, 0, 0, 1, 0, '63501'),
(35307, 0, 0, 0, 1, 0, '63501'),
(35308, 0, 0, 0, 1, 0, '63501'),
(35119, 0, 0, 0, 1, 0, '63501'),
(35518, 0, 0, 0, 1, 0, '63501'),
(34928, 0, 0, 0, 1, 0, '63501'),
(35517, 0, 0, 0, 1, 0, '63501'),
-- Faction_champ
(35323, 0, 0, 0, 1, 0, '63399 62852 64723'),
(35570, 0, 0, 0, 1, 0, '63399 62852 64723'),
(36091, 0, 0, 0, 1, 0, '63399 62852 64723'),
(35326, 0, 0, 0, 1, 0, '63403 62852 64723'),
(35569, 0, 0, 0, 1, 0, '63403 62852 64723'),
(36085, 0, 0, 0, 1, 0, '63403 62852 64723'),
(35314, 0, 0, 0, 1, 0, '63433 62852 64723'),
(35572, 0, 0, 0, 1, 0, '63433 62852 64723'),
(36089, 0, 0, 0, 1, 0, '63433 62852 64723'),
(35325, 0, 0, 0, 1, 0, '63436 62852 64723'),
(35571, 0, 0, 0, 1, 0, '63436 62852 64723'),
(36090, 0, 0, 0, 1, 0, '63436 62852 64723'),
(35329, 0, 0, 0, 1, 0, '63427 62852 64723'),
(34703, 0, 0, 0, 1, 0, '63427 62852 64723'),
(36087, 0, 0, 0, 1, 0, '63427 62852 64723'),
(35331, 0, 0, 0, 1, 0, '63396 62852 64723'),
(34702, 0, 0, 0, 1, 0, '63396 62852 64723'),
(36082, 0, 0, 0, 1, 0, '63396 62852 64723'),
(35327, 0, 0, 0, 1, 0, '63430 62852 64723'),
(35617, 0, 0, 0, 1, 0, '63430 62852 64723'),
(36084, 0, 0, 0, 1, 0, '63430 62852 64723'),
(35328, 0, 0, 0, 1, 0, '62594 62852 64723'),
(34705, 0, 0, 0, 1, 0, '62594 62852 64723'),
(36088, 0, 0, 0, 1, 0, '62594 62852 64723'),
(35330, 0, 0, 0, 1, 0, '63423 62852 64723'),
(34701, 0, 0, 0, 1, 0, '63423 62852 64723'),
(36083, 0, 0, 0, 1, 0, '63423 62852 64723'),
(35332, 0, 0, 0, 1, 0, '63406 62852 64723'),
(36086, 0, 0, 0, 1, 0, '63406 62852 64723'),
(34657, 0, 0, 0, 1, 0, '63406 62852 64723');
-- Immunes (crash fix xD )
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|1073741823 WHERE `entry` IN
(35309,35310, -- Argent Lightwielder
35305,35306, -- Argent Monk
35307,35308); -- Argent Priestess

-- Vehicles fix
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (33299,33418,33409,33300,33408,33301,33414,33297,33297,33416,33298) AND `spell_id` = 47020;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33299','47020','1','0');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33418','47020','1','0');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33409','47020','1','0');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33300','47020','1','0');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33408','47020','1','0');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33301','47020','1','0');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33414','47020','1','0');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33297','47020','1','0');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33416','47020','1','0');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES('33298','47020','1','0');

-- Trial of Crusader
-- Anub'arak, fix of incorrect YTDB flag.
UPDATE `creature_template` SET  `unit_flags` = 32832 WHERE `entry`= 34564;
UPDATE `creature_template` SET  `unit_flags` = 32832 WHERE `entry`= 34566;
UPDATE `creature_template` SET  `unit_flags` = 32832 WHERE `entry`= 35615;
UPDATE `creature_template` SET  `unit_flags` = 32832 WHERE `entry`= 35616;

-- A Tribute to Skill 10 player
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` in (12345,12346,12348,12339,12340,12342);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES (12345, 12, 2);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`) VALUES (12345, 18);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`) VALUES (12346, 18);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES (12346, 12, 2);
-- A Tribute to Mad Skill 10 player
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`) VALUES (12348, 18);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES (12348, 12, 2);
-- A Tribute to Skill 25 player
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`) VALUES (12339, 18);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES (12339, 12, 3);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`) VALUES (12340, 18);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES (12340, 12, 3);
-- A Tribute to Mad Skill 25 player
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`) VALUES (12342, 18);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES (12342, 12, 3);

-- Utgarde Pinnacle
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1575030 AND -1575019;
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('0','-1575030','%s is within range of the harpoon launchers!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','3','0','0','skadi EMOTE_HARPOON_RANGE'),
('26693','-1575029','You motherless knaves! Your corpses will make fine morsels for my new drake!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13507','1','0','0','skadi SAY_DRAKE_DEATH'),
('26693','-1575028','ARGH! You call that... an attack? I\'ll... show... aghhhh...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13506','1','0','0','skadi SAY_DEATH'),
('26693','-1575027','I\'ll mount your skull from the highest tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13505','1','0','0','skadi SAY_KILL_3'),
('26693','-1575026','Not so brash now, are you?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13504','1','0','0','skadi SAY_KILL_2'),
('26693','-1575025','Mjor Na Ul Kaval!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13503','1','0','0','skadi SAY_KILL_1'),
('26693','-1575024','If one more harpoon touches my drake I\'ll flae my miserable heins.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13502','1','0','0','skadi SAY_DRAKE_HARPOON_2'),
('26693','-1575023','I ask for ... to kill them, yet all I get is feeble whelps! By Ye.. SLAUGHTER THEM!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13501','1','0','0','skadi SAY_DRAKE_HARPOON_1'),
('26693','-1575022','Cleanse our sacred halls with flame!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13500','1','0','0','skadi SAY_DRAKEBREATH_3'),
('26693','-1575021','Go now! Leave nothing but ash in your wake!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13499','1','0','0','skadi SAY_DRAKEBREATH_2'),
('26693','-1575020','Sear them to the bone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13498','1','0','0','skadi SAY_DRAKEBREATH_1'),
('26693','-1575019','What mongrels dare intrude here? Look alive, my brothers! A feast for the one that brings me their heads!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13497','1','0','0','skadi SAY_AGGRO');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=51368;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,51368,18,1,26693);

-- Ulduar

-- For Achievement Champion/Conqueror of Ulduar
DELETE FROM achievement_criteria_data WHERE `type` = 18 AND criteria_id IN
(10042,10342,10340,10341,10598,10348,10351,10439,
10403,10582,10347,10349,10350,
10352,10355,10353,10354,10599,10357,10363,10719,
10404,10583,10361,10362,10364);

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10451,10462);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10451,10462) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10451,11,0,0, 'achievement_i_love_the_smell_of_saronite_in_the_morning'),
(10462,11,0,0, 'achievement_i_love_the_smell_of_saronite_in_the_morning'),
(10451,12,0,0, ''),
(10462,12,1,0, '');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10173,10306);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10173,10306) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10173,11,0,0, 'achievement_shadowdodger'),
(10306,11,0,0, 'achievement_shadowdodger'),
(10173,12,0,0, ''),
(10306,12,1,0, '');

INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10042,18,0,0,''),
(10342,18,0,0,''),
(10340,18,0,0,''),
(10341,18,0,0,''),
(10598,18,0,0,''),
(10348,18,0,0,''),
(10351,18,0,0,''),
(10439,18,0,0,''),
(10403,18,0,0,''),
(10582,18,0,0,''),
(10347,18,0,0,''),
(10349,18,0,0,''),
(10350,18,0,0,''),
(10352,18,0,0,''),
(10355,18,0,0,''),
(10353,18,0,0,''),
(10354,18,0,0,''),
(10599,18,0,0,''),
(10357,18,0,0,''),
(10363,18,0,0,''),
(10719,18,0,0,''),
(10404,18,0,0,''),
(10583,18,0,0,''),
(10361,18,0,0,''),
(10362,18,0,0,''),
(10364,18,0,0,'');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10290,10133);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10290,10133) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10290,11,0,0, 'achievement_rubble_and_roll'),
(10133,11,0,0, 'achievement_rubble_and_roll'),
(10290,12,0,0, ''),
(10133,12,1,0, '');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10284,10722);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10284,10722) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10284,11,0,0, 'achievement_disarmed'),
(10722,11,0,0, 'achievement_disarmed'),
(10284,12,0,0, ''),
(10722,12,1,0, '');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10285,10095);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10285,10095) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10285,11,0,0, 'achievement_with_open_arms'),
(10095,11,0,0, 'achievement_with_open_arms'),
(10285,12,0,0, ''),
(10095,12,1,0, '');

DELETE FROM disables WHERE sourceType = 4 AND entry IN 
(10042,10342,10340,10341,10598,10348,10351,10439,
10403,10582,10347,10349,10350,
10352,10355,10353,10354,10599,10357,10363,10719,
10404,10583,10361,10362,10364);

-- Ignis
DELETE FROM conditions WHERE SourceEntry IN (62488);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,62488,0,18,1,33121,0,0,'','Effekt on Constructs');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62343;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,62343,18,1,33121);

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=33121);
DELETE FROM `creature` WHERE `id`=33121;

DELETE FROM `spell_linked_spell` WHERE `spell_effect`=-65667;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(62373,-65667,2, 'Iron Construct - immune to Heat when Molten'),
(62382,-65667,2, 'Iron Construct - immune to Heat when Brittle'),
(67114,-65667,2, 'Iron Construct - immune to Heat when Brittle');

DELETE FROM `conditions` WHERE `SourceEntry`=62711 AND `SourceTypeOrReferenceId`=13 AND `ConditionTypeOrReference`=18;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,62711,18,1,33118,'Ingis - Grab');

-- Razorscale
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (63317,64021);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,63317,18,1,0,'Flame Breath - Players'),
(13,63317,18,1,33453,'Flame Breath - Dark Rune Watcher'),
(13,63317,18,1,33846,'Flame Breath - Dark Rune Sentinel'),
(13,63317,18,1,33388,'Flame Breath - Dark Rune Guardian'),
(13,63317,18,1,33816,'Flame Breath - Expedition Defender'),
(13,64021,18,1,0,'Flame Breath - Players'),
(13,64021,18,1,33453,'Flame Breath - Dark Rune Watcher'),
(13,64021,18,1,33846,'Flame Breath - Dark Rune Sentinel'),
(13,64021,18,1,33388,'Flame Breath - Dark Rune Guardian'),
(13,64021,18,1,33816,'Flame Breath - Expedition Defender');

-- Assembly of Iron
-- Loot
DELETE FROM `reference_loot_template` WHERE `entry`=34122 AND `lootmode`=4;
DELETE FROM `creature_loot_template` WHERE `entry`=32867 AND `lootmode`=4;

UPDATE `creature_loot_template` SET `lootmode`=1 WHERE `entry` IN (32867,32927) AND `lootmode`=2;

UPDATE `creature_loot_template` SET `item`=45857, `lootmode`=1 WHERE `entry` IN (33692,33693) AND `lootmode`=2;
UPDATE `creature_loot_template` SET `lootmode`=1 WHERE `entry`=33693 AND `lootmode`=4;

-- Limit Supercharge targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=61920;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,61920,18,1,32857),
(13,61920,18,1,32867),
(13,61920,18,1,32927);

-- Lightning Tendrils Visual
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61887,63486);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(61887,61883,2, 'Lightning Tendrils - Visual'),
(63486,61883,2, 'Lightning Tendrils - Visual');

UPDATE `creature_template` SET `ScriptName`='mob_rune_of_power' WHERE `entry`=33705;

-- Electrical Charge
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=61901;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,61901,18,1,32867);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (61911,63495);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61911, 'spell_steelbreaker_static_disruption'),
(63495, 'spell_steelbreaker_static_disruption');

-- Kologarn
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (32930);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(32930,46598,1,0); -- Kologarn - Arm - Ride Vehicle Hardcoded

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (64224,64225,63766,63983);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,64224,18,1,32934, 'Stone Grip Absorb'),
(13,64225,18,1,32934, 'Stone Grip Absorb'),
(13,63766,18,1,32933, 'Arm Sweep (10N) Target'),
(13,63983,18,1,32933, 'Arm Sweep (25N) Target');

UPDATE `creature_template` SET `ScriptName`='npc_kologarn_arm' WHERE `entry` IN (32933,32934);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2 WHERE `entry`=33661;
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83 WHERE `entry`=33909;

-- Swap trigger model ids
UPDATE `creature_template` SET `modelid1`=1126, `modelid2`=11686 WHERE `entry` IN (33906,33907);

-- Rubble AI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=33768;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33768;
INSERT INTO `smart_scripts` VALUES 
(33768,0,0,0,0,0,100,0x02,5000,15000,5000,15000,11,63818,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rubble - Cast Rumble (10N)'),
(33768,0,1,0,0,0,100,0x04,5000,15000,5000,15000,11,63978,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rubble - Cast Stone Nova (25N)');

-- Auriaya
UPDATE creature_template SET ScriptName = "boss_auriaya" WHERE Entry = 33515;
UPDATE creature_template SET ScriptName = "mob_feral_defender" WHERE Entry = 34035;
UPDATE creature_template SET ScriptName = "mob_sanctum_sentry" WHERE Entry = 34014;
UPDATE creature_template SET ScriptName = "mob_seeping_essence_stalker" WHERE Entry = 34098;

-- Strength of the Pack
DELETE FROM `spell_script_names` WHERE `spell_id`=64381;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64381, 'spell_strength_of_the_pack');

-- Hodir
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_hodir' WHERE `entry` = 32845;
UPDATE `creature_template` SET `equipment_id` = 1843, `mechanic_immune_mask` = 650854239, `flags_extra` = 1 WHERE `entry` = 32846;

-- Hodir npcs
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `ScriptName` = 'npc_toasty_fire' WHERE `entry` = 33342;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `ScriptName` = 'npc_snowpacked_icicle' WHERE `entry` = 33174;
UPDATE `creature_template` SET `difficulty_entry_1` = 33352, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32926;
UPDATE `creature_template` SET `difficulty_entry_1` = 33353, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612597599 WHERE `entry` IN (33352, 33353);
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194173;

DELETE FROM spell_script_names WHERE spell_id IN (62038,62039);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(62038,'spell_biting_cold'),
(62039,'spell_biting_cold');

-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32950, 32941, 32948, 32946, 32938);

-- Rare Cache of Winter
DELETE FROM `gameobject` WHERE `id` IN (194200,194201);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('400007','194200','603','1','1','1966.07','-220.64','432.687','0.465871','0','0','0.230835','0.972993','604800','0','1'),
('400008','194201','603','2','1','1966.07','-220.64','432.687','0.465871','0','0','0.230835','0.972993','604800','0','1');

-- Freya
UPDATE creature_template SET ScriptName = "boss_freya" WHERE Entry = 32906;
UPDATE creature_template SET ScriptName = "mob_detonating_lasher" WHERE Entry = 32918;
UPDATE creature_template SET ScriptName = "mob_ancient_water_spirit" WHERE Entry = 33202;
UPDATE creature_template SET ScriptName = "mob_storm_lasher" WHERE Entry = 32919;
UPDATE creature_template SET ScriptName = "mob_snaplasher" WHERE Entry = 32916;
UPDATE creature_template SET ScriptName = "mob_ancient_conservator" WHERE Entry = 33203;
UPDATE creature_template SET ScriptName = "mob_healthy_spore" WHERE Entry = 33215;
UPDATE creature_template SET ScriptName = "mob_elder_brightleaf" WHERE Entry = 32915;
UPDATE creature_template SET ScriptName = "mob_elder_ironbranch" WHERE Entry = 32913;
UPDATE creature_template SET ScriptName = "mob_elder_stonebark" WHERE Entry = 32914;
UPDATE creature_template SET ScriptName = "mob_unstable_sunbeam" WHERE Entry = 33050;
UPDATE creature_template SET ScriptName = "mob_eonars_gift" WHERE Entry = 33228;
UPDATE creature_template SET ScriptName = "mob_natural_bomb" WHERE entry = 34129;
UPDATE creature_template SET ScriptName = "mob_iron_roots" WHERE Entry = 33168;
UPDATE creature_template SET ScriptName = "mob_iron_roots" WHERE Entry = 33088;
UPDATE creature_template SET ScriptName = "mob_freya_sunbeam" WHERE Entry = 33170;
UPDATE creature_template SET unit_flags = 4 WHERE ENTRY = 33168;
UPDATE creature_template SET unit_flags = 4 WHERE ENTRY = 33088;
UPDATE creature_template SET faction_A = 16 WHERE Entry = 33168;
UPDATE creature_template SET faction_H = 16 WHERE Entry = 33168;
UPDATE `creature_template` SET `dmg_multiplier`=3.2 WHERE `entry`=32918;
UPDATE `creature_template` SET `dmg_multiplier`=6.4 WHERE `entry`=33399;

DELETE FROM spell_script_names WHERE spell_id IN (62623,62872);
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(62623, "spell_freya_sunbeam"),
(62872, "spell_freya_sunbeam");
DELETE FROM spell_script_names WHERE spell_id = 64648;
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES (64648,"spell_freya_natural_bomb_spell");
DELETE FROM spell_script_names WHERE spell_id IN (62524,62525,62521);
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(62524,"spell_attuned_to_nature_remove"),
(62525,"spell_attuned_to_nature_remove"),
(62521,"spell_attuned_to_nature_remove");
DELETE FROM spell_script_names WHERE spell_id = 62688;
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES (62688,"spell_summon_wave_effect_10mob");

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62968,65761,62713);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62968, 'spell_elder_essence_targeting'),
(65761, 'spell_elder_essence_targeting'),
(62713, 'spell_elder_essence_targeting');

-- Mimiron
-- Mimiron Tram
UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');
DELETE FROM gameobject_template WHERE entry = '194438';
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);

-- Mimiron
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_mimiron' WHERE `entry` = 33350;
-- Leviathan MKII
UPDATE `creature_template` SET `vehicleid` = 370, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk' WHERE `entry` = 33432;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34106;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk_turret' WHERE `entry` = 34071;
DELETE FROM vehicle_template_accessory WHERE entry = 33432;
INSERT INTO vehicle_template_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret', 8, 0);
UPDATE creature_template SET ScriptName = 'npc_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (33432,33651);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(33432,46598,1,0), -- Leviatan MKII - Ride Vehicle Hardcoded
(33651,46598,1,0); -- VX 001 - Ride Vehicle Hardcoded

-- VX-001
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `vehicleid` = 371, `ScriptName` = 'boss_vx_001' WHERE `entry` = 33651;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34108;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 34050;
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2 WHERE `entry` = 34211;
UPDATE `creature_template` SET `ScriptName` = 'npc_rocket_strike' WHERE `entry` = 34047;

-- Aerial Command Unit
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'boss_aerial_unit', `vehicleid` = 372 WHERE `entry` = 33670;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34109;
UPDATE `creature_template` SET `ScriptName` = 'npc_magnetic_core' WHERE `entry` = 34068;
UPDATE `creature_template` SET `ScriptName` = 'npc_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `difficulty_entry_1` = 34148, `ScriptName` = 'npc_emergency_bot' WHERE `entry` = 34147;

-- HardMode
UPDATE `gameobject_template` SET `flags` = 32, `ScriptName` = 'go_not_push_button' WHERE `entry` = 194739;
UPDATE `creature_template` SET `difficulty_entry_1` = 34361, `ScriptName` = 'npc_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `speed_walk` = 0.15, `speed_run` = 0.15, `ScriptName` = 'npc_mimiron_flame_trigger' WHERE `entry` = 34363;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_flame_spread' WHERE `entry` = 34121;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_bomb_bot' WHERE `entry` = 33836;

-- CleanUp
DELETE FROM creature WHERE id IN (34071, 33856);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 34143;

-- Leviathan Hitpoints
UPDATE `creature_template` SET `exp`=0 WHERE `entry` IN (33432,34071,34106);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=63414;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,63414,18,1,33651);

DELETE FROM `spell_script_names` WHERE `spell_id`=63382;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63382, 'spell_rapid_burst');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (64570,65192,64626,65333,64619);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64570,18,1,34121),
(13,64570,18,1,34363),
(13,65192,18,1,34121),
(13,65192,18,1,34363),
(13,64626,18,1,34121),
(13,64626,18,1,34363),
(13,65333,18,1,34121),
(13,65333,18,1,34363),
(13,64619,18,1,34121),
(13,64619,18,1,34363);

UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (34149,34361);

-- Junk Bot
UPDATE `creature_template` SET `difficulty_entry_1`=34114 WHERE `entry`=33855;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `dmg_multiplier`=15 WHERE `entry`=34114;

-- Thorim
UPDATE `creature_template` SET `speed_walk` = 1.66667, `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `speed_walk` = 1.66667, `baseattacktime` = 1500, `equipment_id` = 1844, `mechanic_immune_mask` = 650854239 WHERE `entry` = 33147;
DELETE FROM `creature` WHERE `id`=32865;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(32865, 603, 3, 1, 28977, 0, 2134.967, -298.962, 438.331, 1.57, 604800, 0, 0, 4183500, 425800, 0);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');

-- Charge Orb
DELETE FROM conditions WHERE SourceEntry = 62016;
INSERT INTO `conditions` VALUES
('13','0','62016','0','0','18','0','1','33378','0','0','0','',NULL);
UPDATE `creature_template` SET `unit_flags` = 33685508 WHERE `entry` = 33378;

-- Gate
DELETE FROM `gameobject_template` WHERE `entry`=194265;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','35','48','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0');
UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;

-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32885, 32883, 32908, 32907, 32882, 33110, 32886, 32879, 32892, 33140, 33141, 33378, 32874, 32875)
OR guid IN (136694, 136695, 136666, 136706, 136754, 136653, 136756, 136757, 136725, 136718);

-- Pre adds
UPDATE `creature_template` SET `equipment_id` = 1849, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 33153;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32883;
UPDATE `creature_template` SET `equipment_id` = 1847 WHERE `entry` = 33152;
UPDATE `creature_template` SET `equipment_id` = 1850, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32908;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 33151;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32907;
UPDATE `creature_template` SET `equipment_id` = 1852 WHERE `entry` = 33150;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32882;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32886;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);

UPDATE `creature_template` SET `InhabitType`=3 WHERE `entry`=33214;
UPDATE `creature` SET `modelid`=28830, `curhealth`=6000, `spawntimesecs`=150 WHERE `id`=33214;

SET @GUID := 302618;

DELETE FROM `creature` WHERE `id`=33214 AND `spawnMask`=2;
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+64;
INSERT INTO `creature` VALUES

(@GUID,33214,603,3,1,28830,0,278.447,-37.0855,493.119,4.88278,150,50,0,6000,0,1,0,0,0),
(@GUID+1,33214,603,3,1,28830,0,278.935,48.7189,480.907,1.02569,150,50,0,6000,0,1,0,0,0),
(@GUID+2,33214,603,3,1,28830,0,254.262,8.02975,492.596,1.02569,150,50,0,6000,0,1,0,0,0),
(@GUID+3,33214,603,3,1,28830,0,247.109,-3.76575,481.68,1.02569,150,50,0,6000,0,1,0,0,0),
(@GUID+4,33214,603,3,1,28830,0,242.736,-11.7488,483.917,1.51107,150,50,0,6000,0,1,0,0,0),
(@GUID+5,33214,603,3,1,28830,0,241.389,-34.2777,489.461,1.51107,150,50,0,6000,0,1,0,0,0),
(@GUID+6,33214,603,3,1,28830,0,240.89,-54.6403,494.47,1.87628,150,50,0,6000,0,1,0,0,0),
(@GUID+7,33214,603,3,1,28830,0,247.584,-99.4169,505.59,1.7192,150,50,0,6000,0,1,0,0,0),
(@GUID+8,33214,603,3,1,28830,0,247.584,-99.4169,505.59,1.7192,150,50,0,6000,0,1,0,0,0),
(@GUID+9,33214,603,3,1,28830,0,301.55,-57.969,483.79,1.78596,150,50,0,6000,0,1,0,0,0),
(@GUID+10,33214,603,3,1,28830,0,306.495,-80.5966,483.264,1.4718,150,50,0,6000,0,1,0,0,0),
(@GUID+11,33214,603,3,1,28830,0,304.458,-101.109,475.529,1.4718,150,50,0,6000,0,1,0,0,0),
(@GUID+12,33214,603,3,1,28830,0,270.451,-104.592,499.689,0.102063,150,50,0,6000,0,1,0,0,0),
(@GUID+13,33214,603,3,1,28830,0,251.8,-105.335,478.027,5.88809,150,50,0,6000,0,1,0,0,0),
(@GUID+14,33214,603,3,1,28830,0,224.617,-81.7132,503.64,5.4844,150,50,0,6000,0,1,0,0,0),
(@GUID+15,33214,603,3,1,28830,0,213.795,-54.9709,504.995,4.03141,150,50,0,6000,0,1,0,0,0),
(@GUID+16,33214,603,3,1,28830,0,215.664,-26.3504,501.716,4.64716,150,50,0,6000,0,1,0,0,0),
(@GUID+17,33214,603,3,1,28830,0,225.759,5.35536,485.904,4.29373,150,50,0,6000,0,1,0,0,0),
(@GUID+18,33214,603,3,1,28830,0,249.131,41.0152,496.479,3.08343,150,50,0,6000,0,1,0,0,0),
(@GUID+19,33214,603,3,1,28830,0,275.488,37.3128,515.305,1.36812,150,50,0,6000,0,1,0,0,0),
(@GUID+20,33214,603,3,1,28830,0,267.019,7.84005,520.192,0.844262,150,50,0,6000,0,1,0,0,0),
(@GUID+21,33214,603,3,1,28830,0,249.233,-12.4071,490.774,1.71291,150,50,0,6000,0,1,0,0,0),
(@GUID+22,33214,603,3,1,28830,0,263.001,-52.8104,502.854,2.99547,150,50,0,6000,0,1,0,0,0),
(@GUID+23,33214,603,3,1,28830,0,281.722,-52.1936,493.548,4.59847,150,50,0,6000,0,1,0,0,0),
(@GUID+24,33214,603,3,1,28830,0,293.089,-7.94317,526.191,4.24739,150,50,0,6000,0,1,0,0,0),
(@GUID+25,33214,603,3,1,28830,0,297.864,8.30275,512.314,4.09188,150,50,0,6000,0,1,0,0,0),
(@GUID+26,33214,603,3,1,28830,0,216.331,-13.3252,518.529,1.72783,150,50,0,6000,0,1,0,0,0),
(@GUID+27,33214,603,3,1,28830,0,216.235,-58.6133,499.739,1.24324,150,50,0,6000,0,1,0,0,0),
(@GUID+28,33214,603,3,1,28830,0,208.362,-81.7844,497.082,1.03275,150,50,0,6000,0,1,0,0,0),
(@GUID+29,33214,603,3,1,28830,0,208.04,-82.3793,504.421,4.30629,150,50,0,6000,0,1,0,0,0),
(@GUID+30,33214,603,3,1,28830,0,219.582,-55.5374,518.925,4.30629,150,50,0,6000,0,1,0,0,0),
(@GUID+31,33214,603,3,1,28830,0,251.518,-11.8081,489.351,3.967,150,50,0,6000,0,1,0,0,0),
(@GUID+32,33214,603,3,1,28830,0,284.764,24.211,484.056,3.967,150,50,0,6000,0,1,0,0,0),
(@GUID+33,33214,603,3,1,28830,0,297.267,37.7566,493.207,3.43293,150,50,0,6000,0,1,0,0,0),
(@GUID+34,33214,603,3,1,28830,0,327.535,46.8332,489.191,1.64851,150,50,0,6000,0,1,0,0,0),
(@GUID+35,33214,603,3,1,28830,0,329.676,19.342,483.714,1.33435,150,50,0,6000,0,1,0,0,0),
(@GUID+36,33214,603,3,1,28830,0,321.882,-13.0024,487.786,1.33435,150,50,0,6000,0,1,0,0,0),
(@GUID+37,33214,603,3,1,28830,0,314.911,-41.9326,470.413,1.33435,150,50,0,6000,0,1,0,0,0),
(@GUID+38,33214,603,3,1,28830,0,309.555,-68.1847,483.734,1.79302,150,50,0,6000,0,1,0,0,0),
(@GUID+39,33214,603,3,1,28830,0,315.657,-95.1902,480.442,5.51266,150,50,0,6000,0,1,0,0,0),
(@GUID+40,33214,603,3,1,28830,0,278.184,-92.9812,502.851,5.22992,150,50,0,6000,0,1,0,0,0),
(@GUID+41,33214,603,3,1,28830,0,267.19,-57.6797,506.398,5.0053,150,50,0,6000,0,1,0,0,0),
(@GUID+42,33214,603,3,1,28830,0,261.269,-25.9536,505.211,4.70606,150,50,0,6000,0,1,0,0,0),
(@GUID+43,33214,603,3,1,28830,0,256.682,2.12704,507.823,5.01708,150,50,0,6000,0,1,0,0,0),
(@GUID+44,33214,603,3,1,28830,0,242.466,31.8077,493.654,6.13941,150,50,0,6000,0,1,0,0,0),
(@GUID+45,33214,603,3,1,28830,0,212.067,36.2086,491.848,1.2668,150,50,0,6000,0,1,0,0,0),
(@GUID+46,33214,603,3,1,28830,0,203.205,7.95895,494.388,1.2668,150,50,0,6000,0,1,0,0,0),
(@GUID+47,33214,603,3,1,28830,0,195.024,-18.1174,471.059,1.2668,150,50,0,6000,0,1,0,0,0),
(@GUID+48,33214,603,3,1,28830,0,182.525,-57.9608,491.788,1.2668,150,50,0,6000,0,1,0,0,0),
(@GUID+49,33214,603,3,1,28830,0,182.525,-57.9608,470.788,1.52756,150,50,0,6000,0,1,0,0,0),
(@GUID+50,33214,603,3,1,28830,0,181.154,-89.6438,471.985,1.52756,150,50,0,6000,0,1,0,0,0),
(@GUID+51,33214,603,3,1,28830,0,189.521,-115.227,485.493,4.3385,150,50,0,6000,0,1,0,0,0),
(@GUID+52,33214,603,3,1,28830,0,204.773,-76.3535,506.222,4.3385,150,50,0,6000,0,1,0,0,0),
(@GUID+53,33214,603,3,1,28830,0,217.066,-45.0197,500.71,4.3385,150,50,0,6000,0,1,0,0,0),
(@GUID+54,33214,603,3,1,28830,0,233.844,-2.25781,511.069,4.3385,150,50,0,6000,0,1,0,0,0),
(@GUID+55,33214,603,3,1,28830,0,238.768,10.2939,499.838,5.27155,150,50,0,6000,0,1,0,0,0),
(@GUID+56,33214,603,3,1,28830,0,226.158,28.0768,493.037,2.10954,150,50,0,6000,0,1,0,0,0),
(@GUID+57,33214,603,3,1,28830,0,241.149,2.99724,507.541,2.10954,150,50,0,6000,0,1,0,0,0),
(@GUID+58,33214,603,3,1,28830,0,250.151,-32.0961,504.084,1.53148,150,50,0,6000,0,1,0,0,0),
(@GUID+59,33214,603,3,1,28830,0,250.151,-32.0961,490.084,1.53148,150,50,0,6000,0,1,0,0,0),
(@GUID+60,33214,603,3,1,28830,0,255.478,-64.6037,502.022,1.96267,150,50,0,6000,0,1,0,0,0),
(@GUID+61,33214,603,3,1,28830,0,264.752,-78.7968,500.556,3.62614,150,50,0,6000,0,1,0,0,0),
(@GUID+62,33214,603,3,1,28830,0,283.89,-68.7223,496.885,4.88278,150,50,0,6000,0,1,0,0,0),
(@GUID+63,33214,603,3,1,28830,0,270.921,6.65616,500.337,4.88278,150,50,0,6000,0,1,0,0,0),
(@GUID+64,33214,603,3,1,28830,0,266.205,34.0651,492.053,4.67229,150,50,0,6000,0,1,0,0,0);

-- Thorim Mini bosses
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `ScriptName`='npc_runic_smash' WHERE `entry`=33140;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_ancient_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_sif' WHERE `entry` = 33196;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875, 33110);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62942,62466,62976,64098);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13, 62942, 18, 1, 33110),
(13, 62942, 18, 1, 32874),
(13, 62942, 18, 1, 32872),
(13, 62942, 18, 1, 32875),
(13, 62466, 18, 1, 32780),
(13, 64098, 18, 1, 32865),
(13, 62976, 18, 1, 34055);

UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35 WHERE `entry`=34055;

-- thorim - lightning orb (temporary)
UPDATE `creature_template` SET `speed_run`=9.6, `dmg_multiplier`=200, `baseattacktime`=1000, `Health_mod`=100 WHERE `entry`=33138;

DELETE FROM `spell_script_names` WHERE `spell_id`=62042;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62042, 'spell_stormhammer_targeting');

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32865;
UPDATE `creature_template` SET `dmg_multiplier`=40 WHERE `entry`=33147;
UPDATE `creature` SET `position_z`=440.331 WHERE `id`=32865;

-- General Vezax
UPDATE creature_template SET scriptname = 'boss_general_vezax' WHERE entry = 33271;
UPDATE creature_template SET scriptname = 'mob_saronit_animus' WHERE entry = 33524;
DELETE FROM spell_script_names WHERE spell_id = 62692;
INSERT INTO spell_script_names VALUE (62692,'spell_general_vezax_aura_of_despair_aura');
DELETE FROM spell_script_names WHERE spell_id = 63276;
INSERT INTO spell_script_names VALUE (63276,'spell_general_vezax_mark_of_the_faceless_aura');

-- set 25N chopper spells
UPDATE `creature_template` SET `spell1`=62974, `spell2`=62286, `spell3`=62299, `spell4`=64660 WHERE `entry`=34045;

-- longer steelforged defender respawn timer (should not be DB spawned at all?)
UPDATE `creature` SET `spawntimesecs`=1800 WHERE `id`=33236;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=63322;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,63322,18,1,0);

DELETE FROM `spell_script_names` WHERE `spell_id`=63278;
INSERT INTO `spell_script_names` VALUE (63278, 'spell_general_vezax_mark_of_the_faceless_drain');

-- run speed
UPDATE `creature_template` SET `speed_run`=1.42857, `baseattacktime`=1500 WHERE `entry` IN (33271,33449);

-- Yogg-Saron
DELETE FROM `conditions` WHERE `SourceEntry`=62834 AND `SourceTypeOrReferenceId`=13 AND `ConditionTypeOrReference`=18;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,62834,18,1,0, 'Boombot Boom - Player target'),
(13,62834,18,1,33343, 'Boombot Boom - Scrapbot target'),
(13,62834,18,1,33344, 'Boombot Boom - Pummeler target'),
(13,62834,18,1,33346, 'Boombot Boom - Boombot target'),
(13,62834,18,1,33329, 'Boombot Boom - Heart of the Deconstructor target'),
(13,62834,18,1,33293, 'Boombot Boom - XT-002 target');

UPDATE creature_template SET scriptname = 'boss_sara' WHERE entry = 33134;
UPDATE script_texts SET npc_entry = 33134 WHERE npc_entry = 33288 AND entry IN (-1603330,-1603331,-1603332,-1603333);
UPDATE script_texts SET content_default = "Help me! Please get them off me!" WHERE npc_entry = 33134 AND entry = -1603310;
UPDATE script_texts SET content_default = "What do you want from me? Leave me alone!" WHERE npc_entry = 33134 AND entry = -1603311;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` = 33134;
UPDATE creature_template SET scriptname = 'npc_ominous_cloud' WHERE entry = 33292;
UPDATE creature_template SET scriptname = 'npc_guardian_of_yogg_saron' WHERE entry = 33136;
UPDATE creature_template SET scriptname = 'npc_yogg_saron_tentacle' WHERE entry in (33966,33985,33983);
UPDATE creature_template SET scriptname = 'npc_descend_into_madness' WHERE entry = 34072;
UPDATE creature_template SET scriptname = 'npc_brain_of_yogg_saron' WHERE entry = 33890;
UPDATE creature_template SET scriptname = 'boss_yogg_saron' WHERE entry = 33288;
UPDATE creature_template SET scriptname = 'npc_influence_tentacle' WHERE entry in (33716,33720,33719,33717,33433,33567);
UPDATE creature_template SET scriptname = 'npc_immortal_guardian' WHERE entry = 33988;
UPDATE creature_template SET scriptname = 'npc_support_keeper' WHERE entry in (33410,33411,33412,33413);
UPDATE creature_template SET scriptname = 'npc_sanity_well' WHERE entry = 33991;
UPDATE creature_template SET modelid1 = 11686, modelid2 = 11686 WHERE entry = 33991;
UPDATE creature_template SET scriptname = 'npc_death_orb' WHERE entry = 33882;
UPDATE creature_template SET modelid1 = 16946, modelid2 = 16946 WHERE entry = 33882;
UPDATE creature_template SET scriptname = 'npc_death_ray' WHERE entry = 33881;
UPDATE creature_template SET modelid1 = 17612, modelid2 = 17612 WHERE entry = 33881;
UPDATE creature_template SET minlevel = 80, maxlevel = 80, scriptname = 'npc_laughting_skull' WHERE entry = 33990;
UPDATE creature_template SET modelid1 = 15880, modelid2 = 15880 WHERE entry = 33990;
UPDATE creature_template SET scriptname = 'npc_keeper_help' WHERE entry IN(33241,33244,33242,33213);
UPDATE `creature_template` SET `minlevel`=80  , `maxlevel`=80 WHERE `entry` = 33943;
UPDATE gameobject_template SET scriptname = 'go_flee_to_surface' WHERE entry = 194625;
UPDATE item_template SET scriptname = 'item_unbound_fragments_of_valanyr' WHERE entry = 45896;

UPDATE creature_template SET RegenHealth = 0 WHERE entry IN (33134,34332,33890,33954);

-- Secound Damage Effekt of ShadowNova only on other Guardians or Sara
DELETE FROM conditions WHERE SourceEntry = 65209;
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,65209,0,18,1,33136,0,0,'','Effekt only for Guardian of YoggSaron'),
(13,0,65209,0,18,1,33134,0,0,'','Effekt only for Sara');

DELETE FROM gameobject WHERE id = 194625;
INSERT INTO gameobject 
(guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state)
VALUES 
(603001, 194625, 603, 3, 1, 2001.40, -59.66, 245.07, 0, 0, 0, 0, 0, 60, 100, 1),
(603002, 194625, 603, 3, 1, 1941.61, -25.88, 244.98, 0, 0, 0, 0, 0, 60, 100, 1),
(603003, 194625, 603, 3, 1, 2001.18,  9.409, 245.24, 0, 0, 0, 0, 0, 60, 100, 1);

-- Auren shouldnt hit other friendly NPCs
DELETE FROM spell_script_names WHERE spell_id IN (62670,62671,62702,62650);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(62670,'spell_keeper_support_aura_targeting'),
(62671,'spell_keeper_support_aura_targeting'),
(62702,'spell_keeper_support_aura_targeting'),
(62650,'spell_keeper_support_aura_targeting');

-- Script for Target Faces Caster
DELETE FROM spell_script_names WHERE spell_id IN (64164,64168);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64164,'spell_lunatic_gaze_targeting'),
(64168,'spell_lunatic_gaze_targeting');

-- Trigger Effekt on Near Player with Brain Link 
DELETE FROM spell_script_names WHERE spell_id IN (63802);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(63802,'spell_brain_link_periodic_dummy');

-- Needed for Titanic Storm
-- Script for Target have Weakened Aura
DELETE FROM spell_script_names WHERE spell_id IN (64172);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64172,'spell_titanic_storm_targeting');

-- Condition because NPCs need this else no hit
DELETE FROM conditions WHERE SourceEntry in (64172,64465);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,64172,0,18,1,33988,0,0,'','Effekt only for Immortal Guardians'),
(13,0,64465,0,18,1,33988,0,0,'','Effekt only for Immortal Guardians');

-- Spell Target - Induce Madness
DELETE FROM conditions WHERE SourceEntry = 64059;
INSERT INTO conditions VALUES
(13,0,64059,0,0,18,0,1,0,0,0,0,'','Induce Madness - on Players');

-- Hodir Secound Aura Script
DELETE FROM spell_script_names WHERE spell_id IN (64174);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64174,'spell_hodir_protective_gaze');

-- Insane Death trigger on Remove
DELETE FROM spell_script_names WHERE spell_id IN (63120);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(63120,'spell_insane_death_effekt');

-- Deathray Effekt on Death Orb
DELETE FROM conditions WHERE SourceEntry IN (63882,63886);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,63882,0,18,1,33882,0,0,'','Effekt on Death Orb'),
(13,0,63886,0,18,1,33882,0,0,'','Effekt on Death Orb');

-- Correct Summon Position of Tentacle
DELETE FROM spell_script_names WHERE spell_id IN (64139,64143,64133);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64139,'spell_summon_tentacle_position'),
(64143,'spell_summon_tentacle_position'),
(64133,'spell_summon_tentacle_position');

-- Heal Trigger for Empowering Shadows
DELETE FROM spell_script_names WHERE spell_id IN (64466);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES
(64466,'spell_empowering_shadows');

-- Create Val'anyr on Yogg-Saron
DELETE FROM conditions WHERE SourceEntry IN (64184);
INSERT INTO conditions
(SourceTypeOrReferenceId,SourceGroup,SourceEntry,ElseGroup,
 ConditionTypeOrReference,ConditionValue1,ConditionValue2,ConditionValue3,
 ErrorTextId,ScriptName,COMMENT)
VALUES
(13,0,64184,0,18,1,33288,0,0,'','Effekt on YoggSaron');

-- Missing Says Vision
DELETE FROM script_texts WHERE entry BETWEEN -1603360 AND -1603342;
INSERT INTO script_texts (`npc_entry`,`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES
(33436,-1603342,'Bad news sire.',15538,0,0,0,'Garona KingLlaneVision_Say1'),
(33436,-1603343,'The clans are united under Blackhand in this assault. They will stand together until Stormwind has fallen.',15539,0,0,0,'Garona KingLlaneVision_Say2'),
(33436,-1603344,'Gul\'dan is bringing up his warlocks by nightfall. Until then, the Blackrock clan will be trying to take the Eastern Wall.',15540,0,0,0,'Garona KingLlaneVision_Say3'),
(33288,-1603345,'A thousand deaths... or one murder.',15762,0,0,0,'YoggSaron KingLlaneVision_Say1'),
(33288,-1603346,'',15763,0,0,0,'YoggSaron KingLlianeVision_Say2'),
(33437,-1603347,'We will hold until the reinforcements come. As long as men with stout hearts are manning the walls and throne Stormwind will hold.',15585,0,0,0,'KingLlane KingLlaneVision_Say'),
(33436,-1603348,'The orc leaders agree with your assessment.',15541,0,0,0,'Garona KingLlaneVision_Say4'),
(33288,-1603349,'Your petty quarrels only make me stronger!',15764,0,0,0,'YoggSaron KingLlaneVision_Say3'),

(33441,-1603350,'Your resilience is admirable.',15598,0,0,0,'TheLichKing LichKingVision_Say1'),
(33442,-1603351,'Arrrrrrgh!',15470,1,0,0,'ImmolatedChampion LichKingVision_Say1'),
(33442,-1603352,'I\'m not afraid of you!',15471,0,0,0,'ImmolatedChampion LichKingVision_Say2'),
(33441,-1603353,'I will break you as I broke him.',15599,0,0,0,'TheLichKing LichKingVision_Say2'),
(33288,-1603354,'Yrr n\'lyeth... shuul anagg!',15766,0,0,0,'YoggSaron LichKingVision_Say1'),
(33288,-1603355,'He will learn... no king rules forever, only death is eternal!',15767,0,0,0,'YoggSaron LichKingVision_Say2'),

(33523,-1603356,'It is done... All have been given that which must be given. I now seal the Dragon Soul forever...',15631,0,0,0,'Neltharion DragonSoulVision_Say1'),
(33495,-1603357,'That terrible glow... should that be?',15702,0,0,0,'Ysera DragonSoulVision_Say'),
(33523,-1603358,'For it to be as it must, yes.',15632,0,0,0,'Neltharion DragonSoulVision_Say2'),
(33535,-1603359,'It is a weapon like no other. It must be like no other.',15610,0,0,0,'Malygos DragonSoulVision_Say'),
(33288,-1603360,'His brood learned their lesson before too long, you shall soon learn yours!',15765,0,0,0,'YoggSaron DragonSoulVision_Say1');

-- For Achievement In his House he waits dreaming
DELETE FROM achievement_criteria_data WHERE `type` = 18 AND criteria_id IN
(10321,10322,10323,10324,10325,10326);

INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10321,18,0,0,''),(10322,18,0,0,''),
(10323,18,0,0,''),(10324,18,0,0,''),
(10325,18,0,0,''),(10326,18,0,0,'');

DELETE FROM disables WHERE sourceType = 4 AND entry IN 
(10321,10322,10323,10324,10325,10326);

-- Brain of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1`=33954 WHERE `entry`=33890;

-- Guardian of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1`=33968 WHERE `entry`=33136;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33136;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82, `faction_A`=16, `faction_H`=16, `speed_walk`=1.6, `speed_run`=1.71429, `unit_flags`=32768, `AIName`='' WHERE `entry`=33968;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33136;
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=33968;

-- Immortal Guardian
UPDATE `creature_template` SET `difficulty_entry_1`=33989 WHERE `entry`=33988;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33988;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=33989;
UPDATE `creature_template` SET `dmg_multiplier`=4 WHERE `entry`=33988;
UPDATE `creature_template` SET `dmg_multiplier`=6 WHERE `entry`=33989;

-- Constrictor Tentacle
UPDATE `creature_template` SET `difficulty_entry_1`=33984 WHERE `entry`=33983;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33983;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=33984;

-- Corruptor Tentacle
UPDATE `creature_template` SET `difficulty_entry_1`=33986 WHERE `entry`=33985;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33985;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=33986;

-- Crusher Tentacle
UPDATE `creature_template` SET `difficulty_entry_1`=33967 WHERE `entry`=33966;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33966;
UPDATE `creature_template` SET `minlevel`=81, `maxlevel`=81 WHERE `entry`=33967;
UPDATE `creature_template` SET `dmg_multiplier`=15 WHERE `entry`=33966;
UPDATE `creature_template` SET `dmg_multiplier`=30 WHERE `entry`=33967;

-- Algalon
-- For Achievement He Feeds on your Tears
DELETE FROM achievement_criteria_data WHERE `type` = 18 AND criteria_id IN
(10568,10570);

INSERT INTO achievement_criteria_data (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10568,18,0,0,''),
(10570,18,0,0,'');

DELETE FROM disables WHERE sourceType = 4 AND entry IN 
(10568,10570);

-- spawn algalon
DELETE FROM `creature` WHERE `id`=32871;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('302616','32871','603','3','1','0','0','1632.36','-310.093','417.321','1.8445','604800','0','0','34862500','0','0','0','0','0');

-- set to friendly by default
UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35, `flags_extra`=1 WHERE `entry` IN (32871,33070);

UPDATE `creature_template` SET `ScriptName`='npc_black_hole' WHERE `entry`=32953;
UPDATE `creature_template` SET `ScriptName`='npc_living_constellation' WHERE `entry`=33052;

-- spawn 'Celestial Planetarium Access'
DELETE FROM `gameobject` WHERE `id`= 194628;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES (400002, 194628, 603, 3, 1, 1649.49, -174.711, 427.257, 1.5708, 0, 0, 0, 0, 180, 0, 1);

UPDATE `gameobject_template` SET `data0`=0, `ScriptName`='go_planetarium_access' WHERE `entry`=194628;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (62169,-64412);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(64417,62169,2, 'Phase Punch - Trigger Black Hole Dot'),
(62168,62169,2, 'Black Hole - Trigger Black Hole Dot'),
(64417,-64412,1, 'Phase Punch - Remove Phase Punch');

UPDATE `gameobject` SET `phaseMask`=17 WHERE `id` IN (194910,194715,194148);

UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14, `unit_flags`=6, `InhabitType`=7, `AIName`='SmartAI', `flags_extra`=130 WHERE `entry`=33104;
UPDATE `creature_template` SET `unit_flags`=512, `flags_extra`=130 WHERE `entry`=33105;
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83 WHERE `entry` IN (33104,33070);

DELETE FROM `smart_scripts` WHERE `entryorguid`=33104;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33104,0,0,0,1,0,100,3,4000,4000,0,0,11,62304,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Algalon Asteroid - Cast Cosmic Smash 10N'),
(33104,0,1,0,1,0,100,5,4000,4000,0,0,11,64597,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Algalon Asteroid - Cast Cosmic Smash 25N');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62304,64597,64996);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,62304,18,1,33105),
(13,64597,18,1,33105),
(13,64996,18,1,34246);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62301,64598,62293,62295,62311,64596,64597,64445,62168,64417);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62301, 'spell_cosmic_smash'),
(64598, 'spell_cosmic_smash'),
(62293, 'spell_cosmic_smash_summon_trigger'),
(62295, 'spell_cosmic_smash_summon_target'),
(62311, 'spell_cosmic_smash_dmg'),
(64596, 'spell_cosmic_smash_dmg'),
(64597, 'spell_cosmic_smash_missile_target'),
(64445, 'spell_remove_player_from_phase'),
(62168, 'spell_algalon_phased'),
(64417, 'spell_algalon_phased');

-- Heart of Magic
UPDATE `gameobject_template` SET `data15`=1 WHERE `entry` IN (194158,194159);

-- Dark Matter
SET @GUID := 302685;

DELETE FROM `creature` WHERE `id`=33089;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'33089','603','3','16','0','0','1607.99','-289.992','417.321','5.89086','10','10','0','37800','0','1','0','0','0'),
(@GUID+1,'33089','603','3','16','0','0','1620.23','-280.533','417.321','5.6097','10','10','0','37800','0','1','0','0','0'),
(@GUID+2,'33089','603','3','16','0','0','1638.33','-278.895','417.321','4.49364','10','10','0','37800','0','1','0','0','0'),
(@GUID+3,'33089','603','3','16','0','0','1654.22','-288.583','417.321','4.0656','10','10','0','37800','0','1','0','0','0'),
(@GUID+4,'33089','603','3','16','0','0','1661.51','-309.099','417.321','4.28944','10','10','0','37800','0','1','0','0','0'),
(@GUID+5,'33089','603','3','16','0','0','1653.98','-327.001','417.321','3.5598','10','10','0','37800','0','1','0','0','0'),
(@GUID+6,'33089','603','3','16','0','0','1640.12','-336.194','417.321','1.68663','10','10','0','37800','0','1','0','0','0'),
(@GUID+7,'33089','603','3','16','0','0','1621.68','-333.91','417.321','2.40134','10','10','0','37800','0','1','0','0','0'),
(@GUID+8,'33089','603','3','16','0','0','1605.45','-320.182','417.321','0.444129','10','10','0','37800','0','1','0','0','0'),
(@GUID+9,'33089','603','3','16','0','0','1602.23','-303.377','417.321','6.13041','10','10','0','37800','0','1','0','0','0'),
(@GUID+10,'33089','603','3','16','0','0','1617.7','-309.616','417.321','0.204581','10','10','0','37800','0','1','0','0','0'),
(@GUID+11,'33089','603','3','16','0','0','1623.68','-295.429','417.321','5.30967','10','10','0','37800','0','1','0','0','0'),
(@GUID+12,'33089','603','3','16','0','0','1641.17','-296.46','417.321','4.12137','10','10','0','37800','0','1','0','0','0'),
(@GUID+13,'33089','603','3','16','0','0','1644.9','-313.288','417.321','2.7587','10','10','0','37800','0','1','0','0','0'),
(@GUID+14,'33089','603','3','16','0','0','1630.54','-319.732','417.321','1.53034','10','10','0','37800','0','1','0','0','0'),
(@GUID+15,'33089','603','3','16','0','0','1633.07','-306.294','417.321','1.53505','10','10','0','37800','0','1','0','0','0');

UPDATE `creature_template` SET `dmg_multiplier`=4 WHERE `entry`=33089;
UPDATE `creature_template` SET `dmg_multiplier`=7 WHERE `entry`=34221;
UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=34097;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=34222;

-- Prequest
SET @GUID := 302683;

DELETE FROM `creature` WHERE `id` IN (33956,33957);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'33956','603','1','1','0','0','1444.86','112.472','423.641','2.71061','300','0','0','75600','0','0','0','0','0'),
(@GUID+1,'33957','603','2','1','0','0','1443.35','123.526','423.641','3.67446','300','0','0','75600','0','0','0','0','0');

UPDATE `quest_template` SET `PrevQuestId`=13604 WHERE `Id`=13607;
UPDATE `quest_template` SET `PrevQuestId`=13607, `NextQuestId`=13614, `ExclusiveGroup`=-13606 WHERE `Id`=13606;
UPDATE `quest_template` SET `PrevQuestId`=13607, `NextQuestId`=13614, `ExclusiveGroup`=-13606 WHERE `Id`=13609;
UPDATE `quest_template` SET `PrevQuestId`=13607, `NextQuestId`=13614, `ExclusiveGroup`=-13606 WHERE `Id`=13610;
UPDATE `quest_template` SET `PrevQuestId`=13607, `NextQuestId`=13614, `ExclusiveGroup`=-13606 WHERE `Id`=13611;

UPDATE `quest_template` SET `PrevQuestId`=13817 WHERE `Id`=13816;
UPDATE `quest_template` SET `PrevQuestId`=13816, `NextQuestId`=13818, `ExclusiveGroup`=-13821 WHERE `Id`=13821;
UPDATE `quest_template` SET `PrevQuestId`=13816, `NextQuestId`=13818, `ExclusiveGroup`=-13821 WHERE `Id`=13822;
UPDATE `quest_template` SET `PrevQuestId`=13816, `NextQuestId`=13818, `ExclusiveGroup`=-13821 WHERE `Id`=13823;
UPDATE `quest_template` SET `PrevQuestId`=13816, `NextQuestId`=13818, `ExclusiveGroup`=-13821 WHERE `Id`=13824;

-- Various
-- Add passive Flag to various Ulduar triggers
UPDATE creature_template SET unit_flags = unit_flags|512 WHERE entry IN (
33054, -- Thorim Trap Bunny
33500, -- Vezax Bunny
33575, -- Channel Stalker Freya
33661, -- Armsweep Stalker Kologarn
34188, -- Razorscale Devouring Flame Stalker
34189, -- Razorscale Devouring Flame Stalker (heroic)
34098, -- Auriaya Seeping Essence Stalker
34174, -- Auriaya Seeping Essence Stalker (heroic)
33809, -- Rubble Stalker Kologarn
33942, -- Rubble Stalker Kologarn (heroic)
33571, -- Ulduar Gauntlet Generator
34159  -- Ulduar Gauntlet Generator (small radius)
);

UPDATE creature_template SET scriptname = 'mob_saronit_vapor' WHERE entry = 33488;

-- Remove NON_SELECTABLE from Clockwork Mechanic
UPDATE creature_template SET unit_flags = unit_flags &~ 33554432 WHERE entry = 34184;

-- Ignis
UPDATE `creature_template` SET `mingold`=1190671, `maxgold`=1190671 WHERE `entry`=33118;
UPDATE `creature_template` SET `mingold`=1190671*2.5, `maxgold`=1190671*2.5 WHERE `entry`=33190;
-- Razorscale
UPDATE `creature_template` SET `mingold`=325206, `maxgold`=325206 WHERE `entry`=33186;
UPDATE `creature_template` SET `mingold`=325206*2.5, `maxgold`=325206*2.5 WHERE `entry`=33724;
-- XT-002
UPDATE `creature_template` SET `mingold`=713762, `maxgold`=713762 WHERE `entry`=33293;
UPDATE `creature_template` SET `mingold`=713762*2.5, `maxgold`=713762*2.5 WHERE `entry`=33885;
-- Steelbreaker
UPDATE `creature_template` SET `mingold`=1717186, `maxgold`=1717186 WHERE `entry`=32867;
UPDATE `creature_template` SET `mingold`=1717186*2.5, `maxgold`=1717186*2.5 WHERE `entry`=33693;
-- Molgeim
UPDATE `creature_template` SET `mingold`=1763054, `maxgold`=1763054 WHERE `entry`=32927;
UPDATE `creature_template` SET `mingold`=1763054*2.5, `maxgold`=1763054*2.5 WHERE `entry`=33692;
-- Brundir
UPDATE `creature_template` SET `mingold`=1791922, `maxgold`=1791922 WHERE `entry`=32857;
UPDATE `creature_template` SET `mingold`=1791922*2.5, `maxgold`=1791922*2.5 WHERE `entry`=33694;
-- Auriaya
UPDATE `creature_template` SET `mingold`=1366181, `maxgold`=1366181 WHERE `entry`=33515;
UPDATE `creature_template` SET `mingold`=1366181*2.5, `maxgold`=1366181*2.5 WHERE `entry`=34175;
-- Vezax
UPDATE `creature_template` SET `mingold`=1810711, `maxgold`=1810711 WHERE `entry`=33271;
UPDATE `creature_template` SET `mingold`=1810711*2.5, `maxgold`=1810711*2.5 WHERE `entry`=33449;
-- Yogg-Saron
UPDATE `creature_template` SET `mingold`=2128378, `maxgold`=2128378 WHERE `entry`=33288;
UPDATE `creature_template` SET `mingold`=2128378*2.5, `maxgold`=2128378*2.5 WHERE `entry`=33955;

-- herb and mineral respawn
UPDATE `gameobject` SET `spawntimesecs`=604800 WHERE `map`=603 AND `spawntimesecs`=3600;

-- Yogg-Saron brain Interrupt Immune ( 501ac1b297e903800de2df63a34e2b5675c9fc26 )
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`| 650805115 WHERE `entry` IN (33890,33954);

-- Add Stun-Immune to XT-002 Heart; 2048 = MECHANIC_STUN
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 2048 WHERE `entry` IN (
33995, -- Heart of the Deconstructor (Heroic)
33329  -- Heart of the Deconstructor
);

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` BETWEEN 10082 AND 10087;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` BETWEEN 10082 AND 10087 AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10082,11,0,0,'achievement_i_choose_you'),
(10083,11,0,0,'achievement_i_choose_you'),
(10084,11,0,0,'achievement_i_choose_you'),
(10085,11,0,0,'achievement_i_choose_you'),
(10086,11,0,0,'achievement_i_choose_you'),
(10087,11,0,0,'achievement_i_choose_you'),
(10082,12,0,0,''),
(10083,12,0,0,''),
(10084,12,0,0,''),
(10085,12,1,0,''),
(10086,12,1,0,''),
(10087,12,1,0,'');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10088,10418,10419,10089,10420,10421);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10088,10418,10419,10089,10420,10421) AND `type` IN (11,12);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10088,11,0,0,'achievement_but_i_am_on_your_side'),
(10418,11,0,0,'achievement_but_i_am_on_your_side'),
(10419,11,0,0,'achievement_but_i_am_on_your_side'),
(10088,12,0,0,''),
(10418,12,0,0,''),
(10419,12,0,0,''),
(10089,11,0,0,'achievement_but_i_am_on_your_side'),
(10420,11,0,0,'achievement_but_i_am_on_your_side'),
(10421,11,0,0,'achievement_but_i_am_on_your_side'),
(10089,12,1,0,''),
(10420,12,1,0,''),
(10421,12,1,0,'');


DELETE FROM `spell_script_names` WHERE `spell_id` IN (62359,64979);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64979, 'spell_anti_air_rocket'),
(62359, 'spell_anti_air_rocket');

UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=33218;
UPDATE `creature_template` SET `ScriptName`='npc_liquid_pyrite' WHERE `entry`=33189;

UPDATE `creature` SET `id`=33214 WHERE `id`=33218;
UPDATE `creature` SET `spawndist`=50, `MovementType`=1 WHERE `id`=33214;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62363;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13, 62363, 18, 1, 33214);

DELETE FROM `spell_script_names` WHERE `spell_id`=62374;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62374, 'spell_pursued');

DELETE FROM `spell_script_names` WHERE `spell_id` IN(63018,65121,63024,64234);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63018, 'spell_xt002_searing_light_targeting'),
(65121, 'spell_xt002_searing_light_targeting'),
(63024, 'spell_xt002_gravity_bomb_targeting'),
(64234, 'spell_xt002_gravity_bomb_targeting');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_freya_sunbeam';
UPDATE `gameobject_loot_template` SET `item`=45624 WHERE `entry` IN (27030,26974) AND `item`=47241;
UPDATE `gameobject_loot_template` SET `item`=46053 WHERE `entry`=26974 AND `item`=46052;

-- make Orbital Support trigger and passive
UPDATE `creature_template` SET `flags_extra`=130 WHERE `entry`=34286;

-- cleanup
DELETE FROM `creature` WHERE `guid` IN (137490,137491);
DELETE FROM `creature_addon` WHERE `guid` IN (137490,137491);
DELETE FROM `creature_formations` WHERE `leaderguid`=137496;

UPDATE `spell_script_names` SET `ScriptName`='spell_auriaya_strenght_of_the_pack' WHERE `spell_id`=64381;

UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry`=33571;
UPDATE `creature_template` SET `ScriptName`='npc_pool_of_tar' WHERE `entry`=33090;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (65044,65045);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,65044,18,1,33090),
(13,65045,18,1,33090),
(13,65044,18,1,33060),
(13,65045,18,1,33060),
(13,65044,18,1,33062),
(13,65045,18,1,33062),
(13,65044,18,1,33109),
(13,65045,18,1,33109);

DELETE FROM `spell_script_names` WHERE `spell_id`=62207;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62207, 'spell_elder_brightleaf_unstable_sun_beam');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (65044,65045);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(65044, 'spell_flame_leviathan_flames'),
(65045, 'spell_flame_leviathan_flames');

UPDATE `spell_script_names` SET `ScriptName`='spell_elder_ironbranchs_essence_targeting' WHERE `spell_id`=62713;
UPDATE `spell_script_names` SET `ScriptName`='spell_elder_brightleafs_essence_targeting' WHERE `spell_id` IN (62968,65761);

DELETE FROM `spell_script_names` WHERE `spell_id`=61900;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61900, 'spell_steelbreaker_electrical_charge');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_meltdown';

-- not-so-friendly fire + rocket strike targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (63041,65040,65346);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,63041,18,1,33836),
(13,63041,18,1,34362),
(13,63041,18,1,33855),
(13,63041,18,1,34057),
(13,63041,18,1,34147),
(13,63041,18,1,0),
-- only players
(13,65040,18,1,0),
(13,65346,18,1,0);

-- not-so-friendly fire
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10405,10406) AND `type`=18;

-- firefighter
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10450,10463);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10450,10463) AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10450,11,0,0, 'achievement_firefighter'),
(10463,11,0,0, 'achievement_firefighter');

-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32872';
--
-- eventAI for Runic Colossus, ID: 32872
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Runic Colossus(32872) - Casts Charge (62614)
( '3287200', '32872', '0','0','100','5','2000','10000','10000','17500','11','62614','1','1','0','0','0','0','0','0','0','0','Runic Colossus - Casts Charge' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Runic Colossus(32872) - Casts Charge (62613)
( '3287201', '32872', '0','0','100','3','7000','15000','10000','17500','11','62613','1','1','0','0','0','0','0','0','0','0','Runic Colossus - Casts Charge' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Runic Colossus(32872) - Casts Runic Barrier (62338)
( '3287202', '32872', '0','0','100','1','12000','20000','10000','17500','11','62338','0','1','0','0','0','0','0','0','0','0','Runic Colossus - Casts Runic Barrier' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Runic Colossus(32872) - Casts Smash (62339)
( '3287203', '32872', '0','0','100','1','17000','25000','10000','17500','11','62339','0','1','0','0','0','0','0','0','0','0','Runic Colossus - Casts Smash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32872';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32873';
--
-- eventAI for Ancient Rune Giant, ID: 32873
--
DELETE FROM gameobject_scripts WHERE id=368;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ancient Rune Giant(32873) - Casts Rune Detonation (62526)
( '3287300', '32873', '0','0','100','1','2000','10000','10000','17500','11','62526','1','1','0','0','0','0','0','0','0','0','Ancient Rune Giant - Casts Rune Detonation' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Ancient Rune Giant(32873) - Casts Runic Fortification (62942)
( '3287301', '32873', '0','0','100','1','7000','15000','10000','17500','11','62942','0','1','0','0','0','0','0','0','0','0','Ancient Rune Giant - Casts Runic Fortification' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Ancient Rune Giant(32873) - Casts Stomp (62411)
( '3287302', '32873', '0','0','100','3','12000','20000','10000','17500','11','62411','1','1','0','0','0','0','0','0','0','0','Ancient Rune Giant - Casts Stomp' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Ancient Rune Giant(32873) - Casts Stomp (62413)
( '3287303', '32873', '0','0','100','5','17000','25000','10000','17500','11','62413','1','1','0','0','0','0','0','0','0','0','Ancient Rune Giant - Casts Stomp' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32873';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32874';
--
-- eventAI for Iron Ring Guard, ID: 32874
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Ring Guard(32874) - Casts Impale (62331)
( '3287400', '32874', '0','0','100','3','2000','10000','10000','17500','11','62331','1','1','0','0','0','0','0','0','0','0','Iron Ring Guard - Casts Impale' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Iron Ring Guard(32874) - Casts Impale (62418)
( '3287401', '32874', '0','0','100','5','7000','15000','10000','17500','11','62418','1','1','0','0','0','0','0','0','0','0','Iron Ring Guard - Casts Impale' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Iron Ring Guard(32874) - Casts Whirling Trip (64151)
( '3287402', '32874', '0','0','100','1','12000','20000','10000','17500','11','64151','1','1','0','0','0','0','0','0','0','0','Iron Ring Guard - Casts Whirling Trip' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32874';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32875';
--
-- eventAI for Iron Honor Guard, ID: 32875
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Honor Guard(32875) - Casts Cleave (42724)
( '3287500', '32875', '0','0','100','1','2000','10000','10000','17500','11','42724','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Cleave' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Iron Honor Guard(32875) - Casts Hamstring (48639)
( '3287501', '32875', '0','0','100','1','7000','15000','10000','17500','11','48639','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Hamstring' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Iron Honor Guard(32875) - Casts Shield Smash (62420)
( '3287502', '32875', '0','0','100','5','12000','20000','10000','17500','11','62420','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Shield Smash' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Iron Honor Guard(32875) - Casts Shield Smash (62332)
( '3287503', '32875', '0','0','100','3','17000','25000','10000','17500','11','62332','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Shield Smash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32875';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32876';
--
-- eventAI for Dark Rune Champion, ID: 32876
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Champion(32876) - Casts Charge (32323)
( '3287600', '32876', '0','0','100','1','2000','10000','10000','17500','11','32323','1','1','0','0','0','0','0','0','0','0','Dark Rune Champion - Casts Charge' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Champion(32876) - Casts Mortal Strike (35054)
( '3287601', '32876', '0','0','100','1','7000','15000','10000','17500','11','35054','1','1','0','0','0','0','0','0','0','0','Dark Rune Champion - Casts Mortal Strike' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Champion(32876) - Casts Whirlwind (15578)
( '3287602', '32876', '0','0','100','1','12000','20000','10000','17500','11','15578','0','1','0','0','0','0','0','0','0','0','Dark Rune Champion - Casts Whirlwind' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Champion(32876) - Casts Whirlwind (33500)
( '3287603', '32876', '0','0','100','1','17000','25000','10000','17500','11','33500','0','1','0','0','0','0','0','0','0','0','Dark Rune Champion - Casts Whirlwind' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32876';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32877';
--
-- eventAI for Dark Rune Warbringer, ID: 32877
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Warbringer(32877) - Casts Aura of Celerity (62320)
( '3287700', '32877', '0','0','100','1','2000','10000','10000','17500','11','62320','0','1','0','0','0','0','0','0','0','0','Dark Rune Warbringer - Casts Aura of Celerity' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Warbringer(32877) - Casts Runic Strike (62322)
( '3287701', '32877', '0','0','100','1','7000','15000','10000','17500','11','62322','1','1','0','0','0','0','0','0','0','0','Dark Rune Warbringer - Casts Runic Strike' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32877';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32878';
--
-- eventAI for Dark Rune Evoker, ID: 32878
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Lightning (62327) - raid10
( '3287800', '32878', '0','0','100','3','2000','10000','10000','17500','11','62327','1','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Lightning' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Lightning (62445) - raid25
( '3287801', '32878', '0','0','100','5','7000','15000','10000','17500','11','62445','1','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Lightning' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Mending (62446) - raid25
( '3287802', '32878', '14','0','100','5','30','3000','10000','17500','11','62446','6','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Mending' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Mending (62328) - raid10
( '3287803', '32878', '14','0','100','3','30','3000','10000','17500','11','62328','6','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Mending' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Shield (62529) - raid25
( '3287804', '32878', '0','0','100','5','22000','30000','10000','17500','11','62529','0','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Shield' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Dark Rune Evoker(32878) - Casts Runic Shield (62321) - raid10
( '3287805', '32878', '0','0','100','3','27000','35000','10000','17500','11','62321','0','1','0','0','0','0','0','0','0','0','Dark Rune Evoker - Casts Runic Shield' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32878';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32882';
--
-- eventAI for Jormungar Behemoth, ID: 32882
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Jormungar Behemoth(32882) - Casts Acid Breath (62415)
( '3288200', '32882', '0','0','100','5','2000','10000','10000','17500','11','62415','1','1','0','0','0','0','0','0','0','0','Jormungar Behemoth - Casts Acid Breath' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Jormungar Behemoth(32882) - Casts Acid Breath (62315)
( '3288201', '32882', '0','0','100','3','7000','15000','10000','17500','11','62315','1','1','0','0','0','0','0','0','0','0','Jormungar Behemoth - Casts Acid Breath' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Jormungar Behemoth(32882) - Casts Sweep (62316)
( '3288202', '32882', '0','0','100','3','12000','20000','10000','17500','11','62316','1','1','0','0','0','0','0','0','0','0','Jormungar Behemoth - Casts Sweep' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Jormungar Behemoth(32882) - Casts Sweep (62417)
( '3288203', '32882', '0','0','100','5','17000','25000','10000','17500','11','62417','1','1','0','0','0','0','0','0','0','0','Jormungar Behemoth - Casts Sweep' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32882';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32886';
--
-- eventAI for Dark Rune Acolyte, ID: 32886
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Circle of Healing (61964)
( '3288600', '32886', '0','0','100','1','2000','10000','10000','17500','11','61964','0','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Circle of Healing' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Greater Heal (62334)
( '3288601', '32886', '14','0','100','1','30','15000','10000','17500','11','62334','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Greater Heal (61965)
( '3288602', '32886', '14','0','100','1','30','20000','10000','17500','11','61965','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Holy Smite (62335)
( '3288603', '32886', '0','0','100','1','17000','25000','10000','17500','11','62335','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32886) - Casts Renew (61967)
( '3288604', '32886', '14','0','100','1','30','3000','10000','17500','11','61967','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32886';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32893';
--
-- eventAI for Missy Flamecuffs, ID: 32893
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Missy Flamecuffs(32893) - Casts Conjure Toasty Fire (62823)
( '3289300', '32893', '0','0','100','1','2000','10000','10000','17500','11','62823','1','1','0','0','0','0','0','0','0','0','Missy Flamecuffs - Casts Conjure Toasty Fire' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Missy Flamecuffs(32893) - Casts Fireball (61909)
( '3289301', '32893', '0','0','100','1','7000','15000','10000','17500','11','61909','1','1','0','0','0','0','0','0','0','0','Missy Flamecuffs - Casts Fireball' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Missy Flamecuffs(32893) - Casts Melt Ice (64528)
( '3289302', '32893', '0','0','100','1','12000','20000','10000','17500','11','64528','1','1','0','0','0','0','0','0','0','0','Missy Flamecuffs - Casts Melt Ice' ),
-- Is humanoid: Flee at 15% hp
( '3289303', '32893', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Missy Flamecuffs - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32893';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32897';
--
-- eventAI for Field Medic Penny, ID: 32897
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Field Medic Penny(32897) - Casts Dispel Magic (63499)
( '3289700', '32897', '0','0','100','1','2000','10000','10000','17500','11','63499','1','1','0','0','0','0','0','0','0','0','Field Medic Penny - Casts Dispel Magic' ),
-- Cast timed spell: when Friendly target missing 3000 HP and then every 10000s and 17500s
-- Field Medic Penny(32897) - Casts Great Heal (62809)
( '3289701', '32897', '14','0','100','1','30','3000','10000','17500','11','62809','6','1','0','0','0','0','0','0','0','0','Field Medic Penny - Casts Great Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Field Medic Penny(32897) - Casts Smite (61923)
( '3289702', '32897', '0','0','100','1','12000','20000','10000','17500','11','61923','1','1','0','0','0','0','0','0','0','0','Field Medic Penny - Casts Smite' ),
-- Is humanoid: Flee at 15% hp
( '3289703', '32897', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Field Medic Penny - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32897';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32900';
--
-- eventAI for Elementalist Avuun, ID: 32900
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Elementalist Avuun(32900) - Casts Lava Burst (61924)
( '3290000', '32900', '0','0','100','1','2000','10000','10000','17500','11','61924','1','1','0','0','0','0','0','0','0','0','Elementalist Avuun - Casts Lava Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Elementalist Avuun(32900) - Casts Storm Cloud (65123) - raid10
( '3290001', '32900', '0','0','100','3','7000','15000','10000','17500','11','65123','0','1','0','0','0','0','0','0','0','0','Elementalist Avuun - Casts Storm Cloud' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Elementalist Avuun(32900) - Casts Storm Cloud (65133) - raid25
( '3290002', '32900', '0','0','100','5','12000','20000','10000','17500','11','65133','0','1','0','0','0','0','0','0','0','0','Elementalist Avuun - Casts Storm Cloud' ),
-- Is humanoid: Flee at 15% hp
( '3290003', '32900', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Elementalist Avuun - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32900';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32901';
--
-- eventAI for Ellie Nightfeather, ID: 32901
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ellie Nightfeather(32901) - Casts Wrath (62793)
( '3290100', '32901', '0','0','100','1','2000','10000','10000','17500','11','62793','1','1','0','0','0','0','0','0','0','0','Ellie Nightfeather - Casts Wrath' ),
-- Is humanoid: Flee at 15% hp
( '3290101', '32901', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Ellie Nightfeather - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32901';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32904';
--
-- eventAI for Dark Rune Commoner, ID: 32904
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Commoner(32904) - Casts Low Blow (62326)
( '3290400', '32904', '0','0','100','1','2000','10000','10000','17500','11','62326','1','1','0','0','0','0','0','0','0','0','Dark Rune Commoner - Casts Low Blow' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Commoner(32904) - Casts Pummel (38313)
( '3290401', '32904', '0','0','100','1','7000','15000','10000','17500','11','38313','1','1','0','0','0','0','0','0','0','0','Dark Rune Commoner - Casts Pummel' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32904';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32916';
--
-- eventAI for Snaplasher, ID: 32916
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Snaplasher(32916) - Casts Hardened Bark (62664)
( '3291600', '32916', '0','0','100','3','2000','10000','10000','17500','11','62664','0','1','0','0','0','0','0','0','0','0','Snaplasher - Casts Hardened Bark' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Snaplasher(32916) - Casts Hardened Bark (64191)
( '3291601', '32916', '0','0','100','5','7000','15000','10000','17500','11','64191','0','1','0','0','0','0','0','0','0','0','Snaplasher - Casts Hardened Bark' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32916';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32918';
--
-- eventAI for Detonating Lasher, ID: 32918
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Detonating Lasher(32918) - Casts Detonate (62937)
( '3291800', '32918', '0','0','100','5','2000','10000','10000','17500','11','62937','0','1','0','0','0','0','0','0','0','0','Detonating Lasher - Casts Detonate' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Detonating Lasher(32918) - Casts Detonate (62598)
( '3291801', '32918', '0','0','100','3','7000','15000','10000','17500','11','62598','0','1','0','0','0','0','0','0','0','0','Detonating Lasher - Casts Detonate' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Detonating Lasher(32918) - Casts Flame Lash (62608)
( '3291802', '32918', '0','0','100','1','12000','20000','10000','17500','11','62608','1','1','0','0','0','0','0','0','0','0','Detonating Lasher - Casts Flame Lash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32918';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32919';
--
-- eventAI for Storm Lasher, ID: 32919
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Storm Lasher(32919) - Casts Lightning Lash (62648)
( '3291900', '32919', '0','0','100','3','2000','10000','10000','17500','11','62648','1','1','0','0','0','0','0','0','0','0','Storm Lasher - Casts Lightning Lash' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Storm Lasher(32919) - Casts Lightning Lash (62939)
( '3291901', '32919', '0','0','100','5','7000','15000','10000','17500','11','62939','1','1','0','0','0','0','0','0','0','0','Storm Lasher - Casts Lightning Lash' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Storm Lasher(32919) - Casts Stormbolt (62649)
( '3291902', '32919', '0','0','100','3','12000','20000','10000','17500','11','62649','1','1','0','0','0','0','0','0','0','0','Storm Lasher - Casts Stormbolt' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Storm Lasher(32919) - Casts Stormbolt (62938)
( '3291903', '32919', '0','0','100','5','17000','25000','10000','17500','11','62938','1','1','0','0','0','0','0','0','0','0','Storm Lasher - Casts Stormbolt' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32919';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32941';
--
-- eventAI for Tor Greycloud, ID: 32941
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Tor Greycloud(32941) - Casts Wrath (62793)
( '3294100', '32941', '0','0','100','1','2000','10000','10000','17500','11','62793','1','1','0','0','0','0','0','0','0','0','Tor Greycloud - Casts Wrath' ),
-- Is humanoid: Flee at 15% hp
( '3294101', '32941', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Tor Greycloud - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32941';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32946';
--
-- eventAI for Veesha Blazeweaver, ID: 32946
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- which target to cast to? is friendly npc...
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Veesha Blazeweaver(32946) - Casts Conjure Toasty Fire (62823)
( '3294600', '32946', '0','0','100','1','2000','10000','10000','17500','11','62823','0','1','0','0','0','0','0','0','0','0','Veesha Blazeweaver - Casts Conjure Toasty Fire' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Veesha Blazeweaver(32946) - Casts Fireball (61909)
( '3294601', '32946', '0','0','100','1','7000','15000','10000','17500','11','61909','1','1','0','0','0','0','0','0','0','0','Veesha Blazeweaver - Casts Fireball' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Veesha Blazeweaver(32946) - Casts Melt Ice (64528)
( '3294602', '32946', '0','0','100','1','12000','20000','10000','17500','11','64528','1','1','0','0','0','0','0','0','0','0','Veesha Blazeweaver - Casts Melt Ice' ),
-- Is humanoid: Flee at 15% hp
( '3294603', '32946', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Veesha Blazeweaver - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32946';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32948';
--
-- eventAI for Battle-Priest Eliza, ID: 32948
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Battle-Priest Eliza(32948) - Casts Dispel Magic (63499)
( '3294800', '32948', '0','0','100','1','2000','10000','10000','17500','11','63499','1','1','0','0','0','0','0','0','0','0','Battle-Priest Eliza - Casts Dispel Magic' ),
-- Cast timed spell: when Friendly target missing 3000 HP and then every 10000s and 17500s
-- Battle-Priest Eliza(32948) - Casts Great Heal (62809)
( '3294801', '32948', '14','0','100','1','30','3000','10000','17500','11','62809','6','1','0','0','0','0','0','0','0','0','Battle-Priest Eliza - Casts Great Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Battle-Priest Eliza(32948) - Casts Smite (61923)
( '3294802', '32948', '0','0','100','1','12000','20000','10000','17500','11','61923','1','1','0','0','0','0','0','0','0','0','Battle-Priest Eliza - Casts Smite' ),
-- Is humanoid: Flee at 15% hp
( '3294803', '32948', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Battle-Priest Eliza - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32948';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32950';
--
-- eventAI for Spiritwalker Yona, ID: 32950
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Spiritwalker Yona(32950) - Casts Lava Burst (61924)
( '3295000', '32950', '0','0','100','1','2000','10000','10000','17500','11','61924','1','1','0','0','0','0','0','0','0','0','Spiritwalker Yona - Casts Lava Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Spiritwalker Yona(32950) - Casts Storm Cloud (65133) - raid25
( '3295001', '32950', '0','0','100','5','7000','15000','10000','17500','11','65133','0','1','0','0','0','0','0','0','0','0','Spiritwalker Yona - Casts Storm Cloud' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Spiritwalker Yona(32950) - Casts Storm Cloud (65123) - raid10
( '3295002', '32950', '0','0','100','3','12000','20000','10000','17500','11','65123','0','1','0','0','0','0','0','0','0','0','Spiritwalker Yona - Casts Storm Cloud' ),
-- Is humanoid: Flee at 15% hp
( '3295003', '32950', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Spiritwalker Yona - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32950';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '32957';
--
-- eventAI for Dark Rune Acolyte, ID: 32957
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Greater Heal (62442)
( '3295700', '32957', '14','0','100','5','30','10000','10000','17500','11','62442','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Greater Heal (62334)
( '3295701', '32957', '14','0','100','3','30','15000','10000','17500','11','62334','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Holy Smite (62443)
( '3295702', '32957', '0','0','100','5','12000','20000','10000','17500','11','62443','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Holy Smite (62335)
( '3295703', '32957', '0','0','100','3','17000','25000','10000','17500','11','62335','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Renew (62333)
( '3295704', '32957', '14','0','100','3','30','30000','10000','17500','11','62333','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(32957) - Casts Renew (62441)
( '3295705', '32957', '14','0','100','5','30','35000','10000','17500','11','62441','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '32957';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33052';
--
-- eventAI for Living Constellation, ID: 33052
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Living Constellation(33052) - Casts Arcane Barrage (64599)
( '3305200', '33052', '0','0','100','3','2000','10000','10000','17500','11','64599','1','1','0','0','0','0','0','0','0','0','Living Constellation - Casts Arcane Barrage' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Living Constellation(33052) - Casts Arcane Barrage (64607)
( '3305201', '33052', '0','0','100','5','7000','15000','10000','17500','11','64607','1','1','0','0','0','0','0','0','0','0','Living Constellation - Casts Arcane Barrage' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33052';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33060';
--
-- eventAI for Salvaged Siege Engine, ID: 33060
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Salvaged Siege Engine(33060) - Casts Electroshock (62522)
( '3306000', '33060', '0','0','100','3','2000','10000','10000','17500','11','62522','0','1','0','0','0','0','0','0','0','0','Salvaged Siege Engine - Casts Electroshock' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Salvaged Siege Engine(33060) - Casts Ram (62345)
( '3306001', '33060', '0','0','100','1','7000','15000','10000','17500','11','62345','1','1','0','0','0','0','0','0','0','0','Salvaged Siege Engine - Casts Ram' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Salvaged Siege Engine(33060) - Casts Steam Rush (62346)
( '3306002', '33060', '0','0','100','1','12000','20000','10000','17500','11','62346','1','1','0','0','0','0','0','0','0','0','Salvaged Siege Engine - Casts Steam Rush' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33060';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33062';
--
-- eventAI for Salvaged Chopper, ID: 33062
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Salvaged Chopper(33062) - Casts Eject Passenger (67393)
( '3306200', '33062', '0','0','100','1','2000','10000','10000','17500','11','67393','0','1','0','0','0','0','0','0','0','0','Salvaged Chopper - Casts Eject Passenger' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Salvaged Chopper(33062) - Casts Sonic Horn (62974)
( '3306201', '33062', '0','0','100','1','7000','15000','10000','17500','11','62974','0','1','0','0','0','0','0','0','0','0','Salvaged Chopper - Casts Sonic Horn' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Salvaged Chopper(33062) - Casts Speed Boost (62299)
( '3306202', '33062', '0','0','100','1','12000','20000','10000','17500','11','62299','0','1','0','0','0','0','0','0','0','0','Salvaged Chopper - Casts Speed Boost' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Salvaged Chopper(33062) - Casts Tar (62286)
( '3306203', '33062', '0','0','100','1','17000','25000','10000','17500','11','62286','0','1','0','0','0','0','0','0','0','0','Salvaged Chopper - Casts Tar' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33062';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33088';
--
-- eventAI for Iron Roots, ID: 33088
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Roots(33088) - Casts Iron Roots (63598)
( '3308800', '33088', '0','0','100','1','2000','10000','10000','17500','11','63598','1','1','0','0','0','0','0','0','0','0','Iron Roots - Casts Iron Roots' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33088';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33109';
--
-- eventAI for Salvaged Demolisher, ID: 33109
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Salvaged Demolisher(33109) - Casts Hurl Boulder (62306)
( '3310900', '33109', '0','0','100','1','2000','10000','10000','17500','11','62306','1','1','0','0','0','0','0','0','0','0','Salvaged Demolisher - Casts Hurl Boulder' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Salvaged Demolisher(33109) - Casts Hurl Pyrite Barrel (62490)
( '3310901', '33109', '0','0','100','1','7000','15000','10000','17500','11','62490','1','1','0','0','0','0','0','0','0','0','Salvaged Demolisher - Casts Hurl Pyrite Barrel' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Salvaged Demolisher(33109) - Casts Ram (62308)
( '3310902', '33109', '0','0','100','1','12000','20000','10000','17500','11','62308','1','1','0','0','0','0','0','0','0','0','Salvaged Demolisher - Casts Ram' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33109';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33110';
--
-- eventAI for Dark Rune Acolyte, ID: 33110
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Greater Heal (62442)
( '3311000', '33110', '14','0','100','5','30','15000','10000','17500','11','62442','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Greater Heal (62334)
( '3311001', '33110', '14','0','100','3','30','10000','10000','17500','11','62334','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Greater Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Holy Smite (62335)
( '3311002', '33110', '0','0','100','3','12000','20000','10000','17500','11','62335','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Holy Smite (62443)
( '3311003', '33110', '0','0','100','5','17000','25000','10000','17500','11','62443','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Holy Smite' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Renew (62333)
( '3311004', '33110', '14','0','100','3','3000','30000','10000','17500','11','62333','1','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Dark Rune Acolyte(33110) - Casts Renew (62441)
( '3311005', '33110', '14','0','100','5','30','35000','10000','17500','11','62441','6','1','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Casts Renew' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33110';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33125';
--
-- eventAI for Iron Honor Guard, ID: 33125
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Honor Guard(33125) - Casts Cleave (42724)
( '3312500', '33125', '0','0','100','1','2000','10000','10000','17500','11','42724','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Cleave' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Iron Honor Guard(33125) - Casts Hamstring (48639)
( '3312501', '33125', '0','0','100','1','7000','15000','10000','17500','11','48639','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Hamstring' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Iron Honor Guard(33125) - Casts Shield Smash (62420)
( '3312502', '33125', '0','0','100','5','12000','20000','10000','17500','11','62420','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Shield Smash' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Iron Honor Guard(33125) - Casts Shield Smash (62332)
( '3312503', '33125', '0','0','100','3','17000','25000','10000','17500','11','62332','1','1','0','0','0','0','0','0','0','0','Iron Honor Guard - Casts Shield Smash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33125';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33136';
--
-- eventAI for Guardian of Yogg-Saron, ID: 33136
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Guardian of Yogg-Saron(33136) - Casts Dark Volley (63038)
( '3313600', '33136', '0','0','100','1','2000','10000','10000','17500','11','63038','0','1','0','0','0','0','0','0','0','0','Guardian of Yogg-Saron - Casts Dark Volley' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Guardian of Yogg-Saron(33136) - Casts Shadow Nova (65209)
( '3313601', '33136', '0','0','100','5','7000','15000','10000','17500','11','65209','0','1','0','0','0','0','0','0','0','0','Guardian of Yogg-Saron - Casts Shadow Nova' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Guardian of Yogg-Saron(33136) - Casts Shadow Nova (62714)
( '3313602', '33136', '0','0','100','3','12000','20000','10000','17500','11','62714','0','1','0','0','0','0','0','0','0','0','Guardian of Yogg-Saron - Casts Shadow Nova' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Guardian of Yogg-Saron(33136) - Casts Shadow Nova (65719)
( '3313603', '33136', '0','0','100','1','17000','25000','10000','17500','11','65719','0','1','0','0','0','0','0','0','0','0','Guardian of Yogg-Saron - Casts Shadow Nova' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33136';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33142';
--
-- eventAI for Leviathan Defense Turret, ID: 33142
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Leviathan Defense Turret(33142) - Casts Searing Flame (62402)
( '3314200', '33142', '0','0','100','1','2000','10000','10000','17500','11','62402','1','1','0','0','0','0','0','0','0','0','Leviathan Defense Turret - Casts Searing Flame' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33142';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33168';
--
-- eventAI for Strengthened Iron Roots, ID: 33168
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Strengthened Iron Roots(33168) - Casts Strengthened Iron Roots (63601)
( '3316800', '33168', '0','0','100','1','2000','10000','10000','17500','11','63601','1','1','0','0','0','0','0','0','0','0','Strengthened Iron Roots - Casts Strengthened Iron Roots' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33168';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33189';
--
-- eventAI for Liquid Pyrite, ID: 33189
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Liquid Pyrite(33189) - Casts General Trigger 2 to Vehicle (69745)
( '3318900', '33189', '0','0','100','1','2000','10000','10000','17500','11','69745','1','1','0','0','0','0','0','0','0','0','Liquid Pyrite - Casts General Trigger 2 to Vehicle' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Liquid Pyrite(33189) - Casts Liquid Pyrite (62494)
( '3318901', '33189', '0','0','100','1','7000','15000','10000','17500','11','62494','0','1','0','0','0','0','0','0','0','0','Liquid Pyrite - Casts Liquid Pyrite' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Liquid Pyrite(33189) - Casts Liquid Pyrite (62496)
( '3318902', '33189', '0','0','100','1','12000','20000','10000','17500','11','62496','1','1','0','0','0','0','0','0','0','0','Liquid Pyrite - Casts Liquid Pyrite' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33189';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33202';
--
-- eventAI for Ancient Water Spirit, ID: 33202
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ancient Water Spirit(33202) - Casts Tidal Wave (62653)
( '3320200', '33202', '0','0','100','3','2000','10000','10000','17500','11','62653','1','1','0','0','0','0','0','0','0','0','Ancient Water Spirit - Casts Tidal Wave' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Ancient Water Spirit(33202) - Casts Tidal Wave (62935)
( '3320201', '33202', '0','0','100','5','7000','15000','10000','17500','11','62935','1','1','0','0','0','0','0','0','0','0','Ancient Water Spirit - Casts Tidal Wave' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33202';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33203';
--
-- eventAI for Ancient Conservator, ID: 33203
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ancient Conservator(33203) - Casts Conservator''s Grip (62532)
( '3320300', '33203', '0','0','100','1','2000','10000','10000','17500','11','62532','0','1','0','0','0','0','0','0','0','0','Ancient Conservator - Casts Conservator''s Grip' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Ancient Conservator(33203) - Casts Nature''s Fury (63571)
( '3320301', '33203', '0','0','100','5','7000','15000','10000','17500','11','63571','1','1','0','0','0','0','0','0','0','0','Ancient Conservator - Casts Nature''s Fury' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Ancient Conservator(33203) - Casts Nature''s Fury (62589)
( '3320302', '33203', '0','0','100','3','12000','20000','10000','17500','11','62589','1','1','0','0','0','0','0','0','0','0','Ancient Conservator - Casts Nature''s Fury' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33203';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33228';
--
-- eventAI for Eonar ''s Gift, ID: 33228
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Eonar ''s Gift(33228) - Casts Lifebinder''s Gift (64185)
( '3322800', '33228', '0','0','100','5','2000','10000','10000','17500','11','64185','1','1','0','0','0','0','0','0','0','0','Eonar ''s Gift - Casts Lifebinder''s Gift' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Eonar ''s Gift(33228) - Casts Lifebinder''s Gift (62584)
( '3322801', '33228', '0','0','100','3','7000','15000','10000','17500','11','62584','1','1','0','0','0','0','0','0','0','0','Eonar ''s Gift - Casts Lifebinder''s Gift' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Eonar ''s Gift(33228) - Casts Pheromones (62619)
( '3322802', '33228', '0','0','100','1','12000','20000','10000','17500','11','62619','0','1','0','0','0','0','0','0','0','0','Eonar ''s Gift - Casts Pheromones' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33228';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33236';
--
-- eventAI for Steelforged Defender, ID: 33236
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Steelforged Defender(33236) - Casts Hamstring (62845)
( '3323600', '33236', '0','0','100','1','2000','10000','10000','17500','11','62845','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Hamstring' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Steelforged Defender(33236) - Casts Lightning Bolt (57780)
( '3323601', '33236', '0','0','100','1','7000','15000','10000','17500','11','57780','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Lightning Bolt' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Steelforged Defender(33236) - Casts Sunder Armor (50370)
( '3323602', '33236', '0','0','100','1','12000','20000','10000','17500','11','50370','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Sunder Armor' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33236';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33237';
--
-- eventAI for Ulduar Colossus, ID: 33237
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ulduar Colossus(33237) - Casts Ground Slam (62625)
( '3323700', '33237', '0','0','100','1','2000','10000','10000','17500','11','62625','1','1','0','0','0','0','0','0','0','0','Ulduar Colossus - Casts Ground Slam' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33237';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33255';
--
-- eventAI for Titanium Stormlord, ID: 33255
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Titanium Stormlord(33255) - Casts Cyclone (62632)
( '3325500', '33255', '0','0','100','1','2000','10000','10000','17500','11','62632','1','1','0','0','0','0','0','0','0','0','Titanium Stormlord - Casts Cyclone' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Titanium Stormlord(33255) - Casts Cyclone (62633)
( '3325501', '33255', '0','0','100','1','7000','15000','10000','17500','11','62633','0','1','0','0','0','0','0','0','0','0','Titanium Stormlord - Casts Cyclone' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33255';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33325';
--
-- eventAI for Eivi Nightfeather, ID: 33325
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Eivi Nightfeather(33325) - Casts Wrath (62793)
( '3332500', '33325', '0','0','100','1','2000','10000','10000','17500','11','62793','1','1','0','0','0','0','0','0','0','0','Eivi Nightfeather - Casts Wrath' ),
-- Is humanoid: Flee at 15% hp
( '3332501', '33325', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Eivi Nightfeather - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33325';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33326';
--
-- eventAI for Field Medic Jessi, ID: 33326
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Field Medic Jessi(33326) - Casts Dispel Magic (63499)
( '3332600', '33326', '0','0','100','1','2000','10000','10000','17500','11','63499','1','1','0','0','0','0','0','0','0','0','Field Medic Jessi - Casts Dispel Magic' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Field Medic Jessi(33326) - Casts Great Heal (62809)
( '3332601', '33326', '14','0','100','1','30','3000','10000','17500','11','62809','6','1','0','0','0','0','0','0','0','0','Field Medic Jessi - Casts Great Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Field Medic Jessi(33326) - Casts Smite (61923)
( '3332602', '33326', '0','0','100','1','12000','20000','10000','17500','11','61923','1','1','0','0','0','0','0','0','0','0','Field Medic Jessi - Casts Smite' ),
-- Is humanoid: Flee at 15% hp
( '3332603', '33326', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Field Medic Jessi - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33326';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33327';
--
-- eventAI for Sissy Flamecuffs, ID: 33327
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Sissy Flamecuffs(33327) - Casts Conjure Toasty Fire (62823)
( '3332700', '33327', '0','0','100','1','2000','10000','10000','17500','11','62823','1','1','0','0','0','0','0','0','0','0','Sissy Flamecuffs - Casts Conjure Toasty Fire' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Sissy Flamecuffs(33327) - Casts Fireball (61909)
( '3332701', '33327', '0','0','100','1','7000','15000','10000','17500','11','61909','1','1','0','0','0','0','0','0','0','0','Sissy Flamecuffs - Casts Fireball' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Sissy Flamecuffs(33327) - Casts Melt Ice (64528)
( '3332702', '33327', '0','0','100','1','12000','20000','10000','17500','11','64528','1','1','0','0','0','0','0','0','0','0','Sissy Flamecuffs - Casts Melt Ice' ),
-- Is humanoid: Flee at 15% hp
( '3332703', '33327', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Sissy Flamecuffs - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33327';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33328';
--
-- eventAI for Elementalist Mahfuun, ID: 33328
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Elementalist Mahfuun(33328) - Casts Lava Burst (61924)
( '3332800', '33328', '0','0','100','1','2000','10000','10000','17500','11','61924','1','1','0','0','0','0','0','0','0','0','Elementalist Mahfuun - Casts Lava Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Elementalist Mahfuun(33328) - Casts Storm Cloud (65133)
( '3332801', '33328', '0','0','100','1','7000','15000','10000','17500','11','65133','0','1','0','0','0','0','0','0','0','0','Elementalist Mahfuun - Casts Storm Cloud' ),
-- Is humanoid: Flee at 15% hp
( '3332802', '33328', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Elementalist Mahfuun - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33328';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33330';
--
-- eventAI for Battle-Priest Gina, ID: 33330
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Battle-Priest Gina(33330) - Casts Dispel Magic (63499)
( '3333000', '33330', '0','0','100','1','2000','10000','10000','17500','11','63499','1','1','0','0','0','0','0','0','0','0','Battle-Priest Gina - Casts Dispel Magic' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Battle-Priest Gina(33330) - Casts Great Heal (62809)
( '3333001', '33330', '14','0','100','1','30','3000','10000','17500','11','62809','6','1','0','0','0','0','0','0','0','0','Battle-Priest Gina - Casts Great Heal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Battle-Priest Gina(33330) - Casts Smite (61923)
( '3333002', '33330', '0','0','100','1','12000','20000','10000','17500','11','61923','1','1','0','0','0','0','0','0','0','0','Battle-Priest Gina - Casts Smite' ),
-- Is humanoid: Flee at 15% hp
( '3333003', '33330', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Battle-Priest Gina - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33330';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33331';
--
-- eventAI for Amira Blazeweaver, ID: 33331
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- which target to cast to?
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Amira Blazeweaver(33331) - Casts Conjure Toasty Fire (62823)
( '3333100', '33331', '0','0','100','1','2000','10000','10000','17500','11','62823','1','1','0','0','0','0','0','0','0','0','Amira Blazeweaver - Casts Conjure Toasty Fire' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Amira Blazeweaver(33331) - Casts Fireball (61909)
( '3333101', '33331', '0','0','100','1','7000','15000','10000','17500','11','61909','1','1','0','0','0','0','0','0','0','0','Amira Blazeweaver - Casts Fireball' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Amira Blazeweaver(33331) - Casts Melt Ice (64528)
( '3333102', '33331', '0','0','100','1','12000','20000','10000','17500','11','64528','1','1','0','0','0','0','0','0','0','0','Amira Blazeweaver - Casts Melt Ice' ),
-- Is humanoid: Flee at 15% hp
( '3333103', '33331', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Amira Blazeweaver - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33331';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33332';
--
-- eventAI for Spiritwalker Tara, ID: 33332
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Spiritwalker Tara(33332) - Casts Lava Burst (61924)
( '3333200', '33332', '0','0','100','1','2000','10000','10000','17500','11','61924','1','1','0','0','0','0','0','0','0','0','Spiritwalker Tara - Casts Lava Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Spiritwalker Tara(33332) - Casts Storm Cloud (65133)
( '3333201', '33332', '0','0','100','1','7000','15000','10000','17500','11','65133','0','1','0','0','0','0','0','0','0','0','Spiritwalker Tara - Casts Storm Cloud' ),
-- Is humanoid: Flee at 15% hp
( '3333202', '33332', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Spiritwalker Tara - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33332';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33333';
--
-- eventAI for Kar Greycloud, ID: 33333
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Kar Greycloud(33333) - Casts Wrath (62793)
( '3333300', '33333', '0','0','100','1','2000','10000','10000','17500','11','62793','1','1','0','0','0','0','0','0','0','0','Kar Greycloud - Casts Wrath' ),
-- Is humanoid: Flee at 15% hp
( '3333301', '33333', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Kar Greycloud - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33333';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33344';
--
-- eventAI for XM-024 Pummeller, ID: 33344
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XM-024 Pummeller(33344) - Casts Arcing Smash (8374)
( '3334400', '33344', '0','0','100','1','2000','10000','10000','17500','11','8374','1','1','0','0','0','0','0','0','0','0','XM-024 Pummeller - Casts Arcing Smash' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- XM-024 Pummeller(33344) - Casts Trample (5568)
( '3334401', '33344', '0','0','100','1','7000','15000','10000','17500','11','5568','0','1','0','0','0','0','0','0','0','0','XM-024 Pummeller - Casts Trample' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- XM-024 Pummeller(33344) - Casts Uppercut (10966)
( '3334402', '33344', '0','0','100','1','12000','20000','10000','17500','11','10966','1','1','0','0','0','0','0','0','0','0','XM-024 Pummeller - Casts Uppercut' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33344';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33346';
--
-- eventAI for XE-321 Boombot, ID: 33346
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XE-321 Boombot(33346) - Casts Boom (62834)
( '3334600', '33346', '0','0','100','1','2000','10000','10000','17500','11','62834','1','1','0','0','0','0','0','0','0','0','XE-321 Boombot - Casts Boom' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33346';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33354';
--
-- eventAI for Corrupted Servitor, ID: 33354
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Corrupted Servitor(33354) - Casts Petrify Joints (63169)
( '3335400', '33354', '0','0','100','3','2000','10000','10000','17500','11','63169','1','1','0','0','0','0','0','0','0','0','Corrupted Servitor - Casts Petrify Joints' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Corrupted Servitor(33354) - Casts Petrify Joints (63549)
( '3335401', '33354', '0','0','100','5','7000','15000','10000','17500','11','63549','1','1','0','0','0','0','0','0','0','0','Corrupted Servitor - Casts Petrify Joints' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Corrupted Servitor(33354) - Casts Violent Earth (63149)
( '3335402', '33354', '0','0','100','1','12000','20000','10000','17500','11','63149','1','1','0','0','0','0','0','0','0','0','Corrupted Servitor - Casts Violent Earth' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33354';
-- Tue May 24 20:35:35 CEST 2011
-- >> CreatureEAILoot 2011-03-05 by kizura // 2.4.0 <<
-- Infos taken from WoWHead.com
-- Base URL: http://old.wowhead.com/
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33355';
--
-- eventAI for Misguided Nymph, ID: 33355
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Bind Life (63082) - raid10
( '3335500', '33355', '14','0','100','3','30','3000','10000','17500','11','63082','6','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Bind Life' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Bind Life (63559) - raid25
( '3335501', '33355', '14','0','100','5','30','3000','10000','17500','11','63559','6','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Bind Life' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Frost Spear (63111) - raid10
( '3335502', '33355', '0','0','100','3','12000','20000','10000','17500','11','63111','1','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Frost Spear' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Frost Spear (63562) - raid25
( '3335503', '33355', '0','0','100','5','17000','25000','10000','17500','11','63562','1','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Frost Spear' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Winter''s Embrace (63564) - raid25
( '3335504', '33355', '0','0','100','5','22000','30000','10000','17500','11','63564','0','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Winter''s Embrace' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Misguided Nymph(33355) - Casts Winter''s Embrace (63136) - raid10
( '3335505', '33355', '0','0','100','3','27000','35000','10000','17500','11','63136','0','1','0','0','0','0','0','0','0','0','Misguided Nymph - Casts Winter''s Embrace' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33355';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33387';
--
-- eventAI for Writhing Lasher, ID: 33387
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Writhing Lasher(33387) - Casts Lash (65062)
( '3338700', '33387', '0','0','100','1','2000','10000','10000','17500','11','65062','1','1','0','0','0','0','0','0','0','0','Writhing Lasher - Casts Lash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33387';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33388';
--
-- eventAI for Dark Rune Guardian, ID: 33388
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Guardian(33388) - Casts Stormstrike (64757)
( '3338800', '33388', '0','0','100','1','2000','10000','10000','17500','11','64757','1','1','0','0','0','0','0','0','0','0','Dark Rune Guardian - Casts Stormstrike' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33388';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33430';
--
-- eventAI for Guardian Lasher, ID: 33430
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Guardian Lasher(33430) - Casts Guardian Pheromones (63007)
( '3343000', '33430', '0','0','100','1','2000','10000','10000','17500','11','63007','0','1','0','0','0','0','0','0','0','0','Guardian Lasher - Casts Guardian Pheromones' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Guardian Lasher(33430) - Casts Guardian''s Lash (63047)
( '3343001', '33430', '0','0','100','3','7000','15000','10000','17500','11','63047','1','1','0','0','0','0','0','0','0','0','Guardian Lasher - Casts Guardian''s Lash' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Guardian Lasher(33430) - Casts Guardian''s Lash (63550)
( '3343002', '33430', '0','0','100','5','12000','20000','10000','17500','11','63550','1','1','0','0','0','0','0','0','0','0','Guardian Lasher - Casts Guardian''s Lash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33430';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33431';
--
-- eventAI for Forest Swarmer, ID: 33431
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Forest Swarmer(33431) - Casts Pollinate (63059)
( '3343100', '33431', '0','0','100','1','2000','10000','10000','17500','11','63059','0','1','0','0','0','0','0','0','0','0','Forest Swarmer - Casts Pollinate' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33431';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33432';
--
-- eventAI for Leviathan Mk II, ID: 33432
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Emergency Mode (64582)
( '3343200', '33432', '0','0','100','1','2000','10000','10000','17500','11','64582','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Emergency Mode' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Flame Suppressant (64570)
( '3343201', '33432', '0','0','100','1','7000','15000','10000','17500','11','64570','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Flame Suppressant' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Proximity Mines (63027)
( '3343202', '33432', '0','0','100','1','12000','20000','10000','17500','11','63027','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Proximity Mines' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Self Repair (64383)
( '3343203', '33432', '0','0','100','1','17000','25000','10000','17500','11','64383','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Self Repair' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Leviathan Mk II(33432) - Casts Shock Blast (63631)
( '3343204', '33432', '0','0','100','1','22000','30000','10000','17500','11','63631','0','1','0','0','0','0','0','0','0','0','Leviathan Mk II - Casts Shock Blast' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33432';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33453';
--
-- eventAI for Dark Rune Watcher, ID: 33453
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Watcher(33453) - Casts Chain Lightning (64759)
( '3345300', '33453', '0','0','100','5','2000','10000','10000','17500','11','64759','1','1','0','0','0','0','0','0','0','0','Dark Rune Watcher - Casts Chain Lightning' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Watcher(33453) - Casts Chain Lightning (64758)
( '3345301', '33453', '0','0','100','3','7000','15000','10000','17500','11','64758','1','1','0','0','0','0','0','0','0','0','Dark Rune Watcher - Casts Chain Lightning' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Watcher(33453) - Casts Lightning Bolt (63809)
( '3345302', '33453', '0','0','100','3','12000','20000','10000','17500','11','63809','1','1','0','0','0','0','0','0','0','0','Dark Rune Watcher - Casts Lightning Bolt' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Watcher(33453) - Casts Lightning Bolt (64696)
( '3345303', '33453', '0','0','100','5','17000','25000','10000','17500','11','64696','1','1','0','0','0','0','0','0','0','0','Dark Rune Watcher - Casts Lightning Bolt' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33453';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33525';
--
-- eventAI for Mangrove Ent, ID: 33525
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Hurricane (63272)
( '3352500', '33525', '0','0','100','1','2000','10000','10000','17500','11','63272','1','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Hurricane' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Nourish (63556)
( '3352501', '33525', '0','0','100','5','7000','15000','10000','17500','11','63556','1','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Nourish' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Nourish (63242)
( '3352502', '33525', '0','0','100','3','12000','20000','10000','17500','11','63242','1','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Nourish' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Tranquility (63554)
( '3352503', '33525', '0','0','100','5','17000','25000','10000','17500','11','63554','0','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Tranquility' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Mangrove Ent(33525) - Casts Tranquility (63241)
( '3352504', '33525', '0','0','100','3','22000','30000','10000','17500','11','63241','0','1','0','0','0','0','0','0','0','0','Mangrove Ent - Casts Tranquility' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33525';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33526';
--
-- eventAI for Ironroot Lasher, ID: 33526
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ironroot Lasher(33526) - Casts Ironroot Thorns (63240)
( '3352600', '33526', '0','0','100','3','2000','10000','10000','17500','11','63240','1','1','0','0','0','0','0','0','0','0','Ironroot Lasher - Casts Ironroot Thorns' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Ironroot Lasher(33526) - Casts Ironroot Thorns (63553)
( '3352601', '33526', '0','0','100','5','7000','15000','10000','17500','11','63553','1','1','0','0','0','0','0','0','0','0','Ironroot Lasher - Casts Ironroot Thorns' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33526';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33527';
--
-- eventAI for Nature ''s Blade, ID: 33527
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Nature ''s Blade(33527) - Casts Living Tsunami (63247)
( '3352700', '33527', '0','0','100','3','2000','10000','10000','17500','11','63247','1','1','0','0','0','0','0','0','0','0','Nature ''s Blade - Casts Living Tsunami' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Nature ''s Blade(33527) - Casts Living Tsunami (63568)
( '3352701', '33527', '0','0','100','5','7000','15000','10000','17500','11','63568','1','1','0','0','0','0','0','0','0','0','Nature ''s Blade - Casts Living Tsunami' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33527';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33528';
--
-- eventAI for Guardian of Life, ID: 33528
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Guardian of Life(33528) - Casts Poison Breath (63226)
( '3352800', '33528', '0','0','100','3','2000','10000','10000','17500','11','63226','1','1','0','0','0','0','0','0','0','0','Guardian of Life - Casts Poison Breath' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Guardian of Life(33528) - Casts Poison Breath (63551)
( '3352801', '33528', '0','0','100','5','7000','15000','10000','17500','11','63551','1','1','0','0','0','0','0','0','0','0','Guardian of Life - Casts Poison Breath' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33528';
/* What Spells for ... ? No Spells in WoWHead
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33536';
--
-- eventAI for Alexstrasza, ID: 33536
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Bloodlust (54516)
( '3353600', '33536', '0','0','100','1','2000','10000','10000','17500','11','54516','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Bloodlust' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Break Bonds (59463)
( '3353601', '33536', '0','0','100','1','7000','15000','10000','17500','11','59463','0','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Break Bonds' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Chain Heal (59473)
( '3353602', '33536', '0','0','100','1','12000','20000','10000','17500','11','59473','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Chain Heal' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Cyclone (60236)
( '3353603', '33536', '0','0','100','1','17000','25000','10000','17500','11','60236','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Cyclone' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Devotion Aura (52442)
( '3353604', '33536', '0','0','100','1','22000','30000','10000','17500','11','52442','0','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Devotion Aura' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Earth Shield (59471)
( '3353605', '33536', '0','0','100','1','27000','35000','10000','17500','11','59471','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Earth Shield' ),
-- Cast timed spell: 32000ms to 40000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Earth Shock (54511)
( '3353606', '33536', '0','0','100','1','32000','40000','10000','17500','11','54511','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Earth Shock' ),
-- Cast timed spell: 37000ms to 45000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Exorcism (58822)
( '3353607', '33536', '0','0','100','1','37000','45000','10000','17500','11','58822','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Exorcism' ),
-- Cast timed spell: 42000ms to 50000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Flesh Rip (38056)
( '3353608', '33536', '0','0','100','1','42000','50000','10000','17500','11','38056','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Flesh Rip' ),
-- Cast timed spell: 47000ms to 55000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Holy Light (52444)
( '3353609', '33536', '0','0','100','1','47000','55000','10000','17500','11','52444','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Holy Light' ),
-- Cast timed spell: 52000ms to 60000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Lightning Bolt (59169)
( '3353610', '33536', '0','0','100','1','52000','60000','10000','17500','11','59169','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Lightning Bolt' ),
-- Cast timed spell: 57000ms to 65000ms and then every 10000s and 17500s
-- Alexstrasza(33536) - Casts Lightning Bolt (53044)
( '3353611', '33536', '0','0','100','1','57000','65000','10000','17500','11','53044','1','1','0','0','0','0','0','0','0','0','Alexstrasza - Casts Lightning Bolt' ),
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33536';
*/
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33572';
--
-- eventAI for Steelforged Defender, ID: 33572
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Steelforged Defender(33572) - Casts Hamstring (62845)
( '3357200', '33572', '0','0','100','1','2000','10000','10000','17500','11','62845','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Hamstring' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Steelforged Defender(33572) - Casts Sunder Armor (50370)
( '3357201', '33572', '0','0','100','1','7000','15000','10000','17500','11','50370','1','1','0','0','0','0','0','0','0','0','Steelforged Defender - Casts Sunder Armor' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33572';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33699';
--
-- eventAI for Storm Tempered Keeper, ID: 33699
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33699) - Casts Forked Lightning (63541)
( '3369900', '33699', '0','0','100','1','2000','10000','10000','17500','11','63541','1','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Forked Lightning' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33699) - Casts Separation Anxiety (63539)
( '3369901', '33699', '0','0','100','1','7000','15000','10000','17500','11','63539','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Separation Anxiety' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33699) - Casts Summon Charged Sphere (63527)
( '3369902', '33699', '0','0','100','1','12000','20000','10000','17500','11','63527','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Summon Charged Sphere' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33699) - Casts Vengeful Surge (63630)
( '3369903', '33699', '0','0','100','1','17000','25000','10000','17500','11','63630','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Vengeful Surge' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33699';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33715';
--
-- eventAI for Charged Sphere, ID: 33715
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Charged Sphere(33715) - Casts Supercharged (63528)
( '3371500', '33715', '0','0','100','1','2000','10000','10000','17500','11','63528','1','1','0','0','0','0','0','0','0','0','Charged Sphere - Casts Supercharged' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33715';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33722';
--
-- eventAI for Storm Tempered Keeper, ID: 33722
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33722) - Casts Forked Lightning (63541)
( '3372200', '33722', '0','0','100','1','2000','10000','10000','17500','11','63541','1','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Forked Lightning' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33722) - Casts Separation Anxiety (63539)
( '3372201', '33722', '0','0','100','1','7000','15000','10000','17500','11','63539','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Separation Anxiety' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33722) - Casts Summon Charged Sphere (63527)
( '3372202', '33722', '0','0','100','1','12000','20000','10000','17500','11','63527','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Summon Charged Sphere' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Storm Tempered Keeper(33722) - Casts Vengeful Surge (63630)
( '3372203', '33722', '0','0','100','1','17000','25000','10000','17500','11','63630','0','1','0','0','0','0','0','0','0','0','Storm Tempered Keeper - Casts Vengeful Surge' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33722';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33768';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33772';
--
-- eventAI for Faceless Horror, ID: 33772
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Faceless Horror(33772) - Casts Death Grip (64429)
( '3377200', '33772', '0','0','100','1','2000','10000','10000','17500','11','64429','1','1','0','0','0','0','0','0','0','0','Faceless Horror - Casts Death Grip' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Faceless Horror(33772) - Casts Shadow Crash (63722)
( '3377201', '33772', '0','0','100','1','7000','15000','10000','17500','11','63722','1','1','0','0','0','0','0','0','0','0','Faceless Horror - Casts Shadow Crash' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Faceless Horror(33772) - Casts Void Barrier (63710)
( '3377202', '33772', '0','0','100','1','12000','20000','10000','17500','11','63710','0','1','0','0','0','0','0','0','0','0','Faceless Horror - Casts Void Barrier' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Faceless Horror(33772) - Casts Void Wave (63703)
( '3377203', '33772', '0','0','100','1','17000','25000','10000','17500','11','63703','0','1','0','0','0','0','0','0','0','0','Faceless Horror - Casts Void Wave' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33772';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33806';
--
-- eventAI for Void Beast, ID: 33806
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Void Beast(33806) - Casts Shadow Nova (63723)
( '3380600', '33806', '0','0','100','1','2000','10000','10000','17500','11','63723','0','1','0','0','0','0','0','0','0','0','Void Beast - Casts Shadow Nova' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33806';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33818';
--
-- eventAI for Twilight Adherent, ID: 33818
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Arcane Burst (64663) - don't know which target: 0 - self or 1 - hostile (AoE-Cast)
( '3381800', '33818', '0','0','100','1','2000','10000','10000','17500','11','64663','1','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Arcane Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Blink (64662)
( '3381801', '33818', '0','0','100','1','7000','15000','10000','17500','11','64662','0','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Blink' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Greater Heal (63760)
( '3381802', '33818', '14','0','100','1','30','3000','10000','17500','11','63760','6','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Greater Heal' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Psychic Scream (13704) - don't know which target: 0 - self or 1 - hostile (AoE-Cast)
( '3381803', '33818', '0','0','100','1','17000','25000','10000','17500','11','13704','1','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Psychic Scream' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Twilight Adherent(33818) - Casts Renew (37978)
( '3381804', '33818', '14','0','100','1','30','3000','10000','17500','11','37978','6','1','0','0','0','0','0','0','0','0','Twilight Adherent - Casts Renew' ),
-- Is humanoid: Flee at 15% hp
( '3381805', '33818', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Adherent - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33818';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33819';
--
-- eventAI for Twilight Frost Mage, ID: 33819
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Arcane Burst (64663)
( '3381900', '33819', '0','0','100','1','2000','10000','10000','17500','11','64663','0','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Arcane Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Blink (64662)
( '3381901', '33819', '0','0','100','1','7000','15000','10000','17500','11','64662','1','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Blink' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Frost Bolt Volley (63758)
( '3381902', '33819', '0','0','100','1','12000','20000','10000','17500','11','63758','1','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Frost Bolt Volley' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Frost Nova (63912)
( '3381903', '33819', '0','0','100','1','17000','25000','10000','17500','11','63912','0','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Frost Nova' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Twilight Frost Mage(33819) - Casts Frostbolt (63913)
( '3381904', '33819', '0','0','100','1','22000','30000','10000','17500','11','63913','1','1','0','0','0','0','0','0','0','0','Twilight Frost Mage - Casts Frostbolt' ),
-- Is humanoid: Flee at 15% hp
( '3381905', '33819', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Frost Mage - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33819';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33820';
--
-- eventAI for Twilight Pyromancer, ID: 33820
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Arcane Burst (64663)
( '3382000', '33820', '0','0','100','1','2000','10000','10000','17500','11','64663','0','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Arcane Burst' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Blink (64662)
( '3382001', '33820', '0','0','100','1','7000','15000','10000','17500','11','64662','1','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Blink' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Fireball (63789)
( '3382002', '33820', '0','0','100','1','12000','20000','10000','17500','11','63789','1','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Fireball' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Flamestrike (63775)
( '3382003', '33820', '0','0','100','1','17000','25000','10000','17500','11','63775','1','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Flamestrike' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Twilight Pyromancer(33820) - Casts Summon Fire Elemental (63774)
( '3382004', '33820', '0','0','100','1','22000','30000','10000','17500','11','63774','0','1','0','0','0','0','0','0','0','0','Twilight Pyromancer - Casts Summon Fire Elemental' ),
-- Is humanoid: Flee at 15% hp
( '3382005', '33820', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Pyromancer - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33820';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33822';
--
-- eventAI for Twilight Guardian, ID: 33822
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Guardian(33822) - Casts Concussion Blow (52719)
( '3382200', '33822', '0','0','100','1','2000','10000','10000','17500','11','52719','1','1','0','0','0','0','0','0','0','0','Twilight Guardian - Casts Concussion Blow' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Guardian(33822) - Casts Devastate (62317)
( '3382201', '33822', '0','0','100','1','7000','15000','10000','17500','11','62317','1','1','0','0','0','0','0','0','0','0','Twilight Guardian - Casts Devastate' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Guardian(33822) - Casts Thunderclap (63757)
( '3382202', '33822', '0','0','100','1','12000','20000','10000','17500','11','63757','1','1','0','0','0','0','0','0','0','0','Twilight Guardian - Casts Thunderclap' ),
-- Is humanoid: Flee at 15% hp
( '3382203', '33822', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Guardian - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33822';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33823';
--
-- eventAI for Twilight Slayer, ID: 33823
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Slayer(33823) - Casts Bladestorm (63785)
( '3382300', '33823', '0','0','100','1','2000','10000','10000','17500','11','63785','0','1','0','0','0','0','0','0','0','0','Twilight Slayer - Casts Bladestorm' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Slayer(33823) - Casts Bladestorm (63784)
( '3382301', '33823', '0','0','100','1','7000','15000','10000','17500','11','63784','0','1','0','0','0','0','0','0','0','0','Twilight Slayer - Casts Bladestorm' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Twilight Slayer(33823) - Casts Mortal Strike (35054)
( '3382302', '33823', '0','0','100','1','12000','20000','10000','17500','11','35054','1','1','0','0','0','0','0','0','0','0','Twilight Slayer - Casts Mortal Strike' ),
-- Is humanoid: Flee at 15% hp
( '3382303', '33823', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Slayer - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33823';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33824';
--
-- eventAI for Twilight Shadowblade, ID: 33824
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Twilight Shadowblade(33824) - Casts Backstab (63754)
( '3382400', '33824', '0','0','100','1','2000','10000','10000','17500','11','63754','1','1','0','0','0','0','0','0','0','0','Twilight Shadowblade - Casts Backstab' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Twilight Shadowblade(33824) - Casts Fan of Knives (63753)
( '3382401', '33824', '0','0','100','1','7000','15000','10000','17500','11','63753','0','1','0','0','0','0','0','0','0','0','Twilight Shadowblade - Casts Fan of Knives' ),
-- Is humanoid: Flee at 15% hp
( '3382402', '33824', '2','0','100','0','15','0','0','0 ','25','0','0','0','1','-47','0','0','0','0','0','0','Twilight Shadowblade - Flee at 15% HP' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33824';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33838';
--
-- eventAI for Enslaved Fire Elemental, ID: 33838
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Enslaved Fire Elemental(33838) - Casts Blast Wave (38064)
( '3383800', '33838', '0','0','100','1','2000','10000','10000','17500','11','38064','0','1','0','0','0','0','0','0','0','0','Enslaved Fire Elemental - Casts Blast Wave' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Enslaved Fire Elemental(33838) - Casts Fire Shield (63778)
( '3383801', '33838', '0','0','100','1','7000','15000','10000','17500','11','63778','1','1','0','0','0','0','0','0','0','0','Enslaved Fire Elemental - Casts Fire Shield' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33838';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33846';
--
-- eventAI for Dark Rune Sentinel, ID: 33846
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Battle Shout (64062)
( '3384600', '33846', '0','0','100','5','2000','10000','10000','17500','11','64062','0','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Battle Shout' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Battle Shout (46763)
( '3384601', '33846', '0','0','100','3','7000','15000','10000','17500','11','46763','0','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Battle Shout' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Heroic Strike (45026)
( '3384602', '33846', '0','0','100','1','12000','20000','10000','17500','11','45026','1','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Heroic Strike' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Whirlwind (63807)
( '3384603', '33846', '0','0','100','5','17000','25000','10000','17500','11','63807','0','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Whirlwind' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Dark Rune Sentinel(33846) - Casts Whirlwind (63808)
( '3384604', '33846', '0','0','100','5','22000','30000','10000','17500','11','63808','0','1','0','0','0','0','0','0','0','0','Dark Rune Sentinel - Casts Whirlwind' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33846';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33855';
--
-- eventAI for Junk Bot, ID: 33855
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Junk Bot(33855) - Casts Emergency Mode (64582)
( '3385500', '33855', '0','0','100','1','2000','10000','10000','17500','11','64582','0','1','0','0','0','0','0','0','0','0','Junk Bot - Casts Emergency Mode' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33855';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33966';
--
-- eventAI for Crusher Tentacle, ID: 33966
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Crusher Tentacle(33966) - Casts Diminish Power (64145)
( '3396600', '33966', '0','0','100','1','2000','10000','10000','17500','11','64145','1','1','0','0','0','0','0','0','0','0','Crusher Tentacle - Casts Diminish Power' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Crusher Tentacle(33966) - Casts Erupt (64144)
( '3396601', '33966', '0','0','100','1','7000','15000','10000','17500','11','64144','0','1','0','0','0','0','0','0','0','0','Crusher Tentacle - Casts Erupt' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Crusher Tentacle(33966) - Casts Focused Anger (57688)
( '3396602', '33966', '0','0','100','1','12000','20000','10000','17500','11','57688','0','1','0','0','0','0','0','0','0','0','Crusher Tentacle - Casts Focused Anger' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33966';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33983';
--
-- eventAI for Constrictor Tentacle, ID: 33983
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Constrictor Tentacle(33983) - Casts Erupt (64144)
( '3398300', '33983', '0','0','100','1','2000','10000','10000','17500','11','64144','0','1','0','0','0','0','0','0','0','0','Constrictor Tentacle - Casts Erupt' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33983';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33985';
--
-- eventAI for Corruptor Tentacle, ID: 33985
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Apathy (64156)
( '3398500', '33985', '0','0','100','1','2000','10000','10000','17500','11','64156','1','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Apathy' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Black Plague (64153)
( '3398501', '33985', '0','0','100','1','7000','15000','10000','17500','11','64153','1','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Black Plague' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Curse of Doom (64157)
( '3398502', '33985', '0','0','100','1','12000','20000','10000','17500','11','64157','1','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Curse of Doom' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Draining Poison (64152)
( '3398503', '33985', '0','0','100','1','17000','25000','10000','17500','11','64152','1','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Draining Poison' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Corruptor Tentacle(33985) - Casts Erupt (64144)
( '3398504', '33985', '0','0','100','1','22000','30000','10000','17500','11','64144','0','1','0','0','0','0','0','0','0','0','Corruptor Tentacle - Casts Erupt' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33985';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '33988';
--
-- eventAI for Immortal Guardian, ID: 33988
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Immortal Guardian(33988) - Casts Drain Life (64159)
( '3398800', '33988', '0','0','100','3','2000','10000','10000','17500','11','64159','1','1','0','0','0','0','0','0','0','0','Immortal Guardian - Casts Drain Life' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Immortal Guardian(33988) - Casts Drain Life (64160)
( '3398801', '33988', '0','0','100','5','7000','15000','10000','17500','11','64160','1','1','0','0','0','0','0','0','0','0','Immortal Guardian - Casts Drain Life' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '33988';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34004';
--
-- eventAI for Life Spark, ID: 34004
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Life Spark(34004) - Casts Shock (64230)
( '3400400', '34004', '0','0','100','1','2000','10000','10000','17500','11','64230','1','1','0','0','0','0','0','0','0','0','Life Spark - Casts Shock' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Life Spark(34004) - Casts Static Charged (64236)
( '3400401', '34004', '0','0','100','5','7000','15000','10000','17500','11','64236','0','1','0','0','0','0','0','0','0','0','Life Spark - Casts Static Charged' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Life Spark(34004) - Casts Static Charged (64227)
( '3400402', '34004', '0','0','100','3','12000','20000','10000','17500','11','64227','0','1','0','0','0','0','0','0','0','0','Life Spark - Casts Static Charged' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34004';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34014';
--
-- eventAI for Sanctum Sentry, ID: 34014
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Sanctum Sentry(34014) - Casts Rip Flesh (64375)
( '3401400', '34014', '0','0','100','3','2000','10000','10000','17500','11','64375','1','1','0','0','0','0','0','0','0','0','Sanctum Sentry - Casts Rip Flesh' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Sanctum Sentry(34014) - Casts Rip Flesh (64667)
( '3401401', '34014', '0','0','100','5','7000','15000','10000','17500','11','64667','1','1','0','0','0','0','0','0','0','0','Sanctum Sentry - Casts Rip Flesh' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Sanctum Sentry(34014) - Casts Savage Pounce (64666)
( '3401402', '34014', '0','0','100','5','12000','20000','10000','17500','11','64666','1','1','0','0','0','0','0','0','0','0','Sanctum Sentry - Casts Savage Pounce' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Sanctum Sentry(34014) - Casts Savage Pounce (64374)
( '3401403', '34014', '0','0','100','3','17000','25000','10000','17500','11','64374','1','1','0','0','0','0','0','0','0','0','Sanctum Sentry - Casts Savage Pounce' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34014';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34035';
--
-- eventAI for Feral Defender, ID: 34035
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Feral Defender(34035) - Casts Feral Essence (64455)
( '3403500', '34035', '0','0','100','1','2000','10000','10000','17500','11','64455','0','1','0','0','0','0','0','0','0','0','Feral Defender - Casts Feral Essence' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Feral Defender(34035) - Casts Feral Pounce (64669)
( '3403501', '34035', '0','0','100','5','7000','15000','10000','17500','11','64669','1','1','0','0','0','0','0','0','0','0','Feral Defender - Casts Feral Pounce' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Feral Defender(34035) - Casts Feral Pounce (64478)
( '3403502', '34035', '0','0','100','3','12000','20000','10000','17500','11','64478','1','1','0','0','0','0','0','0','0','0','Feral Defender - Casts Feral Pounce' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34035';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34057';
--
-- eventAI for Assault Bot, ID: 34057
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Assault Bot(34057) - Casts Emergency Mode (64582)
( '3405700', '34057', '0','0','100','1','2000','10000','10000','17500','11','64582','0','1','0','0','0','0','0','0','0','0','Assault Bot - Casts Emergency Mode' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Assault Bot(34057) - Casts Magnetic Field (64668)
( '3405701', '34057', '0','0','100','1','7000','15000','10000','17500','11','64668','1','1','0','0','0','0','0','0','0','0','Assault Bot - Casts Magnetic Field' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34057';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34069';
--
-- eventAI for Molten Colossus, ID: 34069
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Molten Colossus(34069) - Casts Earthquake (64697)
( '3406900', '34069', '0','0','100','1','2000','10000','10000','17500','11','64697','0','1','0','0','0','0','0','0','0','0','Molten Colossus - Casts Earthquake' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Molten Colossus(34069) - Casts Pyroblast (64698)
( '3406901', '34069', '0','0','100','1','7000','15000','10000','17500','11','64698','1','1','0','0','0','0','0','0','0','0','Molten Colossus - Casts Pyroblast' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34069';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34085';
--
-- eventAI for Forge Construct, ID: 34085
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Forge Construct(34085) - Casts Charge (64719)
( '3408500', '34085', '0','0','100','1','2000','10000','10000','17500','11','64719','1','1','0','0','0','0','0','0','0','0','Forge Construct - Casts Charge' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Forge Construct(34085) - Casts Flame Emission (64721)
( '3408501', '34085', '0','0','100','5','7000','15000','10000','17500','11','64721','1','1','0','0','0','0','0','0','0','0','Forge Construct - Casts Flame Emission' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Forge Construct(34085) - Casts Flame Emission (64720)
( '3408502', '34085', '0','0','100','3','12000','20000','10000','17500','11','64720','1','1','0','0','0','0','0','0','0','0','Forge Construct - Casts Flame Emission' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34085';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34086';
--
-- eventAI for Magma Rager, ID: 34086
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Magma Rager(34086) - Casts Fire Blast (64773)
( '3408600', '34086', '0','0','100','1','2000','10000','10000','17500','11','64773','1','1','0','0','0','0','0','0','0','0','Magma Rager - Casts Fire Blast' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Magma Rager(34086) - Casts Superheated Winds (64746)
( '3408601', '34086', '0','0','100','1','7000','15000','10000','17500','11','64746','1','1','0','0','0','0','0','0','0','0','Magma Rager - Casts Superheated Winds' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34086';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34133';
--
-- eventAI for Champion of Hodir, ID: 34133
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Champion of Hodir(34133) - Casts Stomp (64639)
( '3413300', '34133', '0','0','100','3','2000','10000','10000','17500','11','64639','0','1','0','0','0','0','0','0','0','0','Champion of Hodir - Casts Stomp' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Champion of Hodir(34133) - Casts Stomp (64652)
( '3413301', '34133', '0','0','100','5','7000','15000','10000','17500','11','64652','0','1','0','0','0','0','0','0','0','0','Champion of Hodir - Casts Stomp' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34133';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34134';
--
-- eventAI for Winter Revenant, ID: 34134
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Winter Revenant(34134) - Casts Blizzard (64642)
( '3413400', '34134', '0','0','100','3','2000','10000','10000','17500','11','64642','1','1','0','0','0','0','0','0','0','0','Winter Revenant - Casts Blizzard' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Winter Revenant(34134) - Casts Blizzard (64653)
( '3413401', '34134', '0','0','100','5','7000','15000','10000','17500','11','64653','1','1','0','0','0','0','0','0','0','0','Winter Revenant - Casts Blizzard' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Winter Revenant(34134) - Casts Shield of the Winter Revenant (64644)
( '3413402', '34134', '0','0','100','1','12000','20000','10000','17500','11','64644','0','1','0','0','0','0','0','0','0','0','Winter Revenant - Casts Shield of the Winter Revenant' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Winter Revenant(34134) - Casts Whirling Strike (64643)
( '3413403', '34134', '0','0','100','1','17000','25000','10000','17500','11','64643','0','1','0','0','0','0','0','0','0','0','Winter Revenant - Casts Whirling Strike' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34134';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34135';
--
-- eventAI for Winter Rumbler, ID: 34135
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Winter Rumbler(34135) - Casts Cone of Cold (64645)
( '3413500', '34135', '0','0','100','3','2000','10000','10000','17500','11','64645','0','1','0','0','0','0','0','0','0','0','Winter Rumbler - Casts Cone of Cold' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Winter Rumbler(34135) - Casts Cone of Cold (64655)
( '3413501', '34135', '0','0','100','5','7000','15000','10000','17500','11','64655','0','1','0','0','0','0','0','0','0','0','Winter Rumbler - Casts Cone of Cold' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Winter Rumbler(34135) - Casts Snow Blindness (64647)
( '3413502', '34135', '0','0','100','3','12000','20000','10000','17500','11','64647','1','1','0','0','0','0','0','0','0','0','Winter Rumbler - Casts Snow Blindness' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Winter Rumbler(34135) - Casts Snow Blindness (64654)
( '3413503', '34135', '0','0','100','5','17000','25000','10000','17500','11','64654','1','1','0','0','0','0','0','0','0','0','Winter Rumbler - Casts Snow Blindness' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34135';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34137';
--
-- eventAI for Winter Jormungar, ID: 34137
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Winter Jormungar(34137) - Casts Acidic Bite (64638)
( '3413700', '34137', '0','0','100','1','2000','10000','10000','17500','11','64638','1','1','0','0','0','0','0','0','0','0','Winter Jormungar - Casts Acidic Bite' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34137';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34147';
--
-- eventAI for Emergency Fire Bot, ID: 34147
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Emergency Fire Bot(34147) - Casts Deafening Siren (64616)
( '3414700', '34147', '0','0','100','5','2000','10000','10000','17500','11','64616','0','1','0','0','0','0','0','0','0','0','Emergency Fire Bot - Casts Deafening Siren' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Emergency Fire Bot(34147) - Casts Water Spray (64619)
( '3414701', '34147', '0','0','100','1','7000','15000','10000','17500','11','64619','0','1','0','0','0','0','0','0','0','0','Emergency Fire Bot - Casts Water Spray' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34147';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34161';
--
-- eventAI for Mechanostriker 54-A, ID: 34161
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Mechanostriker 54-A(34161) - Casts Laser Barrage (64766)
( '3416100', '34161', '0','0','100','1','2000','10000','10000','17500','11','64766','1','1','0','0','0','0','0','0','0','0','Mechanostriker 54-A - Casts Laser Barrage' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34161';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34164';
--
-- eventAI for Mechagnome Battletank, ID: 34164
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Mechagnome Battletank(34164) - Casts Flame Cannon (64692)
( '3416400', '34164', '0','0','100','1','2000','10000','10000','17500','11','64692','1','1','0','0','0','0','0','0','0','0','Mechagnome Battletank - Casts Flame Cannon' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Mechagnome Battletank(34164) - Casts Jump Attack (64953)
( '3416401', '34164', '0','0','100','1','7000','15000','10000','17500','11','64953','1','1','0','0','0','0','0','0','0','0','Mechagnome Battletank - Casts Jump Attack' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34164';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34183';
--
-- eventAI for Arachnopod Destroyer, ID: 34183
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Arachnopod Destroyer(34183) - Casts Flame Spray (64717)
( '3418300', '34183', '0','0','100','1','2000','10000','10000','17500','11','64717','0','1','0','0','0','0','0','0','0','0','Arachnopod Destroyer - Casts Flame Spray' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Arachnopod Destroyer(34183) - Casts Machine Gun (64776)
( '3418301', '34183', '0','0','100','1','7000','15000','10000','17500','11','64776','1','1','0','0','0','0','0','0','0','0','Arachnopod Destroyer - Casts Machine Gun' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34183';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34184';
--
-- eventAI for Clockwork Mechanic, ID: 34184
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Clockwork Mechanic(34184) - Casts Ice Turret (64966)
( '3418400', '34184', '0','0','100','1','2000','10000','10000','17500','11','64966','0','1','0','0','0','0','0','0','0','0','Clockwork Mechanic - Casts Ice Turret' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34184';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34190';
--
-- eventAI for Hardened Iron Golem, ID: 34190
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Hardened Iron Golem(34190) - Casts Harden Fists (64877)
( '3419000', '34190', '0','0','100','1','2000','10000','10000','17500','11','64877','0','1','0','0','0','0','0','0','0','0','Hardened Iron Golem - Casts Harden Fists' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Hardened Iron Golem(34190) - Casts Rune Punch (64874)
( '3419001', '34190', '0','0','100','3','7000','15000','10000','17500','11','64874','1','1','0','0','0','0','0','0','0','0','Hardened Iron Golem - Casts Rune Punch' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Hardened Iron Golem(34190) - Casts Rune Punch (64967)
( '3419002', '34190', '0','0','100','5','12000','20000','10000','17500','11','64967','1','1','0','0','0','0','0','0','0','0','Hardened Iron Golem - Casts Rune Punch' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34190';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34193';
--
-- eventAI for Clockwork Sapper, ID: 34193
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Clockwork Sapper(34193) - Casts Energy Sap (64740)
( '3419300', '34193', '0','0','100','1','2000','10000','10000','17500','11','64740','1','1','0','0','0','0','0','0','0','0','Clockwork Sapper - Casts Energy Sap' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34193';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34196';
--
-- eventAI for Rune Etched Sentry, ID: 34196
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Flaming Rune (64852)
( '3419600', '34196', '0','0','100','1','2000','10000','10000','17500','11','64852','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Flaming Rune' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Lava Burst (64991)
( '3419601', '34196', '0','0','100','5','7000','15000','10000','17500','11','64991','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Lava Burst' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Lava Burst (64870)
( '3419602', '34196', '0','0','100','3','12000','20000','10000','17500','11','64870','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Lava Burst' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Runed Flame Jets (64988)
( '3419603', '34196', '0','0','100','5','17000','25000','10000','17500','11','64988','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Runed Flame Jets' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Rune Etched Sentry(34196) - Casts Runed Flame Jets (64847)
( '3419604', '34196', '0','0','100','3','22000','30000','10000','17500','11','64847','1','1','0','0','0','0','0','0','0','0','Rune Etched Sentry - Casts Runed Flame Jets' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34196';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34197';
--
-- eventAI for Chamber Overseer, ID: 34197
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Devastating Leap (64943)
( '3419700', '34197', '0','0','100','5','2000','10000','10000','17500','11','64943','1','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Devastating Leap' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Devastating Leap (64820)
( '3419701', '34197', '0','0','100','3','7000','15000','10000','17500','11','64820','1','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Devastating Leap' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Displacement Device (64783)
( '3419702', '34197', '0','0','100','1','12000','20000','10000','17500','11','64783','1','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Displacement Device' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Staggering Roar (64944)
( '3419703', '34197', '0','0','100','5','17000','25000','10000','17500','11','64944','0','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Staggering Roar' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Chamber Overseer(34197) - Casts Staggering Roar (64825)
( '3419704', '34197', '0','0','100','3','22000','30000','10000','17500','11','64825','0','1','0','0','0','0','0','0','0','0','Chamber Overseer - Casts Staggering Roar' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34197';
-- Tue May 24 20:48:58 CEST 2011
-- >> CreatureEAILoot 2011-03-05 by kizura // 2.4.0 <<
-- Infos taken from WoWHead.com
-- Base URL: http://old.wowhead.com/
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34198';
--
-- eventAI for Iron Mender, ID: 34198
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Electro Shock (64971)
( '3419800', '34198', '0','0','100','5','2000','10000','10000','17500','11','64971','1','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Electro Shock' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Electro Shock (64918)
( '3419801', '34198', '0','0','100','3','7000','15000','10000','17500','11','64918','1','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Electro Shock' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Fuse Lightning (64970)
( '3419802', '34198', '0','0','100','5','12000','20000','10000','17500','11','64970','1','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Fuse Lightning' ),
-- Cast timed spell: 17000ms to 25000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Fuse Lightning (64903)
( '3419803', '34198', '0','0','100','3','17000','25000','10000','17500','11','64903','1','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Fuse Lightning' ),
-- Cast timed spell: 22000ms to 30000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Fuse Metal (64897) - raid10
( '3419804', '34198', '14','0','100','3','20','3000','10000','17500','11','64897','6','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Fuse Metal' ),
-- Cast timed spell: 27000ms to 35000ms and then every 10000s and 17500s
-- Iron Mender(34198) - Casts Fuse Metal (64968) - raid25
( '3419805', '34198', '14','0','100','5','20','3000','10000','17500','11','64968','6','1','0','0','0','0','0','0','0','0','Iron Mender - Casts Fuse Metal' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34198';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34199';
--
-- eventAI for Lightning Charged Iron Dwarf, ID: 34199
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Lightning Charged Iron Dwarf(34199) - Casts Lightning Charged (64889)
( '3419900', '34199', '0','0','100','3','2000','10000','10000','17500','11','64889','0','1','0','0','0','0','0','0','0','0','Lightning Charged Iron Dwarf - Casts Lightning Charged' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Lightning Charged Iron Dwarf(34199) - Casts Lightning Charged (64975)
( '3419901', '34199', '0','0','100','5','7000','15000','10000','17500','11','64975','0','1','0','0','0','0','0','0','0','0','Lightning Charged Iron Dwarf - Casts Lightning Charged' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34199';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34234';
--
-- eventAI for Runeforged Sentry, ID: 34234
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Runeforged Sentry(34234) - Casts Flaming Rune (64852)
( '3423400', '34234', '0','0','100','1','2000','10000','10000','17500','11','64852','1','1','0','0','0','0','0','0','0','0','Runeforged Sentry - Casts Flaming Rune' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Runeforged Sentry(34234) - Casts Lava Burst (64870)
( '3423401', '34234', '0','0','100','1','7000','15000','10000','17500','11','64870','1','1','0','0','0','0','0','0','0','0','Runeforged Sentry - Casts Lava Burst' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- Runeforged Sentry(34234) - Casts Runed Flame Jets (64847)
( '3423402', '34234', '0','0','100','1','12000','20000','10000','17500','11','64847','1','1','0','0','0','0','0','0','0','0','Runeforged Sentry - Casts Runed Flame Jets' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34234';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34267';
--
-- eventAI for Parts Recovery Technician, ID: 34267
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Parts Recovery Technician(34267) - Casts Defense Matrix (65070)
( '3426700', '34267', '0','0','100','1','2000','10000','10000','17500','11','65070','1','1','0','0','0','0','0','0','0','0','Parts Recovery Technician - Casts Defense Matrix' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Parts Recovery Technician(34267) - Casts Mechano Kick (65071)
( '3426701', '34267', '0','0','100','1','7000','15000','10000','17500','11','65071','1','1','0','0','0','0','0','0','0','0','Parts Recovery Technician - Casts Mechano Kick' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34267';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34269';
--
-- eventAI for XR-949 Salvagebot, ID: 34269
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XR-949 Salvagebot(34269) - Casts Deploy Salvage Saws (65099)
( '3426900', '34269', '0','0','100','1','2000','10000','10000','17500','11','65099','0','1','0','0','0','0','0','0','0','0','XR-949 Salvagebot - Casts Deploy Salvage Saws' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34269';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34271';
--
-- eventAI for XD-175 Compactobot, ID: 34271
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XD-175 Compactobot(34271) - Casts Trash Compactor (65073)
( '3427100', '34271', '0','0','100','3','2000','10000','10000','17500','11','65073','1','1','0','0','0','0','0','0','0','0','XD-175 Compactobot - Casts Trash Compactor' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- XD-175 Compactobot(34271) - Casts Trash Compactor (65106)
( '3427101', '34271', '0','0','100','5','7000','15000','10000','17500','11','65106','1','1','0','0','0','0','0','0','0','0','XD-175 Compactobot - Casts Trash Compactor' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34271';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34273';
--
-- eventAI for XB-488 Disposalbot, ID: 34273
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- XB-488 Disposalbot(34273) - Casts Cut Scrap Metal (65104)
( '3427300', '34273', '0','0','100','5','2000','10000','10000','17500','11','65104','1','1','0','0','0','0','0','0','0','0','XB-488 Disposalbot - Casts Cut Scrap Metal' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- XB-488 Disposalbot(34273) - Casts Cut Scrap Metal (65080)
( '3427301', '34273', '0','0','100','3','7000','15000','10000','17500','11','65080','1','1','0','0','0','0','0','0','0','0','XB-488 Disposalbot - Casts Cut Scrap Metal' ),
-- Cast timed spell: 12000ms to 20000ms and then every 10000s and 17500s
-- XB-488 Disposalbot(34273) - Casts Self Destruct (65084)
( '3427302', '34273', '0','0','100','1','12000','20000','10000','17500','11','65084','0','1','0','0','0','0','0','0','0','0','XB-488 Disposalbot - Casts Self Destruct' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34273';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34275';
--
-- eventAI for Ward of Life, ID: 34275
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Ward of Life(34275) - Casts Lash (65062)
( '3427500', '34275', '0','0','100','1','2000','10000','10000','17500','11','65062','1','1','0','0','0','0','0','0','0','0','Ward of Life - Casts Lash' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34275';
-- Remove existing creature_ai_scripts entries.
delete from `creature_ai_scripts` where `creature_id` = '34362';
--
-- eventAI for Proximity Mine, ID: 34362
--
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`)
VALUES
-- Cast timed spell: 2000ms to 10000ms and then every 10000s and 17500s
-- Proximity Mine(34362) - Casts Explosion (63009)
( '3436200', '34362', '0','0','100','1','2000','10000','10000','17500','11','63009','0','1','0','0','0','0','0','0','0','0','Proximity Mine - Casts Explosion' ),
-- Cast timed spell: 7000ms to 15000ms and then every 10000s and 17500s
-- Proximity Mine(34362) - Casts Explosion (66351)
( '3436201', '34362', '0','0','100','3','7000','15000','10000','17500','11','66351','0','1','0','0','0','0','0','0','0','0','Proximity Mine - Casts Explosion' );
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '34362';
UPDATE `creature_template` SET `unit_flags`='0' WHERE `entry` IN (33118,32906,32867,32927,32857);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10430,10431) AND `type`=18;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62496,64414);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,62496,18,1,33167),
(13,64414,18,1,33109);
UPDATE `npc_spellclick_spells` SET `spell_id`=62309 WHERE `npc_entry`=33167;
UPDATE `creature` SET `spawntimesecs`=3 WHERE `id` IN (33062,33060,33109);
SET @GUID := 302702;
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+2;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID,'33062','603','2','1','25871','0','-717.889','-147.539','430.22','6.25408','3','0','0','504000','0','0','0','0','0'),
(@GUID+1,'33062','603','2','1','25871','0','-718.058','-136.512','430.017','0.00624','3','0','0','504000','0','0','0','0','0'),
(@GUID+2,'33062','603','2','1','25871','0','-717.993','-126.831','430.008','0.00257','3','0','0','504000','0','0','0','0','0');
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`|0x1|0x2|0x10|0x40|0x200|0x400|0x1000|0x800000|0x4000000 WHERE `entry` IN (33988,33989,33136,33968);
UPDATE `creature_template` SET `ScriptName`='npc_leviathan_player_vehicle' WHERE `entry` IN (33060,33062,33109);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2 WHERE `entry`=33661;
DELETE FROM `spell_script_names` WHERE `spell_id`=63006;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63006, 'spell_aggregation_pheromones_targeting');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10304,10313) AND `type` IN (11,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10304,11,0,0, 'achievement_who_needs_bloodlust'),
(10313,11,0,0, 'achievement_who_needs_bloodlust');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62584,64185);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 AND `SourceEntry`=45897;
DELETE FROM `creature_loot_template` WHERE `entry`=33955 AND `item`=45897;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(33955,45897,-100,16,0,1,1);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (64444);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64444,18,1,33670);
UPDATE `creature_model_info` SET `combat_reach`=4 WHERE `modelid`=28979;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62775,62680,63472);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES 
(62775, 'spell_xt002_tympanic_tantrum'),
(62680, 'spell_ignis_flame_jets'),
(63472, 'spell_ignis_flame_jets');
DELETE FROM `spell_dbc` WHERE `id`=65037;
INSERT INTO `spell_dbc` (`Id`,`Effect1`,`EffectImplicitTargetA1`,`comment`) VALUES 
(65037,3,1,'Nerf the Scrapbots Achievement Criteria Marker');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10401,10402) AND `type`=18;
DELETE FROM `conditions` WHERE `SourceEntry`=62834 AND `SourceTypeOrReferenceId`=13 AND `ConditionTypeOrReference`=18;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,62834,18,1,0,'Boombot Boom - Player target'),
(13,62834,18,1,33343,'Boombot Boom - Scrapbot target'),
(13,62834,18,1,33344,'Boombot Boom - Pummeler target'),
(13,62834,18,1,33346,'Boombot Boom - Boombot target'),
(13,62834,18,1,33329,'Boombot Boom - Heart of the Deconstructor target'),
(13,62834,18,1,33293,'Boombot Boom - XT-002 target');
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN(10074,10075,10220,10221,10077,10079);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10074,10075,10220,10221,10077,10079);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`ScriptName`) VALUES
(10074,11,0,'achievement_nerf_engineering'),
(10074,12,0,''),
(10075,11,0,'achievement_nerf_engineering'),
(10075,12,1,''),
(10221,11,0,'achievement_heartbreaker'),
(10221,12,0,''),
(10220,11,0,'achievement_heartbreaker'),
(10220,12,1,''),
(10077,11,0,'achievement_nerf_gravity_bombs'),
(10077,12,0,''),
(10079,11,0,'achievement_nerf_gravity_bombs'),
(10079,12,1,'');
UPDATE `spell_script_names` SET `ScriptName`='spell_xt002_gravity_bomb' WHERE `ScriptName`='spell_xt002_gravity_bomb_targeting';
UPDATE `spell_script_names` SET `ScriptName`='spell_xt002_searing_light' WHERE `ScriptName`='spell_xt002_searing_light_targeting';
DELETE FROM `spell_script_names` WHERE `spell_id` IN (64233,63025);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64233,'spell_xt002_gravity_bomb_damage'),
(63025,'spell_xt002_gravity_bomb_damage');
-- Door fix
UPDATE `gameobject_template` SET `flags`=18 WHERE entry=194767;
UPDATE `creature` SET `spawntimesecs`=7200 WHERE `id`=33236;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (33365,33370,33212,33367);
UPDATE `creature_template` SET `ScriptName`='npc_thorims_hammer' WHERE `entry`=33364;
UPDATE `creature_template` SET `ScriptName`='npc_mimirons_inferno' WHERE `entry`=33369;
UPDATE `creature_template` SET `ScriptName`='npc_hodirs_fury' WHERE `entry`=33108;
UPDATE `creature_template` SET `ScriptName`='npc_freyas_ward' WHERE `entry`=33366;
UPDATE `creature_template` SET `difficulty_entry_1`=34277, `AIName`='', `ScriptName`='npc_freyas_ward_summon' WHERE `entry`=33387;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=34277;
UPDATE `creature_template` SET `difficulty_entry_1`=34276, `AIName`='', `ScriptName`='npc_freyas_ward_summon' WHERE `entry`=34275;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=34276;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33387,34275);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62911,62909,62533,62906);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,0,62533,0,18,1,33108,0,0,'','Hodir\'s Fury'),
(13,0,62906,0,18,1,33366,0,0,'','Freya\'s Ward'),
(13,0,62909,0,18,1,33369,0,0,'','Mimiron\'s Inferno'),
(13,0,62911,0,18,1,33364,0,0,'','Thorim\'s Hammer');
DELETE FROM `spell_script_names` WHERE `spell_id`=62907;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62907, 'spell_freyas_ward_summon');
UPDATE `creature_template` SET `ScriptName`='npc_flame_leviathan_seat' WHERE `entry`=33114;
UPDATE `creature_template` SET `ScriptName`='npc_flame_leviathan_defense_cannon' WHERE `entry`=33139;
UPDATE `creature_template` SET `ScriptName`='npc_flame_leviathan_defense_turret' WHERE `entry`=33142;
UPDATE `creature_template` SET `ScriptName`='npc_flame_leviathan_overload_device' WHERE `entry`=33143;
UPDATE `creature_template` SET `VehicleId`=340 WHERE `entry`=33113;
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (33113,33114);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(33113,33114,0,1,'Flame Leviathan',6,30000),
(33113,33114,1,1,'Flame Leviathan',6,30000),
(33113,33114,2,1,'Flame Leviathan',6,30000),
(33113,33114,3,1,'Flame Leviathan',6,30000),
(33113,33139,7,1,'Flame Leviathan',6,30000),
(33114,33142,1,1,'Flame Leviathan Seat',6,30000),
(33114,33143,2,1,'Flame Leviathan Seat',6,30000);
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62324,63847,64677);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62324, 'spell_throw_passenger'),
(63847, 'spell_flame_leviathan_flame_vents'),
(64677, 'spell_shield_generator');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10619,10620);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES 
(10619,1,33142,0, ''),
(10619,12,0,0, ''),
(10620,1,33142,0, ''),
(10620,12,1,0, '');
UPDATE `creature_model_info` SET `bounding_radius`=2,`combat_reach`=1.8 WHERE `modelid`=28641;
SET @GUID := 400050;
DELETE FROM `gameobject` WHERE `id` IN (500005,500006);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@GUID,500005,603,1,1,354.8771,-12.9024,409.80365,0,0,0,0,0,-604800,255,1),
(@GUID+1,500006,603,2,1,354.8771,-12.9024,409.80365,0,0,0,0,0,-604800,255,1);
DELETE FROM `reference_loot_template` WHERE `entry`=34116 AND `lootmode`>1;
DELETE FROM `reference_loot_template` WHERE `entry`=34157 AND `lootmode`>1;
DELETE FROM `gameobject_loot_template` WHERE `entry`=40001;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('40001','1','100','1','0','-34116','2'),
('40001','2','100','8','0','-34117','1'),
('40001','3','100','16','0','-34118','1'),
('40001','40753','100','1','0','1','1'),
('40001','45087','100','4','0','2','2'),
('40001','45624','100','2','0','1','1'),
('40001','45912','0.1','1','0','1','1');
DELETE FROM `reference_loot_template` WHERE `entry`=34117;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34117','45088','0','8','1','1','1'),
('34117','45089','0','8','1','1','1'),
('34117','45090','0','8','1','1','1'),
('34117','45091','0','8','1','1','1'),
('34117','45092','0','8','1','1','1'),
('34117','45093','0','8','1','1','1'),
('34117','45094','0','8','1','1','1'),
('34117','45095','0','8','1','1','1'),
('34117','45096','0','8','1','1','1'),
('34117','45097','0','8','1','1','1'),
('34117','45098','0','8','1','1','1'),
('34117','45099','0','8','1','1','1'),
('34117','45100','0','8','1','1','1'),
('34117','45101','0','8','1','1','1'),
('34117','45102','0','8','1','1','1'),
('34117','45103','0','8','1','1','1'),
('34117','45104','0','8','1','1','1'),
('34117','45105','0','8','1','1','1'),
('34117','45624','100','8','0','1','1');
DELETE FROM `reference_loot_template` WHERE `entry`=34118;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34118','45293','0','16','1','1','1'),
('34118','45295','0','16','1','1','1'),
('34118','45296','0','16','1','1','1'),
('34118','45297','0','16','1','1','1'),
('34118','45300','0','16','1','1','1');
DELETE FROM `gameobject_loot_template` WHERE `entry`=40002;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('40002','1','100','1','0','-34157','3'),
('40002','2','100','2','0','-34158','1'),
('40002','3','100','4','0','-34159','1'),
('40002','4','100','8','0','-34154','1'),
('40002','5','10','1','0','-34154','1'),
('40002','45038','8','1','0','1','1'),
('40002','45087','75','1','0','1','1'),
('40002','45132','0','16','1','1','1'),
('40002','45133','0','16','1','1','1'),
('40002','45134','0','16','1','1','1'),
('40002','45135','0','16','1','1','1'),
('40002','45136','0','16','1','1','1'),
('40002','45624','100','1','0','1','1'),
('40002','45912','0.1','1','0','1','1');
DELETE FROM `reference_loot_template` WHERE `entry`=34158;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34158','45624','100','2','0','1','1');
DELETE FROM `reference_loot_template` WHERE `entry`=34159;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34159','45087','100','4','0','2','2'),
('34159','45624','100','4','0','1','1');
UPDATE `creature_template` SET `faction_A`=1971, `faction_H`=1971 WHERE `entry`=33142;
UPDATE `gameobject_template` SET `ScriptName`='' WHERE `ScriptName`='go_ulduar_tower';
UPDATE `npc_spellclick_spells` SET `spell_id`=46598 WHERE `npc_entry` IN (33060,33067,33062,33109,33167);
UPDATE `creature_template` SET `modelid2`=0 WHERE `entry`=33167;
DELETE FROM `achievement_criteria_data` WHERE `ScriptName`='achievement_cant_do_that_while_stunned';
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(10090,11,0,0,'achievement_cant_do_that_while_stunned'),
(10422,11,0,0,'achievement_cant_do_that_while_stunned'),
(10423,11,0,0,'achievement_cant_do_that_while_stunned'),
(10091,11,0,0,'achievement_cant_do_that_while_stunned'),
(10424,11,0,0,'achievement_cant_do_that_while_stunned'),
(10425,11,0,0,'achievement_cant_do_that_while_stunned');
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10090,10422,10423,10091,10424,10425);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10858,10860) AND `type`=18;
DELETE FROM `spell_dbc` WHERE `id`=65387;
INSERT INTO `spell_dbc` (`Id`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `Effect1`, `EffectRadiusIndex1`, `EffectImplicitTargetA1`, `EffectImplicitTargetB1`, `comment`) VALUES
(65387,0x100,0x10000000,0x5,0x10000000,3,28,22,7, 'Achievement Dwarfageddon - Criteria Marker');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=65387;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`) VALUES
(13,65387,18,1);
DELETE FROM `smart_scripts` WHERE `entryorguid`=33236 AND `id`=3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33236,0,3,0,6,0,100,0,0,0,0,0,11,65387,0x2,0,0,0,0,1,0,0,0,0,0,0,0, 'Steelforged Defender - Achievement Criteria Spell');

-- Quests

-- Eastern Kingdoms
-- Ironforge
-- Quest: Incoming Gumdrop, http://old.wowhead.com/quest=8355
SET @ENTRY := 6826;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,264,5000,5000,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Talvash del Kissel - Emote Receive 'Train' - Quest Credit");

-- Ghostlands
-- Quest: Captives at Deatholme, http://old.wowhead.com/quest=9164
UPDATE `creature_template` SET `gossip_menu_id`='7179' WHERE `entry`='16208';
UPDATE `creature_template` SET `gossip_menu_id`='7186' WHERE `entry`='16206';
UPDATE `creature_template` SET `gossip_menu_id`='7176' WHERE `entry`='16209';

-- Silverpine Forest
-- Quest: Scrying Goggles? No Problem!, http://old.wowhead.com/quest=8578
DELETE FROM `creature_questrelation` WHERE `quest` = 8578;
DELETE FROM `gameobject_questrelation` WHERE `quest` = 8578;
INSERT INTO `gameobject_questrelation` (`id`,`quest`) VALUES (180642, 8578);

-- Western Plaguelands
-- Quest: A Plague Upon Thee, http://old.wowhead.com/quest=6389
DELETE FROM `gameobject_involvedrelation` WHERE id = 177490 AND quest IN (5904,6389);
DELETE FROM `gameobject_questrelation` WHERE id = 177490 AND quest = 6389;
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`) VALUES (177490, 5904);
INSERT INTO `gameobject_questrelation` (`id`, `quest`) VALUES (177490, 6389);

-- Sunwell Plateau
-- Quest: The Purification of Quel'Delar, http://old.wowhead.com/quest=24596,
--                                        http://old.wowhead.com/quest=24598,
--                                        http://old.wowhead.com/quest=24594,
--                                        http://old.wowhead.com/quest=24564,
--                                        http://old.wowhead.com/quest=24595,
--                                        http://old.wowhead.com/quest=24553
SET @ENTRY := 37523;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,37523,0,0,0,11,70746,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Script for http://old.wowhead.com/npc=37523"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,37523,1,0,0,11,70746,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Script for http://old.wowhead.com/npc=37523"),
(@ENTRY,@SOURCETYPE,2,0,62,0,100,0,37523,2,0,0,11,70746,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Script for http://old.wowhead.com/npc=37523"),
(@ENTRY,@SOURCETYPE,3,0,62,0,100,0,37523,3,0,0,11,70746,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Script for http://old.wowhead.com/npc=37523"),
(@ENTRY,@SOURCETYPE,4,0,62,0,100,0,37523,4,0,0,11,70746,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Script for http://old.wowhead.com/npc=37523"),
(@ENTRY,@SOURCETYPE,5,0,62,0,100,0,37523,5,0,0,11,70746,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Script for http://old.wowhead.com/npc=37523");

-- Blackrock Depths
-- Quest: The Royal Rescue, http://old.wowhead.com/quest=4003
UPDATE `creature_template` SET `faction_A` = '76', `faction_H`='76' WHERE `entry` = '10076';

-- Eversong Woods
-- Quest: Cleansing the Scar, http://old.wowhead.com/quest=9489
UPDATE `creature_template` SET `faction_A`='85',`faction_H`='85' WHERE `entry`='15938';

-- Quest: Powering our Defenses, http://old.wowhead.com/quest=8490
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `Id`=8490;

-- Operation Gnomeregan
-- Quest: A Few Good Gnomes, http://old.wowhead.com/quest=25229
DELETE FROM `spell_script_names` WHERE `spell_id` = '74035';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('74035', 'spell_motivate_a_tron');
UPDATE `creature_template` SET `ScriptName` = 'npc_gnome_citizen', `InhabitType` = '3', `flags_extra` = '2', `modelid1` = '2590', `modelid2` = '2581' WHERE `entry` IN ('39466', '39624');
UPDATE `creature` SET `spawntimesecs` = '30' WHERE `id` IN ('39253', '39623');
DELETE FROM `creature_text` WHERE `entry` IN ('39466', '39624');
INSERT INTO `creature_text` VALUES ('39466', '0', '0', 'Sign me up!', '12', '0', '100', '66', '0', '0', 'Gnome Citizen JustSpawned');
INSERT INTO `creature_text` VALUES ('39466', '0', '1', 'Anything for King Mekkatorque!', '12', '0', '100', '0', '0', '0', 'Gnome Citizen JustSpawned');
INSERT INTO `creature_text` VALUES ('39466', '0', '2', "I\'d love to help.", '12', '0', '100', '273', '0', '0', 'Gnome Citizen JustSpawned');
INSERT INTO `creature_text` VALUES ('39466', '0', '3', 'Is this going to hurt?', '12', '0', '100', '66', '0', '0', 'Gnome Citizen JustSpawned');
INSERT INTO `creature_text` VALUES ('39466', '1', '0', "Wow! We\'re taking back Gnomeregan? I\'m in!", '12', '0', '100', '66', '0', '0', 'Gnome Citizen Quest Turn in');
INSERT INTO `creature_text` VALUES ('39466', '1', '1', 'My wrench of vengance awaits!', '12', '0', '100', '1', '0', '0', 'Gnome Citizen Quest Turn in');
INSERT INTO `creature_text` VALUES ('39466', '1', '2', 'I want to drive a Spider Tank', '12', '0', '100', '66', '0', '0', 'Gnome Citizen Quest Turn in');
INSERT INTO `creature_text` VALUES ('39466', '1', '3', 'This is going to be fascinating!', '12', '0', '100', '0', '0', '0', 'Gnome Citizen Quest Turn in');
INSERT INTO `creature_text` VALUES ('39466', '1', '4', 'When does the training start?', '12', '0', '100', '6', '0', '0', 'Gnome Citizen Quest Turn in');
INSERT INTO `creature_text` VALUES ('39624', '0', '0', 'Sign me up!', '12', '0', '100', '66', '0', '0', 'Gnome Citizen JustSpawned');
INSERT INTO `creature_text` VALUES ('39624', '0', '1', 'Anything for King Mekkatorque!', '12', '0', '100', '0', '0', '0', 'Gnome Citizen JustSpawned');
INSERT INTO `creature_text` VALUES ('39624', '0', '2', "I\'d love to help.", '12', '0', '100', '273', '0', '0', 'Gnome Citizen JustSpawned');
INSERT INTO `creature_text` VALUES ('39624', '0', '3', 'Is this going to hurt?', '12', '0', '100', '66', '0', '0', 'Gnome Citizen JustSpawned');
INSERT INTO `creature_text` VALUES ('39624', '1', '0', "Wow! We\'re taking back Gnomeregan? I\'m in!", '12', '0', '100', '66', '0', '0', 'Gnome Citizen Quest Turn in');
INSERT INTO `creature_text` VALUES ('39624', '1', '1', 'My wrench of vengance awaits!', '12', '0', '100', '1', '0', '0', 'Gnome Citizen Quest Turn in');
INSERT INTO `creature_text` VALUES ('39624', '1', '2', 'I want to drive a Spider Tank', '12', '0', '100', '66', '0', '0', 'Gnome Citizen Quest Turn in');
INSERT INTO `creature_text` VALUES ('39624', '1', '3', 'This is going to be fascinating!', '12', '0', '100', '0', '0', '0', 'Gnome Citizen Quest Turn in');
INSERT INTO `creature_text` VALUES ('39624', '1', '4', 'When does the training start?', '12', '0', '100', '6', '0', '0', 'Gnome Citizen Quest Turn in');
DELETE FROM `smart_scripts` WHERE (`entryorguid` IN ('39253', '39623') AND `source_type` = '0');
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
('39253', '0', '0', '0', '8', '0', '100', '0', '73943', '0', '0', '0', '41', '1000', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Operation Gnomeregan: On spellhit - force despawn'),
('39623', '0', '0', '0', '8', '0', '100', '0', '74080', '0', '0', '0', '41', '1000', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Operation Gnomeregan: On spellhit - force despawn');

-- Quest: Basic Orders, http://old.wowhead.com/quest=25199
UPDATE `creature_template` SET `ScriptName` = 'npc_steamcrank' WHERE `entry` = '39368';

-- Quest: In and Out, http://old.wowhead.com/quest=25285
UPDATE `creature_template` SET `VehicleId` = '745', `spell6` = '74153' WHERE `entry` = '39682';

-- Quest: One Step Forward..., http://old.wowhead.com/quest=25289
UPDATE `creature_template` SET `spell1` = '74157', `spell2` = '74159', `spell3` = '74160', `spell4` = '74153' WHERE `entry` = '39713';

-- Quest: Press Fire, http://old.wowhead.com/quest=25295
UPDATE `creature_template` SET `spell4` = '74174', `spell6` = '74153' WHERE `entry` = '39714';
UPDATE `creature_template` SET `ScriptName` = 'npc_shoot_bunny' WHERE `entry` = '39707';
DELETE FROM `spell_scripts` WHERE `id` = '74182';
INSERT INTO `spell_scripts` (`id`, `command`, `datalong`, `datalong2`) VALUES ('74182', '15', '74179', '2');

-- Quest: Vent Horizon, http://old.wowhead.com/quest=25212
UPDATE `conditions` SET `ConditionValue1` = '25212' WHERE (`SourceTypeOrReferenceId`='15') AND (`SourceGroup`='11211') AND (`SourceEntry`='0') AND (`ElseGroup`='0') AND (`ConditionTypeOrReference`='9') AND (`ConditionValue1`='25283') AND (`ConditionValue2`='0') AND (`ConditionValue3`='0');
DELETE FROM `creature_template_addon` WHERE (`entry` = '39420');
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES ('39420', '0', '0', '65536', '1', '0', '75779');
UPDATE `creature_template` SET `scale` = '2' WHERE `entry` = '39420';
DELETE FROM `conditions` WHERE `SourceEntry` = '73082';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES ('13', '73082', '18', '1', '39420');

-- Quest: Prepping the Speech, http://old.wowhead.com/quest=25283
UPDATE `quest_template` SET `PrevQuestId` = '25283', `NextQuestId` = '25287' WHERE `Id` = '25286';
UPDATE `quest_template` SET `NextQuestId` = '25286' WHERE `Id` = '25283';
UPDATE `creature_template` SET `ScriptName` = 'npc_mekkatorque', `scale` = '0.6', `unit_flags` = '33554752' WHERE `entry` = '39712';
DELETE FROM `creature_template_addon` WHERE (`entry` = '39712');
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES ('39712', '0', '0', '0', '0', '0', '8326');
DELETE FROM `quest_template` WHERE (`Id` = '25500');
DELETE FROM `creature_questrelation` WHERE (`quest` = '25500');
DELETE FROM `gameobject_questrelation` WHERE (`quest` = '25500');
DELETE FROM `creature_involvedrelation` WHERE (`quest` = '25500');
DELETE FROM `gameobject_involvedrelation` WHERE (`quest` = '25500');
DELETE FROM `areatrigger_involvedrelation` WHERE (`quest` = '25500');

-- Quest: Operation 'Gnomeregan', http://old.wowhead.com/quest=25393
UPDATE `creature_template` SET `mechanic_immune_mask` = '12658704', `ScriptName` = 'npc_og_mekkatorque' WHERE `entry` = '39271';
UPDATE `creature_template` SET `unit_flags` = '393220', `ScriptName` = 'npc_og_rl' WHERE `entry` = '39820';
UPDATE `creature_template` SET `npcflag` = '0', `VehicleId` = '0', `ScriptName` = 'npc_og_tank' WHERE `entry` = '39860';
UPDATE `creature_template` SET `faction_A` = '1771', `faction_H` = '1771', `unit_flags` = '4', `ScriptName` = 'npc_og_cannon' WHERE `entry` = '39759';
UPDATE `creature_template` SET `ScriptName` = 'npc_og_bomber' WHERE `entry` = '39735';
UPDATE `creature_template` SET `ScriptName` = 'npc_og_infantry' WHERE `entry` = '39252';
UPDATE `creature_template` SET `spell1` = '74764', `ScriptName` = 'npc_og_i_infantry' WHERE `entry` = '39755';
UPDATE `creature_template` SET `ScriptName` = 'npc_og_suit' WHERE `entry` = '39902';
UPDATE `creature_template` SET `ScriptName` = 'npc_og_trogg' WHERE `entry` IN ('39826', '39799');
UPDATE `creature_template` SET `ScriptName` = 'npc_og_boltcog' WHERE `entry` = '39837';
UPDATE `creature_template` SET `ScriptName` = 'npc_og_assistants' WHERE `entry` IN ('39273', '39910');
UPDATE `creature_template` SET `ScriptName` = 'npc_og_i_tank' WHERE `entry` = '39819';
UPDATE `creature_template` SET `AIName` = 'AggresorAI' WHERE `entry` IN ('39755', '39836');
UPDATE `creature_template` SET `VehicleId` = '0', `ScriptName` = 'npc_og_camera_vehicle' WHERE `entry` = '40479';
UPDATE `creature_template` SET `mechanic_immune_mask` = '8192' WHERE `entry` IN ('39860', '39826', '39799', '39819', '39273', '39910', '39837');
DELETE FROM `creature` WHERE `id` IN ('39273', '39910');
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
('250249', '39273', '0', '1', '256', '0', '0', '-5423.01', '535.254', '386.516', '5.23555', '300', '0', '0', '630000', '0', '0', '0', '134217728', '0'),
('250248', '39910', '0', '1', '256', '0', '0', '-5427.93', '532.323', '386.85', '5.27046', '300', '0', '0', '630000', '0', '0', '0', '0', '0');
UPDATE `creature` SET `position_x` = '-5424.462891', `position_y` = '531.410095', `position_z` = '386.743347', `orientation` = '5.2' WHERE `id` = '39271';
UPDATE `creature` SET `phaseMask`= '1' WHERE `id` = '7937';
DELETE FROM `vehicle_template_accessory` WHERE `entry` = '39860';
DELETE FROM `creature_template_addon` WHERE `entry` IN ('39820', '39273', '39910');
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('39820', '0', '0', '0', '0', '0', '74311'),
('39273', '0', '9473', '0', '0', '0', ''),
('39910', '0', '6569', '0', '0', '0', '');
UPDATE `creature_template` SET `modelid2` = '0' WHERE `entry` = '39903';
UPDATE `creature_template` SET `speed_run` = '1.25', `faction_A` = '1770', `faction_H` = '1770' WHERE `entry` = '39273';
UPDATE `creature_template` SET `speed_run` = '1.29', `faction_A` = '1770', `faction_H` = '1770' WHERE `entry` = '39910';
DELETE FROM `spell_area` WHERE (`spell` = '74310') AND (`area` IN ('1', '135', '721'));
INSERT INTO `spell_area` VALUES
('74310', '721', '25287', '1', '25393', '0', '0', '2', '1'),
('74310', '135', '25287', '1', '25393', '0', '0', '2', '1');
UPDATE `gameobject` SET `phaseMask` = '257' WHERE `id` = '194498';
UPDATE `gameobject` SET `phaseMask` = '256' WHERE `id` = '202922';
UPDATE `gameobject` SET `spawntimesecs` = '-1' WHERE `guid` NOT IN ('2482', '2469', '2461', '2458', '2454', '2453', '2466', '2475') and `id` = '194498';
DELETE FROM `spell_scripts` where `id` IN ('74412', '75510') AND `command` = '6';
INSERT INTO `spell_scripts` (`id`, `command`, `x`, `y`, `z`, `o`) VALUES
('74412', '6', '-4842.156738', '-1277.52771', '501.868256', '0.84'),
('75510', '6', '-5164.767578', '556.341125', '423.753784', '25.29');
DELETE FROM `spell_dbc` WHERE `id` = '75517';
INSERT INTO `spell_dbc` VALUES ('75517', '0', '0', '384', '1024', '4', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '21', '13', '0', '-1', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '25', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '[DND] Bind Sight');
DELETE FROM `script_waypoint` WHERE `entry` IN ('39271', '39273', '39910');
INSERT INTO `script_waypoint` VALUES ('39271', '0', '-5420.67', '528.775', '386.713', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '1', '-5409.16', '533.555', '386.748', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '2', '-5387.22', '542.998', '386.062', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '3', '-5387.22', '542.998', '386.062', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '4', '-5363.67', '555.368', '387.222', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '5', '-5352.78', '571.801', '386.329', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '6', '-5348.4', '554.581', '385.103', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '7', '-5334.2', '548.422', '384.389', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '8', '-5320.33', '589.94', '389.282', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '9', '-5304.74', '579.818', '389.878', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '10', '-5296.44', '574.425', '387.195', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '11', '-5284.05', '583.055', '386.916', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '12', '-5273.44', '562.343', '386.416', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '13', '-5234.36', '526.2', '386.764', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '14', '-5190.17', '519.923', '387.845', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '15', '-5182.69', '494.296', '387.976', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '16', '-5162.55', '476.988', '390.1', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '17', '-5133.19', '446.746', '395.009', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '18', '-5102.61', '459.28', '403.119', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '19', '-5083.89', '449.192', '410.409', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '20', '-5073.83', '441.95', '410.966', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '21', '-5083.89', '449.192', '410.409', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '22', '-5094.04', '461.049', '404.753', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '23', '-5099.45', '463.045', '403.707', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '24', '-5102.38', '461.128', '403.291', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '25', '-5111.06', '456.148', '400.845', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '26', '-5130.05', '448.678', '395.097', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '27', '-5142.41', '457.047', '393.074', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '28', '-5156.83', '472.722', '390.558', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '29', '-5162.18', '477.146', '390.118', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '30', '-5171.85', '482.398', '388.832', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '31', '-5184.8', '495.179', '387.975', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '32', '-5188.27', '511.978', '387.774', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '33', '-5188.67', '519.197', '387.827', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '34', '-5189.08', '532.199', '388.979', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '35', '-5188.2', '548.319', '393.302', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '36', '-5184.14', '581.337', '403.195', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '37', '-5183.25', '600.234', '409.013', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '38', '-5182.88', '611.582', '408.964', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '39', '-5181.33', '629.587', '398.547', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '40', '-5181.18', '633.698', '398.547', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '41', '-5179.62', '655.145', '388.96', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '42', '-5179.33', '658.935', '388.96', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '43', '-5177.68', '680.319', '379.373', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '44', '-5177.34', '684.68', '379.279', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '45', '-5175.27', '705.866', '369.766', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '46', '-5174.38', '714.979', '369.766', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '47', '-5159.94', '714.156', '369.766', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '48', '-5159.84', '705.217', '369.766', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '49', '-5162.77', '665.875', '348.932', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '50', '-5163.54', '655.233', '348.281', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '51', '-5164.36', '649.379', '348.531', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '52', '-5164.36', '649.379', '247.268', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '53', '-5160.58', '691.629', '247.369', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '54', '-5150.96', '724.722', '247.369', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '55', '-5143.21', '723.851', '247.369', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '56', '-5119.14', '721.632', '254.27', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '57', '-5115.13', '721.586', '254.307', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '58', '-5095.03', '720.342', '260.506', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '59', '-5078.62', '722.355', '260.543', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '60', '-5055.71', '729.623', '260.559', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '61', '-5053.57', '730.578', '261.236', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '62', '-5046.74', '733.553', '256.475', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '63', '-5032.67', '734.978', '256.475', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '64', '-4974.75', '730.193', '256.261', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '65', '-4948.22', '728.136', '260.438', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '66', '-4946.75', '728.089', '261.646', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '67', '-4937.45', '728.895', '261.646', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '68', '-4944.71', '728.062', '261.645', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '69', '-4946.95', '727.975', '261.646', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '70', '-4948.56', '728.227', '260.382', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '71', '-4981.64', '730.998', '256.327', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '72', '-4974.27', '730.200', '256.257', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '73', '-4948.23', '727.982', '260.438', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '74', '-4947.24', '727.969', '261.506', '0', '');
INSERT INTO `script_waypoint` VALUES ('39271', '75', '-4938.09', '728.934', '261.646', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '0', '-5420.402832', '532.782776', '386.462921', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '1', '-5413.188477', '535.881653', '386.570923', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '2', '-5391.552246', '544.664673', '386.394592', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '3', '-5366.873535', '557.704712', '386.987396', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '4', '-5357.714355', '569.594055', '386.843536', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '5', '-5347.485840', '559.449036', '384.522247', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '6', '-5337.935547', '551.479126', '384.372162', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '7', '-5321.748047', '584.958923', '388.036346', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '8', '-5305.991211', '583.735352', '389.782196', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '9', '-5297.886719', '578.137695', '388.633179', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '10', '-5283.689941', '587.856506', '387.076050', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '11', '-5272.595703', '566.956177', '386.519623', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '12', '-5236.533203', '530.369751', '387.070984', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '13', '-5189.522461', '524.215027', '388.070892', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '14', '-5181.116211', '499.922943', '387.990204', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '15', '-5163.294434', '482.087555', '389.972443', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '16', '-5134.145020', '452.650818', '394.293671', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '17', '-5106.144043', '460.529114', '402.411102', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '18', '-5083.545410', '452.273163', '409.631439', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '19', '-5082.151855', '450.770660', '410.434784', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '20', '-5083.367188', '452.029633', '409.771332', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '21', '-5090.745605', '462.081818', '405.188080', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '22', '-5094.800781', '464.407684', '404.231567', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '23', '-5098.551270', '464.187897', '403.823486', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '24', '-5109.258789', '459.713531', '401.694031', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '25', '-5125.863770', '452.030670', '395.953247', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '26', '-5138.246582', '456.800995', '393.498688', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '27', '-5151.615723', '470.463165', '390.977905', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '28', '-5159.138184', '477.868378', '390.390503', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '29', '-5166.544434', '482.103271', '389.501068', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '30', '-5179.772949', '493.101166', '388.037781', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '31', '-5185.578613', '509.315033', '387.862335', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '32', '-5186.571289', '515.156555', '387.784119', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '33', '-5186.854980', '528.101440', '388.403992', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '34', '-5186.819336', '543.251831', '391.710083', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '35', '-5182.299805', '576.332642', '401.499268', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '36', '-5180.895508', '596.640320', '408.112335', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '37', '-5180.009766', '610.448669', '408.964294', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '38', '-5179.010254', '629.560303', '398.546448', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '39', '-5178.824219', '633.018311', '398.546082', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '40', '-5177.220703', '654.860657', '388.959839', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '41', '-5176.970215', '658.702515', '388.959839', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '42', '-5175.649902', '678.966553', '379.909698', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '43', '-5175.290527', '684.310486', '379.352386', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '44', '-5173.214355', '705.574524', '369.766937', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '45', '-5172.834473', '712.714966', '369.765472', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '46', '-5163.152344', '712.508667', '369.765472', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '47', '-5162.308594', '705.768188', '369.765472', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '48', '-5165.507324', '666.178040', '348.932495', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '49', '-5166.233887', '656.292297', '348.279694', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '50', '-5166.872070', '649.750427', '348.489136', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '51', '-5166.872070', '649.750427', '247.841827', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '52', '-5162.357910', '689.594788', '247.369598', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '53', '-5151.636230', '727.016418', '247.369598', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '54', '-5145.094727', '726.401733', '247.369598', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '55', '-5119.512207', '724.035522', '254.095673', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '56', '-5116.247070', '723.778198', '254.307098', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '57', '-5098.798828', '722.279053', '259.285217', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '58', '-5081.573730', '724.174316', '260.555847', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '59', '-5054.638184', '732.560059', '261.248962', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '60', '-5048.257813', '735.472778', '257.336182', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '61', '-5033.412109', '737.746399', '256.475433', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '62', '-4976.061035', '733.267578', '256.275848', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '63', '-4948.415527', '730.725708', '260.374939', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '64', '-4946.948730', '730.632813', '261.566132', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '65', '-4939.745117', '731.451355', '261.645691', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '66', '-4940.826660', '730.935669', '261.645691', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '67', '-4976.375000', '733.288513', '256.280151', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '68', '-4948.928223', '730.775269', '260.292114', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '69', '-4946.928711', '730.578186', '261.582672', '0', '');
INSERT INTO `script_waypoint` VALUES ('39273', '70', '-4941.870117', '731.079346', '261.645782', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '0', '-5424.904785', '529.018250', '386.907135', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '1', '-5409.412598', '529.308472', '386.815735', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '2', '-5389.864258', '537.651489', '386.400970', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '3', '-5362.293945', '552.092041', '387.345825', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '4', '-5351.015625', '568.830688', '385.658569', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '5', '-5352.846680', '556.917725', '385.812195', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '6', '-5331.118652', '550.053711', '384.222687', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '7', '-5317.275879', '586.008179', '388.921997', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '8', '-5305.580078', '576.558838', '389.430603', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '9', '-5299.335449', '572.321472', '387.363373', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '10', '-5287.414063', '579.508423', '386.900696', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '11', '-5279.070801', '564.824463', '386.324402', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '12', '-5237.998047', '523.175537', '386.834412', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '13', '-5195.938477', '518.082886', '387.628754', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '14', '-5187.843750', '496.516663', '387.960724', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '15', '-5169.045898', '477.416107', '389.567505', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '16', '-5140.520020', '448.746094', '394.346405', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '17', '-5103.534668', '454.931732', '402.526276', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '18', '-5087.425293', '447.815735', '409.280487', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '19', '-5085.774414', '446.122864', '410.010529', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '20', '-5087.396973', '447.636505', '409.314209', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '21', '-5092.096191', '455.544373', '406.078674', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '22', '-5096.645508', '459.132782', '404.369598', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '23', '-5099.127441', '459.274902', '403.712097', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '24', '-5106.294922', '455.985779', '402.018951', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '25', '-5128.013672', '445.234467', '395.625244', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '26', '-5139.292969', '451.904663', '393.962158', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '27', '-5155.541992', '468.300476', '390.728790', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '28', '-5160.116699', '472.721527', '390.356110', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '29', '-5168.042480', '477.739838', '389.631897', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '30', '-5183.694336', '489.820190', '388.044525', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '31', '-5190.432129', '508.433350', '387.769104', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '32', '-5191.108398', '514.904297', '387.729156', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '33', '-5191.555176', '527.512756', '388.405853', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '34', '-5190.826172', '545.530029', '392.304321', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '35', '-5187.698730', '575.555298', '401.323792', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '36', '-5186.026855', '597.184814', '408.193695', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '37', '-5185.793457', '610.082031', '408.964874', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '38', '-5183.908691', '629.966553', '398.547729', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '39', '-5183.680664', '633.795776', '398.545227', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '40', '-5181.918945', '655.113708', '388.982178', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '41', '-5181.717285', '658.493713', '388.960114', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '42', '-5179.924316', '678.677795', '380.190948', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '43', '-5179.567383', '684.666199', '379.353027', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '44', '-5177.982910', '705.807007', '369.818054', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '45', '-5176.126953', '715.995422', '369.766388', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '46', '-5160.162598', '716.361267', '369.766388', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '47', '-5157.438965', '705.328491', '369.766388', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '48', '-5160.029297', '665.752869', '348.932465', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '49', '-5160.773926', '655.525208', '348.280701', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '50', '-5161.148926', '649.951538', '348.936096', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '51', '-5161.270996', '648.982727', '247.909073', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '52', '-5157.797363', '689.493164', '247.369415', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '53', '-5151.696289', '721.441223', '247.369415', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '54', '-5145.410156', '721.279846', '247.369415', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '55', '-5119.867676', '719.472656', '254.097168', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '56', '-5116.398926', '719.157898', '254.307388', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '57', '-5098.915527', '717.599792', '259.362640', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '58', '-5079.908203', '719.716125', '260.552216', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '59', '-5054.856445', '727.103699', '261.248871', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '60', '-5047.593750', '730.491272', '257.369171', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '61', '-5033.518555', '732.164917', '256.475372', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '62', '-4976.188477', '727.239563', '256.272461', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '63', '-4949.388184', '724.849670', '260.293152', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '64', '-4947.241211', '724.775208', '261.645844', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '65', '-4940.058105', '725.943787', '261.645844', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '66', '-4941.194336', '724.833923', '261.645844', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '67', '-4976.979492', '727.399170', '256.280396', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '68', '-4950.066406', '725.069885', '260.181854', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '69', '-4947.596191', '725.010742', '261.424683', '0', '');
INSERT INTO `script_waypoint` VALUES ('39910', '70', '-4941.947266', '726.680725', '261.646057', '0', '');

-- Deeprun Tram
-- Quest: Deeprun Rat Roundup, http://old.wowhead.com/quest=6661
SET @ENTRY := 13016;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `RequiredSpellCast1`=0 WHERE `Id`=6661;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,21050,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Deeprun Rat - On Spellhit - Follow Player"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,36,13017,0,0,0,0,0,1,0,0,0,0,0,0,0,"Deeprun Rat - On Spellhit - Update Template"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,33,13017,0,0,0,0,0,7,0,0,0,0,0,0,0,"Deeprun Rat - On Spellhit - Quest Credit"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Deeprun Rat - On Spellhit - Set Phase 1");

-- Ahn'Qiraj: The Fallen Kingdom
-- Quest: Band of Unending Life, http://old.wowhead.com/quest=8700
UPDATE `quest_template` SET `RequiredClasses` = 1024 WHERE Id = 8700;

-- Quest: Band of Vaulted Secrets, http://old.wowhead.com/quest=8699
UPDATE `quest_template` SET `RequiredClasses` = 128 WHERE Id = 8699;

-- Quest: Band of Veiled Shadows, http://old.wowhead.com/quest=8701
UPDATE `quest_template` SET `RequiredClasses` = 8 WHERE Id = 8701;

-- Quest: Ring of Eternal Justice, http://old.wowhead.com/quest=8703
UPDATE `quest_template` SET `RequiredClasses` = 2 WHERE Id = 8703;

-- Quest: Ring of Infinite Wisdom, http://old.wowhead.com/quest=8697
UPDATE `quest_template` SET `RequiredClasses` = 16 WHERE Id = 8697;

-- Quest: Ring of the Gathering Storm, http://old.wowhead.com/quest=8698
UPDATE `quest_template` SET `RequiredClasses` = 64 WHERE Id = 8698;

-- Quest: Ring of Unspoken Names, http://old.wowhead.com/quest=8702
UPDATE `quest_template` SET `RequiredClasses` = 256 WHERE Id = 8702;

-- Quest: Signet of the Unseen Path, http://old.wowhead.com/quest=8704
UPDATE `quest_template` SET `RequiredClasses` = 4 WHERE Id = 8704;

-- Quest: Signet of Unyielding Strength, http://old.wowhead.com/quest=8556
UPDATE `quest_template` SET `RequiredClasses` = 1 WHERE Id = 8556;

-- Quest: Blade of Eternal Justice, http://old.wowhead.com/quest=8711
UPDATE `quest_template` SET `RequiredClasses` = 2 WHERE Id = 8711;

-- Quest: Blade of Vaulted Secrets, http://old.wowhead.com/quest=8707
UPDATE `quest_template` SET `RequiredClasses` = 128 WHERE Id = 8707;

-- Quest: Dagger of Veiled Shadows, http://old.wowhead.com/quest=8709
UPDATE `quest_template` SET `RequiredClasses` = 8 WHERE Id = 8709;

-- Quest: Gavel of Infinite Wisdom, http://old.wowhead.com/quest=8705
UPDATE `quest_template` SET `RequiredClasses` = 16 WHERE Id = 8705;

-- Quest: Hammer of the Gathering Storm, http://old.wowhead.com/quest=8706
UPDATE `quest_template` SET `RequiredClasses` = 64 WHERE Id = 8706;

-- Quest: Kris of Unspoken Names, http://old.wowhead.com/quest=8710
UPDATE `quest_template` SET `RequiredClasses` = 256 WHERE Id = 8710;

-- Quest: Mace of Unending Life, http://old.wowhead.com/quest=8708
UPDATE `quest_template` SET `RequiredClasses` = 1024 WHERE Id = 8708;

-- Quest: Scythe of the Unseen Path, http://old.wowhead.com/quest=8712
UPDATE `quest_template` SET `RequiredClasses` = 4 WHERE Id = 8712;

-- Quest: Sickle of Unyielding Strength, http://old.wowhead.com/quest=8558
UPDATE `quest_template` SET `RequiredClasses` = 1 WHERE Id = 8558;

-- Quest: Cape of Eternal Justice, http://old.wowhead.com/quest=8695
UPDATE `quest_template` SET `RequiredClasses` = 2 WHERE Id = 8695;

-- Quest: Cloak of the Gathering Storm, http://old.wowhead.com/quest=8690
UPDATE `quest_template` SET `RequiredClasses` = 64 WHERE Id = 8690;

-- Quest: Cloak of the Unseen Path, http://old.wowhead.com/quest=8696
UPDATE `quest_template` SET `RequiredClasses` = 4 WHERE Id = 8696;

-- Quest: Cloak of Unending Life, http://old.wowhead.com/quest=8692
UPDATE `quest_template` SET `RequiredClasses` = 1024 WHERE Id = 8692;

-- Quest: Cloak of Veiled Shadows, http://old.wowhead.com/quest=8693
UPDATE `quest_template` SET `RequiredClasses` = 8 WHERE Id = 8693;

-- Quest: Drape of Unyielding Strength, http://old.wowhead.com/quest=8557
UPDATE `quest_template` SET `RequiredClasses` = 1 WHERE Id = 8557;

-- Quest: Drape of Vaulted Secrets, http://old.wowhead.com/quest=8691
UPDATE `quest_template` SET `RequiredClasses` = 128 WHERE Id = 8691;

-- Quest: Shroud of Infinite Wisdom, http://old.wowhead.com/quest=8689
UPDATE `quest_template` SET `RequiredClasses` = 16 WHERE Id = 8689;

-- Quest: Shroud of Unspoken Names, http://old.wowhead.com/quest=8694
UPDATE `quest_template` SET `RequiredClasses` = 256 WHERE Id = 8694;

-- Durotar
-- Quest: Garments of Spirituality, http://old.wowhead.com/npc=12430
UPDATE creature_template SET faction_A = 85, faction_H = 85 WHERE entry = 12430;

-- Felwood
-- Quest: Corrupted Sabers, http://old.wowhead.com/quest=4506
UPDATE creature_template SET AIName='', ScriptName='npc_q4506_cat' WHERE entry=9937;
UPDATE creature_template SET scale=3, speed_walk=1.146, speed_run=1.914, faction_A=35, faction_H=35, unit_flags=770, flags_extra=2 WHERE entry=10657;

-- Moonglade
-- Quests: Waking Legends, http://old.wowhead.com/quest=8447
--         Hope Within the Emerald Nightmare, http://old.wowhead.com/quest=13074
--         The Boon of Remulos, http://old.wowhead.com/quest=13075
SET @REMULOS :=11832;
SET @MALFURION :=17949;
SET @QUEST := 8447;
SET @SPELL1 :=25004;
SET @SPELL2 :=52096; 
UPDATE `quest_template` SET `RewardFactionValueId1` = 8 WHERE `Id` IN (8446,@QUEST);
UPDATE `quest_template` SET `SpecialFlags` = 2 WHERE `Id` = 8447;
DELETE FROM `creature_text` WHERE `entry` IN (@REMULOS,@MALFURION);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@REMULOS,0,0,'Come, $N. The lake is around the bend.',12,0,100,1,0,0,'Keeper Remulos - say Text 0'),
(@REMULOS,1,0,'Stand near me, $N. I will protect you should anything go wrong.',12,0,100,1,0,0,'Keeper Remulos - say Text 1'),
(@REMULOS,2,0,'Malfurion!',12,0,100,5,0,0,'Keeper Remulos - say Text 2'),
(@REMULOS,3,0,'It was shrouded in nightmares, Malfurion. What is happening in the Dream? What could cause such atrocities?',12,0,100,6,0,0,'Keeper Remulos - say Text 3'),
(@REMULOS,4,0,'I sensed as much, Malfurion. Dark days loom ahead.',12,0,100,1,0,0,'Keeper Remulos - say Text 4'),
(@REMULOS,5,0,'You have been gone too long, Malfurion. Peace between the Children of Azeroth has become tenuous at best. What of my father? Of your brother? Have you any news?',12,0,100,6,0,0,'Keeper Remulos - say Text 5'),
(@REMULOS,6,0,'Farewell, old friend... Farewell...',12,0,100,1,0,0,'Keeper Remulos - say Text 6'),
(@REMULOS,7,0,'Let us return to the grove, mortal.',12,0,100,1,0,0,'Keeper Remulos - say Text 7'),
(@MALFURION,0,0,'Remulos, old friend. It is good to see you once more. I knew the message would find its way to you – one way or another.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 0'),
(@MALFURION,1,0,'I fear for the worst, old friend. Within the Dream we fight a new foe, born of an ancient evil. Ysera''s noble brood has fallen victim to the old whisperings. It seems as if the Nightmare has broken through the realm to find a new host on Azeroth.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 1'),
(@MALFURION,2,0,'Aye Remulos, prepare the mortal races.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 2'),
(@MALFURION,3,0,'Cenarius fights at my side. Illidan sits atop his throne in Outland – brooding. I''m afraid that the loss to Arthas proved to be his breaking point. Madness has embraced him, Remulos. He replays the events in his mind a thousand times per day, but in his mind, he is the victor and Arthas is utterly defeated. He is too far gone, old friend. I fear that the time may soon come that our bond is tested and it will not be as it was at the Well in Zin-Azshari.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 3'),
(@MALFURION,4,0,'Remulos, I am being drawn back... Tyrande... send her my love... Tell her I am safe... Tell her... Tell her I will return... Farewell...',12,0,100,1,0,0,'Malfurion Stormrage - say Text 4');
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@REMULOS;
UPDATE `creature_template` SET `InhabitType`=4,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@MALFURION;
DELETE FROM `creature_template_addon` WHERE `entry`=@MALFURION;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@MALFURION,0,0,33554432,0,0,'24999');
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@REMULOS,@MALFURION);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@REMULOS*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@REMULOS,0,0,0,62,0,100,0,10215,0,0,0,11,57413,1,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - On gossip option select - cast spell'),
(@REMULOS,0,1,2,62,0,100,0,10215,1,0,0,11,57670,1,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - On gossip option select - cast spell'),
(@REMULOS,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - On gossip option select - close gossip'),
(@REMULOS,0,3,4,19,0,100,0,@QUEST,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - on Quest Accept - Turn off Quest Giver & Gossip Flag'),
(@REMULOS,0,4,5,61,0,100,0,0,0,0,0,53,0,@REMULOS,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - on Quest Accept - start WP'),
(@REMULOS,0,5,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - on Quest Accept - say Text 0'),
(@REMULOS,0,6,7,40,0,100,0,5,@REMULOS,0,0,54,83000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 5 - pause WP'),
(@REMULOS,0,7,8,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.12180,'Keeper Remulos - reached WP5 - set orientation'),
(@REMULOS,0,8,0,61,0,100,0,0,0,0,0,80,@REMULOS*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 5 - run Script'),
(@REMULOS,0,9,10,40,0,100,0,10,@REMULOS,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 10 - Turn on Quest Giver & Gossip Flag'),
(@REMULOS,0,10,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.909540,'Keeper Remulos - reached WP 10 - set orientation'),
(@REMULOS*100,9,0,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 1'),
(@REMULOS*100,9,1,0,0,0,100,0,3000,3000,0,0,11,@SPELL1,2,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - cast Spell: Throw Nightmare Object to Position'),
(@REMULOS*100,9,2,0,0,0,100,0,4000,4000,0,0,12,@MALFURION,8,0,0,0,0,8,0,0,0,7730.5288,-2318.8596,453.8706,6.14985,'Keeper Remulos - summon Malfurion Stormrage'),
(@REMULOS*100,9,3,0,0,0,100,0,2000,2000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 2'),
(@REMULOS*100,9,4,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 0'),
(@REMULOS*100,9,5,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 3'),
(@REMULOS*100,9,6,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 1'),
(@REMULOS*100,9,7,0,0,0,100,0,11000,11000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 4'),
(@REMULOS*100,9,8,0,0,0,100,0,3500,3500,0,0,1,2,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 2'),
(@REMULOS*100,9,9,0,0,0,100,0,4000,4000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 5'),
(@REMULOS*100,9,10,0,0,0,100,0,9000,9000,0,0,1,3,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 3'),
(@REMULOS*100,9,11,0,0,0,100,0,19000,19000,0,0,1,4,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 4'),
(@REMULOS*100,9,12,0,0,0,100,0,6000,6000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 6'),
(@REMULOS*100,9,13,0,0,0,100,0,2000,2000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 7'),
(@REMULOS*100,9,14,0,0,0,100,0,0,0,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - give Quest Credit'),
(@REMULOS*100,9,15,0,0,0,100,0,1000,1000,0,0,45,0,1,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Keeper Remulos - set data 0 1 to Malfurion Stormrage'),
(@MALFURION,0,0,0,54,0,100,0,0,0,0,0,11,@SPELL2,2,0,0,0,0,1,0,0,0,0,0,0,0,'Malfurion Stormrage - on summon - cast Cosmetic Teleport Effect on self'),
(@MALFURION,0,1,0,38,0,100,0,0,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malfurion Stormrage - on data set 0 1 - despawn');
DELETE FROM `spell_target_position` WHERE `id`=@SPELL1;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(@SPELL1,1,7730.5288,-2318.8596,451.34,0);
DELETE FROM `waypoints` WHERE `entry`=@REMULOS;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@REMULOS,1,7828.5752,-2246.8354,463.5159,'Keeper Remulos - WP1'),
(@REMULOS,2,7824.6440,-2279.0273,459.3173,'Keeper Remulos - WP2'),
(@REMULOS,3,7814.1699,-2302.2565,456.2227,'Keeper Remulos - WP3'),
(@REMULOS,4,7787.4604,-2320.9807,454.5470,'Keeper Remulos - WP4'),
(@REMULOS,5,7753.7495,-2319.0832,454.7066,'Keeper Remulos - WP5'),
(@REMULOS,6,7787.4604,-2320.9807,454.5470,'Keeper Remulos - WP6'),
(@REMULOS,7,7814.1699,-2302.2565,456.2227,'Keeper Remulos - WP7'),
(@REMULOS,8,7824.6440,-2279.0273,459.3173,'Keeper Remulos - WP8'),
(@REMULOS,9,7828.5752,-2246.8354,463.5159,'Keeper Remulos - WP9'),
(@REMULOS,10,7848.3,-2216.35,470.888,'Keeper Remulos - WP10 (Home)');

-- Thunder Bluff
-- Quest: Kodo Hide Bag, http://old.wowhead.com/quest=769
UPDATE `quest_template` SET `RequiredSkillId` = '165', `RequiredSkillPoints`='10' WHERE `Id` = '769';

-- Azuremyst Isle
-- Quest: Strength of One, http://old.wowhead.com/quest=9582
UPDATE item_template SET ScriptName = "item_ravager_cage_key" WHERE entry = 23925;

-- Quest: The Prophecy of Akida, http://old.wowhead.com/quest=9544
UPDATE item_template SET ScriptName = "item_bristlelimb_key" WHERE entry = 23801;

-- Silithus
-- Quest: Glyph Chasing, http://old.wowhead.com/quest=8309
UPDATE item_template SET ScriptName = 'item_gt_kit' WHERE entry = 20453;

-- Quest: Metzen the Reindeer, http://old.wowhead.com/quest=8762
DELETE FROM `conditions` WHERE `SourceGroup`='15664' AND `ConditionTypeOrReference`='23' AND `ConditionValue1`='21211';
DELETE FROM `smart_scripts` WHERE `entryorguid`=15664;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(15664, 0, 0, 0, 62, 0, 100, 0, 6763, 0, 0, 0, 80, 1566400, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Metzen the Reindeer: Call action list on gossip select'),
(15664, 0, 1, 0, 62, 0, 100, 0, 6763, 0, 0, 0, 33, 15664, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Metzen the Reindeer: Give kill credit on gossip select');

-- Outland
-- Netherstorm
-- Quest: Elemental Power Extraction, http://old.wowhead.com/quest=10226
UPDATE creature_template SET AIName='', ScriptName='npc_ele_power_extractor' WHERE entry IN (18865,18881);
UPDATE gameobject_template SET flags=0 WHERE entry=183933;

-- Quest: Fel Reaver, No Thanks!, http://old.wowhead.com/quest=10855
UPDATE `spell_dbc` SET `Effect1`=16,`EffectMiscValue1`=10855 WHERE `id`=38758;

-- Quest: Sniffing Out the Perpetrator, http://old.wowhead.com/quest=12910
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 29695;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 29695;
INSERT INTO `smart_scripts` VALUES (29695, 0, 0, 0, 10, 0, 100, 1, 0, 40, 0, 0, 33, 29677, 0, 0, 0, 0, 0, 18, 40, 0, 0, 0, 0, 0, 0,'');

-- Shadowmoon valley
-- Quests: To Legion Hold, http://old.wowhead.com/quest=10596,
--                         http://old.wowhead.com/quest=10563
DELETE FROM areatrigger_scripts WHERE entry=4548;
INSERT INTO areatrigger_scripts VALUES (4548,'at_legion_hold_smvalley');
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=21633;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (21633);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(21633,0,0,0,1,0,100,1,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jovaan - Say Text 0'),
(21633,0,1,0,1,0,100,1,4000,4000,0,0,1,0,0,0,0,0,0,9,21502,0,3,25,0,0,0,'Razuun - Say Text 0'),
(21633,0,2,0,1,0,100,1,12000,12000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jovaan - Say Text 1'),
(21633,0,3,0,1,0,100,1,16000,16000,0,0,1,1,0,0,0,0,0,9,21502,0,3,25,0,0,0,'Razuun - Say Text 1'),
(21633,0,4,0,1,0,100,1,22000,22000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jovaan - Say Text 2'),
(21633,0,5,0,1,0,100,1,28000,28000,0,0,1,2,0,0,0,0,0,9,21502,0,3,25,0,0,0,'Razuun - Say Text 2'),
(21633,0,6,0,1,0,100,1,30000,30000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jovaan - Say Text 3'),
(21633,0,7,0,1,0,100,1,32000,32000,0,0,1,3,0,0,0,0,0,9,21502,0,3,25,0,0,0,'Razuun - Say Text 3'),
(21633,0,8,0,1,0,100,0,35000,35000,0,0,33,21502,0,0,0,0,0,21,1,0,0,0,0,0,0,'Jovaan - KillCredit to nearest Player'); -- > this doesn't work for some reason
DELETE FROM `creature_text` WHERE `entry` IN (21502,21633);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(21502,0,0,'Doom Lord Kazzak will be pleased. You are to increase the pace of your attacks. Destroy the orcish and dwarven strongholds with all haste.',12,0,100,1,0,0,'Razuun'),
(21502,1,0,'Don''t worry about that. I''ve increased production at the Deathforge. You''ll have all the infernals you need to carry out your orders. Don''t fail, Jovaan.',0,0,100,1,0,0,'Razuun'),
(21502,2,0,'Yes?',12,0,100,1,0,0,'Razuun'),
(21502,3,0,'Crate? I didn''t send you a crate, Jovaan. Don''t you have more important things to worry about? Go see to them!',12,0,100,1,0,0,'Razuun'),
(21633,0,0,'Everything is in readiness, warbringer.',12,0,100,1,0,0,'Jovaan'),
(21633,1,0,'Warbringer, that will require the use of all the hold''s infernals. It may leave us vulnerable to a counterattack.',0,0,100,1,0,0,'Jovaan'),
(21633,2,0,'It shall be as you say, warbringer. One last question, if I may...',12,0,100,1,0,0,'Jovaan'),
(21633,3,0,'What''s in the crate?',12,0,100,1,0,0,'Jovaan');

-- Blade's Edge Mountains
-- Quest: Death's Door, http://old.wowhead.com/quest=10910
UPDATE `creature_template` SET `ScriptName` = 'npc_antelarion_gossip' WHERE `entry` = 22127;
UPDATE `creature_template` SET `ScriptName` = 'npc_evergrove_druid' WHERE `entry` = 22423;
UPDATE `creature_template` SET `unit_flags` = 0, `flags_extra` = 2, `InhabitType` = 5 WHERE `entry` = 22423;
DELETE FROM `creature_template_addon` WHERE `entry`=22423;

-- Quest: Stasis Chambers of Bash'ir, http://old.wowhead.com/quest=10974
DELETE FROM `creature_template` WHERE entry = '22919';
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`,`difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`,
`modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`,`gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`,
`npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`,`dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`,
`rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`,`trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`,
`maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`,`pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`,
`resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`,`spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`,
`mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`,`Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`,
`questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`,`RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`,`ScriptName`, `WDBVerified`) VALUES
('22919', '0', '0', '0', '0', '0', '19661', '0', '0', '0', 'Image of Commander Ameer', 'The Protectorate', NULL, '0', '70', '70', '1', '1795', '1795',
 '2', '1.125', '1.14286', '1', '0', '252', '357', '0', '304', '1', '2000', '0', '1', '2', '8', '0', '0', '0', '0', '0', '215', '320', '44', '10', '0',
 '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '1', '1', '0', '0',
 '0', '0', '0', '0', '0', '0', '1', '2256', '0', '0', '', '12340');
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`,`equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`,
`spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('22919', '530', '1', '1', '0', '2256', '3866.6', '5978.59', '291.792', '3.97902', '300', '0', '0', '6986', '0', '0', '0', '0', '0');
UPDATE `creature_involvedrelation` SET `id` = '22919' WHERE `quest` IN ( '10974', '10975', '10976', '10977', '10981' ,'10982');
UPDATE `creature_questrelation` SET `id` = '22919' WHERE `quest` IN ( '10975', '10976', '10977', '10981' ,'10982');

-- Quests: Bombing Run, http://old.wowhead.com/quest=11010
--                      http://old.wowhead.com/quest=11102
--         Bomb Them Again!, http://old.wowhead.com/quest=11023
UPDATE `quest_template` SET `PrevQuestId` = 11058 WHERE `Id` IN (11010, 11102);
SET @NPC_BOMBING_RUN_BUNNY := 23118;
SET @NPC_BOMBING_RUN_KC    := 23118;
SET @GO_FEL_CANNON_BALLS   := 185861;
SET @C_GUID                := 600793;
UPDATE `creature_template` SET `AIName` = 'SmartAI', `flags_extra` = 130 WHERE `entry` = @NPC_BOMBING_RUN_BUNNY;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@NPC_BOMBING_RUN_BUNNY AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@NPC_BOMBING_RUN_BUNNY, 0, 1, 2, 25, 0, 100, 1, 0, 0, 0, 0, 50, @GO_FEL_CANNON_BALLS, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bombing Run target - Summon GameObject Fel Cannonball Stack on spawn'),
(@NPC_BOMBING_RUN_BUNNY, 0, 2, 0, 61, 0, 100, 1, 0, 0, 0, 0, 11, 40196, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bombing Run -  Add Hunter Mark visual'),
(@NPC_BOMBING_RUN_BUNNY, 0, 10, 11, 8, 0, 100, 1, 40160, 0, 0, 0, 33,  @NPC_BOMBING_RUN_KC, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Bombing Run - OnSpellHit - Give KillCredit to caster'),
(@NPC_BOMBING_RUN_BUNNY, 0, 11, 12, 61, 0, 100, 1, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 13, @GO_FEL_CANNON_BALLS, 0, 1, 0, 0, 0, 0, 'Bombing Run - OnSpellHit - Activate summoned GO (makes him despawn)'),
(@NPC_BOMBING_RUN_BUNNY, 0, 12, 13, 61, 0, 100, 1, 0, 0, 0, 0, 28, 40196, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bombing Run - OnSpellHit - Remove Hunter Mark Visual (for avoiding problems on respawn)'),
(@NPC_BOMBING_RUN_BUNNY, 0, 13, 0, 61, 0, 100, 1, 0, 0, 0, 0, 41, 7000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bombing Run - OnSpellHit - Despawn self at the same time as the GO does');
UPDATE `quest_template` SET `RequiredNpcOrGo1` =  @NPC_BOMBING_RUN_KC WHERE `Id` = 11023;
DELETE FROM `creature` WHERE `id`=@NPC_BOMBING_RUN_BUNNY;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@C_GUID+07, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2926.96, 7100.13, 368.636, 5.82846, 300, 0, 0, 47, 0, 0, 0, 33554432, 0),
(@C_GUID+08, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2938.12, 7105.3, 370.151, 3.34739, 300, 0, 0, 28, 0, 0, 0, 33554432, 0),
(@C_GUID+09, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2811.53, 7054.38, 370.553, 3.99062, 300, 0, 0, 1, 0, 0, 0, 33554432, 0),
(@C_GUID+10, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2772.98, 7033.43, 369.986, 3.76757, 300, 0, 0, 34, 0, 0, 0, 33554432, 0),
(@C_GUID+11, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2772.97, 7029.23, 370.295, 4.71005, 300, 0, 0, 60, 0, 0, 0, 33554432, 0),
(@C_GUID+12, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2768.57, 7023.64, 369.705, 0.65582, 300, 0, 0, 40, 0, 0, 0, 33554432, 0),
(@C_GUID+13, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 3018.58, 6815.8, 373.901, 5.03913, 300, 0, 0, 43, 0, 0, 0, 33554432, 0),
(@C_GUID+14, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 3023.46, 6809.04, 374.139, 3.41728, 300, 0, 0, 19, 0, 0, 0, 33554432, 0),
(@C_GUID+15, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2949.2, 6808.38, 367.529, 4.94959, 300, 0, 0, 14, 0, 0, 0, 33554432, 0),
(@C_GUID+16, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 3087.37, 6915.52, 365.235, 3.06464, 300, 0, 0, 15, 0, 0, 0, 33554432, 0),
(@C_GUID+17, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 3081.75, 6910.23, 365.12, 1.72004, 300, 0, 0, 15, 0, 0, 0, 33554432, 0),
(@C_GUID+18, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 3075.5, 6913.78, 365.21, 0.0408534, 300, 0, 0, 53, 0, 0, 0, 33554432, 0),
(@C_GUID+19, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2933.24, 7023.79, 366.7, 0.855313, 300, 0, 0, 3, 0, 0, 0, 33554432, 0),
(@C_GUID+20, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2804.19, 7051.71, 370.669, 5.83867, 300, 0, 0, 15, 0, 0, 0, 33554432, 0),
(@C_GUID+21, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2943.7, 7065.94, 370.55, 0.224639, 300, 0, 0, 5, 0, 0, 0, 33554432, 0),
(@C_GUID+22, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2962.72, 7072.13, 369.895, 2.97196, 300, 0, 0, 26, 0, 0, 0, 33554432, 0),
(@C_GUID+23, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 2807.64, 7012.14, 371.752, 5.13966, 300, 0, 0, 1, 0, 0, 0, 33554432, 0),
(@C_GUID+24, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1658.55, 7204.57, 370.581, 4.54904, 300, 0, 0, 35, 0, 0, 0, 33554432, 0),
(@C_GUID+25, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1660.75, 7195.83, 369.876, 2.70178, 300, 0, 0, 11, 0, 0, 0, 33554432, 0),
(@C_GUID+26, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1622.48, 7208.63, 371.626, 2.87378, 300, 0, 0, 2, 0, 0, 0, 33554432, 0),
(@C_GUID+27, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1351.68, 7348.13, 371.49, 5.88814, 300, 0, 0, 11, 0, 0, 0, 33554432, 0),
(@C_GUID+28, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1356.8, 7353.64, 370.865, 5.67844, 300, 0, 0, 1, 0, 0, 0, 33554432, 0),
(@C_GUID+29, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1363.89, 7356.13, 372.428, 5.22291, 300, 0, 0, 2, 0, 0, 0, 33554432, 0),
(@C_GUID+30, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1284.64, 7168.34, 374.298, 4.05816, 300, 0, 0, 61, 0, 0, 0, 33554432, 0),
(@C_GUID+31, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1285.45, 7159.85, 374.611, 2.09231, 300, 0, 0, 58, 0, 0, 0, 33554432, 0),
(@C_GUID+32, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1331.17, 7214.11, 376.48, 4.73125, 300, 0, 0, 27, 0, 0, 0, 33554432, 0),
(@C_GUID+33, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1335.3, 7214.85, 375.837, 5.20249, 300, 0, 0, 11, 0, 0, 0, 33554432, 0),
(@C_GUID+34, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1342.25, 7213.9, 375.026, 5.62346, 300, 0, 0, 38, 0, 0, 0, 33554432, 0),
(@C_GUID+35, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1471.43, 7252.4, 374.415, 0.172015, 300, 0, 0, 9, 0, 0, 0, 33554432, 0),
(@C_GUID+36, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1480.66, 7245.62, 374.497, 1.59673, 300, 0, 0, 58, 0, 0, 0, 33554432, 0),
(@C_GUID+37, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1368.79, 7336.18, 371.621, 1.95644, 300, 0, 0, 55, 0, 0, 0, 33554432, 0),
(@C_GUID+38, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1511.27, 7225.6, 371.129, 5.05013, 300, 0, 0, 39, 0, 0, 0, 33554432, 0),
(@C_GUID+39, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1516.46, 7290.59, 367.624, 0.316532, 300, 0, 0, 35, 0, 0, 0, 33554432, 0),
(@C_GUID+40, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1670.86, 7371.79, 373.319, 0.764209, 300, 0, 0, 29, 0, 0, 0, 33554432, 0),
(@C_GUID+41, @NPC_BOMBING_RUN_BUNNY, 530, 1, 1, 0, 0, 1675.87, 7381.21, 371.146, 4.09195, 300, 0, 0, 49, 0, 0, 0, 33554432, 0);

-- Terrokar Forest
-- Quest: Missing Friends, http://old.wowhead.com/quest=10852
UPDATE `gameobject_template` SET `ScriptName`='go_veil_skith_cage' WHERE `entry` IN (185202,185203,185204,185205);
DELETE FROM `creature_text` WHERE `entry`=22314;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(22314,0,0,"Woot!",12,0,100,0,0,0,"Captive Child"),
(22314,0,1,"I think those weird bird guys were going to eat us. Gross!",12,0,100,0,0,0,"Captive Child"),
(22314,0,2,"Yay! We're free!",12,0,100,0,0,0,"Captive Child"),
(22314,0,3,"Gross!",12,0,100,0,0,0,"Captive Child");

-- Quest: The Big Bone Worm, http://old.wowhead.com/quest=10930
DELETE FROM spell_script_names WHERE spell_id=39246;
INSERT INTO spell_script_names VALUES (39246,'spell_fumping_39246');

-- Quest: Fumping, http://old.wowhead.com/quest=10929
DELETE FROM spell_script_names WHERE spell_id=39238;
INSERT INTO spell_script_names VALUES (39238,'spell_fumping_39238');

-- Quest: Terokk's Downfall, http://old.wowhead.com/quest=11073
UPDATE `gameobject_template` SET `ScriptName` = 'go_ancient_skull_pile' WHERE `entry` = 185928;
UPDATE creature_template SET AIName='', ScriptName='npc_terokk' WHERE entry=21838;
DELETE FROM `creature_text` WHERE `entry`=21838;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(21838,0,0,'Who calls me to this world? The stars are not yet aligned...my powers fail me! You will pay for this!',14,0,0,0,0,0,'Terokk - Summoned & inCombat'),
(21838,1,0,'Show me how tough you are!',12,0,0,0,0,0,'Terokk - Player Chosen'),
(21838,2,0,'Kwa! You cannot kill me, I am immortal!',12,0,0,0,0,0,'Terokk - Immune');
DELETE FROM `creature_template` WHERE (`entry`=97016);
INSERT INTO `creature_template` VALUES (97016, 0, 0, 0, 0, 0, 17519, 11686, 0, 0, 'Terokk Visual Marker Trigger', '', '', 0, 80, 80, 0, 114, 114, 0, 1, 1.14286, 1, 0, 104, 138, 0, 252, 1, 2000, 0, 1, 33587968, 8, 0, 0, 0, 0, 0, 72, 106, 26, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 7, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 130, '', 12340);
UPDATE creature_template SET modelid1=11686, modelid2=11686, modelid3=11686, modelid4=11686, npcflag=0, unit_flags=256|512|33554432, flags_extra=2 WHERE entry=97016;

-- Quest: Veil Skith: Darkstone of Terokk, http://old.wowhead.com/quest=10839
UPDATE item_template SET ScriptName = "rod_of_purification" WHERE entry = 31610;

-- Hellfire Peninsula
-- Quests: Journey to Thrallmar http://old.wowhead.com/quest=10289
--                              http://old.wowhead.com/quest=10140
-- Vlagga Freyfeather NPC(18930)
DELETE FROM  `gossip_menu_option` WHERE  `menu_id` =7938;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(7938, 0, 2, 'Show me where I can fly.', 4, 8192, 0, 0, 0, 0, ''),
(7938, 1, 2, 'Send me to Thrallmar!', 4, 8192, 0, 0, 0, 0, '');
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE  `entry` =18930;
DELETE FROM  `smart_scripts` WHERE  `entryorguid` =18930;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(18930, 0, 0, 0, 62, 0, 100, 0, 7938, 1, 0, 0, 11, 34924, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Vlagga Freyfeather - On gossip option 1 select - Cast Stair of Destiny to Thrallmar'),
(18930, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 12, 9297, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Vlagga Freyfeather - Summon Enraged Wyverns on Aggro'),
(18930, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 12, 9297, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Vlagga Freyfeather - Summon Enraged Wyverns on Aggro'),
(18930, 0, 3, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Vlagga Freyfeather - Say text on Aggro');
DELETE FROM  `conditions` WHERE  `SourceGroup` =7938;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 7938, 0, 0, 14, 10289, 0, 0, 0, '', 'Show gossip option 0 if player not have quest 10289 "Journey to Thrallmar"'),
(15, 7938, 1, 0, 28, 10289, 0, 0, 0, '', 'Show gossip option 1 if player has complete quest 10289 "Journey to Thrallmar"');
DELETE FROM  `locales_gossip_menu_option` WHERE  `menu_id` =7938;
INSERT INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES
(7938, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Покажи мне, куда я могу полететь.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(7938, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Отправьте меня в Траллмар!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
DELETE FROM  `gossip_menu` WHERE  `entry` =7939;
DELETE FROM  `npc_text` WHERE  `ID` IN ( 9935, 9991);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(7939, 10052);
DELETE FROM  `gossip_menu_option` WHERE  `menu_id` =7939;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(7939, 0, 2, 'Show me where I can fly.', 4, 8192, 0, 0, 0, 0, ''),
(7939, 1, 2, 'Send me to Honor Hold!', 4, 8192, 0, 0, 0, 0, '');
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE  `entry` =18931;
DELETE FROM  `smart_scripts` WHERE  `entryorguid` =18931;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(18931, 0, 0, 0, 62, 0, 100, 0, 7939, 1, 0, 0, 11, 34907, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Amish Wildhammer - On gossip option 1 select - Cast Stair of Destiny to Honor Hold'),
(18931, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 12, 9526, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Amish Wildhammer - Summon Enraged Gryphon on Aggro'),
(18931, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 12, 9526, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Amish Wildhammer - Summon Enraged Gryphon on Aggro'),
(18931, 0, 3, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Amish Wildhammer - Say text on Aggro');
DELETE FROM  `conditions` WHERE  `SourceGroup` =7939;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 7939, 0, 0, 14, 10140, 0, 0, 0, '', 'Show gossip option 0 if player has complete quest 10140 "Journey to Honor Hold"'),
(15, 7939, 1, 0, 28, 10140, 0, 0, 0, '', 'Show gossip option 1 if player has complete quest 10140 "Journey to Honor Hold"');
DELETE FROM  `locales_gossip_menu_option` WHERE  `menu_id` =7939;
INSERT INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`) VALUES
(7939, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Покажи мне, куда я могу полететь.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(7939, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Отправьте меня в Оплот Чести!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');

-- Quest: Laying Waste to the Unwanted, http://old.wowhead.com/quest=10078
SET @ENTRY := 19009;
SET @SPELL_IGNITE_SIEGE := 32979;
SET @SPELL_HELLFIRE_FIRE := 34386;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature` SET `position_x`=-183.947998,`position_y`=2773.389893,`position_z`=49.198399 WHERE `guid`=68321 AND `id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_IGNITE_SIEGE,0,60000,60000,11,@SPELL_HELLFIRE_FIRE,0,0,0,0,0,1,0,0,0,0,0,0,0,"Invis Horde Siege Engine - West - On Spellhit - Cast Create Hellfire Fire"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,1,0,0,0,0,0,0,0,"Invis Horde Siege Engine - West - On Spellhit - Quest Credit");
SET @ENTRY := 21236;
SET @SPELL_IGNITE_SIEGE := 32979;
SET @SPELL_HELLFIRE_FIRE := 34386;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature` SET `position_z`=43.094120 WHERE `guid`=74454 AND `id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_IGNITE_SIEGE,0,60000,60000,11,@SPELL_HELLFIRE_FIRE,0,0,0,0,0,1,0,0,0,0,0,0,0,"Invis Horde Siege Engine - West 02 - On Spellhit - Cast Create Hellfire Fire"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,1,0,0,0,0,0,0,0,"Invis Horde Siege Engine - West 02 - On Spellhit - Quest Credit");
SET @ENTRY := 21237;
SET @SPELL_IGNITE_SIEGE := 32979;
SET @SPELL_HELLFIRE_FIRE := 34386;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature` SET `position_x`=-157.329712,`position_y`=2518.655273,`position_z`=58.221237 WHERE `guid`=67186 AND `id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_IGNITE_SIEGE,0,60000,60000,11,@SPELL_HELLFIRE_FIRE,0,0,0,0,0,1,0,0,0,0,0,0,0,"Invis Horde Siege Engine - East - On Spellhit - Cast Create Hellfire Fire"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,1,0,0,0,0,0,0,0,"Invis Horde Siege Engine - East - On Spellhit - Quest Credit");
SET @ENTRY := 18818;
SET @SPELL_IGNITE_SIEGE := 32979;
SET @SPELL_HELLFIRE_FIRE := 34386;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature` SET `position_x`=-152.163116,`position_y`=2662.497314,`position_z`=60.728378 WHERE `guid`=74455 AND `id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_IGNITE_SIEGE,0,60000,60000,11,@SPELL_HELLFIRE_FIRE,0,0,0,0,0,1,0,0,0,0,0,0,0,"Invis Horde Siege Engine - East 02 - On Spellhit - Cast Create Hellfire Fire"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,1,0,0,0,0,0,0,0,"Invis Horde Siege Engine - East 02 - On Spellhit - Quest Credit");

-- Skettis
-- Quest: Fires Over Skettis, http://old.wowhead.com/quest=11008
SET @TRIGGER := 22991;
SET @EGG := 185549;
SET @SKYBLAST := 39844;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`unit_flags`=33554432 WHERE `entry`=@TRIGGER;
UPDATE `gameobject_template` SET `AIName`= 'SmartGameObjectAI' WHERE `entry`=@EGG;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@TRIGGER AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@EGG AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@EGG,1,0,1, 8,0,100,0x01,@SKYBLAST,0,0,0,41,500,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Monstrous Kaliri Egg - On Skyguard Blasting Charge hit - Despawn'),
(@TRIGGER,0,0,1,8,0,100,0x01,@SKYBLAST,0,0,0,33,@TRIGGER,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Monstrous Kaliri Egg Trigger - On Skyguard Blasting Charge hit - Give kill credit'),
(@TRIGGER,0,1,0,61,0,100,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Monstrous Kaliri Egg Trigger - Linked event - Despawn after 500 ms');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SKYBLAST;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,0,@SKYBLAST,0,18,0,@EGG,0,0,'', 'Skyguard Blasting Charge - Limit GO targets to Monstrous Kaliri Egg'),
(13,0,@SKYBLAST,0,18,1,@TRIGGER,0,0,'', 'Skyguard Blasting Charge - Limit NPC targets to Monstrous Kaliri Egg Trigger');

-- Northrend
-- Dragonblight
-- Quest: Spread the Good Word, http://old.wowhead.com/quest=12218
UPDATE creature_template SET scriptname = 'vehicle_forsaken_blight_spreader' WHERE entry = 26523;

-- Quest: Blood Oath of the Horde, http://old.wowhead.com/quest=11983
UPDATE creature_template SET scriptname = 'npc_emissary_brighthoof' WHERE entry = 26181;

-- Quest: Leave Nothing to Chance, http://old.wowhead.com/quest=12277
UPDATE creature_template SET scriptname = 'npc_wintergarde_mine_bomb' WHERE entry = 27435;

-- Quest: Wanted: The Scarlet Onslaught, http://old.wowhead.com/quest=12205
UPDATE creature_template SET scriptname = 'npc_devout_bodyguard' WHERE entry = 27247;
UPDATE creature_template SET scriptname = 'npc_high_abbot_landgren' WHERE entry = 27245;

-- Quest: A Fall From Grace, http://old.wowhead.com/quest=12274
UPDATE creature_template SET scriptname = 'npc_agent_skully' WHERE entry = 27350;

-- Quest: Steamtank Surprise, http://old.wowhead.com/quest=12326
UPDATE creature_template SET scriptname = 'npc_7th_legion_siege_engineer' WHERE entry = 27163;
UPDATE creature_template SET scriptname = 'vehicle_alliance_steamtank' WHERE entry = 27587;

-- Quests: Strengthen the Ancients, http://old.wowhead.com/quest=12092,
--                                  http://old.wowhead.com/quest=12096
UPDATE creature_template SET scriptname = 'mob_woodlands_walker' WHERE entry = 26421;
UPDATE creature_template SET scriptname = 'npc_denouncement_target' WHERE entry IN (27234, 27235, 27236, 27237);
UPDATE creature_template SET spell1 = 49315, spell2 = 49333, spell3 = 49109, spell4 = 49081 WHERE entry = 27587;
DELETE FROM spell_area WHERE spell=49081;
INSERT INTO spell_area (`spell`,`area`,`autocast`) VALUES (49081,4246,0);
UPDATE creature_template SET flags_extra = flags_extra | 2 WHERE entry = 27607;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry` = 27587;

-- Quests: Projections and Plans, http://old.wowhead.com/quest=12060
--                                http://old.wowhead.com/quest=12061
DELETE FROM `creature_template` WHERE `entry`=27853;
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(27853,0,0,0,0,0,1126,17612,0,0,'Projections and Plans Kill Credit Bunny','','',0,1,1,0,35,35,0,1,1.14286,1,0,2,2,0,24,1,2000,0,1,33555200,8,0,0,0,0,0,1,1,0,10,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,7,1,1,1,0,0,0,0,0,0,0,0,1,0,0,128,'',12340);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27853;
DELETE FROM `smart_scripts` WHERE `entryorguid`=27853 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(27853,0,0,0,1,0,100,0,1000,1000,1000,1000,11,49731,0,0,0,0,0,1,0,0,0,0,0,0,0,'Projections and Plans Kill Credit Bunny - OOC - Cast Projections and Plans: Kill Credit on self');

-- Quests: The Focus on the Beach, http://old.wowhead.com/quest=12065
--                                 http://old.wowhead.com/quest=12066 
--         Atop the Woodlands, http://old.wowhead.com/quest=12083
--                             http://old.wowhead.com/quest=12084
--         The End of the Line, http://old.wowhead.com/quest=12107
--                              http://old.wowhead.com/quest=12110
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (47390,47472,47635);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(47374,47390,0,'The Focus on the Beach - Quest Credit'),
(47469,47472,0,'Atop The Woodlands - Quest Credit'),
(47634,47635,0,'The End of The Line - Quest Credit');
DELETE FROM `creature_template` WHERE `entry`=26889;
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(26889,0,0,0,0,0,1126,17612,0,0,'The End of the Line Area Trigger Kill Credit Bunny','','',0,1,1,0,35,35,0,1,1.14286,1,0,2,2,0,24,1,2000,0,1,33555200,8,0,0,0,0,0,1,1,0,10,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,7,1,1,1,0,0,0,0,0,0,0,0,1,0,0,128,'',12340);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=26889;
DELETE FROM `spell_dbc` WHERE `id`=47639;
INSERT INTO `spell_dbc` (`Id`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`EffectImplicitTargetA1`,`EffectImplicitTargetB1`,`CastingTimeIndex`,`ProcChance`,`EquippedItemClass`,`Effect1`,`EffectRadiusIndex1`,`EffectMiscValue1`,`Comment`) VALUES
(47639,0x29000100,0x420,0x4004,0x10000040,0x80,0x60008,22,7,1,101,-1,134,10,26889,'The End of the Line Area Trigger Kill Credit');
DELETE FROM `smart_scripts` WHERE `entryorguid`=26889 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26889,0,0,0,1,0,100,0,1000,1000,1000,1000,11,47639,0,0,0,0,0,1,0,0,0,0,0,0,0,'The End of the Line Area Trigger Kill Credit Bunny - Cast The End of the Line Area Trigger Kill Credit on self');

-- Quest: Where the Wild Things Roam, http://old.wowhead.com/quest=12111
UPDATE item_template SET scriptname = 'pack_of_vaccine' WHERE entry = 36818;

-- Quest: Flight of the Wintergarde Defender, http://old.wowhead.com/quest=12237
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=48363;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,48363,18,1,27315),
(13,48363,18,1,27336);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_q12237_rescue_villager';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_q12237_drop_off_villager';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(48363, 'spell_q12237_rescue_villager'),
(48397, 'spell_q12237_drop_off_villager');
UPDATE `quest_template` SET `RequiredNpcOrGoCount1`=27341 WHERE `Id`=12237;
SET @guid := 307123;
DELETE FROM `creature` WHERE `id` IN (27315,27336);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@guid,'27315','571','1','1','0','0','3866.58','-1064.05','129.837','3.06459','10','0','0','7984','0','0','0','0','0'),
(@guid+1,'27315','571','1','1','0','0','3810.28','-1038.18','119.534','0.000745702','10','0','0','6986','0','0','0','0','0'),
(@guid+2,'27315','571','1','1','0','0','3745.69','-1010.8','122.173','4.88357','10','0','0','6986','0','0','0','0','0'),
(@guid+3,'27315','571','1','1','0','0','3793.81','-1077.19','119.458','0.245007','10','0','0','8982','0','0','0','0','0'),
(@guid+4,'27315','571','1','1','0','0','3755.87','-1122.73','119.764','3.76438','10','0','0','8982','0','0','0','0','0'),
(@guid+5,'27315','571','1','1','0','0','3700.85','-1115.15','121.53','5.17024','10','0','0','7984','0','0','0','0','0'),
(@guid+6,'27315','571','1','1','0','0','3698.46','-1152.04','123.142','6.08758','10','0','0','7984','0','0','0','0','0'),
(@guid+7,'27315','571','1','1','0','0','3733.41','-1178.25','121.465','2.67738','10','0','0','7984','0','0','0','0','0'),
(@guid+8,'27315','571','1','1','0','0','3713.66','-1202.5','122.166','0.933013','10','0','0','6986','0','0','0','0','0'),
(@guid+9,'27336','571','1','1','0','0','3816.06','-1134.11','121.044','2.22971','10','0','0','7984','0','0','0','0','0'),
(@guid+10,'27336','571','1','1','0','0','3734.17','-1141.39','121.504','3.88769','10','0','0','7984','0','0','0','0','0'),
(@guid+11,'27336','571','1','1','0','0','3724.56','-1034.6','122.087','0.750019','10','0','0','7984','0','0','0','0','0'),
(@guid+12,'27336','571','1','1','0','0','3673.76','-1189.86','120.404','3.18083','10','0','0','6986','0','0','0','0','0'),
(@guid+13,'27336','571','1','1','0','0','3705.97','-1232.91','117.041','3.55389','10','0','0','7984','0','0','0','0','0'),
(@guid+14,'27336','571','1','1','0','0','3759.81','-1199.03','125.803','3.06302','10','0','0','8982','0','0','0','0','0'),
(@guid+15,'27336','571','1','1','0','0','3684.62','-1166.84','122.325','0.804998','10','0','0','6986','0','0','0','0','0'),
(@guid+16,'27336','571','1','1','0','0','3809.41','-1097.37','118.928','5.09956','10','0','0','8982','0','0','0','0','0'),
(@guid+17,'27336','571','1','1','0','0','3836.97','-1046.16','120.61','3.79345','10','0','0','8982','0','0','0','0','0'),
(@guid+18,'27336','571','1','1','0','0','3859.38','-1019.01','123.016','3.29472','10','0','0','7984','0','0','0','0','0');

-- Quest: No Mercy for the Captured, http://old.wowhead.com/quest=12245
UPDATE `creature_template`SET `ScriptName` = 'npc_no_mercy_for_the_captured' WHERE `entry` IN (27376,27378,27379,27381);

-- Nagrand
-- Quest: The Ring of Blood: Brokentoe, http://old.wowhead.com/quest=9962
UPDATE `creature_template`SET `ScriptName` = 'npc_brokentoe' WHERE `entry` = '18398';

-- Zul'Drak
-- Quest: A tangled skein, http://old.wowhead.com/quest=12555
UPDATE creature_template SET ScriptName='npc_plague_sprayer' WHERE entry=28274;

-- Quests: Something for the Pain, http://old.wowhead.com/quest=12597
--                                 http://old.wowhead.com/quest=12564
--         Troll Patrol: Can You Dig It?, http://old.wowhead.com/quest=12588
--         Troll Patrol: High Standards, http://old.wowhead.com/quest=12502
UPDATE creature_template SET scriptname = 'npc_captain_brandon_zuldrak' WHERE entry = 28042;

-- Quest: Troll Patrol: The Alchemist's Apprentice, http://old.wowhead.com/quest=12541
UPDATE creature_template SET scriptname = 'npc_alchemist_finklestein' WHERE entry = 28205;

-- Quest: Argent Crusade, We Are Leaving!, http://old.wowhead.com/quest=12504
UPDATE creature_template SET scriptname = 'npc_argent_soldier_12504' WHERE entry = 28041;

-- Quests: Pa'Troll, http://old.wowhead.com/quest=12596
--         Throwing Down, http://old.wowhead.com/quest=12598
--         Cocooned!, http://old.wowhead.com/quest=12606
--         Creature Comforts, http://old.wowhead.com/quest=12599
--         Lab Work, http://old.wowhead.com/quest=12557
UPDATE creature_template SET scriptname = 'npc_commander_kunz' WHERE entry = 28039;

-- Quest: Gluttonous Lurkers, http://old.wowhead.com/quest=12527
SET @ENTRY :=28202;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,50926,0,1000,1000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zul''Drak Rat - Despawn on Spell Dummy');
SET @ENTRY :=28203;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,50918,0,1000,1000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gorged Lurking Basilisk - Despawn on Spell Dummy');
SET @ENTRY :=28145;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,17000,27000,11,54470,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Lurking Basilisk - Cast Venemous Bite'),
(@ENTRY,0,1,0,23,0,100,0,50894,5,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0, 'Lurking Basilisk - Start Script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lurking Basilisk - Gorged Lurking Basilisk'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,12,28203,1,30000,0,0,0,1,0,0,0,0,0,0,0, 'Lurking Basilisk - Gorged Lurking Basilisk'),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lurking Basilisk - Despawn');

-- [Hack] Quest: Leave No One Behind, http://old.wowhead.com/quest=12512
UPDATE `quest_template` SET `Flags` = 0 WHERE `Id` = 12512;

-- Icecrown
-- Quests: Sneak Preview, http://old.wowhead.com/quest=13351
--                        http://old.wowhead.com/quest=13315
SET @AT_SOUTH := 5284;
SET @AT_CENTRAL := 5285;
SET @AT_NORTH := 5286;
SET @AT_NORTHWEST := 5287;
SET @NPC_SOUTH := 32195;
SET @NPC_CENTRAL := 32196;
SET @NPC_NORTH := 32197;
SET @NPC_NORTHWEST := 32199;
UPDATE `areatrigger_scripts` SET `ScriptName`='SmartTrigger' WHERE `entry` IN (@AT_SOUTH,@AT_CENTRAL,@AT_NORTH,@AT_NORTHWEST);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@AT_SOUTH,@AT_CENTRAL,@AT_NORTH,@AT_NORTHWEST) AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@AT_SOUTH,2,0,0,46,0,100,0,@AT_SOUTH,0,0,0,33,@NPC_SOUTH,0,0,0,0,0,7,0,0,0,0,0,0,0,"Areatrigger South - On Trigger - Quest Credit"),
(@AT_CENTRAL,2,0,0,46,0,100,0,@AT_CENTRAL,0,0,0,33,@NPC_CENTRAL,0,0,0,0,0,7,0,0,0,0,0,0,0,"Areatrigger Central - On Trigger - Quest Credit"),
(@AT_NORTH,2,0,0,46,0,100,0,@AT_NORTH,0,0,0,33,@NPC_NORTH,0,0,0,0,0,7,0,0,0,0,0,0,0,"Areatrigger North - On Trigger - Quest Credit"),
(@AT_NORTHWEST,2,0,0,46,0,100,0,@AT_NORTHWEST,0,0,0,33,@NPC_NORTHWEST,0,0,0,0,0,7,0,0,0,0,0,0,0,"Areatrigger Northwest - On Trigger - Quest Credit");

-- Quests: I'm Not Dead Yet!, http://old.wowhead.com/quest=13221
--                            http://old.wowhead.com/quest=13229
DELETE FROM `creature_template` WHERE (`entry`=97002);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (97002, 0, 0, 0, 0, 0, 17519, 11686, 0, 0, 'q13221 q13229 trigger', '', '', 0, 80, 80, 0, 114, 114, 0, 1, 1.14286, 1, 0, 104, 138, 0, 252, 1, 2000, 0, 1, 33587968, 8, 0, 0, 0, 0, 0, 72, 106, 26, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 7, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 130, '', 12340);
DELETE FROM creature WHERE guid=3334446;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs) VALUES
(3334446,97002,571,1,1,7032.746094,3445.322998,696.076782,3.14159,100);
UPDATE creature_template SET AIName='', ScriptName='npc_father_kamaros' WHERE entry=31279;

-- Quests: Raise the Barricades, http://old.wowhead.com/quest=13306
--                               http://old.wowhead.com/quest=13332
DELETE FROM spell_script_names WHERE spell_id=59925;
INSERT INTO spell_script_names VALUES (59925,'spell_construct_barricade');

-- Quests: Breakfast Of Champions, http://old.wowhead.com/quest=14092
--                                 http://old.wowhead.com/quest=14076
UPDATE `creature_template` SET `lootid`=34920 WHERE `entry`=34920;
DELETE FROM `creature_loot_template` WHERE `entry`=34920 AND `item`=46889;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(34920,46889,-100,1,0,1,1);

-- Quest: If He Cannot Be Turned, http://old.wowhead.com/quest=12897
--                                http://old.wowhead.com/quest=12896
UPDATE `creature_template` SET faction_A = 2050, faction_H = 2050 WHERE `entry` in (29860,29859,29858);
UPDATE `creature_template` SET AIName='', `ScriptName`='npc_general_lightsbane' WHERE `entry` = 29851;
UPDATE `creature_template` SET `dmg_multiplier`=2 WHERE `entry` = 29851;

-- Quest: It's All Fun and Games, http://old.wowhead.com/quest=12892
--                                http://old.wowhead.com/quest=12887
DELETE FROM `smart_scripts` WHERE `entryorguid`=29747;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|268435456,`AIName`='',`InhabitType`=`InhabitType`|4,`ScriptName`='npc_the_ocular' WHERE `entry`=29747;
UPDATE `creature_model_info` SET `combat_reach`=100 WHERE `modelid`=26533;
DELETE FROM `creature_template_addon` WHERE `entry`=29747;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29747,0,0,0,0,0,'55162');
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|2|33554432 WHERE `entry`=29790;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=30740;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,30740,0,18,1,29747,0,63,'','Eyesore Blaster only target The Oculus');

-- Quest: Free Your Mind, http://old.wowhead.com/quest=12893
UPDATE `creature_template` SET ScriptName = 'npc_free_your_mind' WHERE `entry` IN (29769,29770,29840);

-- Quest: Shadow Vault Decree, http://old.wowhead.com/quest=12943
UPDATE item_template SET scriptname = 'shadow_vault_decree' WHERE entry = 41776;

-- Quest: The Battle For Crusaders' Pinnacle, http://old.wowhead.com/quest=13141
UPDATE item_template SET scriptname = 'blessed_banner' WHERE entry = 43243;

-- Quest: The Boon of A'dal, http://old.wowhead.com/quest=13082
SET @ENTRY := 18481;
SET @QUEST := 13082;
SET @SPELL_BLESSING := 35076;
SET @SPELL_TP_DALARAN := 53141;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `Id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,0,0,0,0,11,@SPELL_BLESSING,0,0,0,0,0,1,0,0,0,0,0,0,0,"A'dal - Out of Combat - Cast Blessing of A'dal"),
(@ENTRY,0,1,0,19,0,100,0,@QUEST,0,0,0,11,@SPELL_TP_DALARAN,0,0,0,0,0,7,0,0,0,0,0,0,0,"A'dal - On Quest Accept - Cast Teleport Dalaran");

-- Borean Tundra
-- Quest: Springing the Trap, http://old.wowhead.com/quest=11969
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1002038 AND -1002030;
INSERT INTO `script_texts` (entry, content_default, TYPE, emote) VALUES
(-1002030, 'Stay close to me, $N. I could not bear for any harm to come to you.', 0, 1),
(-1002031, 'MALYGOS!!', 1, 1),
(-1002032, 'Come, Lord of Magic, and recover your precious consort...', 1, 1),
(-1002033, '...what remains of her!', 1, 1),
(-1002034, 'Come, $N. Let us see the fruits of our efforts.', 0, 1),
(-1002035, 'Saragosa! What has become of you?', 1, 1),
(-1002036, 'Hurry, $N! Flee! Live to finish what we\'ve begun here....', 0, 1),
(-1002037, 'Keristrasza! You\'ve bested my consort... and now YOU shall take her place!', 1, 1),
(-1002038, 'Never!', 1, 1);
UPDATE `creature_template` SET `ScriptName` = 'npc_keristrasza_coldarra' WHERE `entry` = 26237;
UPDATE `creature_template` SET `ScriptName` = 'npc_signal_fire' WHERE `entry` = 33087;
UPDATE `creature_template` SET `InhabitType` = 5 WHERE `entry` IN (26237,26310);
UPDATE `creature_template` SET `flags_extra` = 128 WHERE `entry` = 33087;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 44550;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 62272;
INSERT INTO `conditions` VALUES
(13, 0, 62272, 0, 0, 18, 0, 1, 33087, 0, 0, 0, '', (NULL));
DELETE FROM `creature_template_addon` WHERE (`entry`=26299);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (26299, 0, 0, 7, 0, 65, '');
DELETE FROM `creature` WHERE `id`=33087;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(250050, 33087, 571, 1, 1, 0, 0, 4055.08, 7103.51, 169.522, 3.75432, 300, 0, 0, 42, 0, 0, 0, 0, 0);
DELETE FROM `gameobject` WHERE `id`=194151;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(177960, 194151, 571, 1, 1, 4055.08, 7103.51, 169.522, 3.75432, 0, 0, 0.953436, -0.301594, 300, 0, 1);

-- Howling Fjord
-- Quest: The Way to His Heart..., http://old.wowhead.com/quest=11472
UPDATE creature_template SET AIName='SmartAI' WHERE entry=24786;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=24786 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(24786, 0, 0, 1, 8, 0, 100, 0, 44454, 0, 0, 0, 11, 44456, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Reef Bull - On Spell Hit - Cast Spell'),
(24786, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Reef Bull - On Spell Hit - Despawn');
UPDATE creature_template SET ScriptName='npc_attracted_reef_bull' WHERE entry=24804;
DELETE FROM spell_script_names WHERE spell_id=21014;
INSERT INTO spell_script_names VALUES (21014, 'spell_anuniaqs_net');

-- Quests: Iron Rune Constructs and You: Rocket Jumping, http://old.wowhead.com/quest=11485
--         Iron Rune Constructs and You: Collecting Data, http://old.wowhead.com/quest=11489
--         Iron Rune Constructs and You: The Bluff, http://old.wowhead.com/quest=11491
UPDATE `creature_template` SET `minlevel` = 73, `maxlevel` = 73, `VehicleId` = 22, ScriptName = 'npc_iron_rune_construct' WHERE `entry` IN (24821, 24823, 24825);
UPDATE `creature_template` SET `spell1` = 44550 WHERE `entry` = 24821;
UPDATE `creature_template` SET `spell1` = 44498 WHERE `entry` = 24823;
UPDATE `creature_template` SET `spell1` = 44562 WHERE `entry` = 24825;
UPDATE `gameobject_template` SET `ScriptName` = 'go_iron_rune_construct_workbank' WHERE `entry` = 186958;
UPDATE `gameobject_template` SET `data0` = 1635 WHERE `entry` = 186958;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 44498;
INSERT INTO `spell_linked_spell` VALUES
(44498, 34873, 2, 'Rocket Jump -> Fly');
UPDATE `creature_template` SET `modelid1` = 17856, `unit_flags` = 33587200 WHERE `entry` = 24820;
UPDATE `quest_template` SET `RequiredSpellCast1` = 44550 WHERE `Id` = 11489;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 44550;
INSERT INTO `conditions` VALUES
(13, 0, 44550, 0, 0, 18, 0, 1, 24820, 0, 0, 0, '', (NULL));
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_lebronski' WHERE `entry` = 24718;

-- Quest: The Echo of Ymiron, http://old.wowhead.com/quest=11343
UPDATE `creature_template` SET `ScriptName` = 'npc_ancient_vrykul' WHERE `entry` = 24315;
UPDATE `creature_template` SET `ScriptName` = 'npc_lich_king_hfjord' WHERE `entry` = 24248;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 24327;
UPDATE `creature_template` SET `unit_flags` = 2 WHERE `entry` IN (24314, 24315, 24248, 24327);
DELETE FROM `creature_template_addon` WHERE (`entry`=24315);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (24315, 0, 0, 1, 0, 0, '');
DELETE FROM `smart_scripts` WHERE (`entryorguid`=24327 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(24327, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Valkyr - Passive'),
(24327, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Valkyr - Fly');
DELETE FROM `areatrigger_scripts` WHERE `entry` = 4778;
INSERT INTO `areatrigger_scripts` VALUES
(4778, 'at_ymiron_house');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1002026 AND -1002011;
INSERT INTO `script_texts` (entry, content_default, TYPE, emote) VALUES
(-1002011, 'So then we too are cursed?', 0, 1),
(-1002012, 'Ancient Male Vrykul points to the infant.', 2, 25),
(-1002013, 'Ancient Female Vrykul sobs.', 2, 18),
(-1002014, 'The gods have forsaken us! We must dispose of it before Ymiron is notified!', 0, 1),
(-1002015, 'NO! You cannot! I beg of you! It is our child!', 0, 1),
(-1002016, 'Then what are we to do, wife? The others cannot find out. Should they learn of this aberration, we will all be executed.', 0, 6),
(-1002017, 'I... I will hide it. I will hide it until I find it a home, far away from here...', 0, 1),
(-1002018, 'The Lich King turns to face you.', 2, 0),
(-1002019, 'The Lich King grins.', 2, 0),
(-1002020, 'Shamanism has brought you here... Its scent permeates the air. *The Lich King laughs* I was once a shaman.', 0, 1),
(-1002021, 'Shall we prepare it for you, my lord?', 0, 1),
(-1002022, 'No, minion. This one is not ready.', 0, 1),
(-1002023, 'Do you feel it, mortal? Death seeps through me, enveloping all that I touch. With just a snap of my finger your soul will languish in damnation for all eternity.', 0, 1),
(-1002024, 'But... It is not yet your time to serve the Lich King. Yes, a greater destiny awaits you. Power... You must become more powerful before you are to serve me.', 0, 1),
(-1002026, "Now watch, val\'kyr. Observe as I apply pressure. Can you see that it is not yet ripe? Watch as it pops and falls lifeless to the floor.", 0, 1);
SET @CreatureGUID := 202300;
DELETE FROM creature WHERE id IN(24314, 24315, 24248, 24327);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CreatureGUID+0, 24314, 571, 1, 2, 0, 0, 1070.78, -5029.16, 9.80087, 4.93592, 300, 0, 0, 5158, 0, 0, 0, 0, 0),
(@CreatureGUID+1, 24315, 571, 1, 2, 0, 0, 1073.62, -5032.9, 9.88443, 3.24653, 300, 0, 0, 5158, 0, 0, 0, 0, 0),
(@CreatureGUID+2, 24248, 571, 1, 2, 0, 0, 1061.16, -4915.53, 11.3146, 3.29914, 300, 0, 0, 27890000, 0, 0, 0, 0, 0),
(@CreatureGUID+3, 24327, 571, 1, 2, 0, 0, 1064.48, -4907.72, 17.2031, 3.56383, 300, 0, 0, 9610, 0, 0, 0, 0, 0),
(@CreatureGUID+4, 24327, 571, 1, 2, 0, 0, 1069, -4921.13, 17.2031, 3.41617, 300, 0, 0, 9610, 0, 0, 0, 0, 0);
SET @GUID_GO := 153200;
DELETE FROM `gameobject` WHERE `id`=186664;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GUID_GO, 186664, 571, 1, 2, 1071.62, -5033.12, 9.88719, 4.8566, 0, 0, 0.654328, -0.756211, 300, 0, 1);

-- Quest: Drop It then Rock It!, http://old.wowhead.com/quest=11429
UPDATE `creature_template` SET `ScriptName` = 'npc_banner_q11429' WHERE `entry` = 24640;

-- Quests: The Shining Light, http://old.wowhead.com/quest=11288
--         Guided by Honor, http://old.wowhead.com/quest=11289
UPDATE `quest_template` SET `SourceSpellId` = 43202 WHERE `Id` = 11288;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_decomposing_ghoul' WHERE `entry` = 24177;
UPDATE `creature_template` SET `ScriptName` = 'npc_irulon_trueblade' WHERE `entry` = 24191;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1002010 AND -1002000;
INSERT INTO `script_texts` (entry, content_default, TYPE, emote) VALUES
(-1002000, 'That will be enough Irulon.', 0, 1),
(-1002001, 'Cleric of the Crusade removes his disguise.', 2, 0),
(-1002002, "Lord Fordring, you mustn\'t reveal yourself!", 0, 1),
(-1002003, "The boy\'s death and, in fact, the deaths of all of the knights involved in the redemption of this blade could have been avoided.", 0, 1),
(-1002004, 'Their passing weighs heavily on my soul.', 0, 1),
(-1002005, 'The path of freedom has always been beset with tragedy, sire. We could not risk losing you. The Order could not have survived such a blow.', 0, 1),
(-1002006, 'Highlord Tirion Fordring grimaces.', 2, 0),
(-1002007, 'It should have been me that carried the blade. That burden was mine to bear.', 0, 1),
(-1002008, 'But you are right, Irulon. The price of our freedom will undoubtedly cost thousands more of their lives.', 0, 1),
(-1002009, 'Highlord Tirion Fordring picks up the Ashbringer.', 2, 0),
(-1002010, 'DO you hear me Arthas? The Silver Hand comes FOR you! Your kingdom shall crumble beneath the weight of justice! BY the Light!', 1, 15);

-- Grizzly Hills
-- Quests: Riding the Red Rocket, http://old.wowhead.com/quest=12432
--                                http://old.wowhead.com/quest=12437
UPDATE `creature_template` SET `npcflag` = '16777216', `speed_walk` = '6', `speed_run` = '6', `ScriptName` = 'npc_rocket_warhead' WHERE `entry` = 27593;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry = 27593 AND spell_id = 49177;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES ('27593','49177','1','0');

-- Quests: Shred the Alliance, http://old.wowhead.com/quest=12270
--         Shredder Repair,    http://old.wowhead.com/quest=12244
UPDATE `creature_template` SET `ScriptName` = 'npc_shredders_taker' WHERE `entry` IN (27371, 27423);
UPDATE `creature_template` SET `ScriptName` = 'npc_brokendown_shredders' WHERE `entry` = 27354;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry = 27354;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES ('27354','48533','1','0');

-- The Storm Peaks
-- Quest: Catching up with Brann, http://old.wowhead.com/quest=12920
DELETE FROM spell_script_names WHERE spell_id=61122;
INSERT INTO spell_script_names VALUES (61122,'spell_contact_brann');
UPDATE creature_template SET scriptname = 'npc_roxi_ramrocket' WHERE entry = 31247;

-- Quest: Going Bearback, http://old.wowhead.com/quest=12851
UPDATE creature_template SET scriptname = 'npc_quest_12851' WHERE entry IN (29358,29351);

-- Quest: Cold Hearted, http://old.wowhead.com/quest=12856
UPDATE creature_template SET scriptname = 'npc_freed_protodrake' WHERE entry = 29709;

-- Quest: Forging a Head, http://old.wowhead.com/quest=12985
UPDATE creature_template SET scriptname = 'npc_dead_irongiant' WHERE entry = 30163;

-- Quest: A Delicate Touch, http://old.wowhead.com/quest=12820
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 29475;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 29475;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_flags`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`comment`) VALUES
(29475,0,0,0,9,1,1,5,11,54537,'Quest: 12820');
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_flags`,`event_param4`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(29475,0,1,0,5,1,29619,33,29618,23,'Quest: 12820');

-- Quests: Norgannon's Shell http://old.wowhead.com/quest=12872
--                           http://old.wowhead.com/quest=12928
SET @NPC_ARCHIVIST_MECHATON := 29775;
SET @SPELL_CHARGED_DISK     := 55197;
DELETE FROM `creature_text` WHERE `entry`=@NPC_ARCHIVIST_MECHATON;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_ARCHIVIST_MECHATON,1,0,'Use of the Inventor\'s Disk detected. Emergency protocol gamma activated.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,2,0,'Verifying status of Norgannon\'s shell.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,3,0,'Norgannon\'s shell accounted for and secure. It will be available for transfer once user\'s identity has been verified.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,4,0,'Standby to verify identity as Keeper Mimir.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,5,0,'%s stuns you as he scans your identity.',16,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,6,0,'Identity verification failed. User is not Keeper Mimir.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,7,0,'The Inventor\'s Disk has fallen into the hands of an unauthorized user. Activating defense protocol.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,8,0,'Impostor must be dealt with. The Inventor\'s Disk must be recovered.',12,0,100,1,0,0,'Archivist Mechaton');
DELETE FROM `creature` WHERE `id`=@NPC_ARCHIVIST_MECHATON;
DELETE FROM `gameobject` WHERE `id` IN (191762,191763);
UPDATE `creature_template` SET `unit_flags`=512|2,`lootid`=`entry`,`AIName`='',`ScriptName`='npc_archivist_mechaton' WHERE `entry`=@NPC_ARCHIVIST_MECHATON;
DELETE FROM `creature_loot_template` WHERE `item`=41258;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
(@NPC_ARCHIVIST_MECHATON,41258,-100,1,0,1,1); -- Norgannon's Shell
DELETE FROM `event_scripts` WHERE `id`=19410;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(19410,0,10,@NPC_ARCHIVIST_MECHATON,300000,0,7991.799805,-827.638977,968.159973,0);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@SPELL_CHARGED_DISK;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,@SPELL_CHARGED_DISK,0,23,4485,0,0,0,'','Spell: Charged Disk only cast if at Area: Inventors Library'),
(17,0,@SPELL_CHARGED_DISK,1,9,12872,0,0,0,'','Spell: Charged Disk cast only if took Quest'),
(17,0,@SPELL_CHARGED_DISK,1,9,12928,0,0,0,'','Spell: Charged Disk cast only if took Quest');

-- Quest: Maintaining Discipline, http://old.wowhead.com/quest=13422
SET @ENTRY := 30146;
SET @SPELL_DESPERATE_BLOW := 57395;
SET @SPELL_DISCIPLINING_ROD := 42837;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100+0,@ENTRY*100+1);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - Out of Combat - Set Bytes1 Sit"), -- Not doing this in creature_addon(_template) so that we can cancel this in SAI
(@ENTRY,0,1,2,8,0,100,0,@SPELL_DISCIPLINING_ROD,0,0,0,87,@ENTRY*100+0,@ENTRY*100+1,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - On Spellhit - Run Random Script"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - On Spellhit - Set Phase 1"), -- To prevent the same one to give more credits
(@ENTRY*100+0,9,0,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Attack Player"),
(@ENTRY*100+0,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Say Line 0 (random)"),
(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Say Line 1 (random)"),
(@ENTRY*100+1,9,1,0,0,0,100,0,0,0,0,0,91,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Stand Up"),
(@ENTRY*100+1,9,2,0,0,0,100,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Emote Work"),
(@ENTRY*100+1,9,3,0,0,0,100,0,0,0,0,0,33,29886,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exhausted Vrykul - On Script - Kill Credit"),
(@ENTRY,0,3,0,2,0,100,1,0,15,0,0,11,@SPELL_DESPERATE_BLOW,0,0,0,0,0,2,0,0,0,0,0,0,0,"Exhausted Vrykul - At 15% HP - Cast Desperate Blow");
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Curse you! You will not treat me like a beast!",12,0,100,1,0,0,"Exhausted Vrykul"),
(@ENTRY,0,1,"Enough! I will teach you some manners, wench!",12,0,100,1,0,0,"Exhausted Vrykul"),
(@ENTRY,0,2,"I'd rather die fighting than live like a slave!",12,0,100,1,0,0,"Exhausted Vrykul"),
(@ENTRY,1,0,"Back... to work...",12,0,100,1,0,0,"Exhausted Vrykul"),
(@ENTRY,1,1,"We will have revenge... some day.",12,0,100,1,0,0,"Exhausted Vrykul"),
(@ENTRY,1,2,"You treat us worse than animals!",12,0,100,1,0,0,"Exhausted Vrykul");
DELETE FROM `creature_template_addon` WHERE `entry`=29427;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (29427,0,0,1,233,NULL);

-- Quest: The Heart of the Storm, http://old.wowhead.com/quest=12998
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=192181;
UPDATE `creature_template` SET `AIName`='SmartAI', `faction_H`=1954, `faction_A`=1954, `unit_flags`=768, `equipment_id`=749, `flags_extra`=2 WHERE `entry`=30299;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (30299,3029900,192181,19218100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(30299,0,0,0,25,0,100,0,0,0,0,0,80,3029900,0,2,0,0,0,1,0,0,0,0,0,0,0, 'On summon Overseer Narvir start script'),
(3029900,9,0,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Set react passive'),
(3029900,9,1,0,0,0,100,0,500,500,0,0,69,0,0,0,0,0,0,8,0,0,0,7313.045,-726.853,791.610,0, 'Walk to the Heart of the Storm'),
(3029900,9,2,0,0,0,100,0,6500,6500,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.437, 'Set orientation'),
(3029900,9,3,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir say text 0'),
(3029900,9,4,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir say text 1'),
(3029900,9,5,0,0,0,100,0,6000,6000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.334, 'Set orientation'),
(3029900,9,6,0,0,0,100,0,500,500,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Loot the heart'),
(3029900,9,7,0,0,0,100,0,5000,5000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Stop looting'),
(3029900,9,8,0,0,0,100,0,1500,1500,0,0,5,463,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Disappear emote'),
(3029900,9,9,0,0,0,100,0,500,500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Despawn'),
(192181,1,0,0,64,0,100,0x01,0,0,0,0,80,19218100,0,2,0,0,0,1,0,0,0,0,0,0,0, 'On use start script'),
(19218100,9,0,0,0,0,100,0,1000,1000,0,0,12,30299,1,60000,0,0,0,8,0,0,0,7312.130,-710.919,791.610,4.643, 'Summon Overseer Narvir'),
(19218100,9,1,0,0,0,100,0,0,0,0,0,75,56485,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Cyclone the invoker'),
(19218100,9,2,0,0,0,100,0,27000,27000,0,0,33,30299,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Give quest credit');
DELETE FROM `creature_text` WHERE `entry`=30299;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(30299,0,0,'You did not think that I was going to let you walk in here and take the Heart of the Storm, did you?',0,0,100,6,0,0,'Narvir text 0'),
(30299,1,0,'You may have killed Valduran, but that will not stop me from completing the colossus.',0,0,100,274,0,0,'Narvir text 1');

-- Sholazar Basin
-- Quest: The Angry Gorlok, http://old.wowhead.com/quest=12578
UPDATE creature_template SET ScriptName='npc_moodle' WHERE entry=28122;

-- Quest: A Cleansing Song, http://old.wowhead.com/quest=12735
DELETE FROM spell_script_names WHERE spell_id=52941;
INSERT INTO spell_script_names VALUES (52941,'spell_song_of_cleansing');

-- Quest: Rejek: First Blood, http://old.wowhead.com/quest=12734
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_rejek_first_blood' WHERE `entry` IN (28086,28096,28110,28109);
UPDATE `quest_template` SET `RequiredSpellCast1`=0,`RequiredSpellCast2`=0,`RequiredSpellCast3`=0 WHERE `Id`=12734;

-- Quest: A Hero's Headgear, http://old.wowhead.com/quest=12758
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_stormwatcher' WHERE `entry`=28877;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-10 WHERE `item`=39651;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=39651;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,0,39651,0,24,2,28877,0,0,'','Venture Co. Explosives only target dead Stormwatcher');

-- Quest: Song of Wind and Water, http://old.wowhead.com/quest=12726
SET @HAIPHOON_W :=28999;
SET @HAIPHOON_A :=28985;
SET @STORM :=28858;
SET @AQUEOUS :=28862;
SET @SPELL_W_1 :=61375;
SET @SPELL_W_2 :=61376;
SET @SPELL_W_3 :=52862;
SET @SPELL_W_4 :=52869;
SET @SPELL_A_1 :=71934;
SET @SPELL_A_2 :=52870;
SET @SPELL_A_3 :=52864;
UPDATE `creature_template` SET `spell1`=@SPELL_W_1, `spell2`=@SPELL_W_2, `spell3`=@SPELL_W_3, `spell4`=@SPELL_W_4, `npcflag`=`npcflag`|16777216, `unit_flags`=`unit_flags`|16777216,
`type_flags`=`type_flags`|2048, `VehicleId`=257, `AIName`='', `exp`=2, `minlevel`=80, `maxlevel`=80, `mindmg`=417, `maxdmg`=582, `attackpower`=608, `minrangedmg`=341, `maxrangedmg`=506, `rangedattackpower`=80, `ScriptName`='vehicle_haiphoon' WHERE `entry`=@HAIPHOON_W;
UPDATE `creature_template` SET `spell1`=@SPELL_A_1, `spell2`=@SPELL_A_2, `spell3`=@SPELL_A_3, `npcflag`=`npcflag`|16777216, `unit_flags`=`unit_flags`|16777216, `type_flags`=`type_flags`|2048,
`VehicleId`=257, `AIName`='', `exp`=2, `minlevel`=80, `maxlevel`=80, `mindmg`=417, `maxdmg`=582, `attackpower`=608, `minrangedmg`=341, `maxrangedmg`=506, `rangedattackpower`=80, `ScriptName`='vehicle_haiphoon'
WHERE `entry`=@HAIPHOON_A;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (@HAIPHOON_W,@HAIPHOON_A);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(@HAIPHOON_W,46598,1,0),
(@HAIPHOON_A,46598,1,0);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (@SPELL_W_3,@SPELL_A_3);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=16 AND `SourceEntry` IN (@HAIPHOON_W,@HAIPHOON_A);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(16,0,@HAIPHOON_W,0,23,4392,0,0,0,'','Ride Vehicle only in Area'),
(16,0,@HAIPHOON_A,0,23,4392,0,0,0,'','Ride Vehicle only in Area');
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry` IN (@STORM,@AQUEOUS);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@STORM,@AQUEOUS);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@STORM,0,0,0,0,0,100,0,2000,4000,5000,7000,11,32018,1,0,0,0,0,2,0,0,0,0,0,0,0,'Storm Revenant - IC - Cast Call Lightning'),
(@AQUEOUS,0,0,0,0,0,100,0,6000,9000,7000,10000,11,55087,1,0,0,0,0,2,0,0,0,0,0,0,0,'Aqueous Spirit - IC - Cast Typhoon');

-- Quest: Reclamation, http://old.wowhead.com/quest=12546
UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216,`unit_flags`=`unit_flags`|16777216,`spell1`=50978,`spell2`=50980,`spell3`=50985,`spell4`=50983,`spell5`=54166,`VehicleId`=111,`Health_mod`=18,`Mana_mod`=12,`questItem1`=0,`AIName`='',`ScriptName`='' WHERE `entry`=28222;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=28222;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(28222,52082,1,0);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=16 AND `SourceEntry`=28222;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(16,0,28222,0,23,4282,0,0,0,'','Ride vehicle only in Area');

-- Quests: Making Peace, http://old.wowhead.com/quest=12573
--         The Lost Mistwhisper Treasure, http://old.wowhead.com/quest=12575
DELETE FROM `creature_template_addon` WHERE (`entry`=28105);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (28105, 0, 28044, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE (`entry`=190577);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES (190577, 6, 0, 'Mistwhisper Treasure', '', '', '', 35, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'go_mistwhisper_treasure', 11723);
DELETE FROM `gameobject` WHERE `id`=190577;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(1098451, 190577, 571, 1, 1, 6713.84, 5124.42, -18.9935, 2.04098, 0, 0, 0.852363, 0.52295, 300, 0, 1);

-- Quest: The Mosswalker Savior, http://old.wowhead.com/quest=12580 
SET @ENTRY  := 28113;
SET @GOSSIP := 9728;
SET @QUEST  := 12580;
UPDATE `creature_template` SET `unit_flags` = 262912,`AIName` = 'SmartAI' WHERE `entry` = @ENTRY;
UPDATE `creature` SET `MovementType` = 0 WHERE `id` = @ENTRY;
DELETE FROM `creature_template_addon` WHERE (`entry`=@ENTRY);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@ENTRY,0,0,0,0,0,'58806 0 58806 1');
DELETE FROM `gossip_menu_option` WHERE `menu_id` = @GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(@GOSSIP,'<Check for the pulse...>',1,1);
DELETE FROM `creature_text` WHERE `entry` = @ENTRY;
INSERT INTO `creature_text` VALUES
(@ENTRY,2,0,'I do something bad? I sorry....',12,0,100,0,0,0,"Mosswalker Victim - Say Fail 1"),
(@ENTRY,2,1,'Use my shinies...make weather good again...make undead things go away.',12,0,100,0,0,0,"Mosswalker Victim - Say Fail 2"),
(@ENTRY,2,2,'We gave shinies to shrine... we not greedy... why this happen?',12,0,100,0,0,0,"Mosswalker Victim - Say Fail 3"),
(@ENTRY,2,3,'Thank...you.',12,0,100,0,0,0,"Mosswalker Victim - Say Fail 4"),
(@ENTRY,2,4,'We not do anything... to them... I no understand.',12,0,100,0,0,0,"Mosswalker Victim - Say Fail 5"),
(@ENTRY,1,0,'Thank you! You good!',12,0,100,0,0,0,"Mosswalker Victim - Say Save 1"),
(@ENTRY,1,1,'Maybe you make weather better too?',12,0,100,0,0,0,"Mosswalker Victim - Say Save 2"),
(@ENTRY,1,2,'Help more mosswalkers,okay?',12,0,100,0,0,0,"Mosswalker Victim - Say Save 1"),
(@ENTRY,1,3,'You save us! Yay for you!',12,0,100,0,0,0,"Mosswalker Victim - Say Save 1");
DELETE FROM `smart_scripts` WHERE (`entryorguid` IN (@ENTRY*100,@ENTRY*100+1) AND `source_type`=9);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@ENTRY AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,1,62,0,100,1,@GOSSIP,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosswalker Victim - Remove gossip"),
(@ENTRY,0,1,2,61,0,100,1,0,0,0,0,87,@ENTRY*100+0,@ENTRY*100+0,@ENTRY*100+0,@ENTRY*100+1,@ENTRY*100+1,0,1,0,0,0,0,0,0,0,"Mosswalker Victim - Randomize save chance(40%)"),
(@ENTRY,0,2,0,61,0,100,1,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosswalker Victim - Set timed despawn"),
(@ENTRY*100+0,9,0,0,0,0,100,1,750,750,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosswalker Victim - Save FAIL - Say"),
(@ENTRY*100+1,9,0,0,0,0,100,1,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosswalker Victim - Save OK - Say"),
(@ENTRY*100+1,9,1,0,0,0,100,1,0,0,0,0,33,28644,0,0,0,0,0,7,0,0,0,0,0,0,0,"Mosswalker Victim - Save OK - KillCredit"),
(@ENTRY*100+1,9,2,0,0,0,100,1,0,0,0,0,28,58806,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosswalker Victim - Save OK - Remove feing death state");
DELETE FROM `conditions` WHERE (SourceTypeOrReferenceId = 15 AND SourceGroup = @GOSSIP);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,0,0,9,@QUEST,0,0,0,'',"Mosswalker victim - Show only pulse option if player has quest The Mosswalker Savior");

-- Quest: Kick, What Kick?, http://old.wowhead.com/quest=12589
UPDATE `creature_template` SET AIName='SmartAI' WHERE entry=28054;
DELETE FROM `smart_scripts` WHERE entryorguid='28054';
INSERT INTO `smart_scripts` VALUES
(28054,0,0,0,8,0,25,0,51330,0,0,0,33,28053,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Lucky Wilhelm - On Spell Hit - Kil Credit');

-- Ulduar
-- Quests: Algalon, http://old.wowhead.com/quest=13614
--         Heroic Algalon, http://old.wowhead.com/quest=13818
--         Val'anyr, Hammer of Ancient Kings, http://old.wowhead.com/quest=13629
--         Archivum Data Disc, http://old.wowhead.com/quest=13604
--         Heroic: Archivum Data Disc, http://old.wowhead.com/quest=13817
--         Ancient History, http://old.wowhead.com/quest=13622
DELETE FROM `gossip_menu` WHERE `entry` = 10368; 
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10368;  
DELETE FROM conditions WHERE SourceGroup = 10368;

-- Dalaran
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 31885;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 31886;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 31557;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 32419;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 32420;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 32253;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 32415;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 32412;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 32251;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 32252;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 35507;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 31580;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 31579;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 35494;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 37942;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 33964;

-- Quests: A Suitable Disguise, http://old.wowhead.com/quest=20438
--                              http://old.wowhead.com/quest=24556
SET @ENTRY := 36856;
SET @SOURCETYPE := 0;
SET @GOSSIP := 10854;
SET @MENUID := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,2,62,0,100,0,@GOSSIP,@MENUID,0,0,50,201384,60,0,0,0,0,8,0,0,0,5802.22,691.556,657.949,3.50801,"Arcanum Core - Script for quest http://wowhead.com/quest=24556"),
(@ENTRY,@SOURCETYPE,1,2,62,0,100,0,@GOSSIP,@MENUID+1,0,0,50,201384,60,0,0,0,0,8,0,0,0,5802.22,691.556,657.949,3.50801,"Arcanum Core - Script for quest http://wowhead.com/quest=20438"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"On gossip option select - Close gossip");

-- Some sciptnamest etc
UPDATE creature_template SET scriptname = 'npc_lake_frog' WHERE entry IN (33211,33224);
UPDATE creature_template SET scriptname = 'npc_vendor_tournament_fraction_champion' WHERE entry IN (33657,33650,33653,33307,33310,33553,33554,33557,33556,33555);
UPDATE creature_template SET scriptname = 'npc_faction_valiant_champion' WHERE entry IN (33559,33562,33558,33564,33306,33285,33382,33561,33383,33384);
UPDATE creature_template SET scriptname = 'npc_faction_valiant_champion' WHERE entry IN (33738,33739,33740,33743,33744,33745,33746,33747,33748,33749);
DELETE FROM `event_scripts` WHERE `id`=20990;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(20990,1,10,33273,60000,0,4602.782715,-1600.874146,158,1.387292);
UPDATE creature_template SET scriptname = 'npc_maiden_of_drakmar' WHERE entry = 33273;
UPDATE creature_template SET scriptname = 'npc_squire_danny' WHERE entry = 33518;
UPDATE creature_template SET scriptname = 'npc_argent_champion' WHERE entry = 33707;
UPDATE creature_template SET scriptname = 'npc_argent_squire_gruntling', `npcflag` = `npcflag`| 1 WHERE entry in (33238,33239);
UPDATE creature_template SET scriptname = 'npc_the_black_knight' WHERE entry = 33785;
UPDATE creature_template SET scriptname = 'npc_squire_calvin' WHERE entry = 33522;
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=34852;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=34852;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34852,0,0,1,8,0,100,0,66390,0,3000,3000,33,34852,0,0,0,0,0,7,0,0,0,0,0,0,0,'Slain Tualiq Villager - On Read Last Rites Hit - Give Kill Credit'),
(34852,0,1,0,61,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Slain Tualiq Villager - On Read Last Rites Hit - Despawn after 3 secs');

-- The Sunreavers * The Silver Covenant Quests
DELETE FROM pool_template WHERE entry IN (34880,34771);
INSERT INTO pool_template VALUES
(34880,1,'Tournament - Champion - The Silver Covenant - Sea'),
(34771,1,'Tournament - Champion - The Sunreavers - Sea');

UPDATE quest_template SET ExclusiveGroup = 14074 WHERE Id in (14074,14152,14077,14080);
UPDATE quest_template SET ExclusiveGroup = 14143 WHERE Id in (14143,14136,14144,14140);
UPDATE quest_template SET ExclusiveGroup = 0 WHERE Id in (14142,14096); -- Kul Quest enable everyday
-- Fix for Kul Quest - Not Closing Cages
UPDATE `gameobject_template` SET `data2`=30000 WHERE `entry` = 195310;
UPDATE gameobject SET state = 1 WHERE id = 195310;

DELETE FROM pool_quest WHERE pool_entry IN (34880,34771);
INSERT INTO pool_quest VALUES
(14074,34880,'Tournament - Champion - The Silver Covenant - Sea - A Leg Up'),
(14152,34880,'Tournament - Champion - The Silver Covenant - Sea - Rescue At Sea'),
(14077,34880,'Tournament - Champion - The Silver Covenant - Sea - The Lights Mercy'),
(14080,34880,'Tournament - Champion - The Silver Covenant - Sea - Stop the Aggression'),
(14143,34771,'Tournament - Champion - The Sunreavers - Sea - A Leg Up'),
(14136,34771,'Tournament - Champion - The Sunreavers - Sea - Rescue At Sea'),
(14144,34771,'Tournament - Champion - The Sunreavers - Sea - The Lights Mercy'),
(14140,34771,'Tournament - Champion - The Sunreavers - Sea - Stop the Aggression');

DELETE FROM pool_template WHERE entry IN (34912,34914);
INSERT INTO pool_template VALUES
(34912,1,'Tournament - Champion - The Silver Covenant - Tournament'),
(34914,1,'Tournament - Champion - The Sunreavers - Tournament');

UPDATE quest_template SET ExclusiveGroup = 14092 WHERE Id in (14092,14141,14145);
UPDATE quest_template SET ExclusiveGroup = 14076 WHERE Id in (14076,14090,14112);
DELETE FROM pool_quest WHERE pool_entry IN (34912,34914);
INSERT INTO pool_quest VALUES
(14092,34912,'Tournament - Champion - The Silver Covenant - Tournament - Breakfast Of Champions'),
(14141,34912,'Tournament - Champion - The Silver Covenant - Tournament - Gormok Wants His Snobolds'),
(14145,34912,'Tournament - Champion - The Silver Covenant - Tournament - What Do You Feed a Yeti, Anyway?'),
(14076,34914,'Tournament - Champion - The Sunreavers - Tournament - Breakfast Of Champions'),
(14090,34914,'Tournament - Champion - The Sunreavers - Tournament - Gormok Wants His Snobolds'),
(14112,34914,'Tournament - Champion - The Sunreavers - Tournament - What Do You Feed a Yeti, Anyway?');

DELETE FROM pool_template WHERE entry IN (34882);
INSERT INTO pool_template VALUES
(34882,1,'Tournament - Champion - The Argent Crusade - Defeat');

DELETE FROM pool_template WHERE entry IN (35094);
INSERT INTO pool_template VALUES
(35094,1,'Tournament - Champion - The Argent Crusade - Kraken');

UPDATE quest_template SET ExclusiveGroup = 14107 WHERE Id in (14107,14108);
DELETE FROM pool_quest WHERE pool_entry IN (35094);
INSERT INTO pool_quest VALUES
(14107,35094,'Tournament - Champion - The Argent Crusade - Kraken - The Fate Of The Fallen'),
(14108,35094,'Tournament - Champion - The Argent Crusade - Kraken - Get Kraken!');

-- Valiant Spellaura on Vehicle Quest: The Grand Melee
DELETE FROM spell_linked_spell WHERE spell_trigger IN (63151,-63151);
INSERT INTO spell_linked_spell VALUES
(63151,63405,0,'Darnassus Valiant'),
(63151,63422,0,'Exodar Valiant'),
(63151,63395,0,'Gnomeregan Valiant'),
(63151,63426,0,'Ironforge Valiant'),
(63151,63432,0,'Orgrimmar Valiant'),
(63151,63398,0,'SenJin Valiant'),
(63151,63402,0,'Silvermoon Valiant'),
(63151,62596,0,'Stormwind Valiant'),
(63151,63435,0,'Thunder Bluff Valiant'),
(63151,63429,0,'Undercity Valiant'),
(-63151,-63405,0,'Darnassus Valiant remove'),
(-63151,-63422,0,'Exodar Valiant remove'),
(-63151,-63395,0,'Gnomeregan Valiant remove'),
(-63151,-63426,0,'Ironforge Valiant remove'),
(-63151,-63432,0,'Orgrimmar Valiant remove'),
(-63151,-63398,0,'SenJin Valiant remove'),
(-63151,-63402,0,'Silvermoon Valiant remove'),
(-63151,-62596,0,'Stormwind Valiant remove'),
(-63151,-63435,0,'Thunder Bluff Valiant remove'),
(-63151,-63429,0,'Undercity Valiant remove');

DELETE FROM conditions WHERE SourceEntry IN (63405,63422,63395,63426,63432,63398,63402,62596,63435,63429);
INSERT INTO conditions VALUES
(17,0,63405,0,0,9,0,13761,0,0,0,0,'','Darnassus Valiant'),
(17,0,63422,0,0,9,0,13756,0,0,0,0,'','Exodar Valiant'),
(17,0,63395,0,0,9,0,13750,0,0,0,0,'','Gnomeregan Valiant'),
(17,0,63426,0,0,9,0,13745,0,0,0,0,'','Ironforge Valiant'),
(17,0,63432,0,0,9,0,13767,0,0,0,0,'','Orgrimmar Valiant'),
(17,0,63398,0,0,9,0,13772,0,0,0,0,'','SenJin Valiant'),
(17,0,63402,0,0,9,0,13787,0,0,0,0,'','Silvermoon Valiant'),
(17,0,62596,0,0,9,0,13665,0,0,0,0,'','Stormwind Valiant'),
(17,0,63435,0,0,9,0,13777,0,0,0,0,'','Thunder Bluff Valiant'),
(17,0,63429,0,0,9,0,13782,0,0,0,0,'','Undercity Valiant');

-- Questfix
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=33498;
 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33498;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33498,0,0,0,23,0,100,0,63124,1,0,0,81,16777216,0,0,0,0,0,1,0,0,0,0,0,0,0,'Maloric - on Aura: Incapacitate Maloric - set npcflag: Spellklick'),
(33498,0,1,0,23,0,100,0,63124,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Maloric - on NoAura: Incapacitate Maloric - set npcflag: none');
 
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=33498;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(33498,63126,2,0);
 
UPDATE `creature_template` SET `lootid`=`entry` WHERE `entry`=33499;
 
DELETE FROM `creature_loot_template` WHERE `entry`=33499;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(33499,45080,-100,0,0,1,1);

-- The Black Knight's Fall only avalable as Champion
DELETE FROM conditions WHERE SourceTypeOrReferenceId IN (19,20) AND SourceEntry = 13664;
INSERT INTO conditions
VALUES
(19,0,13664,0,0,-2782,0,0,0,0,0,0,"","The Black Knight's Fall - Daily needs Champion"),
(20,0,13664,0,0,-2782,0,0,0,0,0,0,"","The Black Knight's Fall - Daily needs Champion"),
(19,0,13664,0,1,-2788,0,0,0,0,0,0,"","The Black Knight's Fall - Daily needs Champion"),
(20,0,13664,0,1,-2788,0,0,0,0,0,0,"","The Black Knight's Fall - Daily needs Champion");

-- Mount for Argent Champion
DELETE FROM `creature_template_addon` WHERE `entry` IN (33707);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(33707,0,28919,0,0,0,''); -- Argent Champion - Mount

-- The Scourgebane - DK only
UPDATE quest_template SET RequiredClasses = 32 WHERE Id = 13795;
-- Eradic the Pure - DK forbitten
UPDATE quest_template SET RequiredClasses = 1503 WHERE Id = 13794;

-- Spell: Trample Scourge
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 13 AND SourceEntry = 63001;
INSERT INTO conditions VALUES
(13,0,63001,0,0,18,0,1,33438,0,0,0,'','');

-- Get Kraken!
DELETE FROM spell_script_names WHERE spell_id IN (66588);
INSERT INTO spell_script_names (spell_id,Scriptname)
VALUES (66588,'spell_flaming_spear_targeting');

-- The Skybreaker ... Prequest Crusader Pinacle
UPDATE quest_template SET PrevQuestId = 13157, NextQuestId = 0, ExclusiveGroup = 13225, NextQuestIdChain = 0 WHERE Id = 13225;
-- Expoiting a Openinig ... Prev: The Skybreaker AND The Shadow Vault - Next in Chain: Securing the Perimeter
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13225;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13387 WHERE Id = 13386;
DELETE FROM conditions WHERE SourceEntry = 13386 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13386,0,0,8,0,12898,0,0,0,0,'',''),
(19,0,13386,0,0,8,0,12898,0,0,0,0,'',''),
(20,0,13386,0,0,8,0,13225,0,0,0,0,'',''),
(19,0,13386,0,0,8,0,13225,0,0,0,0,'','');

-- Blood of the Choosen ... Prev: The Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13336;
-- Joining the Assault ... Prev: The Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13341;
-- -- Assault by ... Prev: Joining the Assault
UPDATE quest_template SET PrevQuestId = 13341, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13309;
UPDATE quest_template SET PrevQuestId = 13341, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13284;

-- Mind Tricks ... Prev: Skybreaker OR Orgrims Hammer
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13308;
DELETE FROM conditions WHERE SourceEntry = 13308 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13308,0,0,8,0,13225,0,0,0,0,'',''),
(19,0,13308,0,0,8,0,13225,0,0,0,0,'',''),
(20,0,13308,0,1,8,0,13224,0,0,0,0,'',''),
(19,0,13308,0,1,8,0,13224,0,0,0,0,'','');
-- Slaves to Saronite ... Prev: Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13300;
-- Get to Ymirheim! ... Prev: Skybreaker ... NextChain: King of the Mountain
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13280 WHERE Id = 13296;
-- -- King of the Mountain ... Prev Get to Ymirheim
UPDATE quest_template SET PrevQuestId = 13296, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13280;

-- The Broken Front ... Prev: Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13231;
-- -- Finish Me ... Prev: Skybreaker
UPDATE quest_template SET PrevQuestId = 13225, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13232;
-- No Mercy ... Prev: The Broken Front
UPDATE quest_template SET PrevQuestId = 13231, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13233;

-- Your Attention, Please ... Prev: The Broken Front ... Next in Chain: Borrowed Technology
UPDATE quest_template SET PrevQuestId = 13231, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13291 WHERE Id = 13290;
-- -- Borrowed Technology
UPDATE quest_template SET PrevQuestId = 13290, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13291;
-- -- -- The Solution Solution Prev: Borrowed Technology
UPDATE quest_template SET PrevQuestId = 13291, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13292;
-- -- Killohertz ... Prev: Borrowed Technology ... NextinChain: Leading the Charge
UPDATE quest_template SET PrevQuestId = 13291, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13380 WHERE Id = 13383;
-- -- -- Leading the Charge
UPDATE quest_template SET PrevQuestId = 13383, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13380;
-- -- -- -- Static Shock Troops: the Bombardment Prev: Leading the Charge
UPDATE quest_template SET PrevQuestId = 13380, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13404;
-- -- -- -- Putting the Hertz: The Valley of Lost Hope Prev: Leading the Charge
UPDATE quest_template SET PrevQuestId = 13380, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13382;

-- ...All the Help We Can Get. ... Prev: The Broken Front ... NextInChain: Poke and Prod
UPDATE quest_template SET PrevQuestId = 13231, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13287 WHERE Id = 13286;
-- Poke and Prod ... Prev: ...All the Help We Can Get.
UPDATE quest_template SET PrevQuestId = 13286, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13287;

-- Against the Giants ... Prev: Poke and Prod ... Next in Chain: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13287, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13295 WHERE Id = 13294;
-- Coprous the Defiled ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13294, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13298;
-- Basic Chemistry ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13294, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13295;
-- -- Neutralizing the Plague ... Prev: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13295, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13297;

-- That's Abominable! ... Prev: Poke and Prod 
UPDATE quest_template SET PrevQuestId = 13287, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13288;
-- -- That's Abominable! Daily ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13288, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13289;

-- Sneak Preview ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13288, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13315;
-- Chain of Command ... Prev: Sneak Preview
UPDATE quest_template SET PrevQuestId = 13315, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13319;
-- Cannot Reproduce ... Prev: Sneak Preview ... Next In Chain: Retest Now
UPDATE quest_template SET PrevQuestId = 13315, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13321 WHERE Id = 13320;
-- -- Retest Now ... Prev: Cannot Reproduce
UPDATE quest_template SET PrevQuestId = 13320, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13321;
-- -- Retest Now Daily ... Prev: Retest Now
UPDATE quest_template SET PrevQuestId = 13321, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13322;

-- Drag and Drop ... Prev: Sneak Preview  
UPDATE quest_template SET PrevQuestId = 13315, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13318;
-- -- Drag and Drop Daily ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13318, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13323;
-- -- Not a Bug ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13318, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13342;
-- -- -- Not a Bug Daily ... Prev: Not a Bug
UPDATE quest_template SET PrevQuestId = 13342, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13344;

-- Need more Info ... Prev: Drag and Drop ... Next in Chain: No Rest For The Wicked
UPDATE quest_template SET PrevQuestId = 13318, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13346 WHERE Id = 13345;
-- No Rest For the Wicked ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13345, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13346;
-- -- No Rest For the Wicked Daily ... Prev: No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 13346, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13350;
-- Raise the Barricades ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13345, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13332;

-- The Ironwall Rampart ... Prev: Raise the Barricades AND No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13337;
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13346;
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13332;
DELETE FROM conditions WHERE SourceEntry = 13337 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13337,0,0,8,0,13346,0,0,0,0,'',''),
(19,0,13337,0,0,8,0,13346,0,0,0,0,'',''),
(20,0,13337,0,0,8,0,13332,0,0,0,0,'',''),
(19,0,13337,0,0,8,0,13332,0,0,0,0,'','');

-- Get the Message ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13332, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13314;
-- -- Capture More Dispatches ... Prev: Get the Message
UPDATE quest_template SET PrevQuestId = 13314, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13333;
-- Bloodspattered Banners ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13332, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13334;
-- Before the Gate of Horror ... Prev:  Bloodspattered Banners AND The Ironwall Rampart
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13335;
-- * NextQuestId not used yet so:
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13334;
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13337;
DELETE FROM conditions WHERE SourceEntry = 13335 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13335,0,0,8,0,13334,0,0,0,0,'',''),
(19,0,13335,0,0,8,0,13334,0,0,0,0,'',''),
(20,0,13335,0,0,8,0,13337,0,0,0,0,'',''),
(19,0,13335,0,0,8,0,13337,0,0,0,0,'','');

-- Shatter the Shards ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13335, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13339;
-- The Guardians of Corp'rethar ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13335, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13338;

-- If He Cannot Be Turned Alliance ... Prev: Non ... NextInChain: The Shadow Vault
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12898 WHERE Id = 12896;
-- If He Cannot Be Turned Horde ... Prev: Non ... NextInChain: The Shadow Vault
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12899 WHERE Id = 12897;
-- The Shadow Vault Alliance... Prev: If He Cannot Be Turned Alliance ... NextInChain: The Duke
UPDATE quest_template SET PrevQuestId = 12896, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12938 WHERE Id = 12898;
-- The Shadow Vault Horde... Prev: If He Cannot Be Turned Alliance ... NextInChain: The Duke
UPDATE quest_template SET PrevQuestId = 12897, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12938 WHERE Id = 12899;
-- The Duke... Prev: The Shadow Vault Alliance OR Horde ... NextInChain: Honor Challenge
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12939 WHERE Id = 12938;
DELETE FROM conditions WHERE SourceEntry = 12938 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,12938,0,0,8,0,12898,0,0,0,0,'',''),
(19,0,12938,0,0,8,0,12898,0,0,0,0,'',''),
(20,0,12938,0,1,8,0,12899,0,0,0,0,'',''),
(19,0,12938,0,1,8,0,12899,0,0,0,0,'','');

-- Honor Challenge ... Prev: The Duke ... NextInChain: Shadow Vault Decree
UPDATE quest_template SET PrevQuestId = 12938, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12943 WHERE Id = 12939;
-- Shadow Vault Decree ... Prev: Honor Challenge
UPDATE quest_template SET PrevQuestId = 12939, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12943;

-- Get the Key ... Prev: Honor Challenge ... NextInChain: Let the Baron Know
UPDATE quest_template SET PrevQuestId = 12938, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12951 WHERE Id = 12949;
-- Let the Baron Know ... Prev: Get the Key 
UPDATE quest_template SET PrevQuestId = 12949, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12951;

-- Vandalizing Jotunheim ... Prev: Let the Baron Know AND Shadow Vault Decree 
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13084;
DELETE FROM conditions WHERE SourceEntry = 13084 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13084,0,0,8,0,12951,0,0,0,0,'',''),
(19,0,13084,0,0,8,0,12951,0,0,0,0,'',''),
(20,0,13084,0,0,8,0,12943,0,0,0,0,'',''),
(19,0,13084,0,0,8,0,12943,0,0,0,0,'','');

-- Leave Our Mark ... Prev: Let the Baron Know AND Shadow Vault Decree 
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12995;
DELETE FROM conditions WHERE SourceEntry = 12995 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,12995,0,0,8,0,12951,0,0,0,0,'',''),
(19,0,12995,0,0,8,0,12951,0,0,0,0,'',''),
(20,0,12995,0,0,8,0,12943,0,0,0,0,'',''),
(19,0,12995,0,0,8,0,12943,0,0,0,0,'','');

-- Crush Dem Vrykuls! ... Prev: Let the Baron Know AND Shadow Vault Decree ... NextInChain: Vile Like Fire!
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13071 WHERE Id = 12992;
DELETE FROM conditions WHERE SourceEntry = 12992 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,12992,0,0,8,0,12951,0,0,0,0,'',''),
(19,0,12992,0,0,8,0,12951,0,0,0,0,'',''),
(20,0,12992,0,0,8,0,12943,0,0,0,0,'',''),
(19,0,12992,0,0,8,0,12943,0,0,0,0,'','');

-- -- Vile Like Fire! ... Prev: Crush Dem Vrykuls!
UPDATE quest_template SET PrevQuestId = 12992, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13071;

-- Vaelen Has Returned ... Prev: Let the Baron Know AND Shadow Vault Decree ... NextInChain: Ebon Blade Prisoners
UPDATE quest_template SET PrevQuestId = 12943, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12982 WHERE Id = 13085;
-- Ebon Blade Prisoners ... Prev: Vaelen Has Returned
UPDATE quest_template SET PrevQuestId = 13085, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12982;
-- -- Shoot 'Em Up ... Prev: Ebon Blade Prisoners
UPDATE quest_template SET PrevQuestId = 12982, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13069;

-- To the Rise with all Due Haste! ... Prev: Ebon Blade Prisoners ... NextInChain: The Story Thus Far...
UPDATE quest_template SET PrevQuestId = 12982, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12807 WHERE Id = 12806;
-- The Story Thus Far... ... Prev: To the Rise with all Due Haste! ... NextInChain: Blood in the Water 
UPDATE quest_template SET PrevQuestId = 12806, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12810 WHERE Id = 12807;
-- Blood in the Water ... Prev: The Story Thus Far... ... NextInChain: You'll Need a Gryphon
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12814 WHERE Id = 12810;
-- You'll Need a Gryphon
UPDATE quest_template SET PrevQuestId = 12810, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12814;
-- Fix for "You'll Need a Gryphon"
UPDATE `creature_template` SET `spell1`=54420  , `VehicleId`=165  , `InhabitType`=7 WHERE `entry` = 29403;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 17 AND SourceEntry = 54420;
INSERT INTO conditions VALUES
(17,0,54420,0,0,29,0,29405,10,0,0,0,'','Deliver Gryphon only near Uzo Deathcaller');

-- -- From Their Corpses, Rise! ... Prev: The Story Thus Far...
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12813;
-- -- No Fly Zone ... Prev: You'll Need a Gryphon
UPDATE quest_template SET PrevQuestId = 12814, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12815;
-- -- Intelligence Gathering ... Prev: The Story Thus Far...
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12838;
-- -- -- The Grand (Admiral's) Plan ... Prev:  The Story Thus Far... ... NextInChain: In Strict Confidence
UPDATE quest_template SET PrevQuestId = 12807, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12840 WHERE Id = 12839;
-- -- -- In Strict Confidence ... Prev: The Grand (Admiral's) Plan ... NextInChain: Second Chances
UPDATE quest_template SET PrevQuestId = 12839, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12847 WHERE Id = 12840;
-- -- -- Second Chances ... Prev: In Strict Confidence ... NextInChain: The Admiral Revealed
UPDATE quest_template SET PrevQuestId = 12840, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12852 WHERE Id = 12847;
-- -- -- The Admiral Revealed ... Prev: Second Chances
UPDATE quest_template SET PrevQuestId = 12847, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12852;

-- Eliminate the Competition ... Prev: The Duke ... NextInChain: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12938, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 12999 WHERE Id = 12955;
-- The Bone Witch ... Prev: Eliminate the Competition
UPDATE quest_template SET PrevQuestId = 12955, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 12999;
-- -- Reading the Bones ... Prev: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13092;
-- -- Reading the Bones Repeatable ... Prev: Reading the Bones
UPDATE quest_template SET PrevQuestId = 13092, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13093;

-- Deep in the Bowels of The Underhalls ... Prev: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13042;
-- Revenge for the Vargul ... Prev: The Bone Witch
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13059;

-- The Sum is Greater than the Parts ... Prev: The Bone Witch ... NextInChain: The Art of Being a Water Terror
UPDATE quest_template SET PrevQuestId = 12999, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13091 WHERE Id = 13043;
-- The Art of Being a Water Terror ... Prev: The Sum is Greater than the Parts ... NextInChain: Through the Eye
UPDATE quest_template SET PrevQuestId = 13043, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13121 WHERE Id = 13091;
--  Through the Eye ... Prev: The Art of Being a Water Terror ... NextInChain: Find the Ancient Hero
UPDATE quest_template SET PrevQuestId = 13091, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13133 WHERE Id = 13121;
-- Find the Ancient Hero ... Prev: Through the Eye  ... NextInChain: Not-So-Honorable Combat
UPDATE quest_template SET PrevQuestId = 13121, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13137 WHERE Id = 13133;
-- Not-So-Honorable Combat ... Prev: Find the Ancient Hero  ... NextInChain: Banshee's Revenge
UPDATE quest_template SET PrevQuestId = 13133, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13142 WHERE Id =13137;
-- Banshee's Revenge ... Prev: Not-So-Honorable Combat ... NextInChain: Battle at Valhalas
UPDATE quest_template SET PrevQuestId = 13137, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13213 WHERE Id = 13142;
-- Battle at Valhalas ... Prev: Banshee's Revenge
UPDATE quest_template SET PrevQuestId = 13142, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13213;

-- Battle at Valhalas: Fallen Heroes ... Prev: Battle at Valhalas
UPDATE quest_template SET PrevQuestId = 13213, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13214;
-- Battle at Valhalas: Khit'rix the Dark Master ... Prev: Battle at Valhalas: Fallen Heroes
UPDATE quest_template SET PrevQuestId = 13214, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13215;
-- Battle at Valhalas: The Return of Sigrid Iceborn ... Prev: Battle at Valhalas: Khit'rix the Dark Master
UPDATE quest_template SET PrevQuestId = 13215, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13216;
-- Battle at Valhalas: Carnage! ... Prev: Battle at Valhalas: The Return of Sigrid Iceborn
UPDATE quest_template SET PrevQuestId = 13216, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13217;
-- Battle at Valhalas: Thane Deathblow ... Prev: Battle at Valhalas: Carnage!
UPDATE quest_template SET PrevQuestId = 13217, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13218;
-- Battle at Valhalas: Final Challenge ... Prev: Battle at Valhalas: Thane Deathblow
UPDATE quest_template SET PrevQuestId = 13217, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13219;

-- Orgrim's Hammer ... Prequest Crusader Pinacle
UPDATE quest_template SET PrevQuestId = 13157, NextQuestId = 0, ExclusiveGroup = 13225, NextQuestIdChain = 0 WHERE Id = 13224;
-- Expoiting a Openinig ... Prev: Orgrim's Hammer AND The Shadow Vault - Next in Chain: Securing the Perimeter
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13224;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13259 WHERE Id = 13258;
DELETE FROM conditions WHERE SourceEntry = 13258 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13258,0,0,8,0,12899,0,0,0,0,'',''),
(19,0,13258,0,0,8,0,12899,0,0,0,0,'',''),
(20,0,13258,0,0,8,0,13224,0,0,0,0,'',''),
(19,0,13258,0,0,8,0,13224,0,0,0,0,'','');

-- Blood of the Choosen ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13330;
-- Joining the Assault ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13340;
-- -- Assault by ... Prev: Joining the Assault
UPDATE quest_template SET PrevQuestId = 13340, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13310;
UPDATE quest_template SET PrevQuestId = 13340, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13301;

-- Mind Tricks ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13308;
DELETE FROM conditions WHERE SourceEntry = 13308 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13308,0,0,8,0,13225,0,0,0,0,'',''),
(19,0,13308,0,0,8,0,13225,0,0,0,0,'',''),
(20,0,13308,0,1,8,0,13224,0,0,0,0,'',''),
(19,0,13308,0,1,8,0,13224,0,0,0,0,'','');
-- Slaves to Saronite ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13302;
-- Get to Ymirheim! ... Prev: Orgrim's Hammer ... NextChain: King of the Mountain
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13283 WHERE Id = 13293;
-- -- King of the Mountain ... Prev Get to Ymirheim
UPDATE quest_template SET PrevQuestId = 13293, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13283;

-- The Broken Front ... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13228;
-- -- Avenge me... Prev: Orgrim's Hammer
UPDATE quest_template SET PrevQuestId = 13224, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13230;
-- Make Them Pay! ... Prev: The Broken Front
UPDATE quest_template SET PrevQuestId = 13228, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13234;

-- Good For Something? ... Prev: The Broken Front ... Next in Chain: Volatility
UPDATE quest_template SET PrevQuestId = 13228, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13239 WHERE Id = 13238;
-- -- Volatility
UPDATE quest_template SET PrevQuestId = 13238, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13239;
-- -- -- Volatility Daily ... Prev: Volatility
UPDATE quest_template SET PrevQuestId = 13239, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13261;
-- -- Green Technology ... Prev: Volatility ... NextinChain: Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13239, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13373 WHERE Id = 13379;
-- -- -- Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13379, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13373;
-- -- -- -- Riding the Wavelength: The Bombardment ... Prev: Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13373, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13406;
-- -- -- -- Total Ohmage: The Valley of Lost Hope! ... Prev: Fringe Science Benefits
UPDATE quest_template SET PrevQuestId = 13373, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13376;

-- Takes One to Know One ... Prev: The Broken Front ... NextInChain: Poke and Prod
UPDATE quest_template SET PrevQuestId = 13228, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13237 WHERE Id = 13260;
-- Poke and Prod ... Prev: Takes One to Know One
UPDATE quest_template SET PrevQuestId =  13260, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13237;

-- Against the Giants ... Prev: Poke and Prod ... Next in Chain: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13237, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13279 WHERE Id = 13277;
-- Coprous the Defiled ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13277, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13278;
-- Basic Chemistry ... Prev: Against the Giants
UPDATE quest_template SET PrevQuestId = 13277, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13279;
-- -- Neutralizing the Plague ... Prev: Basic Chemistry
UPDATE quest_template SET PrevQuestId = 13279, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13281;

-- That's Abominable! ... Prev: Poke and Prod 
UPDATE quest_template SET PrevQuestId = 13237, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13264;
-- -- That's Abominable! Daily ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13264, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13276;

-- Sneak Preview ... Prev: That's Abominable!
UPDATE quest_template SET PrevQuestId = 13264, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13351;
-- Chain of Command ... Prev: Sneak Preview
UPDATE quest_template SET PrevQuestId = 13351, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13354;
-- Cannot Reproduce ... Prev: Sneak Preview ... Next In Chain: Retest Now
UPDATE quest_template SET PrevQuestId = 13351, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13356 WHERE Id = 13355;
-- -- Retest Now ... Prev: Cannot Reproduce
UPDATE quest_template SET PrevQuestId = 13355, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13356;
-- -- Retest Now Daily ... Prev: Retest Now
UPDATE quest_template SET PrevQuestId = 13356, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13357;

-- Drag and Drop ... Prev: Sneak Preview  
UPDATE quest_template SET PrevQuestId = 13351, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13352;
-- -- Drag and Drop Daily ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13352, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13353;
-- -- Not a Bug ... Prev: Drag and Drop
UPDATE quest_template SET PrevQuestId = 13352, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13358;
-- -- -- Not a Bug Daily ... Prev: Not a Bug
UPDATE quest_template SET PrevQuestId = 13358, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13365;

-- Need more Info ... Prev: Drag and Drop ... Next in Chain: No Rest For The Wicked
UPDATE quest_template SET PrevQuestId = 13352, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13367 WHERE Id = 13366;
-- No Rest For the Wicked ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13366, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13367;
-- -- No Rest For the Wicked Daily ... Prev: No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 13367, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13368;
-- Raise the Barricades ... Prev: Need more Info 
UPDATE quest_template SET PrevQuestId = 13366, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13306;

-- The Ironwall Rampart ... Prev: Raise the Barricades AND No Rest For the Wicked
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13312;
-- * NextQuestId not used yet so:
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13306;
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13367;
DELETE FROM conditions WHERE SourceEntry = 13312 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13312,0,0,8,0,13306,0,0,0,0,'',''),
(19,0,13312,0,0,8,0,13306,0,0,0,0,'',''),
(20,0,13312,0,0,8,0,13367,0,0,0,0,'',''),
(19,0,13312,0,0,8,0,13367,0,0,0,0,'','');

-- Blinding the Eyes in the Sky ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13306, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13313;
-- -- Keeping the Alliance Blind ... Prev: Blinding the Eyes in the Sky
UPDATE quest_template SET PrevQuestId = 13313, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13331;
-- Bloodspattered Banners ... Prev: Raise the Barricades
UPDATE quest_template SET PrevQuestId = 13306, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13307;
-- Before the Gate of Horror ... Prev:  Bloodspattered Banners AND The Ironwall Rampart
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13329;
-- * NextQuestId not used yet so:
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13307;
UPDATE quest_template SET NextQuestId = 0 WHERE Id = 13312;
DELETE FROM conditions WHERE SourceEntry = 13329 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13329,0,0,8,0,13307,0,0,0,0,'',''),
(19,0,13329,0,0,8,0,13307,0,0,0,0,'',''),
(20,0,13329,0,0,8,0,13312,0,0,0,0,'',''),
(19,0,13329,0,0,8,0,13312,0,0,0,0,'','');

-- Shatter the Shards ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13329, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13328;
-- The Guardians of Corp'rethar ... Prev: Before the Gate of Horror
UPDATE quest_template SET PrevQuestId = 13329, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13316;

-- Judgment Day Comes! Allianz ... Next Quest: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 13036, ExclusiveGroup = 13226, NextQuestIdChain = 0 WHERE Id = 13226;

-- Judgment Day Comes! Horde ... Next Quest: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 13036, ExclusiveGroup = 13226, NextQuestIdChain = 0 WHERE Id = 13227;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13008 WHERE Id = 13036;

-- Scourge Tactics ... Prev: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 13036, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13008;
-- Defending The Vanguard ... Prev: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 13036, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13039;
-- Curing The Incurable ... Prev: Honor Above All Else
UPDATE quest_template SET PrevQuestId = 13036, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13040;

-- If There Are Survivors... Prev: Scourge Tactics AND Defending The Vanguard AND Curing The Incurable
-- NextInChain: Into The Wild Green Yonder
UPDATE quest_template SET ExclusiveGroup = -13008 WHERE Id = 13008;
UPDATE quest_template SET ExclusiveGroup = -13008 WHERE Id = 13039;
UPDATE quest_template SET ExclusiveGroup = -13008 WHERE Id = 13040;
UPDATE quest_template SET PrevQuestId = 13008, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13045 WHERE Id = 13044;
-- Into The Wild Green Yonder ... Prev:  If There Are Survivors ... NextInChain: A Cold Front Approaches
UPDATE quest_template SET PrevQuestId = 13044, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13070 WHERE Id = 13045;
-- A Cold Front Approaches ... Prev: Into The Wild Green Yonder ... NextInChain: The Last Line Of Defense
UPDATE quest_template SET PrevQuestId = 13045, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13086 WHERE Id = 13070;
-- The Last Line Of Defense ... Prev: A Cold Front Approaches
UPDATE quest_template SET PrevQuestId = 13070, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13086;

-- Tirions Mount
DELETE FROM `creature_template_addon` WHERE `entry` IN (30677);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30677,0,2325,0,0,0,'');  -- Tirion Fordring - Mount

-- Once More Unto The Breach, Hero
-- Once More Unto The Breach, Hero  DK only
UPDATE quest_template SET PrevQuestId = 13086, NextQuestId = 0, ExclusiveGroup = 13104, NextQuestIdChain = 0 WHERE Id = 13104;
UPDATE quest_template SET PrevQuestId = 13086, NextQuestId = 0, ExclusiveGroup = 13104, NextQuestIdChain = 0 WHERE Id = 13105;

-- The Scourgestone ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13122;
DELETE FROM conditions WHERE SourceEntry = 13122 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13122,0,0,8,0,13104,0,0,0,0,'',''),
(19,0,13122,0,0,8,0,13104,0,0,0,0,'',''),
(20,0,13122,0,1,8,0,13105,0,0,0,0,'',''),
(19,0,13122,0,1,8,0,13105,0,0,0,0,'','');

-- The Purging Of Scourgeholme ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13118;
DELETE FROM conditions WHERE SourceEntry = 13118 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13118,0,0,8,0,13104,0,0,0,0,'',''),
(19,0,13118,0,0,8,0,13104,0,0,0,0,'',''),
(20,0,13118,0,1,8,0,13105,0,0,0,0,'',''),
(19,0,13118,0,1,8,0,13105,0,0,0,0,'','');

-- The Restless Dead ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13110;
DELETE FROM conditions WHERE SourceEntry = 13110 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13110,0,0,8,0,13104,0,0,0,0,'',''),
(19,0,13110,0,0,8,0,13104,0,0,0,0,'',''),
(20,0,13110,0,1,8,0,13105,0,0,0,0,'',''),
(19,0,13110,0,1,8,0,13105,0,0,0,0,'','');


-- It Could Kill Us All ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13135;
DELETE FROM conditions WHERE SourceEntry = 13135 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13135,0,0,8,0,13104,0,0,0,0,'',''),
(19,0,13135,0,0,8,0,13104,0,0,0,0,'',''),
(20,0,13135,0,1,8,0,13105,0,0,0,0,'',''),
(19,0,13135,0,1,8,0,13105,0,0,0,0,'','');

-- The Stone That Started A Revolution ... Prev: Once More Unto The Breach, Hero ODER Once More Unto The Breach, Hero DK only
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13130;
DELETE FROM conditions WHERE SourceEntry = 13130 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13130,0,0,8,0,13104,0,0,0,0,'',''),
(19,0,13130,0,0,8,0,13104,0,0,0,0,'',''),
(20,0,13130,0,1,8,0,13105,0,0,0,0,'',''),
(19,0,13130,0,1,8,0,13105,0,0,0,0,'','');

-- The Air Stands Still ... Prev: The Scourgestone UND The Purging Of Scourgeholme
UPDATE quest_template SET NextQuestId = 13125, ExclusiveGroup = -13122 WHERE Id = 13122;
UPDATE quest_template SET NextQuestId = 13125, ExclusiveGroup = -13122 WHERE Id = 13118;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13125;

-- Into The Frozen Heart Of Northrend ... Prev: The Air Stands Still AND The Restless Dead AND The Stone That Started A Revolution AND It Could Kill Us All
-- NextQuestIdChain: The Battle For Crusaders' Pinnacle
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE Id = 13135;
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE Id = 13110;
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE Id = 13130;
UPDATE quest_template SET NextQuestId = 13139, ExclusiveGroup = -13135 WHERE Id = 13125;
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13141 WHERE Id = 13139;

-- The Battle For Crusaders' Pinnacle ... Prev: Into The Frozen Heart Of Northrend ... NextQuestIdChain: The Crusaders' Pinnacle
UPDATE quest_template SET PrevQuestId = 13139, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13157 WHERE Id = 13141;
-- The Crusaders' Pinnacle ... PRev: The Battle For Crusaders' Pinnacle
UPDATE quest_template SET PrevQuestId = 13141, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13157;

-- Blackwatch ... Prev: The Shadow Vault Allianz OR The Shadow Vault Horde
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13106;
DELETE FROM conditions WHERE SourceEntry = 13106 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13106,0,0,8,0,12898,0,0,0,0,'',''),
(19,0,13106,0,0,8,0,12898,0,0,0,0,'',''),
(20,0,13106,0,1,8,0,12899,0,0,0,0,'',''),
(19,0,13106,0,1,8,0,12899,0,0,0,0,'','');

-- Where Are They Coming From? ... Prev: Blackwatch
UPDATE quest_template SET PrevQuestId = 13106, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13117;

-- Death's Gaze ... Prev: Where Are They Coming From?
UPDATE quest_template SET PrevQuestId = 13117, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13120;
-- Destroying the Altars ... Prev: Where Are They Coming From?
UPDATE quest_template SET PrevQuestId = 13117, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13119;

-- I'm Not Dead Yet! H ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13229;
DELETE FROM conditions WHERE SourceEntry = 13229 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13229,0,0,8,0,13120,0,0,0,0,'',''),
(19,0,13229,0,0,8,0,13120,0,0,0,0,'',''),
(20,0,13229,0,0,8,0,13119,0,0,0,0,'',''),
(19,0,13229,0,0,8,0,13119,0,0,0,0,'','');
-- I'm Not Dead Yet! A ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13221;
DELETE FROM conditions WHERE SourceEntry = 13221 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13221,0,0,8,0,13120,0,0,0,0,'',''),
(19,0,13221,0,0,8,0,13120,0,0,0,0,'',''),
(20,0,13221,0,0,8,0,13119,0,0,0,0,'',''),
(19,0,13221,0,0,8,0,13119,0,0,0,0,'','');

-- Spill Their Blood ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13134;
DELETE FROM conditions WHERE SourceEntry = 13134 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13134,0,0,8,0,13120,0,0,0,0,'',''),
(19,0,13134,0,0,8,0,13120,0,0,0,0,'',''),
(20,0,13134,0,0,8,0,13119,0,0,0,0,'',''),
(19,0,13134,0,0,8,0,13119,0,0,0,0,'','');
-- Jagged Shards ... Prev: Death's Gaze AND Destroying the Altars
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13136;
DELETE FROM conditions WHERE SourceEntry = 13136 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13136,0,0,8,0,13120,0,0,0,0,'',''),
(19,0,13136,0,0,8,0,13120,0,0,0,0,'',''),
(20,0,13136,0,0,8,0,13119,0,0,0,0,'',''),
(19,0,13136,0,0,8,0,13119,0,0,0,0,'','');

-- The Runesmiths of Malykriss ... Prev: Jagged Shards     
UPDATE quest_template SET PrevQuestId = 13136, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13140;
-- I'm Smelting... Smelting! ... Prev: Jagged Shards
UPDATE quest_template SET PrevQuestId = 13136, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13138;
-- By Fire Be Purged ... Prev: I'm Smelting... Smelting! AND The Runesmiths of Malykriss AND Spill Their Blood 
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13211;
DELETE FROM conditions WHERE SourceEntry = 13211 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13211,0,0,8,0,13140,0,0,0,0,'',''),
(19,0,13211,0,0,8,0,13140,0,0,0,0,'',''),
(20,0,13211,0,0,8,0,13134,0,0,0,0,'',''),
(19,0,13211,0,0,8,0,13134,0,0,0,0,'',''),
(20,0,13211,0,0,8,0,13138,0,0,0,0,'',''),
(19,0,13211,0,0,8,0,13138,0,0,0,0,'','');
-- A Visit to the Doctor ... Prev: I'm Smelting... Smelting! AND The Runesmiths of Malykriss AND Spill Their Blood 
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13152;
DELETE FROM conditions WHERE SourceEntry = 13152 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13152,0,0,8,0,13140,0,0,0,0,'',''),
(19,0,13152,0,0,8,0,13140,0,0,0,0,'',''),
(20,0,13152,0,0,8,0,13134,0,0,0,0,'',''),
(19,0,13152,0,0,8,0,13134,0,0,0,0,'',''),
(20,0,13152,0,0,8,0,13138,0,0,0,0,'',''),
(19,0,13152,0,0,8,0,13138,0,0,0,0,'','');

-- Killing Two Scourge With One Skeleton ... Prev: A Visit to the Doctor AND By Fire Be Purged
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13144;
DELETE FROM conditions WHERE SourceEntry = 13144 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13144,0,0,8,0,13152,0,0,0,0,'',''),
(19,0,13144,0,0,8,0,13152,0,0,0,0,'',''),
(20,0,13144,0,0,8,0,13211,0,0,0,0,'',''),
(19,0,13144,0,0,8,0,13211,0,0,0,0,'','');

-- Let's Get Out of Here A ... Prev: Killing Two Scourge With One Skeleton 
UPDATE quest_template SET PrevQuestId = 13144, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13482;
-- Let's Get Out of Here H ... Prev: Killing Two Scourge With One Skeleton
UPDATE quest_template SET PrevQuestId = 13144, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13481;
-- He's Gone to Pieces ... Prev: Killing Two Scourge With One Skeleton ... NextQuestIdChain: Putting Olakin Back Together Again
UPDATE quest_template SET PrevQuestId = 13144, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13220 WHERE Id = 13212;
-- Putting Olakin Back Together Again ... Prev: He's Gone to Pieces ... NextQuestIdChain: The Flesh Giant Champion
UPDATE quest_template SET PrevQuestId = 13212, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13235 WHERE Id = 13220;
-- The Flesh Giant Champion ... Prev: Putting Olakin Back Together Again
UPDATE quest_template SET PrevQuestId = 13220, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13235;

-- Exploiting an Opening(A) ... Prev: The SkyBreaker AND The ShadowVault ... NextQuestIdChain: Securing the Perimeter
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13387 WHERE Id = 13386;
DELETE FROM conditions WHERE SourceEntry = 13386 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13386,0,0,8,0,12898,0,0,0,0,'',''),
(19,0,13386,0,0,8,0,12898,0,0,0,0,'',''),
(20,0,13386,0,0,8,0,13225,0,0,0,0,'',''),
(19,0,13386,0,0,8,0,13225,0,0,0,0,'','');
-- Securing the Perimeter ... Prev: Exploiting an Opening ... NextQuestIdChain: Set it Off!
UPDATE quest_template SET PrevQuestId = 13386, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13388 WHERE Id = 13387;
-- Set it Off! ... Prev: Securing the Perimeter ... NextQuestIdChain: A Short Fuse
UPDATE quest_template SET PrevQuestId = 13387, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13389 WHERE Id = 13388;
-- A Short Fuse ... Prev: Set it Off! ... NextQuestIdChain: A Voice in the Dark
UPDATE quest_template SET PrevQuestId = 13388, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13390 WHERE Id = 13389;
-- A Voice in the Dark ... Prev: A Short Fuse ... NextQuestIdChain: Time to Hide
UPDATE quest_template SET PrevQuestId = 13389, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13391 WHERE Id = 13390;
--  Time to Hide ... Prev:  A Voice in the Dark ... NextQuestIdChain: Return to the Surface
UPDATE quest_template SET PrevQuestId = 13390, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13392 WHERE Id = 13391;
-- Return to the Surface ... Prev: Time to Hide ... NextQuestIdChain: Field Repairs
UPDATE quest_template SET PrevQuestId = 13391, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13393 WHERE Id = 13392;
-- Field Repairs ... Prev: Return to the Surface 
UPDATE quest_template SET PrevQuestId = 13392, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13393;

-- Do Your Worst ... Prev: Field Repairs ... NextQuestIdChain: Army of the Damned
UPDATE quest_template SET PrevQuestId = 13393, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13395 WHERE Id = 13394;
-- Army of the Damned ... Prev: Do Your Worst ... NextQuestIdChain: Futility
UPDATE quest_template SET PrevQuestId = 13394, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13396 WHERE Id = 13395;
-- Futility ... Prev: Army of the Damned ... NextQuestIdChain: Sindragosa's Fall
UPDATE quest_template SET PrevQuestId = 13395, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13397 WHERE Id = 13396;
-- Sindragosa's Fall ... Prev: Futility 
UPDATE quest_template SET PrevQuestId = 13396, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13397;

-- Where Dragons Fell ... Prev: Futility ... NextQuestIdChain:	Time for Answers	
UPDATE quest_template SET PrevQuestId = 13396, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13399 WHERE Id = 13398;
-- Time for Answers ... Prev: Where Dragons Fell ... NextQuestIdChain: The Hunter and the Prince
UPDATE quest_template SET PrevQuestId = 13398, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13400 WHERE Id = 13399;
-- The Hunter and the Prince ... Prev: Time for Answers ... NextQuestIdChain: Knowledge is a Terrible Burden
UPDATE quest_template SET PrevQuestId = 13399, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13401 WHERE Id = 13400;
-- Knowledge is a Terrible Burden ... Prev: The Hunter and the Prince ... NextQuestIdChain: Tirion's Help
UPDATE quest_template SET PrevQuestId = 13400, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13402 WHERE Id = 13401;
-- Tirion's Help ... Prev: Knowledge is a Terrible Burden ... NextQuestIdChain: Tirion's Gambit
UPDATE quest_template SET PrevQuestId = 13401, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13403 WHERE Id = 13402;
-- Tirion's Gambit ... Prev: Tirion's Help
UPDATE quest_template SET PrevQuestId = 13402, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13403;

-- Opportunity ... Prev: Orgrim's Hammer AND The ShadowVault ... NextQuestIdChain: Establishing Superiority
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13259 WHERE Id = 13258;
DELETE FROM conditions WHERE SourceEntry = 13258 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13258,0,0,8,0,13224,0,0,0,0,'',''),
(19,0,13258,0,0,8,0,13224,0,0,0,0,'',''),
(20,0,13258,0,0,8,0,12899,0,0,0,0,'',''),
(19,0,13258,0,0,8,0,12899,0,0,0,0,'','');

-- Establishing Superiority ... Prev: Opportunity ... NextQuestIdChain: Blow it Up!
UPDATE quest_template SET PrevQuestId = 13258, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13262 WHERE Id = 13259;
-- Blow it Up! ... Prev:  Establishing Superiority ... NextQuestIdChain: A Short Fuse
UPDATE quest_template SET PrevQuestId = 13259, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13263 WHERE Id = 13262;
-- A Short Fuse ... Prev: Blow it Up! ... NextQuestIdChain: A Voice in the Dark
UPDATE quest_template SET PrevQuestId = 13262, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13271 WHERE Id = 13263;
-- A Voice in the Dark ... Prev: A Short Fuse ... NextQuestIdChain: Time to Hide
UPDATE quest_template SET PrevQuestId = 13263, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13275 WHERE Id = 13271;
-- Time to Hide ... Prev: A Voice in the Dark ... NextQuestIdChain: Return to the Surface
UPDATE quest_template SET PrevQuestId = 13271, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13282 WHERE Id = 13275;
-- Return to the Surface ... Prev: Time to Hide ... NextQuestIdChain: Field Repairs
UPDATE quest_template SET PrevQuestId = 13275, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13304 WHERE Id = 13282;
-- Field Repairs ... Prev: Return to the Surface
UPDATE quest_template SET PrevQuestId = 13282, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13304;

-- Do Your Worst ... Prev: Field Repairs ... NextQuestIdChain: Army of the Damned
UPDATE quest_template SET PrevQuestId = 13304, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13236 WHERE Id = 13305;
-- Army of the Damned ... Prev: Do Your Worst ... NextQuestIdChain: Futility
UPDATE quest_template SET PrevQuestId = 13305, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13348 WHERE Id = 13236;
-- Futility ... Prev: Army of the Damned ... NextQuestIdChain: Cradle of the Frostbrood
UPDATE quest_template SET PrevQuestId = 13236, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13349 WHERE Id = 13348;
-- Cradle of the Frostbrood ... Prev: Futility
UPDATE quest_template SET PrevQuestId = 13348, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13349;

-- Where Dragons Fell ... Prev: Futility
UPDATE quest_template SET PrevQuestId = 13349, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13359;
-- Time for Answers ... Prev: Where Dragons Fell ... NextQuestIdChain: The Hunter and the Prince
UPDATE quest_template SET PrevQuestId = 13359, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13361 WHERE Id = 13360;
-- The Hunter and the Prince ... Prev: Time for Answers ... NextQuestIdChain: Knowledge is a Terrible Burden
UPDATE quest_template SET PrevQuestId = 13360, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13362 WHERE Id = 13361;
-- Knowledge is a Terrible Burden ... Prev: The Hunter and the Prince
UPDATE quest_template SET PrevQuestId = 13361, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13362;

-- Argent Aid ... Prev: Knowledge is a Terrible Burden ... NextQuestIdChain: Tirion's Gambit
UPDATE quest_template SET PrevQuestId = 13362, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13364 WHERE Id = 13363;
-- Tirion's Gambit ... Prev: Argent Aid
UPDATE quest_template SET PrevQuestId = 13363, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13364;

-- Parting Gifts ... Prev: A Short Fuse A OR A Short Fuse H
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13168;
DELETE FROM conditions WHERE SourceEntry = 13168 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13168,0,0,8,0,13263,0,0,0,0,'',''),
(19,0,13168,0,0,8,0,13263,0,0,0,0,'',''),
(20,0,13168,0,1,8,0,13389,0,0,0,0,'',''),
(19,0,13168,0,1,8,0,13389,0,0,0,0,'','');

-- An Undead's Best Friend ... Prev: Parting Gifts
UPDATE quest_template SET PrevQuestId = 13168, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13169;
-- Honor is for the Weak ... Prev: Parting Gifts
UPDATE quest_template SET PrevQuestId = 13168, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13170;
-- From Whence They Came ... Prev: Parting Gifts
UPDATE quest_template SET PrevQuestId = 13168, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13171;

-- Seeds of Chaos ... Prev: An Undead's Best Friend AND Honor is for the Weak AND From Whence They Came
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13172;
DELETE FROM conditions WHERE SourceEntry = 13172 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13172,0,0,8,0,13169,0,0,0,0,'',''),
(19,0,13172,0,0,8,0,13169,0,0,0,0,'',''),
(20,0,13172,0,0,8,0,13170,0,0,0,0,'',''),
(19,0,13172,0,0,8,0,13170,0,0,0,0,'',''),
(20,0,13172,0,0,8,0,13171,0,0,0,0,'',''),
(19,0,13172,0,0,8,0,13171,0,0,0,0,'','');
-- Amidst the Confusion ... Prev: An Undead's Best Friend AND Honor is for the Weak AND From Whence They Came
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13174;
DELETE FROM conditions WHERE SourceEntry = 13174 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13174,0,0,8,0,13169,0,0,0,0,'',''),
(19,0,13174,0,0,8,0,13169,0,0,0,0,'',''),
(20,0,13174,0,0,8,0,13170,0,0,0,0,'',''),
(19,0,13174,0,0,8,0,13170,0,0,0,0,'',''),
(20,0,13174,0,0,8,0,13171,0,0,0,0,'',''),
(19,0,13174,0,0,8,0,13171,0,0,0,0,'','');

-- Vereth the Cunning ... Prev: Amidst the Confusion AND Seeds of Chaos ... NextQuestIdChain: New Recruit
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13143 WHERE Id = 13155;
DELETE FROM conditions WHERE SourceEntry = 13155 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13155,0,0,8,0,13174,0,0,0,0,'',''),
(19,0,13155,0,0,8,0,13174,0,0,0,0,'',''),
(20,0,13155,0,0,8,0,13172,0,0,0,0,'',''),
(19,0,13155,0,0,8,0,13172,0,0,0,0,'','');

-- New Recruit ... Prev: Vereth the Cunning ... NextQuestIdChain: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13155, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 13145 WHERE Id = 13143;
-- The Vile Hold ... Prev: New Recruit
UPDATE quest_template SET PrevQuestId = 13143, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13145;

-- Generosity Abounds ... Prev: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13145, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13146;
-- Stunning View ... Prev: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13145, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13160;
-- Matchmaker ... Prev: The Vile Hold
UPDATE quest_template SET PrevQuestId = 13145, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13147;

-- The Rider of the Unholy ... Prev: Generosity Abounds AND Stunning View AND Matchmaker
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13161;
DELETE FROM conditions WHERE SourceEntry = 13161 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13161,0,0,8,0,13146,0,0,0,0,'',''),
(19,0,13161,0,0,8,0,13146,0,0,0,0,'',''),
(20,0,13161,0,0,8,0,13160,0,0,0,0,'',''),
(19,0,13161,0,0,8,0,13160,0,0,0,0,'',''),
(20,0,13161,0,0,8,0,13147,0,0,0,0,'',''),
(19,0,13161,0,0,8,0,13147,0,0,0,0,'','');
-- The Rider of the Frost ... Prev: Generosity Abounds AND Stunning View AND Matchmaker
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13162;
DELETE FROM conditions WHERE SourceEntry = 13162 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13162,0,0,8,0,13146,0,0,0,0,'',''),
(19,0,13162,0,0,8,0,13146,0,0,0,0,'',''),
(20,0,13162,0,0,8,0,13160,0,0,0,0,'',''),
(19,0,13162,0,0,8,0,13160,0,0,0,0,'',''),
(20,0,13162,0,0,8,0,13147,0,0,0,0,'',''),
(19,0,13162,0,0,8,0,13147,0,0,0,0,'','');
-- The Rider of the Blood ... Prev: Generosity Abounds AND Stunning View AND Matchmaker
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13163;
DELETE FROM conditions WHERE SourceEntry = 13163 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13163,0,0,8,0,13146,0,0,0,0,'',''),
(19,0,13163,0,0,8,0,13146,0,0,0,0,'',''),
(20,0,13163,0,0,8,0,13160,0,0,0,0,'',''),
(19,0,13163,0,0,8,0,13160,0,0,0,0,'',''),
(20,0,13163,0,0,8,0,13147,0,0,0,0,'',''),
(19,0,13163,0,0,8,0,13147,0,0,0,0,'','');

-- The Fate of Bloodbane ... Prev: The Rider of the Blood AND Frost AND Unholy
UPDATE quest_template SET PrevQuestId = 0, NextQuestId = 0, ExclusiveGroup = 0, NextQuestIdChain = 0 WHERE Id = 13164;
DELETE FROM conditions WHERE SourceEntry = 13164 AND SourceTypeOrReferenceId IN (20,19);
INSERT INTO conditions VALUES
(20,0,13164,0,0,8,0,13161,0,0,0,0,'',''),
(19,0,13164,0,0,8,0,13161,0,0,0,0,'',''),
(20,0,13164,0,0,8,0,13162,0,0,0,0,'',''),
(19,0,13164,0,0,8,0,13162,0,0,0,0,'',''),
(20,0,13164,0,0,8,0,13163,0,0,0,0,'',''),
(19,0,13164,0,0,8,0,13163,0,0,0,0,'','');

-- Other
DELETE FROM `item_template` WHERE (`entry`=8);
DELETE FROM `locales_item` WHERE (`entry`=8);
INSERT INTO `item_template` VALUES ('8', '13', '0', '-1', 'Summon Teleporter', '12735', '1', '64', '0', '1', '0', '0', '0', '-1', '-1', '80', '0', '0', '0', '0', '0', '0', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18282', '0', '-1', '-1', '300000', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '0', '0', '0', '0', '-1', '0', '-1', '1', 'Summons Teleporter', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0', '0', '0', 'item_custom_summon', '0', '0', '0', '0', '1');
INSERT INTO `locales_item`(`entry`,`name_loc1`,`name_loc2`,`name_loc3`,`name_loc4`,`name_loc5`,`name_loc6`,`name_loc7`,`name_loc8`,`description_loc1`,`description_loc2`,`description_loc3`,`description_loc4`,`description_loc5`,`description_loc6`,`description_loc7`,`description_loc8`) VALUES ( '8','','','','','','','','Призыв Телепортера',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Эта вещь призывает Мастера Телепортации');

DELETE FROM creature_template WHERE entry = '100000';

INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, Health_mod, Mana_mod, Armor_mod, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, dmg_multiplier, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName) VALUES
('100000', '21572', "Мастер телепортации", "", 'Directions', '50000', 71, 71, 1.56, 1.56, 1.56, 35, 35, 3, 1, 1.14286, 1.25, 1, 1, 1, 2, 7, 138936390, 3, 1, 2, 'SmartAI');

DELETE FROM creature_template_addon WHERE Entry = '100000' ;

DELETE FROM gossip_menu WHERE entry>'50000'-1 AND entry<'50000'+9;
DELETE FROM npc_text WHERE ID>'300000'-1 AND ID<'300000'+5;

INSERT INTO gossip_menu (entry, text_id) VALUES
('50000'+4, '300000'+3),
('50000'+3, '300000'+2),
('50000'+2, '300000'+2),
('50000'+1, '300000'+2),
('50000'+8, '300000'+4),
('50000'+7, '300000'+4),
('50000'+6, '300000'+4),
('50000'+5, '300000'+4),
('50000', '300000'+1),
('50000', '300000');

INSERT INTO npc_text (ID, text0_0, em0_1) VALUES
('300000'+4, '$BКуда бы ты хотел попасть?$B', 0),
('300000'+3, '$BБудь осторожен в выборе подземелья.$B', 0),
('300000'+2, '$BПодземелья:?$B', 0),
('300000'+1, '$B За Альянс!$B', 6),
('300000', '$B За Орду!$B', 6);

DELETE FROM gossip_menu_option WHERE menu_id>'50000'-1 AND menu_id<'50000'+9;
DELETE FROM smart_scripts WHERE entryorguid = '100000';
DELETE FROM conditions WHERE (SourceTypeOrReferenceId = 15 OR SourceTypeOrReferenceId=14) AND (SourceGroup>'50000'-1 AND SourceGroup<'50000'+9);

INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ConditionTypeOrReference, ConditionValue1, Comment) VALUES
(15, '50000', 1, 6, 469, 'Stormwind'),
(15, '50000'+5, 2, 6, 469, 'Dun Morogh'),
(15, '50000'+5, 3, 6, 67, 'Tirisfal Glades'),
(15, '50000'+5, 4, 6, 67, 'Ghostlands'),
(15, '50000'+5, 5, 6, 469, 'Loch modan'),
(15, '50000'+5, 6, 6, 67, 'Silverpine Forest'),
(15, '50000'+5, 7, 6, 469, 'Westfall'),
(15, '50000'+5, 8, 6, 469, 'Redridge mountains'),
(15, '50000'+5, 9, 6, 469, 'Duskwood'),
(15, '50000'+5, 11, 6, 469, 'Wetlands'),
(15, '50000'+6, 0, 6, 469, 'Azuremyst Isle'),
(15, '50000'+6, 1, 6, 469, 'Teldrassil'),
(15, '50000'+6, 2, 6, 67, 'Durotar'),
(15, '50000'+6, 3, 6, 67, 'Mulgore'),
(15, '50000'+6, 4, 6, 469, 'Bloodmyst Isle'),
(15, '50000'+6, 5, 6, 469, 'Darkshore'),
(15, '50000'+6, 6, 6, 67, 'The Barrens'),
(15, '50000'+5, 1, 6, 67, 'Eversong Woods'),
(15, '50000'+5, 0, 6, 469, 'Elwynn Forest'),
(15, '50000'+4, 22, 6, 67, 'Zul\'Aman'),
(15, '50000', 2, 6, 67, 'Orgrimmar'),
(15, '50000', 3, 6, 469, 'Darnassus'),
(15, '50000', 4, 6, 469, 'Ironforge'),
(15, '50000', 5, 6, 469, 'Exodar'),
(15, '50000', 6, 6, 67, 'Thunder bluff'),
(15, '50000', 7, 6, 67, 'Undercity'),
(15, '50000', 8, 6, 67, 'Silvermoon city'),
(15, '50000'+1, 0, 6, 469, 'Gnomeregan'),
(15, '50000'+1, 1, 6, 469, 'The Deadmines'),
(15, '50000'+1, 2, 6, 469, 'The Stockade'),
(15, '50000'+1, 3, 6, 67, 'Ragefire Chasm'),
(15, '50000'+1, 4, 6, 67, 'Razorfen Downs'),
(15, '50000'+1, 5, 6, 67, 'Razorfen Kraul'),
(15, '50000'+1, 6, 6, 67, 'Scarlet Monastery'),
(15, '50000'+1, 7, 6, 67, 'Shadowfang Keep'),
(15, '50000'+1, 8, 6, 67, 'Wailing Caverns'),
(15, '50000'+6, 9, 6, 67, 'Thousand Needles'),
(14, '50000', '300000'+1, 6, 469, 'For the Alliance'),
(14, '50000', '300000', 6, 67, 'For the Horde');

INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, Comment) VALUES
(15, '50000'+8, 9, 27, 77, 3, 0, 'Portal Master - Level req'),
(15, '50000'+8, 8, 27, 77, 3, 0, 'Portal Master - Level req'),
(15, '50000'+8, 7, 27, 77, 3, 0, 'Portal Master - Level req'),
(15, '50000'+8, 6, 27, 77, 3, 0, 'Portal Master - Level req'),
(15, '50000'+8, 5, 27, 76, 3, 0, 'Portal Master - Level req'),
(15, '50000'+8, 4, 27, 74, 3, 0, 'Portal Master - Level req'),
(15, '50000'+8, 3, 27, 73, 3, 0, 'Portal Master - Level req'),
(15, '50000'+8, 2, 27, 71, 3, 0, 'Portal Master - Level req'),
(15, '50000'+8, 1, 27, 68, 3, 0, 'Portal Master - Level req'),
(15, '50000'+8, 0, 27, 68, 3, 0, 'Portal Master - Level req'),
(15, '50000'+7, 6, 27, 67, 3, 0, 'Portal Master - Level req'),
(15, '50000'+7, 5, 27, 67, 3, 0, 'Portal Master - Level req'),
(15, '50000'+7, 4, 27, 65, 3, 0, 'Portal Master - Level req'),
(15, '50000'+7, 3, 27, 64, 3, 0, 'Portal Master - Level req'),
(15, '50000'+7, 2, 27, 62, 3, 0, 'Portal Master - Level req'),
(15, '50000'+7, 1, 27, 60, 3, 0, 'Portal Master - Level req'),
(15, '50000'+7, 0, 27, 58, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 18, 27, 55, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 17, 27, 55, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 16, 27, 48, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 15, 27, 48, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 14, 27, 45, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 13, 27, 40, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 12, 27, 40, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 11, 27, 35, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 10, 27, 30, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 9, 27, 25, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 8, 27, 18, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 7, 27, 15, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 6, 27, 10, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 5, 27, 10, 3, 0, 'Portal Master - Level req'),
(15, '50000'+6, 4, 27, 15, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 23, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 22, 27, 53, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 21, 27, 51, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 20, 27, 50, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 19, 27, 45, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 18, 27, 43, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 17, 27, 40, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 16, 27, 35, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 15, 27, 35, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 14, 27, 30, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 13, 27, 30, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 12, 27, 30, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 11, 27, 20, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 10, 27, 20, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 9, 27, 18, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 8, 27, 15, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 7, 27, 10, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 6, 27, 10, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 5, 27, 10, 3, 0, 'Portal Master - Level req'),
(15, '50000'+5, 4, 27, 10, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 22, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 21, 27, 57, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 19, 27, 80, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 18, 27, 80, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 17, 27, 80, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 16, 27, 80, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 15, 27, 60, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 14, 27, 67, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 13, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 12, 27, 60, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 11, 27, 80, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 10, 27, 80, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 9, 27, 60, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 8, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 7, 27, 80, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 6, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 5, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 4, 27, 80, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 3, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 2, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 1, 27, 60, 3, 0, 'Portal Master - Level req'),
(15, '50000'+4, 0, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 11, 27, 75, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 10, 27, 69, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 9, 27, 77, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 8, 27, 79, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 7, 27, 75, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 6, 27, 71, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 5, 27, 79, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 4, 27, 71, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 3, 27, 74, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 2, 27, 79, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 1, 27, 79, 3, 0, 'Portal Master - Level req'),
(15, '50000'+3, 0, 27, 73, 3, 0, 'Portal Master - Level req'),
(15, '50000'+2, 5, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+2, 4, 27, 70, 3, 0, 'Portal Master - Level req'),
(15, '50000'+2, 3, 27, 59, 3, 0, 'Portal Master - Level req'),
(15, '50000'+2, 2, 27, 62, 3, 0, 'Portal Master - Level req'),
(15, '50000'+2, 1, 27, 66, 3, 0, 'Portal Master - Level req'),
(15, '50000'+2, 0, 27, 64, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 18, 27, 35, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 17, 27, 37, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 16, 27, 47, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 15, 27, 55, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 14, 27, 55, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 13, 27, 45, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 12, 27, 55, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 11, 27, 57, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 10, 27, 53, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 9, 27, 21, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 8, 27, 17, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 7, 27, 18, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 6, 27, 32, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 5, 27, 24, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 4, 27, 34, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 3, 27, 15, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 2, 27, 22, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 1, 27, 17, 3, 0, 'Portal Master - Level req'),
(15, '50000'+1, 0, 27, 25, 3, 0, 'Portal Master - Level req'),
(15, '50000', 20, 27, 57, 3, 0, 'Portal Master - Level req'),
(15, '50000', 19, 27, 69, 3, 0, 'Portal Master - Level req'),
(15, '50000', 18, 27, 59, 3, 0, 'Portal Master - Level req'),
(15, '50000', 17, 27, 15, 3, 0, 'Portal Master - Level req'),
(15, '50000', 16, 27, 68, 3, 0, 'Portal Master - Level req'),
(15, '50000', 15, 27, 58, 3, 0, 'Portal Master - Level req'),
(15, '50000', 12, 27, 30, 3, 0, 'Portal Master - Level req'),
(15, '50000', 11, 27, 30, 3, 0, 'Portal Master - Level req'),
(15, '50000', 10, 27, 57, 3, 0, 'Portal Master - Level req'),
(15, '50000', 9, 27, 67, 3, 0, 'Portal Master - Level req');

INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, box_coded, box_money, box_text) VALUES
('50000', 1, 2, 'Штормград', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Штормград?'),
('50000', 2, 2, 'Оргриммар', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Оргриммар?'),
('50000', 3, 2, 'Дарнас', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Дарнас?'),
('50000', 4, 2, 'Стальгорн', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Стальгорн?'),
('50000', 5, 2, 'Эксодар', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Эксодар?'),
('50000', 6, 2, 'Громовой утес', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть на Громовой утес?'),
('50000', 7, 2, 'Подгород', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Подгород?'),
('50000', 8, 2, 'Луносвет', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Луносвет?'),
('50000', 9, 2, 'Даларан', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Даларан?'),
('50000', 10, 2, 'Шаттрат', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Шаттрат?'),
('50000', 11, 2, 'Пиратская бухта', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть в Пиратскую бухту?'),
('50000', 12, 2, 'Арена Гурубаши', 1, 1, '50000', 0, 0, 0, 'Вы уверены, что вы хотите попасть на Арену Гурубаши?'),
('50000', 13, 3, 'Восточные королевства', 1, 1, '50000'+5, 0, 0, 0, NULL),
('50000', 14, 3, 'Калимдор', 1, 1, '50000'+6, 0, 0, 0, NULL),
('50000', 15, 3, 'Запределье', 1, 1, '50000'+7, 0, 0, 0, NULL),
('50000', 16, 3, 'Нордскол', 1, 1, '50000'+8, 0, 0, 0, NULL),
('50000', 17, 9, 'Классические подземелья', 1, 1, '50000'+1, 0, 0, 0, NULL),
('50000', 18, 9, 'Подземелья BC', 1, 1, '50000'+2, 0, 0, 0, NULL),
('50000', 19, 9, 'Подземелья WotLK', 1, 1, '50000'+3, 0, 0, 0, NULL),
('50000', 20, 9, 'Рейдовые телепоры', 1, 1, '50000'+4, 0, 0, 0, NULL),
('50000'+1, 0, 2, 'Гномреган', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Гномреган?'),
('50000'+1, 1, 2, 'Мертвые копи', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Мертвые копи?'),
('50000'+1, 2, 2, 'Тюрьма', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Тюрьму?'),
('50000'+1, 3, 2, 'Огненная пропасть', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Огненную пропасть?'),
('50000'+1, 4, 2, 'Курганы Иглошкурых', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Курганы Иглошкурых?'),
('50000'+1, 5, 2, 'Лабиринты Иглошкурых', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Лабиринты Иглошкурых?'),
('50000'+1, 6, 2, 'Монастырь Алого ордена', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Монастырь Алого ордена?'),
('50000'+1, 7, 2, 'Крепость Темного клыка', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Крепость Темного клыка?'),
('50000'+1, 8, 2, 'Пещеры стенаний', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Пещеры стенаний?'),
('50000'+1, 9, 2, 'Непроглядная пучина', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Непроглядную пучину?'),
('50000'+1, 10, 2, 'Глубины Черной горы', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Глубины Черной горы?'),
('50000'+1, 11, 2, 'Пик Черной горы', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Пик Черной горы?'),
('50000'+1, 12, 2, 'Забытый Город', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Забытый Город?'),
('50000'+1, 13, 2, 'Мародон', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Мародон?'),
('50000'+1, 14, 2, 'Некроситет', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Некроситет?'),
('50000'+1, 15, 2, 'Стратхольм', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Стратхольм?'),
('50000'+1, 16, 2, 'Храм Атал\'Хаккара', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Храм Атал\'Хаккара?'),
('50000'+1, 17, 2, 'Ульдаман', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Ульдаман?'),
('50000'+1, 18, 2, 'Зуль\'Фаррак', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Зуль\'Фаррак?'),
('50000'+1, 19, 7, 'Назад...', 1, 1, '50000', 0, 0, 0, NULL),
('50000'+2, 0, 2, 'Аункидоин', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Аункидоин?'),
('50000'+2, 1, 2, 'Пещеры времени', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Пещеры времени?'),
('50000'+2, 2, 2, 'Резервуар Кривого клыка', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Резервуар Кривого клыка?'),
('50000'+2, 3, 2, 'Цитадель Адского Пламени', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Цитадель Адского Пламени?'),
('50000'+2, 4, 2, 'Терраса Магистров', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Терраса Магистров?'),
('50000'+2, 5, 2, 'Крепость Бурь', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Крепость Бурь?'),
('50000'+2, 6, 7, 'Назад...', 1, 1, '50000', 0, 0, 0, NULL),
('50000'+3, 0, 2, 'Азжол-Неруб', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Азжол-Неруб?'),
('50000'+3, 1, 2, 'Пещеры времени: Очищение Стратхольма', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Пещеры времени: Очищение Стратхольма?'),
('50000'+3, 2, 2, 'Испытание Чемпиона', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Испытание Чемпиона?'),
('50000'+3, 3, 2, 'Крепость Драк\'Тарон', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Крепость Драк\'Тарон?'),
('50000'+3, 4, 2, 'Гундрак', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Гундрак?'),
('50000'+3, 5, 2, 'Подземелья Ледяной Короны', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Подземелья Ледяной Короны?'),
('50000'+3, 6, 2, 'Нексус', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Нексус?'),
('50000'+3, 7, 2, 'Аметистовая крепость', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Аметистовую крепость?'),
('50000'+3, 8, 2, 'Чертоги молний', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Чертоги молний?'),
('50000'+3, 9, 2, 'Чертоги камня', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Чертоги камня?'),
('50000'+3, 10, 2, 'Крепость Утгард', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Крепость Утгард?'),
('50000'+3, 11, 2, 'Вершина Утгард', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Вершину Утгард?'),
('50000'+3, 12, 7, 'Назад...', 1, 1, '50000', 0, 0, 0, NULL),
('50000'+4, 0, 2, 'Черный храм', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Черный храм?'),
('50000'+4, 1, 2, 'Логово крыла тьмы', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Логово крыла тьмы?'),
('50000'+4, 2, 2, 'Вершина Хиджала', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Вершина Хиджала?'),
('50000'+4, 3, 2, 'Змеиное святилище', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Змеиное святилище?'),
('50000'+4, 4, 2, 'Испытание крестоносца', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Испытание крестоносца?'),
('50000'+4, 5, 2, 'Логово Груула', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Логово Груула?'),
('50000'+4, 6, 2, 'Логово Матгеридона', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Логово Матгеридона?'),
('50000'+4, 7, 2, 'Цитадель Ледяной Короны', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Цитадель Ледяной Короны?'),
('50000'+4, 8, 2, 'Каражан', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Каражан?'),
('50000'+4, 9, 2, 'Огненные недра', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Огненные недра?'),
('50000'+4, 10, 2, 'Наксрамас', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Наксрамас?'),
('50000'+4, 11, 2, 'Логово Ониксии', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Логово Ониксии?'),
('50000'+4, 12, 2, 'Руины Ан\'Киража', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Руины Ан\'Киража?'),
('50000'+4, 13, 2, 'Плато солнечного колодца', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Плато солнечного колодца?'),
('50000'+4, 14, 2, 'Око', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Око?'),
('50000'+4, 15, 2, 'Храм Ан\'Кираж', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Храм Ан\'Кираж?'),
('50000'+4, 16, 2, 'Око вечности', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Око вечности?'),
('50000'+4, 17, 2, 'Обсидиановое святилище', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Обсидиановое святилище?'),
('50000'+4, 18, 2, 'Ульдуар', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Ульдуар?'),
('50000'+4, 19, 2, 'Склеп Аркавона', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Склеп Аркавона?'),
('50000'+4, 21, 2, 'Зул\'Гуруб', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Зул\'Гуруб?'),
('50000'+4, 22, 2, 'Зул\'Аман', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Зул\'Аман?'),
('50000'+4, 23, 7, 'Назад...', 1, 1, '50000', 0, 0, 0, NULL),
('50000'+5, 0, 2, 'Элвиннский Лес', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Элвиннский Лес?'),
('50000'+5, 1, 2, 'Леса Вечной Песни', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Леса Вечной Песни?'),
('50000'+5, 2, 2, 'Дун Морог', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Дун Морог?'),
('50000'+5, 3, 2, 'Тирисфальские Леса', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Тирисфальские Леса?'),
('50000'+5, 4, 2, 'Призрачные Земли', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Призрачные Земли?'),
('50000'+5, 5, 2, 'Лок Модан', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Лок Модан?'),
('50000'+5, 6, 2, 'Серебрянный Бор', 1, 1, 0, 0, 0, 0, 'Серебрянный Бор?'),
('50000'+5, 7, 2, 'Западный край', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Западный край?'),
('50000'+5, 8, 2, 'Красногорье', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Красногорье?'),
('50000'+5, 9, 2, 'Темнолесье', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Темнолесье?'),
('50000'+5, 10, 2, 'Предгорья Хилсбрада', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Предгорья Хилсбрада?'),
('50000'+5, 11, 2, 'Болотина', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Болотину?'),
('50000'+5, 12, 2, 'Альтеракские горы', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Альтеракские горы?'),
('50000'+5, 13, 2, 'Нагорье Арати', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Нагорье Аратиs?'),
('50000'+5, 14, 2, 'Тернистая долина', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Тернистую долина?'),
('50000'+5, 15, 2, 'Бесплодные земли', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Бесплодные земли?'),
('50000'+5, 16, 2, 'Болото печали', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Болото печали?'),
('50000'+5, 17, 2, 'Внутренние земли', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть во Внутренние земли?'),
('50000'+5, 18, 2, 'Тлеющее ущелье', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Тлеющее ущелье?'),
('50000'+5, 19, 2, 'Выжженные земли', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Выжженные земли?'),
('50000'+5, 20, 2, 'Пылающие степи', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Пылающие степи?'),
('50000'+5, 21, 2, 'Западные Чумные земли', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Западные Чумные земли?'),
('50000'+5, 22, 2, 'Восточные Чумные земли', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Восточные Чумные земли?'),
('50000'+5, 23, 2, 'Остров Кель\'Данас', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Остров Кель\'Данас?'),
('50000'+5, 24, 7, 'Назад...', 1, 1, '50000', 0, 0, 0, NULL),
('50000'+6, 0, 2, 'Остров лазурной дымки', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Остров лазурной дымки?'),
('50000'+6, 1, 2, 'Тельдрассил', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Тельдрассил?'),
('50000'+6, 2, 2, 'Дуротар', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Дуротар?'),
('50000'+6, 3, 2, 'Мулгор', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Мулгор?'),
('50000'+6, 4, 2, 'Остров кровавой дымки', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Остров кровавой дымки?'),
('50000'+6, 5, 2, 'Темные берега', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Темные берега?'),
('50000'+6, 6, 2, 'Степи', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Степи?'),
('50000'+6, 7, 2, 'Когтистые горы', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Когтистые горы?'),
('50000'+6, 8, 2, 'Ясеневый лес', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Ясеневый лес?'),
('50000'+6, 9, 2, 'Тысяча игл', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Тысячу игл?'),
('50000'+6, 10, 2, 'Пустоши', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Пустоши?'),
('50000'+6, 11, 2, 'Пылевые топи', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Пылевые топи?'),
('50000'+6, 12, 2, 'Фералас', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Фералас?'),
('50000'+6, 13, 2, 'Танарис', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Танарис?'),
('50000'+6, 14, 2, 'Азшара', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Азшару?'),
('50000'+6, 15, 2, 'Оскверненный лес', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Оскверненный лес?'),
('50000'+6, 16, 2, 'Кратер Ун\'Горо', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Кратер Ун\'Горо?'),
('50000'+6, 17, 2, 'Силитус', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Силитус?'),
('50000'+6, 18, 2, 'Зимние ключи', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Зимние ключи?'),
('50000'+6, 19, 7, 'Назад...', 1, 1, '50000', 0, 0, 0, NULL),
('50000'+7, 0, 2, 'Полуостров Адского пламени', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Полуостров Адского пламени?'),
('50000'+7, 1, 2, 'Зангартопь', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Зангартопь?'),
('50000'+7, 2, 2, 'Лес Тероккар', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Лес Тероккар?'),
('50000'+7, 3, 2, 'Награнд', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Награнд?'),
('50000'+7, 4, 2, 'Острогорье', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Острогорье?'),
('50000'+7, 5, 2, 'Пустоверть', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Пустоверть?'),
('50000'+7, 6, 2, 'Долина призрачной луны', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Долину призрачной луны?'),
('50000'+7, 7, 7, 'Назад...', 1, 1, '50000', 0, 0, 0, NULL),
('50000'+8, 0, 2, 'Борейская тундра', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Борейскую тундру?'),
('50000'+8, 1, 2, 'Ревущий фьорд', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Ревущий фьорд?'),
('50000'+8, 2, 2, 'Драконий погост', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Драконий погост?'),
('50000'+8, 3, 2, 'Седые холмы', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Седые холмы?'),
('50000'+8, 4, 2, 'Зул\'Драк', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Зул\'Драк?'),
('50000'+8, 5, 2, 'Низина Шолазар', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Низину Шолазар?'),
('50000'+8, 6, 2, 'Хрустальная песня', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Хрустальную песню?'),
('50000'+8, 7, 2, 'Грозовая гряда', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Грозовую гряду?'),
('50000'+8, 8, 2, 'Ледяная корона', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть в Ледяную корону?'),
('50000'+8, 9, 2, 'Озеро ледяных оков', 1, 1, 0, 0, 0, 0, 'Вы уверены, что вы хотите попасть на Озеро ледяных оков?'),
('50000'+8, 10, 7, 'Назад...', 1, 1, '50000', 0, 0, 0, NULL);


INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES 
('100000', 0, 1, 0, 62, 0, 100, 0, '50000', 1, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -8842.09, 626.358, 94.0867, 3.61363, 'Teleporter script'),
('100000', 0, 2, 0, 62, 0, 100, 0, '50000', 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1601.08, -4378.69, 9.9846, 2.14362, 'Teleporter script'),
('100000', 0, 3, 0, 62, 0, 100, 0, '50000', 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -14281.9, 552.564, 8.90422, 0.860144, 'Teleporter script'),
('100000', 0, 4, 0, 62, 0, 100, 0, '50000', 10, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -1887.62, 5359.09, -12.4279, 4.40435, 'Teleporter script'),
('100000', 0, 5, 0, 62, 0, 100, 0, '50000', 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 5809.55, 503.975, 657.526, 2.38338, 'Teleporter script'),
('100000', 0, 6, 0, 62, 0, 100, 0, '50000', 12, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -13181.8, 339.356, 42.9805, 1.18013, 'Teleporter script'),
('100000', 0, 7, 0, 62, 0, 100, 0, '50000', 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 9869.91, 2493.58, 1315.88, 2.78897, 'Teleporter script'),
('100000', 0, 8, 0, 62, 0, 100, 0, '50000', 4, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -4900.47, -962.585, 501.455, 5.40538, 'Teleporter script'),
('100000', 0, 9, 0, 62, 0, 100, 0, '50000', 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -3864.92, -11643.7, -137.644, 5.50862, 'Teleporter script'),
('100000', 0, 10, 0, 62, 0, 100, 0, '50000', 6, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -1274.45, 71.8601, 128.159, 2.80623, 'Teleporter script'),
('100000', 0, 11, 0, 62, 0, 100, 0, '50000', 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1633.75, 240.167, -43.1034, 6.26128, 'Teleporter script'),
('100000', 0, 12, 0, 62, 0, 100, 0, '50000', 8, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 9738.28, -7454.19, 13.5605, 0.043914, 'Teleporter script'),
('100000', 0, 13, 0, 62, 0, 100, 0, '50000'+1, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -5163.54, 925.423, 257.181, 1.57423, 'Teleporter script'),
('100000', 0, 14, 0, 62, 0, 100, 0, '50000'+1, 1, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -11209.6, 1666.54, 24.6974, 1.42053, 'Teleporter script'),
('100000', 0, 15, 0, 62, 0, 100, 0, '50000'+1, 2, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -8799.15, 832.718, 97.6348, 6.04085, 'Teleporter script'),
('100000', 0, 16, 0, 62, 0, 100, 0, '50000'+1, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1811.78, -4410.5, -18.4704, 5.20165, 'Teleporter script'),
('100000', 0, 17, 0, 62, 0, 100, 0, '50000'+1, 4, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -4657.3, -2519.35, 81.0529, 4.54808, 'Teleporter script'),
('100000', 0, 18, 0, 62, 0, 100, 0, '50000'+1, 5, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -4470.28, -1677.77, 81.3925, 1.16302, 'Teleporter script'),
('100000', 0, 19, 0, 62, 0, 100, 0, '50000'+1, 6, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 2873.15, -764.523, 160.332, 5.10447, 'Teleporter script'),
('100000', 0, 20, 0, 62, 0, 100, 0, '50000'+1, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -234.675, 1561.63, 76.8921, 1.24031, 'Teleporter script'),
('100000', 0, 21, 0, 62, 0, 100, 0, '50000'+1, 8, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -731.607, -2218.39, 17.0281, 2.78486, 'Teleporter script'),
('100000', 0, 22, 0, 62, 0, 100, 0, '50000'+1, 9, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 4249.99, 740.102, -25.671, 1.34062, 'Teleporter script'),
('100000', 0, 23, 0, 62, 0, 100, 0, '50000'+1, 10, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -7179.34, -921.212, 165.821, 5.09599, 'Teleporter script'),
('100000', 0, 24, 0, 62, 0, 100, 0, '50000'+1, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -7527.05, -1226.77, 285.732, 5.29626, 'Teleporter script'),
('100000', 0, 25, 0, 62, 0, 100, 0, '50000'+1, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -3520.14, 1119.38, 161.025, 4.70454, 'Teleporter script'),
('100000', 0, 26, 0, 62, 0, 100, 0, '50000'+1, 13, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -1421.42, 2907.83, 137.415, 1.70718, 'Teleporter script'),
('100000', 0, 27, 0, 62, 0, 100, 0, '50000'+1, 14, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1269.64, -2556.21, 93.6088, 0.620623, 'Teleporter script'),
('100000', 0, 28, 0, 62, 0, 100, 0, '50000'+1, 15, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3352.92, -3379.03, 144.782, 6.25978, 'Teleporter script'),
('100000', 0, 29, 0, 62, 0, 100, 0, '50000'+1, 16, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -10177.9, -3994.9, -111.239, 6.01885, 'Teleporter script'),
('100000', 0, 30, 0, 62, 0, 100, 0, '50000'+1, 17, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -6071.37, -2955.16, 209.782, 0.015708, 'Teleporter script'),
('100000', 0, 31, 0, 62, 0, 100, 0, '50000'+1, 18, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -6801.19, -2893.02, 9.00388, 0.158639, 'Teleporter script'),
('100000', 0, 32, 0, 62, 0, 100, 0, '50000'+2, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -3324.49, 4943.45, -101.239, 4.63901, 'Teleporter script'),
('100000', 0, 33, 0, 62, 0, 100, 0, '50000'+2, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -8369.65, -4253.11, -204.272, -2.70526, 'Teleporter script'),
('100000', 0, 34, 0, 62, 0, 100, 0, '50000'+2, 2, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 738.865, 6865.77, -69.4659, 6.27655, 'Teleporter script'),
('100000', 0, 35, 0, 62, 0, 100, 0, '50000'+2, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -347.29, 3089.82, 21.394, 5.68114, 'Teleporter script'),
('100000', 0, 36, 0, 62, 0, 100, 0, '50000'+2, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 12884.6, -7317.69, 65.5023, 4.799, 'Teleporter script'),
('100000', 0, 37, 0, 62, 0, 100, 0, '50000'+2, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3100.48, 1536.49, 190.3, 4.62226, 'Teleporter script'),
('100000', 0, 38, 0, 62, 0, 100, 0, '50000'+3, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3707.86, 2150.23, 36.76, 3.22, 'Teleporter script'),
('100000', 0, 39, 0, 62, 0, 100, 0, '50000'+3, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -8756.39, -4440.68, -199.489, 4.66289, 'Teleporter script'),
('100000', 0, 40, 0, 62, 0, 100, 0, '50000'+3, 2, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8590.95, 791.792, 558.235, 3.13127, 'Teleporter script'),
('100000', 0, 41, 0, 62, 0, 100, 0, '50000'+3, 3, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 4765.59, -2038.24, 229.363, 0.887627, 'Teleporter script'),
('100000', 0, 42, 0, 62, 0, 100, 0, '50000'+3, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 6722.44, -4640.67, 450.632, 3.91123, 'Teleporter script'),
('100000', 0, 43, 0, 62, 0, 100, 0, '50000'+3, 5, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 5643.16, 2028.81, 798.274, 4.60242, 'Teleporter script'),
('100000', 0, 44, 0, 62, 0, 100, 0, '50000'+3, 6, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3782.89, 6965.23, 105.088, 6.14194, 'Teleporter script'),
('100000', 0, 45, 0, 62, 0, 100, 0, '50000'+3, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 5693.08, 502.588, 652.672, 4.0229, 'Teleporter script'),
('100000', 0, 46, 0, 62, 0, 100, 0, '50000'+3, 8, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 9136.52, -1311.81, 1066.29, 5.19113, 'Teleporter script'),
('100000', 0, 47, 0, 62, 0, 100, 0, '50000'+3, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8922.12, -1009.16, 1039.56, 1.57044, 'Teleporter script'),
('100000', 0, 48, 0, 62, 0, 100, 0, '50000'+3, 10, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1203.41, -4868.59, 41.2486, 0.283237, 'Teleporter script'),
('100000', 0, 49, 0, 62, 0, 100, 0, '50000'+3, 11, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1267.24, -4857.3, 215.764, 3.22768, 'Teleporter script'),
('100000', 0, 50, 0, 62, 0, 100, 0, '50000'+4, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -3649.92, 317.469, 35.2827, 2.94285, 'Teleporter script'),
('100000', 0, 51, 0, 62, 0, 100, 0, '50000'+4, 1, 0, 0, 62, 229, 0, 0, 0, 0, 0, 0, 8, 0, 0, 152.451, -474.881, 116.84, 0.001073, 'Teleporter script'),
('100000', 0, 52, 0, 62, 0, 100, 0, '50000'+4, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -8177.89, -4181.23, -167.552, 0.913338, 'Teleporter script'),
('100000', 0, 53, 0, 62, 0, 100, 0, '50000'+4, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 797.855, 6865.77, -65.4165, 0.005938, 'Teleporter script'),
('100000', 0, 54, 0, 62, 0, 100, 0, '50000'+4, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8515.61, 714.153, 558.248, 1.57753, 'Teleporter script'),
('100000', 0, 55, 0, 62, 0, 100, 0, '50000'+4, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3530.06, 5104.08, 3.50861, 5.51117, 'Teleporter script'),
('100000', 0, 56, 0, 62, 0, 100, 0, '50000'+4, 6, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -336.411, 3130.46, -102.928, 5.20322, 'Teleporter script'),
('100000', 0, 57, 0, 62, 0, 100, 0, '50000'+4, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 5855.22, 2102.03, 635.991, 3.57899, 'Teleporter script'),
('100000', 0, 58, 0, 62, 0, 100, 0, '50000'+4, 8, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -11118.9, -2010.33, 47.0819, 0.649895, 'Teleporter script'),
('100000', 0, 59, 0, 62, 0, 100, 0, '50000'+4, 9, 0, 0, 62, 230, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1126.64, -459.94, -102.535, 3.46095, 'Teleporter script'),
('100000', 0, 60, 0, 62, 0, 100, 0, '50000'+4, 10, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3668.72, -1262.46, 243.622, 4.785, 'Teleporter script'),
('100000', 0, 61, 0, 62, 0, 100, 0, '50000'+4, 11, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -4708.27, -3727.64, 54.5589, 3.72786, 'Teleporter script'),
('100000', 0, 62, 0, 62, 0, 100, 0, '50000'+4, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -8409.82, 1499.06, 27.7179, 2.51868, 'Teleporter script'),
('100000', 0, 63, 0, 62, 0, 100, 0, '50000'+4, 13, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 12574.1, -6774.81, 15.0904, 3.13788, 'Teleporter script'),
('100000', 0, 64, 0, 62, 0, 100, 0, '50000'+4, 14, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3088.49, 1381.57, 184.863, 4.61973, 'Teleporter script'),
('100000', 0, 65, 0, 62, 0, 100, 0, '50000'+4, 15, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -8240.09, 1991.32, 129.072, 0.941603, 'Teleporter script'),
('100000', 0, 66, 0, 62, 0, 100, 0, '50000'+4, 16, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3784.17, 7028.84, 161.258, 5.79993, 'Teleporter script'),
('100000', 0, 67, 0, 62, 0, 100, 0, '50000'+4, 17, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3472.43, 264.923, -120.146, 3.27923, 'Teleporter script'),
('100000', 0, 68, 0, 62, 0, 100, 0, '50000'+4, 18, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 9222.88, -1113.59, 1216.12, 6.27549, 'Teleporter script'),
('100000', 0, 69, 0, 62, 0, 100, 0, '50000'+4, 19, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 5453.72, 2840.79, 421.28, 0, 'Teleporter script'),
('100000', 0, 70, 0, 62, 0, 100, 0, '50000'+4, 21, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -11916.7, -1215.72, 92.289, 4.72454, 'Teleporter script'),
('100000', 0, 71, 0, 62, 0, 100, 0, '50000'+4, 22, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 6851.78, -7972.57, 179.242, 4.64691, 'Teleporter script'),
('100000', 0, 72, 0, 62, 0, 100, 0, '50000'+5, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -9449.06, 64.8392, 56.3581, 3.07047, 'Teleporter script'),
('100000', 0, 73, 0, 62, 0, 100, 0, '50000'+5, 1, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 9024.37, -6682.55, 16.8973, 3.14131, 'Teleporter script'),
('100000', 0, 74, 0, 62, 0, 100, 0, '50000'+5, 2, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -5603.76, -482.704, 396.98, 5.23499, 'Teleporter script'),
('100000', 0, 75, 0, 62, 0, 100, 0, '50000'+5, 3, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 2274.95, 323.918, 34.1137, 4.24367, 'Teleporter script'),
('100000', 0, 76, 0, 62, 0, 100, 0, '50000'+5, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 7595.73, -6819.6, 84.3718, 2.56561, 'Teleporter script'),
('100000', 0, 77, 0, 62, 0, 100, 0, '50000'+5, 5, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -5405.85, -2894.15, 341.972, 5.48238, 'Teleporter script'),
('100000', 0, 78, 0, 62, 0, 100, 0, '50000'+5, 6, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 505.126, 1504.63, 124.808, 1.77987, 'Teleporter script'),
('100000', 0, 79, 0, 62, 0, 100, 0, '50000'+5, 7, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -10684.9, 1033.63, 32.5389, 6.07384, 'Teleporter script'),
('100000', 0, 80, 0, 62, 0, 100, 0, '50000'+5, 8, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -9447.8, -2270.85, 71.8224, 0.283853, 'Teleporter script'),
('100000', 0, 81, 0, 62, 0, 100, 0, '50000'+5, 9, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -10531.7, -1281.91, 38.8647, 1.56959, 'Teleporter script'),
('100000', 0, 82, 0, 62, 0, 100, 0, '50000'+5, 10, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -385.805, -787.954, 54.6655, 1.03926, 'Teleporter script'),
('100000', 0, 83, 0, 62, 0, 100, 0, '50000'+5, 11, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -3517.75, -913.401, 8.86625, 2.60705, 'Teleporter script'),
('100000', 0, 84, 0, 62, 0, 100, 0, '50000'+5, 12, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 275.049, -652.044, 130.296, 0.502032, 'Teleporter script'),
('100000', 0, 85, 0, 62, 0, 100, 0, '50000'+5, 13, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -1581.45, -2704.06, 35.4168, 0.490373, 'Teleporter script'),
('100000', 0, 86, 0, 62, 0, 100, 0, '50000'+5, 14, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -11921.7, -59.544, 39.7262, 3.73574, 'Teleporter script'),
('100000', 0, 87, 0, 62, 0, 100, 0, '50000'+5, 15, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -6782.56, -3128.14, 240.48, 5.65912, 'Teleporter script'),
('100000', 0, 88, 0, 62, 0, 100, 0, '50000'+5, 16, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -10368.6, -2731.3, 21.6537, 5.29238, 'Teleporter script'),
('100000', 0, 89, 0, 62, 0, 100, 0, '50000'+5, 17, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 112.406, -3929.74, 136.358, 0.981903, 'Teleporter script'),
('100000', 0, 90, 0, 62, 0, 100, 0, '50000'+5, 18, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -6686.33, -1198.55, 240.027, 0.916887, 'Teleporter script'),
('100000', 0, 91, 0, 62, 0, 100, 0, '50000'+5, 19, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -11184.7, -3019.31, 7.29238, 3.20542, 'Teleporter script'),
('100000', 0, 92, 0, 62, 0, 100, 0, '50000'+5, 20, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, -7979.78, -2105.72, 127.919, 5.10148, 'Teleporter script'),
('100000', 0, 93, 0, 62, 0, 100, 0, '50000'+5, 21, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1743.69, -1723.86, 59.6648, 5.23722, 'Teleporter script'),
('100000', 0, 94, 0, 62, 0, 100, 0, '50000'+5, 22, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 2280.64, -5275.05, 82.0166, 4.7479, 'Teleporter script'),
('100000', 0, 95, 0, 62, 0, 100, 0, '50000'+5, 23, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 12806.5, -6911.11, 41.1156, 2.22935, 'Teleporter script'),
('100000', 0, 96, 0, 62, 0, 100, 0, '50000'+6, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -4192.62, -12576.7, 36.7598, 1.62813, 'Teleporter script'),
('100000', 0, 97, 0, 62, 0, 100, 0, '50000'+6, 1, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 9889.03, 915.869, 1307.43, 1.9336, 'Teleporter script'),
('100000', 0, 98, 0, 62, 0, 100, 0, '50000'+6, 2, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 228.978, -4741.87, 10.1027, 0.416883, 'Teleporter script'),
('100000', 0, 99, 0, 62, 0, 100, 0, '50000'+6, 3, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -2473.87, -501.225, -9.42465, 0.6525, 'Teleporter script'),
('100000', 0, 100, 0, 62, 0, 100, 0, '50000'+6, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -2095.7, -11841.1, 51.1557, 6.19288, 'Teleporter script'),
('100000', 0, 101, 0, 62, 0, 100, 0, '50000'+6, 5, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 6463.25, 683.986, 8.92792, 4.33534, 'Teleporter script'),
('100000', 0, 102, 0, 62, 0, 100, 0, '50000'+6, 6, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -575.772, -2652.45, 95.6384, 0.006469, 'Teleporter script'),
('100000', 0, 103, 0, 62, 0, 100, 0, '50000'+6, 7, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1574.89, 1031.57, 137.442, 3.8013, 'Teleporter script'),
('100000', 0, 104, 0, 62, 0, 100, 0, '50000'+6, 8, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1919.77, -2169.68, 94.6729, 6.14177, 'Teleporter script'),
('100000', 0, 105, 0, 62, 0, 100, 0, '50000'+6, 9, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -5375.53, -2509.2, -40.432, 2.41885, 'Teleporter script'),
('100000', 0, 106, 0, 62, 0, 100, 0, '50000'+6, 10, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -656.056, 1510.12, 88.3746, 3.29553, 'Teleporter script'),
('100000', 0, 107, 0, 62, 0, 100, 0, '50000'+6, 11, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -3350.12, -3064.85, 33.0364, 5.12666, 'Teleporter script'),
('100000', 0, 108, 0, 62, 0, 100, 0, '50000'+6, 12, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -4808.31, 1040.51, 103.769, 2.90655, 'Teleporter script'),
('100000', 0, 109, 0, 62, 0, 100, 0, '50000'+6, 13, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -6940.91, -3725.7, 48.9381, 3.11174, 'Teleporter script'),
('100000', 0, 110, 0, 62, 0, 100, 0, '50000'+6, 14, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3117.12, -4387.97, 91.9059, 5.49897, 'Teleporter script'),
('100000', 0, 111, 0, 62, 0, 100, 0, '50000'+6, 15, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3898.8, -1283.33, 220.519, 6.24307, 'Teleporter script'),
('100000', 0, 112, 0, 62, 0, 100, 0, '50000'+6, 16, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -6291.55, -1158.62, -258.138, 0.457099, 'Teleporter script'),
('100000', 0, 113, 0, 62, 0, 100, 0, '50000'+6, 17, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, -6815.25, 730.015, 40.9483, 2.39066, 'Teleporter script'),
('100000', 0, 114, 0, 62, 0, 100, 0, '50000'+6, 18, 0, 0, 62, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0, 6658.57, -4553.48, 718.019, 5.18088, 'Teleporter script'),
('100000', 0, 115, 0, 62, 0, 100, 0, '50000'+7, 0, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -207.335, 2035.92, 96.464, 1.59676, 'Teleporter script'),
('100000', 0, 116, 0, 62, 0, 100, 0, '50000'+7, 1, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -220.297, 5378.58, 23.3223, 1.61718, 'Teleporter script'),
('100000', 0, 117, 0, 62, 0, 100, 0, '50000'+7, 2, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -2266.23, 4244.73, 1.47728, 3.68426, 'Teleporter script'),
('100000', 0, 118, 0, 62, 0, 100, 0, '50000'+7, 3, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -1610.85, 7733.62, -17.2773, 1.33522, 'Teleporter script'),
('100000', 0, 119, 0, 62, 0, 100, 0, '50000'+7, 4, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 2029.75, 6232.07, 133.495, 1.30395, 'Teleporter script'),
('100000', 0, 120, 0, 62, 0, 100, 0, '50000'+7, 5, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, 3271.2, 3811.61, 143.153, 3.44101, 'Teleporter script'),
('100000', 0, 121, 0, 62, 0, 100, 0, '50000'+7, 6, 0, 0, 62, 530, 0, 0, 0, 0, 0, 0, 8, 0, 0, -3681.01, 2350.76, 76.587, 4.25995, 'Teleporter script'),
('100000', 0, 122, 0, 62, 0, 100, 0, '50000'+8, 0, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 2954.24, 5379.13, 60.4538, 2.55544, 'Teleporter script'),
('100000', 0, 123, 0, 62, 0, 100, 0, '50000'+8, 1, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 682.848, -3978.3, 230.161, 1.54207, 'Teleporter script'),
('100000', 0, 124, 0, 62, 0, 100, 0, '50000'+8, 2, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 2678.17, 891.826, 4.37494, 0.101121, 'Teleporter script'),
('100000', 0, 125, 0, 62, 0, 100, 0, '50000'+8, 3, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 4017.35, -3403.85, 290, 5.35431, 'Teleporter script'),
('100000', 0, 126, 0, 62, 0, 100, 0, '50000'+8, 4, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 5560.23, -3211.66, 371.709, 5.55055, 'Teleporter script'),
('100000', 0, 127, 0, 62, 0, 100, 0, '50000'+8, 5, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 5614.67, 5818.86, -69.722, 3.60807, 'Teleporter script'),
('100000', 0, 128, 0, 62, 0, 100, 0, '50000'+8, 6, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 5411.17, -966.37, 167.082, 1.57167, 'Teleporter script'),
('100000', 0, 129, 0, 62, 0, 100, 0, '50000'+8, 7, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 6120.46, -1013.89, 408.39, 5.12322, 'Teleporter script'),
('100000', 0, 130, 0, 62, 0, 100, 0, '50000'+8, 8, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 8323.28, 2763.5, 655.093, 2.87223, 'Teleporter script'),
('100000', 0, 131, 0, 62, 0, 100, 0, '50000'+8, 9, 0, 0, 62, 571, 0, 0, 0, 0, 0, 0, 8, 0, 0, 4522.23, 2828.01, 389.975, 0.215009, 'Teleporter script');

DELETE FROM `trinity_string` WHERE `entry` IN (11002,11003,11004,11005,11006,11007);
INSERT INTO `trinity_string`(`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`) VALUES ('11002','You can\'t do this at the moment.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы не можете сделать это сейчас.');
INSERT INTO `trinity_string`(`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`) VALUES ('11003','You are not VIP.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы не владеете правами VIP аккаунта.');
INSERT INTO `trinity_string`(`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`) VALUES ('11004','You are not VIP.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вам недоступна эта VIP команда.');
INSERT INTO `trinity_string`(`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`) VALUES ('11005','You cannot say, yell or emote until you will play %d minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы не сможете говорить, кричать, использовать эмоции, пока вы не проведете в онлайне %d минут.');
INSERT INTO `trinity_string`(`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`) VALUES ('11006','You cannot whisper until you will play %d minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы не сможете шептать, пока вы не проведете в онлайне %d минут.');
INSERT INTO `trinity_string`(`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`) VALUES ('11007','You cannot write to channels until you will play %d. minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы не сможете писать в каналы, пока вы не проведете в онлайне %d минут.');

REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('anticheat global', '2', 'Syntax: .anticheat 
global returns the total amount reports and the average. (top three players)'), ('anticheat player', '2', 
'Syntax: .anticheat player $name returns the players''s total amount of warnings, the average and the 
amount of each cheat type.'), ('anticheat handle', '2', 'Syntax: .anticheat handle [on|off] Turn on/off the 
AntiCheat-Detection .'),
('anticheat delete', '2', 'Syntax: .anticheat delete [deleteall|$name] Deletes the report records of all the players or deletes all the reports of player $name.');


DELETE FROM gameobject WHERE 
       id IN (192317,192335,192313,192316,192332,192331,192330,192329,192487,192310,192314,192308,192309,192324,192326,192312,192325,192304,187433,193984,193983,192377,192321,192318,192322,192320,192269,192273,192274,192277,192278,192280,192283,192284,192285,192289,192290,192336,192338,192339,192349,192350,192351,192352,192353,192354,192355,192356,192357,192358,192359,192360,192361,192362,192363,192364,192366,192367,192368,192369,192370,192371,192372,192373,192374,192375,192378,192379,192406,192407,192414,192416,192417,192418,192429,192433,192434,192435,192458,192459,192460,192461,192488,192501,192254,192255,192688,192686,180398,193764,193762,192319,192287,192323,192305,192286,192334,192307,192306,192328,192252,192253,192292,192299,192327,192267,192449,192450) 
          AND map=571;
INSERT INTO `gameobject` VALUES (NULL, 192317, 571, 1, 385, 5363.39, 2781.28, 435.634, 1.58825, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192335, 571, 1, 385, 5363.72, 2763.25, 445.023, -1.54462, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192313, 571, 1, 1, 5392.65, 3037.11, 433.713, -1.52716, 0, 0, -0.691512, 0.722365, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192316, 571, 1, 385, 5322.01, 2781.13, 435.673, 1.57952, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192332, 571, 1, 1, 5289.46, 2704.68, 435.875, -0.017451, 0, 0, -0.00872539, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192331, 571, 1, 1, 5350.95, 2640.36, 435.408, 1.5708, 0, 0, 0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192330, 571, 1, 1, 5392.27, 2639.74, 435.331, 1.50971, 0, 0, 0.685183, 0.728371, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192329, 571, 1, 1, 5350.88, 2622.72, 444.686, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5278.38, 2613.83, 432.721, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5260.82, 2631.8, 433.324, 3.05433, 0, 0, 0.999048, 0.0436174, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192310, 571, 1, 1, 5271.8, 2704.87, 445.183, -3.13286, 0, 0, -0.99999, 0.00436634, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192314, 571, 1, 1, 5236.27, 2739.46, 444.992, -1.59698, 0, 0, -0.716303, 0.697789, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5163.78, 2729.68, 432.009, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192308, 571, 1, 1, 5237.07, 2757.03, 435.796, 1.51844, 0, 0, 0.688356, 0.725373, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192309, 571, 1, 1, 5235.34, 2924.34, 435.04, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5262.54, 3047.95, 430.979, 3.10665, 0, 0, 0.999847, 0.0174704, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5163.13, 2952.59, 433.503, 1.53589, 0, 0, 0.694658, 0.71934, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192324, 571, 1, 1, 5235.19, 2942, 443.948, 1.58825, 0, 0, 0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192326, 571, 1, 1, 5272.73, 2976.55, 443.81, 3.12412, 0, 0, 0.999962, 0.00873622, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192312, 571, 1, 1, 5352.37, 3037.09, 435.252, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192325, 571, 1, 1, 5290.35, 2976.56, 435.221, 0.017452, 0, 0, 0.00872589, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192304, 571, 1, 385, 5397.76, 2873.08, 455.321, 3.10665, 0, 0, 0.999847, 0.0174704, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 187433, 571, 1, 1, 2832.84, 6184.45, 84.6827, -2.58308, 0, 0, 0, 0, 300, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 187433, 571, 1, 1, 2835.96, 6180.37, 84.6827, 1.50098, 0, 0, 0, 0, 180, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 187433, 571, 1, 1, 2830.12, 6188.96, 84.6827, -0.855211, 0, 0, 0, 0, 300, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 187433, 571, 1, 1, 2831.88, 6188.72, 84.6827, -1.65806, 0, 0, 0, 0, 300, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 193984, 571, 1, 1, 7647.47, 2055.55, 599.399, -0.279252, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193984, 571, 1, 1, 7647.42, 2065.23, 599.308, 0.279252, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193984, 571, 1, 1, 7609.86, 2055.53, 599.494, -2.86234, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193984, 571, 1, 1, 7610.18, 2065.31, 599.426, 2.87979, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193983, 571, 1, 1, 7906.95, 2053.04, 599.626, -0.296705, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193983, 571, 1, 1, 7907.01, 2063.02, 599.587, 0.261798, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193983, 571, 1, 1, 7870.43, 2053.35, 599.669, -2.87979, 0, 0, 0, 0, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193983, 571, 1, 1, 7870.36, 2063.25, 599.628, 2.86234, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192377, 571, 1, 1, 5414.19, 3069.8, 415.187, 1.64061, 0, 0, 0, 0, 5, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 192321, 571, 1, 385, 5288.85, 2861.82, 435.591, 0.026179, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192318, 571, 1, 385, 5322.25, 2898.95, 435.643, -1.57952, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192322, 571, 1, 385, 5322.89, 2917.14, 445.154, 1.56207, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192320, 571, 1, 385, 5289.05, 2820.23, 435.674, 0, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192269, 571, 1, 1, 4526.46, 2810.18, 391.2, -2.99322, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192273, 571, 1, 1, 4417.94, 2324.81, 371.577, 3.08051, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192274, 571, 1, 1, 4424.15, 3286.54, 371.546, 3.12412, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192277, 571, 1, 1, 4572.93, 3475.52, 363.009, 1.42244, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192278, 571, 1, 1, 4433.9, 3534.14, 360.275, -1.85005, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192280, 571, 1, 1, 4857.97, 3335.44, 368.881, -2.94959, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192283, 571, 1, 1, 5006.34, 3280.4, 371.163, 2.22529, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192284, 571, 1, 65, 5372.48, 2862.5, 409.049, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192285, 571, 1, 65, 5371.49, 2820.8, 409.177, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192289, 571, 1, 1, 4778.19, 2438.06, 345.644, -2.94088, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 1, 5024.57, 2532.75, 344.023, -1.93732, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192336, 571, 1, 1, 5154.49, 2862.15, 445.012, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192338, 571, 1, 65, 5397.76, 2873.08, 455.461, 3.10665, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192339, 571, 1, 65, 5397.39, 2809.33, 455.344, 3.10665, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192349, 571, 1, 1, 5155.31, 2820.74, 444.979, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192350, 571, 1, 1, 5270.69, 2861.78, 445.058, -3.11539, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192351, 571, 1, 1, 5271.28, 2820.16, 445.201, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192352, 571, 1, 1, 5173.02, 2820.93, 435.72, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192353, 571, 1, 1, 5172.11, 2862.57, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192354, 571, 1, 1, 5288.41, 2861.79, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192355, 571, 1, 1, 5288.92, 2820.22, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192356, 571, 1, 1, 5237.07, 2757.03, 435.796, 1.51844, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192357, 571, 1, 1, 5235.34, 2924.34, 435.04, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192358, 571, 1, 65, 5322.23, 2899.43, 435.808, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192359, 571, 1, 65, 5364.35, 2899.4, 435.839, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192360, 571, 1, 65, 5352.37, 3037.09, 435.252, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192361, 571, 1, 65, 5392.65, 3037.11, 433.713, -1.52716, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192362, 571, 1, 65, 5322.12, 2763.61, 444.974, -1.55334, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192363, 571, 1, 65, 5363.61, 2763.39, 445.024, -1.54462, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192364, 571, 1, 1, 5350.88, 2622.72, 444.686, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192366, 571, 1, 1, 5236.27, 2739.46, 444.992, -1.59698, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192367, 571, 1, 1, 5271.8, 2704.87, 445.183, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192368, 571, 1, 65, 5289.46, 2704.68, 435.875, -0.017451, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192369, 571, 1, 1, 5350.95, 2640.36, 435.408, 1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192370, 571, 1, 1, 5392.27, 2639.74, 435.331, 1.50971, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192371, 571, 1, 65, 5364.29, 2916.94, 445.331, 1.57952, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192372, 571, 1, 65, 5322.86, 2916.95, 445.154, 1.56207, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192373, 571, 1, 1, 5290.35, 2976.56, 435.221, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192374, 571, 1, 1, 5272.94, 2976.55, 444.492, 3.12412, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192375, 571, 1, 1, 5235.19, 2941.9, 444.278, 1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192378, 571, 1, 65, 5322.02, 2781.13, 435.811, 1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192379, 571, 1, 65, 5363.42, 2781.03, 435.763, 1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192406, 571, 1, 1, 4438.3, 3361.08, 371.568, -0.017451, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192407, 571, 1, 1, 4448.17, 3235.63, 370.412, -1.56207, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192414, 571, 1, 1, 4387.62, 2719.57, 389.935, -1.54462, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192416, 571, 1, 1, 4408.57, 2422.61, 377.179, 1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192417, 571, 1, 1, 4416.59, 2414.08, 377.196, 0, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 4417.25, 2301.14, 377.214, 0.026179, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192429, 571, 1, 1, 4464.12, 2855.45, 406.111, 0.829032, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192433, 571, 1, 1, 4401.63, 3377.46, 363.365, 1.55334, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192434, 571, 1, 1, 5041.61, 3294.4, 382.15, -1.63188, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192435, 571, 1, 1, 4855.63, 3297.62, 376.739, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192458, 571, 1, 1, 4811.4, 2441.9, 358.207, -2.0333, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192459, 571, 1, 1, 4805.67, 2407.48, 358.191, 1.78023, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192460, 571, 1, 1, 5004.35, 2486.36, 358.449, 2.17294, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4983.28, 2503.09, 358.177, -0.427603, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5160.34, 2798.61, 430.769, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5158.81, 2883.13, 431.618, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5278.38, 2613.83, 433.409, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5260.82, 2631.8, 433.324, 3.05433, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5163.13, 2952.59, 433.503, 1.53589, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5145.11, 2935, 433.386, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5262.54, 3047.95, 432.055, 3.10665, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5146.04, 2747.21, 433.584, 3.07177, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5163.78, 2729.68, 433.394, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4398.82, 2804.7, 429.792, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4416, 2822.67, 429.851, -0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4559.11, 3606.22, 419.999, -1.48353, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4539.42, 3622.49, 420.034, -3.07177, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4555.26, 3641.65, 419.974, 1.67551, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4574.87, 3625.91, 420.079, 0.087266, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4466.79, 1960.42, 459.144, 1.15192, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4475.35, 1937.03, 459.07, -0.436332, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4451.76, 1928.1, 459.076, -2.00713, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4442.99, 1951.9, 459.093, 2.74016, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192254, 571, 1, 1, 5154.46, 2828.94, 409.189, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192255, 571, 1, 1, 5154.52, 2853.31, 409.183, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192688, 571, 1, 1, 5916.1, 566.209, 639.625, -2.72271, 0, 0, 0, 1, 180, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 192686, 571, 1, 1, 5664.81, 791.002, 653.698, -0.663223, 0, 0, 0, 1, 180, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 180398, 571, 1, 1, 5665.02, 790.2, 653.698, -0.610864, 0, 0, 0, 1, 180, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 256, 4855.63, 3297.62, 376.281, -3.13286, 0, 0, -0.99999, 0.00436634, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4526.46, 2810.18, 391.2, -2.99322, 0, 0, -0.997249, 0.0741182, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 256, 4517.75, 2717.23, 387.812, -1.53589, 0, 0, -0.694658, 0.71934, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4475.35, 1937.03, 459.07, -0.436332, 0, 0, -0.216439, 0.976296, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4451.76, 1928.1, 459.076, -2.00713, 0, 0, -0.843392, 0.537299, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4442.99, 1951.9, 459.093, 2.74016, 0, 0, 0.979924, 0.199371, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4466.8, 1960.44, 459.841, 1.15192, 0, 0, 0.54464, 0.83867, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 256, 5041.61, 3294.4, 382.15, -1.63188, 0, 0, -0.72837, 0.685184, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192278, 571, 1, 256, 5006.34, 3280.4, 371.163, 2.22529, 0, 0, 0.896872, 0.442291, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192278, 571, 1, 256, 4857.97, 3335.44, 368.881, -2.94959, 0, 0, -0.995395, 0.0958539, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4433.9, 3534.14, 360.275, -1.85005, 0, 0, -0.798636, 0.601815, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4572.93, 3475.52, 363.009, 1.42244, 0, 0, 0.652758, 0.757566, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4555.26, 3641.65, 419.974, 1.67551, 0, 0, 0.743143, 0.669133, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4574.87, 3625.91, 420.079, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4559.11, 3606.22, 419.999, -1.48353, 0, 0, -0.67559, 0.737277, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4539.42, 3622.49, 420.034, -3.07177, 0, 0, -0.999391, 0.0349043, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4401.63, 3377.46, 363.365, 1.55334, 0, 0, 0.700908, 0.713252, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4448.17, 3235.63, 370.412, -1.56207, 0, 0, -0.704015, 0.710185, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4438.3, 3361.08, 371.299, -0.017451, 0, 0, -0.00872539, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4424.15, 3286.54, 371.546, 3.12412, 0, 0, 0.999962, 0.00873622, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4416.03, 2822.68, 430.475, -0.017452, 0, 0, -0.00872589, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4464.12, 2855.45, 406.111, 0.829032, 0, 0, 0.402747, 0.915311, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4398.82, 2804.7, 429.792, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4408.57, 2422.61, 377.179, 1.58825, 0, 0, 0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4416.59, 2414.08, 377.13, 0, 0, 0, 0, 1, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4417.25, 2301.14, 377.214, 0.026179, 0, 0, 0.0130891, 0.999914, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 4805.67, 2407.48, 358.191, 1.78023, 0, 0, 0.777144, 0.629323, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 4811.4, 2441.9, 358.207, -2.0333, 0, 0, -0.85035, 0.526218, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192273, 571, 1, 1, 4778.19, 2438.06, 345.644, -2.94088, 0, 0, -0.994969, 0.100188, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192273, 571, 1, 1, 5024.57, 2532.75, 344.023, -1.93732, 0, 0, -0.824127, 0.566404, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 5004.35, 2486.36, 358.449, 2.17294, 0, 0, 0.884989, 0.465612, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 4983.28, 2503.09, 358.177, -0.427603, 0, 0, -0.212176, 0.977231, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 1, 4417.94, 2324.81, 371.577, 3.08051, 0, 0, 0.999534, 0.0305366, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193764, 571, 1, 1, 7625.87, 2060.05, 604.27, 0.07854, 0, 0, 0.99999, 0.004363, 180, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 193762, 571, 1, 1, 7625.66, 2060.04, 604.195, -3.05428, 0, 0, 0.99999, 0.004363, 180, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192319, 571, 1, 385, 5364.3, 2899.22, 435.691, -1.55334, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192287, 571, 1, 385, 5372.42, 2862.48, 409.366, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192323, 571, 1, 385, 5364.28, 2917.26, 445.332, 1.58825, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192305, 571, 1, 385, 5397.31, 2809.26, 455.102, 3.13286, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192286, 571, 1, 385, 5371.45, 2820.79, 409.427, 3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192334, 571, 1, 385, 5322.17, 2763.2, 444.974, -1.56207, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192307, 571, 1, 385, 5271.16, 2820.11, 445.109, -3.13286, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192306, 571, 1, 385, 5270.56, 2861.68, 444.917, -3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 385, 5160.28, 2798.6, 430.604, -3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 385, 5146.04, 2747.3, 433.527, 3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192328, 571, 1, 385, 5173.13, 2820.96, 435.658, 0.026179, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192252, 571, 1, 385, 5154.37, 2853.23, 409.183, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192253, 571, 1, 385, 5154.42, 2828.93, 409.189, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192292, 571, 1, 385, 5154.35, 2862.08, 445.01, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192299, 571, 1, 385, 5155.22, 2820.63, 444.979, -3.11539, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192327, 571, 1, 385, 5172.34, 2862.57, 435.658, 0, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 385, 5158.71, 2882.9, 431.274, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 385, 5145.11, 2934.95, 433.255, -3.10665, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192267, 571, 1, 385, 4452.76, 2639.14, 358.444, 1.67552, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192449, 571, 1, 385, 4517.75, 2717.23, 387.812, -1.53589, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192450, 571, 1, 385, 4387.59, 2719.9, 390.201, -1.51843, 0, 0, 0, 1, 300, 255, 1);

DELETE FROM `trinity_string` WHERE entry IN (756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,780,781,782,783);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('756', 'Battle begins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Битва началась'),
('757', '%s has successfully defended the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s успешно защитил(а) крепость!'),
('758', '%s has taken over the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s захватил(а) крепость'),
('759', 'The %s siege workshop has been damaged by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('760', 'The %s siege workshop has been destroyed by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('761', 'The %s tower has been damaged!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s башня повреждена'),
('762', 'The %s tower has been destroyed!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s башня уничтожена!'),
('763', 'Wintergrasp fortress is under attack!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('764', 'Wintergrasp is now under the control of the %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('765', 'Wintergrasp timer set to %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('766', 'Wintergrasp battle started.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('767', 'Wintergrasp battle finished.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('769', 'Wintergrasp outdoorPvP is disabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('770', 'Wintergrasp outdoorPvP is enabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('771', 'You have reached Rank 1: Corporal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы достигли Ранга 1: Капрал'),
('772', 'You have reached Rank 2: First Lieutenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы достигли Ранга 2: Лейтенант'),
('780', 'Before the Battle of  Wintergrasp left 30 minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'До битвы на  Озере Ледяных Оков осталось 30 минут!'),
('781', 'Before the Battle of  Wintergrasp left 10 minutes! Portal from Dalaran will work at begin of the battle.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'До битвы на  Озере Ледяных Оков осталось 10 минут! Портал с Даларана начнет работу во время боя.'),
('782', 'The battle for Wintergrasp  has stopped! Not enough defenders. Wintergrasp Fortress remains  Attackers.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Битва за Озеро Ледяных Оков Остановлена. Не хватает защитников. Крепость переходит атакующей  стороне.'),
('783', 'The battle for Wintergrasp  has stopped! Not enough attackers. Wintergrasp Fortress remains  Defenders.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Битва за Озеро Ледяных Оков Остановлена. Не хватает нападающих. Крепость остается защитникам.');

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('wg', '3', 'Syntax: .wg $subcommand.'),
('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.'),
('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.'),
('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.'),
('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).'),
('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.'),
('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

/* WG scriptname */
DELETE FROM `outdoorpvp_template` WHERE TypeId=7;
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `comment`) VALUES 
('7', 'outdoorpvp_wg', 'Wintergrasp');

UPDATE `creature_template` SET `ScriptName` = 'npc_demolisher_engineerer' WHERE `entry` IN (30400,30499);

/* Teleport WG SPELLs*/
DELETE FROM `spell_target_position` WHERE id IN ('59096', '58632', '58633');
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
('59096', '571', '4561.58', '2835.33', '389.79', '0.34'),
('58632', '571', '5025.71', '3673.41', '362.687', '0'),
('58633', '571', '5094.67', '2170.33', '365.601', '0');

/* Defender's Portal Activate Proper Spell */
DELETE FROM `spell_linked_spell` WHERE spell_trigger=54640;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
('54640','54643','0','Defender\'s Portal Activate Proper Spell');

/* Protect players from catching by Druid Cyclone at graveyard which removes immunity after disappear */
DELETE FROM `spell_linked_spell` WHERE spell_trigger=58729;
INSERT INTO `spell_linked_spell` VALUES (58729, -33786, 2, 'Spiritual Immunity: Protect From Cyclone (now Immune always)');

/* Temp removed gameobject stopping you getting to the relic
* 194323 - [Wintergrasp Keep Collision Wall X:5396.209961 Y:2840.010010 Z:432.268005 MapId:571
* 194162 - [Doodad_WG_Keep_Door01_collision01 X:5397.109863 Y:2841.540039 Z:425.901001 MapId:571]*/
DELETE FROM gameobject WHERE id IN ('194323', '194162');

/* Titan Relic remove */
DELETE FROM `gameobject` WHERE `id`=192829;

/* Towers */
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 6553632 WHERE `entry` IN (190356,190357,190358);

/*Spirit healer FIX */
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry IN (31841,31842);

/* Creature template */
UPDATE creature_template SET faction_A = '1802', faction_H = '1802' WHERE entry IN (30499,28312,28319);
UPDATE creature_template SET faction_A = '1801', faction_H = '1801' WHERE entry IN (30400,32629,32627);
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry   IN (31841,31842);

/* spell target for build vehicles */
DELETE FROM `conditions` WHERE ConditionValue2=27852;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 49899, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56575, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56661, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56663, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56665, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56667, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56669, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 61408, 0, 18, 1, 27852, 0, 0, '', NULL);

/* Workshop */
UPDATE `gameobject_template` SET `faction` = 35 WHERE `entry` IN (192028,192029,192030,192031,192032,192033);

/*WG Spell area Data */
/*For wg antifly */
DELETE FROM `spell_area` WHERE spell IN (58730, 57940, 58045);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES
(58730, 4197, 0, 0, 0, 0, 0, 2, 1),
(58730, 4584, 0, 0, 0, 0, 0, 2, 1),
(58730, 4581, 0, 0, 0, 0, 0, 2, 1),
(58730, 4585, 0, 0, 0, 0, 0, 2, 1),
(58730, 4612, 0, 0, 0, 0, 0, 2, 1),
(58730, 4582, 0, 0, 0, 0, 0, 2, 1),
(58730, 4611, 0, 0, 0, 0, 0, 2, 1),
(58730, 4578, 0, 0, 0, 0, 0, 2, 1),
(58730, 4576, 0, 0, 0, 0, 0, 2, 1),
(58730, 4538, 0, 0, 0, 0, 0, 2, 1),
(57940, 65, 0, 0, 0, 0, 0, 2, 1),
(57940, 66, 0, 0, 0, 0, 0, 2, 1),
(57940, 67, 0, 0, 0, 0, 0, 2, 1),
(57940, 206, 0, 0, 0, 0, 0, 2, 1),
(57940, 210, 0, 0, 0, 0, 0, 2, 1),
(57940, 394, 0, 0, 0, 0, 0, 2, 1),
(57940, 395, 0, 0, 0, 0, 0, 2, 1),
(57940, 1196, 0, 0, 0, 0, 0, 2, 1),
(57940, 2817, 0, 0, 0, 0, 0, 2, 1),
(57940, 3456, 0, 0, 0, 0, 0, 2, 1),
(57940, 3477, 0, 0, 0, 0, 0, 2, 1),
(57940, 3537, 0, 0, 0, 0, 0, 2, 1),
(57940, 3711, 0, 0, 0, 0, 0, 2, 1),
(57940, 4100, 0, 0, 0, 0, 0, 2, 1),
(57940, 4196, 0, 0, 0, 0, 0, 2, 1),
(57940, 4228, 0, 0, 0, 0, 0, 2, 1),
(57940, 4264, 0, 0, 0, 0, 0, 2, 1),
(57940, 4265, 0, 0, 0, 0, 0, 2, 1),
(57940, 4272, 0, 0, 0, 0, 0, 2, 1),
(57940, 4273, 0, 0, 0, 0, 0, 2, 1),
(57940, 4395, 0, 0, 0, 0, 0, 2, 1),
(57940, 4415, 0, 0, 0, 0, 0, 2, 1),
(57940, 4416, 0, 0, 0, 0, 0, 2, 1),
(57940, 4493, 0, 0, 0, 0, 0, 2, 1),
(57940, 4494, 0, 0, 0, 0, 0, 2, 1),
(57940, 4603, 0, 0, 0, 0, 0, 2, 1),
(58045, 4197, 0, 0, 0, 0, 0, 2, 1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (56575,56661,56663,61408);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 56575, 0, 0, 31, 0, 3, 27852, 0, 0, 0, '', NULL),
(13, 1, 56661, 0, 0, 31, 0, 3, 27852, 0, 0, 0, '', NULL),
(13, 1, 56663, 0, 0, 31, 0, 3, 27852, 0, 0, 0, '', NULL),
(13, 1, 61408, 0, 0, 31, 0, 3, 27852, 0, 0, 0, '', NULL);

/* Portal Dalaran->WG */
DELETE FROM `gameobject` WHERE `id`=193772;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(NULL, 193772, 571, 1, 64, 5924.11, 573.387, 661.087, 4.43208, 0, 0, 0.798953, -0.601393, 300, 0, 1),
(NULL, 193772, 571, 1, 65535, 5686.57, 772.921, 647.754, 5.62225, 0, 0, 0.324484, -0.945891, 600, 0, 1),
(NULL, 193772, 571, 1, 65535, 5930.82, 548.961, 640.632, 1.88506, 0, 0, 0.809047, 0.587744, 300, 0, 1);

/* Wintergrasp Battle-Mage */
DELETE FROM `creature` WHERE `id`=32170;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(NULL, 32170, 571, 1, 65535, 27801, 0, 5925.34, 573.71, 661.087, 4.06662, 300, 0, 0, 504000, 440700, 0, 0, 0, 0),
(NULL, 32170, 571, 1, 64, 0, 918, 5932.96, 549.906, 641.595, 2.09189, 300, 0, 0, 504000, 440700, 0, 0, 0, 0);
UPDATE `creature_template` SET `ScriptName`='npc_wg_ally_battle_mage' WHERE `entry`=32169;
UPDATE `creature_template` SET `ScriptName`='npc_wg_horde_battle_mage' WHERE `entry`=32170;

UPDATE `gameobject_template` SET `type` = 6, `faction` = 0, `data2` = 10, `data3` = 54643, `ScriptName` = 'go_wg_veh_teleporter' WHERE `entry` = 192951;
DELETE FROM `spell_area` WHERE spell = 55173 AND area = 4197;
INSERT INTO `spell_area` VALUES ('55173', '4197', '0', '0', '0', '8326', '8', '2', '1');

-- DK quest chain.
UPDATE `script_texts` SET `content_loc8`='Воины Плети, рыцари смерти Акеруса, слуги тьмы: услышьте зов Верховного Лорда!' WHERE `npc_entry`='29173' AND `entry`='-1609204';
UPDATE `script_texts` SET `content_loc8`='ВОССТАНЬТЕ!' WHERE `npc_entry`='29173' AND `entry`='-1609205';
UPDATE `script_texts` SET `content_loc8`='Небеса станут красными от крови павших! Король Лич взирает на нас, своих слуг! Оставляйте за собой лишь пепел и страдание!' WHERE `npc_entry`='29173' AND `entry`='-1609206';
UPDATE `script_texts` SET `content_loc8`='Склонитесь перед Верховным Лордом!' WHERE `npc_entry`='29173' AND `entry`='-1609209';
UPDATE `script_texts` SET `content_loc8`='Что это?! Я... не могу нанести удар...' WHERE `npc_entry`='29173' AND `entry`='-1609217';
UPDATE `script_texts` SET `content_loc8`='Плеть разгромит эту часовню!' WHERE `npc_entry`='29173' AND `entry`='-1609211';
UPDATE `script_texts` SET `content_loc8`='Я...я не могу, клинок не слушается меня!' WHERE `npc_entry`='29173' AND `entry`='-1609220';
UPDATE `script_texts` SET `content_loc8`='Серебрянному Рассвету пришел конец!' WHERE `npc_entry`='29173' AND `entry`='-1609215';
UPDATE `script_texts` SET `content_loc8`='Повинуйся мне, меч!' WHERE `npc_entry`='29173' AND `entry`='-1609218';
UPDATE `script_texts` SET `content_loc8`='Ты сделаешь так, как я скажу! Я тут командую!' WHERE `npc_entry`='29173' AND `entry`='-1609219';
UPDATE `script_texts` SET `content_loc8`='Испепелитель отвергает меня...' WHERE `npc_entry`='29173' AND `entry`='-1609223';
UPDATE `script_texts` SET `content_loc8`='Сила...покидает меня...' WHERE `npc_entry`='29173' AND `entry`='-1609222';
UPDATE `script_texts` SET `content_loc8`='Слуги, на помощь!' WHERE `npc_entry`='29173' AND `entry`='-1609224';
UPDATE `script_texts` SET `content_loc8`='Жизнь безсмысленна без страданий.' WHERE `npc_entry`='29173' AND `entry`='-1609213';
UPDATE `script_texts` SET `content_loc8`='%s рассеивается' WHERE `npc_entry`='29173' AND `entry`='-1609272';
UPDATE `script_texts` SET `content_loc8`='Назад, рыцари смерти. Мы проиграли... Свет... Тут... Нет надежды...' WHERE `npc_entry`='29173' AND `entry`='-1609227';
UPDATE `script_texts` SET `content_loc8`='Цени каждый вздох, старик. Он может стать последним.' WHERE `npc_entry`='29173' AND `entry`='-1609231';
UPDATE `script_texts` SET `content_loc8`='Отец!' WHERE `npc_entry`='29173' AND `entry`='-1609233';
UPDATE `script_texts` SET `content_loc8`='Аргх... Что это?' WHERE `npc_entry`='29173' AND `entry`='-1609234';
UPDATE `script_texts` SET `content_loc8`='Отец, ты вернулся!' WHERE `npc_entry`='29173' AND `entry`='-1609235';
UPDATE `script_texts` SET `content_loc8`='Тебя так долго не было, отец. Я думал...' WHERE `npc_entry`='29173' AND `entry`='-1609236';
UPDATE `script_texts` SET `content_loc8`='Отец, я хочу сражаться вместе с тобой против нежити. Я жажду битв! Я не могу больше оставаться безучастным!' WHERE `npc_entry`='29173' AND `entry`='-1609238';
UPDATE `script_texts` SET `content_loc8`='Если мне суждено умереть, отец, пусть это случится в битве с легионами нежити! Плечом к плечу с тобой!' WHERE `npc_entry`='29173' AND `entry`='-1609240';
UPDATE `script_texts` SET `content_loc8`='Ты предал меня! Ты предал нас всех, чудовище! Узри Моргрейна в гневе!' WHERE `npc_entry`='29173' AND `entry`='-1609244';
UPDATE `script_texts` SET `content_loc8`='Этот день еще не настал...' WHERE `npc_entry`='29173' AND `entry`='-1609252';
UPDATE `script_texts` SET `content_loc8`='Тирион!' WHERE `npc_entry`='29173' AND `entry`='-1609253';
UPDATE `script_texts` SET `content_loc8`='За это же ратуют и Рыцари Черного Клинка... И хотя для нас нет места в вашем мире, мы будем биться за то, чтобы низложить Короля Лича... Клянусь!' WHERE `npc_entry`='29173' AND `entry`='-1609268';
UPDATE `script_texts` SET `content_loc8`='Рыцари смерти Акеруса, смертный поход начался!' WHERE `npc_entry`='29173' AND `entry`='-1609203';
UPDATE `script_texts` SET `content_loc8`='Небо оплакивает опустошенные земли! Скоро и жалкие слезы Азерота прольются на нас дождем!' WHERE `npc_entry`='29173' AND `entry`='-1609202';
UPDATE `script_texts` SET `content_loc8`='Воины Плети, соберитесь! Приготовьтесь выплеснуть свою ярость на Серебянный Рассвет!' WHERE `npc_entry`='29173' AND `entry`='-1609201';
UPDATE `script_texts` SET `content_loc8`='Армия плети выступает!' WHERE `npc_entry`='29173' AND `entry`='-1609207';
UPDATE `script_texts` SET `content_loc8`='Готовьтесь, братья и сестры! За свет!' WHERE `npc_entry`='29173' AND `entry`='-1609208';
UPDATE `script_texts` SET `content_loc8`='У вас нет шанса!' WHERE `npc_entry`='29173' AND `entry`='-1609210';
UPDATE `script_texts` SET `content_loc8`='Ваша жизнь уже не принадлежит вам!' WHERE `npc_entry`='29173' AND `entry`='-1609212';
UPDATE `script_texts` SET `content_loc8`='Сколько еще продержаться ваши воиска?' WHERE `npc_entry`='29173' AND `entry`='-1609214';
UPDATE `script_texts` SET `content_loc8`='Не щадите никого!' WHERE `npc_entry`='29173' AND `entry`='-1609216';
UPDATE `script_texts` SET `content_loc8`='Что со мной?' WHERE `npc_entry`='29173' AND `entry`='-1609221';
UPDATE `script_texts` SET `content_loc8`='Тебе не победить, Дарион!' WHERE `npc_entry`='29173' AND `entry`='-1609225';
UPDATE `script_texts` SET `content_loc8`='Привести их к часовне!' WHERE `npc_entry`='29173' AND `entry`='-1609226';
UPDATE `script_texts` SET `content_loc8`='Ты так ничему и не научился, мальчишка? В тебе соединилось все, с чем бился твой отец! Как трусливый Артас ты позволил тьме и ненависти затмить твой разум. Боль тех, кого ты мучил и убивал лишь укрепляла тебя!' WHERE `npc_entry`='29173' AND `entry`='-1609228';
UPDATE `script_texts` SET `content_loc8`='Твой господин знает, что скрывается под часовней. Потому-то он и не рискнул приехать сам, а прислал сюда на верную гибель тебя и твоих рыцарей смерти, Дарион.' WHERE `npc_entry`='29173' AND `entry`='-1609229';
UPDATE `script_texts` SET `content_loc8`='То, что ты чувствуешь сейчас это муки тысячи загубленных душ! Душ, которые ты и твой господин завлекли сюда! Свет воздаст тебе по заслугам, Дарион!' WHERE `npc_entry`='29173' AND `entry`='-1609230';
UPDATE `script_texts` SET `content_loc8`='Мой сын! Мой дорогой, милый мальчик!' WHERE `npc_entry`='29173' AND `entry`='-1609232';
UPDATE `script_texts` SET `content_loc8`='Ничто не могло помешать мне быть здесь, Дарион. Тут мой дом и семья.' WHERE `npc_entry`='29173' AND `entry`='-1609237';
UPDATE `script_texts` SET `content_loc8`='Дарион Моргрейн, ты едва достиг того возраста, когда можешь взять в руки меч, не говоря уже о том, чтобы сражаться с ордами нежити Лордерона! Я не переживу, если ты погибнешь. Сама мысль...' WHERE `npc_entry`='29173' AND `entry`='-1609239';
UPDATE `script_texts` SET `content_loc8`='Мой сын, однажды ты завладеешь Испепелителем и с его помощью восстановишь справедливость в этих землях. Не сомневаюсь, что когда наконец прийдет этот день ты сделаешь Лордерон светлее и чище. Наш народ будет гордится тобой! Но этот день...еще не настал...' WHERE `npc_entry`='29173' AND `entry`='-1609241';
UPDATE `script_texts` SET `content_loc8`='Теперь он мой...' WHERE `npc_entry`='29173' AND `entry`='-1609245';
UPDATE `script_texts` SET `content_loc8`='Трогательно...' WHERE `npc_entry`='29173' AND `entry`='-1609243';
UPDATE `script_texts` SET `content_loc8`='Не забывай...' WHERE `npc_entry`='29173' AND `entry`='-1609242';
UPDATE `script_texts` SET `content_loc8`='И плачевно...' WHERE `npc_entry`='29173' AND `entry`='-1609246';
UPDATE `script_texts` SET `content_loc8`='Ты гнусное чудовище, Артас!' WHERE `npc_entry`='29173' AND `entry`='-1609247';
UPDATE `script_texts` SET `content_loc8`='Ты прав, Фордринг. Я действительно послал их на верную смерть. Их жизни ничего не стоят, но вот твоя...' WHERE `npc_entry`='29173' AND `entry`='-1609248';
UPDATE `script_texts` SET `content_loc8`='Как просто оказалось вытащить великого Тириона Фордринга из его норы. Ты сейчас беззащитен, паладин. Ничто тебя не спасет...' WHERE `npc_entry`='29173' AND `entry`='-1609249';
UPDATE `script_texts` SET `content_loc8`='В АТАКУ!!!' WHERE `npc_entry`='29173' AND `entry`='-1609250';
UPDATE `script_texts` SET `content_loc8`='КОНЕЦ СВЕТА!!!' WHERE `npc_entry`='29173' AND `entry`='-1609251';
UPDATE `script_texts` SET `content_loc8`='АРТАС!!!' WHERE `npc_entry`='29173' AND `entry`='-1609254';
UPDATE `script_texts` SET `content_loc8`='Что это такое?' WHERE `npc_entry`='29173' AND `entry`='-1609255';
UPDATE `script_texts` SET `content_loc8`='Конец тебе.' WHERE `npc_entry`='29173' AND `entry`='-1609256';
UPDATE `script_texts` SET `content_loc8`='Невозможно...' WHERE `npc_entry`='29173' AND `entry`='-1609257';
UPDATE `script_texts` SET `content_loc8`='Это...еще...не конец...' WHERE `npc_entry`='29173' AND `entry`='-1609258';
UPDATE `script_texts` SET `content_loc8`='В следующий раз мы встретимся уже не на священной земле, паладин.' WHERE `npc_entry`='29173' AND `entry`='-1609259';
UPDATE `script_texts` SET `content_loc8`='Поднимись, Дарион, и слушай...' WHERE `npc_entry`='29173' AND `entry`='-1609260';
UPDATE `script_texts` SET `content_loc8`='Мы все стали свидетелями ужасной трагедии. Кровь благородных людей пролилась на эту землю. Кровь славных рыцарей, которые сложили головы защищая свои и наши жизни!' WHERE `npc_entry`='29173' AND `entry`='-1609261';
UPDATE `script_texts` SET `content_loc8`='О таких подвигах никогда нельзя забывать, мы должны ревниво оберегать наши идеалы!' WHERE `npc_entry`='29173' AND `entry`='-1609262';
UPDATE `script_texts` SET `content_loc8`='Король Лич ответит за то, что он натворил, мы не позволим ему и дальше сеять разрушения в нашем мире.' WHERE `npc_entry`='29173' AND `entry`='-1609263';
UPDATE `script_texts` SET `content_loc8`='Братья и сестры, сегодня я даю вам обет: Король Лич будет повержен! В этот день я объявляю о заключении союза.' WHERE `npc_entry`='29173' AND `entry`='-1609264';
UPDATE `script_texts` SET `content_loc8`='Серебрянный Рассвет и Серебрянная Длань объединятся! Мы преуспеем там, где прежде все терпели неудачу!' WHERE `npc_entry`='29173' AND `entry`='-1609265';
UPDATE `script_texts` SET `content_loc8`='Мы сразимся с Артасом и стены Цитадели Ледяной Короны падут!' WHERE `npc_entry`='29173' AND `entry`='-1609266';
UPDATE `script_texts` SET `content_loc8`='Серебрянный Авангард идет за тобой, Артас!' WHERE `npc_entry`='29173' AND `entry`='-1609267';
UPDATE `script_texts` SET `content_loc8`='%s исчезает. Тирион идет к месту, где лежит Дарион' WHERE `npc_entry`='29173' AND `entry`='-1609285';
UPDATE `script_texts` SET `content_loc8`='%s взрывается.' WHERE `npc_entry`='29173' AND `entry`='-1609283';

-- Forge of Souls
REPLACE INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(36497,-1632001,'Finally...a captive audience!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Наконец-то... гости пожаловали!',16595,1,0,0,'Bronjham SAY_AGGRO'),
(36497,-1632002,'Fodder for the engine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Скормлю тебя машине!',16596,1,0,0,'Bronjham SAY_SLAY_1'),
(36497,-1632003,'Another soul to strengthen the host!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Еще одна душа обогатит вместилище.',16597,1,0,0,'Bronjham SAY_SLAY_2'),
(36497,-1632005,'The vortex of the harvested calls to you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вихрь погубленных душ взывает к вам!',16599,1,0,0,'Bronjham SAY_SOUL_STORM'),
(36497,-1632006,'I will sever the soul from your body!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я вырву душу из твоего тела!',16600,1,0,0,'Bronjham SAY_CORRUPT_SOUL'),
(36502,-1632010,'You dare look upon the host of souls? I SHALL DEVOUR YOU WHOLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы осмелились взглянуть на вместилище душ?! Я СОЖРУ ВАС ЗАЖИВО!',16884,1,0,0,'Devoureur SAY_FACE_ANGER_AGGRO'),
(36502,-1632011,'You dare look upon the host of souls? I SHALL DEVOUR YOU WHOLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы осмелились взглянуть на вместилище душ?! Я СОЖРУ ВАС ЗАЖИВО!',16890,1,0,0,'Devoureur SAY_FACE_DESIRE_AGGRO'),
(36502,-1632012,'Damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Проклинаю тебя!',16885,1,0,0,'Devoureur SAY_FACE_ANGER_SLAY_1'),
(36502,-1632013,'Damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Проклинаю тебя!',16896,1,0,0,'Devoureur SAY_FACE_SORROW_SLAY_1'),
(36502,-1632014,'Damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Проклинаю тебя!',16891,1,0,0,'Devoureur SAY_FACE_DESIRE_SLAY_1'),
(36502,-1632015,'Doomed for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Обрекаю тебя на вечные муки!',16886,1,0,0,'Devoureur SAY_FACE_ANGER_SLAY_2'),
(36502,-1632016,'Doomed for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Обрекаю тебя на вечные муки!',16897,1,0,0,'Devoureur SAY_FACE_SORROW_SLAY_2'),
(36502,-1632017,'Doomed for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Обрекаю тебя на вечные муки!',16892,1,0,0,'Devoureur SAY_FACE_DESIRE_SLAY_2'),
(36502,-1632018,'The swell of souls will not be abated! You only delay the inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вместилище душ не ослабнет! Вы лишь пытаетесь отсрочить неизбежное!',16887,1,0,0,'Devoureur SAY_FACE_ANGER_DEATH'),
(36502,-1632019,'The swell of souls will not be abated! You only delay the inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вместилище душ не ослабнет! Вы лишь пытаетесь отсрочить неизбежное!',16898,1,0,0,'Devoureur SAY_FACE_SORROW_DEATH'),
(36502,-1632020,'The swell of souls will not be abated! You only delay the inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вместилище душ не ослабнет! Вы лишь пытаетесь отсрочить неизбежное!',16893,1,0,0,'Devoureur SAY_FACE_DESIRE_DEATH'),
(36502,-1632023,'SUFFERING! ANGUISH! CHAOS! RISE AND FEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'СТРАДАНИЕ! МУЧЕНИЕ! ХАОС! ВОССТАНЬТЕ И ПИРУЙТЕ!',16888,1,0,0,'Devoureur SAY_FACE_ANGER_UNLEASH_SOUL'),
(36502,-1632024,'SUFFERING! ANGUISH! CHAOS! RISE AND FEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'СТРАДАНИЕ! МУЧЕНИЕ! ХАОС! ВОССТАНЬТЕ И ПИРУЙТЕ!',16899,1,0,0,'Devoureur SAY_FACE_SORROW_UNLEASH_SOUL'),
(36502,-1632025,'SUFFERING! ANGUISH! CHAOS! RISE AND FEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'СТРАДАНИЕ! МУЧЕНИЕ! ХАОС! ВОССТАНЬТЕ И ПИРУЙТЕ!',16894,1,0,0,'Devoureur SAY_FACE_DESIRE_UNLEASH_SOUL'),
(36502,-1632027,'Stare into the abyss, and see your end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вглядитесь в бездну, и узрите свою смерть!',16889,1,0,0,'Devoureur SAY_FACE_ANGER_WAILING_SOUL'),
(36502,-1632028,'Stare into the abyss, and see your end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вглядитесь в бездну, и узрите свою смерть!',16895,1,0,0,'Devoureur SAY_FACE_DESIRE_WAILING_SOUL'),

-- Pit of Saron
(38160,-1632029,'Excellent work, champions! We shall set up our base camp in these chambers. My mages will get the Scourge transport device working shortly. Step inside it when you''re ready for your next mission. I will meet you on the other side.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Превосходно. Мы разобьем лагерь в этих покоях. Скоро мои маги заставят портал плети работать. Войдите в него, когда будете готовы к следующему заданию. Я присоединюсь к вам позже...',16625,1,0,0,'Jaina SAY_JAINA_OUTRO'),
(38161,-1632030,'Excellent work, champions! We shall set up our base camp in these chambers. My mages will get the Scourge transport device working shortly. Step inside when you are ready for your next mission. I will meet you on the other side.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Превосходно. Мы разобьем лагерь в этих покоях. Скоро мои маги заставят портал плети работать. Войдите в него, когда будете готовы к следующему заданию. Я присоединюсь к вам позже...',17044,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO'),
(37597,-1632040,'Thank the light for seeing you here safely. We have much work to do if we are to defeat the Lich King and put an end to the Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Слава свету, вы целы и невредимы. Нам предстоит многое сделать, если мы хотим покончить с Королем Личом и Плетью',16617,0,0,0,'Jaina SAY_INTRO_1'),
(37597,-1632041,'Our allies within the Argent Crusade and the Knights of the Ebon Blade have broken through the front gate of Icecrown and are attempting to establish a foothold within the Citadel.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Серебряный Авангард и Рыцари Черного Клинка прорвались через главные ворота, и пытаются укрепить свои позиции в Цитадели.',16618,0,0,0,'Jaina SAY_INTRO_2'),
(37597,-1632042,'Their success hinges upon what we discover in these cursed halls. Although our mission is a wrought with peril, we must persevere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Успех зависит от того, что мы найдем в этих ужасных залах. Пусть наша миссия опасна, но мы должны выстоять!',16619,0,0,0,'Jaina SAY_INTRO_3'),
(37597,-1632043,'With the attention of the Lich King drawn toward the front gate, we will be working our way through the side in search of information that will enable us to defeat the Scourge - once and for all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пока Король Лич отвлекся на главные ворота, мы проникнем внутрь другим путем, и постараемся узнать - как можно покончить с Плетью раз и навсегда.',16620,0,0,0,'Jaina SAY_INTRO_4'),
(37597,-1632044,'King Varian''s SI7 agents have gathered information about a private sanctum of the Lich King''s deep within a place called the Halls of Reflection.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Разведчики ШРУ, отправленные Варианом, сообщают, что покои короля находятся в глубине дворца. Это место называется Залами Отражений',16621,0,0,0,'Jaina SAY_INTRO_5'),
(37597,-1632045,'We will carve a path through this wretched place and find a way to enter the Halls of Reflection. I sense powerful magic hidden away within those walls... Magic that could be the key to destroy the Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы проложим себе путь сквозь это Проклятое место, и найдем вход в Залы Отражений. Я чувствую, что в них сокрыта могущественная магия, которая поможет нам сокрушить Плеть.',16622,0,0,0,'Jaina SAY_INTRO_6'),
(37597,-1632046,'Your first mission is to destroy the machines of death within this malevolent engine of souls, and clear a path for our soldiers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ваша первая задача - разрушить машины смерти в этом гнусном механизме душ. Это откроет путь нашим солдатам.',16623,0,0,0,'Jaina SAY_INTRO_7'),
(37597,-1632047,'Make haste, champions! I will prepare the troops to fall in behind you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Спешите, герои! Я прикажу солдатам следовать за вами.',16624,0,0,0,'Jaina SAY_INTRO_8'),
(37596,-1632050,'The Argent Crusade and the Knights of the Ebon Blade have assaulted the gates of Icecrown Citadel and are preparing for a massive attack upon the Scourge. Our missition is a bit more subtle, but equally as important.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Серебряный Авангард и Рыцари Черного Клинка штурмуют ворота Цитадели Ледяной Короны, и готовятся нанести решающий удар. Мы будем действовать незаметно, но не менее эффективно!',17038,0,0,0,'Sylvanas SAY_INTRO_1'),
(37596,-1632051,'With the attention of the Lich King turned towards the front gate, we''ll be working our way through the side in search of information that will enable us to defeat the Lich King - once and for all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пока Король Лич отвлекся на главные ворота, мы проникнем внутрь другим путем, и по стараемся понять - как можно покончить с ним раз и навсегда!',17039,0,0,0,'Sylvanas SAY_INTRO_2'),
(37596,-1632052,'Our scouts have reported that the Lich King has a private chamber, outside of the Frozen Throne, deep within a place called the Halls of Reflection. That is our target, champions.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Наши разведчики сообщили, что покои Короля Лича находятся в глубине дворца, неподалеку от Ледяного Трона. Это место называется Залами Отражений. Туда и лежит наш путь.',17040,0,0,0,'Sylvanas SAY_INTRO_3'),
(37596,-1632053,'We will cut a swath of destruction through this cursed place and find a way to enter the Halls of Reflection. If there is anything of value to be found here, it will be found in the Halls.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы проложим себе путь сквозь это Проклятое место, и найдем вход в Залы Отражений. Если в Цитадели и есть что-то достойное внимания, оно ждет нас именно там.',17041,0,0,0,'Sylvanas SAY_INTRO_4'),
(37596,-1632054,'Your first mission is to destroy the machines of death within this wretched engine of souls, and clear a path for our soldiers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вашей первой задачей будет разрушение машин смерти в этом гнусном механизме душ. Это откроет путь нашим солдатам.',17042,0,0,0,'Sylvanas SAY_INTRO_5'),
(37596,-1632055,'The Dark Lady watches over you. Make haste!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17043,0,0,0,'Sylvanas SAY_INTRO_6'),
(36494,-1658001,'Tiny creatures under feet, you bring Garfrost something good to eat!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Маленьких букашек тыща принести Гархладу пища... Ха-ха-ха-ха',16912,1,0,0,'garfrost SAY_AGGRO'),
(36494,-1658002,'Will save for snack. For later.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Оставить на потом. Сейчас не хочу...',16913,1,0,0,'garfrost SAY_SLAY_1'),
(36494,-1658003,'That one maybe not so good to eat now. Stupid Garfrost! BAD! BAD!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Этот кусок сейчас лучше не есть, глупый Гархлад. Плохой! Плохой!',16914,1,0,0,'garfrost SAY_SLAY_2'),
(36494,-1658004,'Garfrost hope giant underpants clean. Save boss great shame. For later.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Гархлад надеется, большие штаны чистые. Спасет от большого позора. Пока.',16915,1,0,0,'garfrost SAY_DEATH'),
(36494,-1658005,'Axe too weak. Garfrost make better and CRUSH YOU!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Топор слабый. Гархлад, сделает другую штуку и раздавит вас',16916,1,0,0,'garfrost SAY_PHASE2'),
(36494,-1658006,'Garfrost tired of puny mortals. Now your bones will freeze!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Гархлад устал от жалких смертных. Сейчас ваши кости - леденец.',16917,1,0,0,'garfrost SAY_PHASE3'),
(36658,-1658007,'Another shall take his place. You waste your time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Его место займет другой. Вы попусту тратите время',16752,1,0,0,'Tyrannus SAY_TYRANNUS_DEATH'),
(36477,-1658010,'Our work must not be interrupted! Ick! Take care of them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Нельзя мешать нашей работе! Ик! Займемся ими!',16926,1,0,0,'Krick SAY_AGGRO'),
(36477,-1658011,'Ooh...We could probably use these parts!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'О-хо-хо... Твои культяпки нам пригодятся!',16927,1,0,0,'Krick SAY_SLAY_1'),
(36477,-1658012,'Arms and legs are in short supply...Thanks for your contribution!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'У нас как раз кончались руки и ноги... Благодарю за вклад!',16928,1,0,0,'Krick SAY_SLAY_2'),
(36477,-1658013,'Enough moving around! Hold still while I blow them all up!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Хватит суетиться! Замри, пока я буду их взрывать!',16929,1,0,0,'Krick SAY_BARRAGE_1'),
(36477,-1658015,'Quickly! Poison them all while they''re still close!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Скорей! Отрави их, пока они близко!',16930,1,0,0,'Krick SAY_POISON_NOVA'),
(36477,-1658016,'No! That one! That one! Get that one!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Нет же! Целься в этого! Да вот в этого!',16931,1,0,0,'Krick SAY_CHASE_1'),
(36477,-1658017,'I''ve changed my mind...go get that one instead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я... передумал... лучше в этого!',16932,1,0,0,'Krick SAY_CHASE_2'),
(36477,-1658018,'What are you attacking him for? The dangerous one is over there,fool!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Да что ты к тому привязался? Этот опаснее, тупица!',16933,1,0,0,'Krick SAY_CHASE_3'),
(36477,-1658030,'Wait! Stop! Don''t kill me, please! I''ll tell you everything!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Подождите! Не убивайте меня, умоляю! Я вам все расскажу!',16934,1,0,0,'Krick SAY_KRICK_OUTRO_1'),
(36993,-1658031,'I''m not so naive as to believe your appeal for clemency, but I will listen.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я не так наивна, чтобы верить твоим причитаниям. Но я выслушаю тебя.',16611,1,0,0,'Jaina SAY_JAINA_OUTRO_2'),
(36990,-1658032,'Why should the Banshee Queen spare your miserable life?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Почему королева Банши должна выслушивать твое нытьё?',17033,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_2'),
(36477,-1658033,'What you seek is in the master''s lair, but you must destroy Tyrannus to gain entry. Within the Halls of Reflection you will find Frostmourne. It... it holds the truth.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'То, что вы ищете, находится в покоях господина, но чтобы попасть туда, вам надо убить Тирания. В Залах Отражений хранится Ледяная Скорбь. В клинке... сокрыта Истина!',16935,1,0,0,'Krick SAY_KRICK_OUTRO_3'),
(36993,-1658034,'Frostmourne lies unguarded? Impossible!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Меч никто не охраняет? Не может быть.',16612,1,0,0,'Jaina SAY_JAINA_OUTRO_4'),
(36990,-1658035,'Frostmourne? The Lich King is never without his blade! If you are lying to me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Король Лич никогда не расстается со своим мечом, если ты мне лжешь...',17034,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_4'),
(36477,-1658036,'I swear it is true! Please, don''t kill me!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Клянусь это правда! Прошу, не убивайте меня!!',16936,1,0,0,'Krick SAY_KRICK_OUTRO_5'),
(36658,-1658037,'Worthless gnat! Death is all that awaits you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Жалкая букашка! Тебя ждет лишь смерть!',16753,1,0,0,'Tyrannus SAY_TYRANNUS_OUTRO_7'),
(36477,-1658038,'Urg... no!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Неет!...',16937,1,0,0,'Krick SAY_KRICK_OUTRO_8'),
(36658,-1658039,'Do not think that I shall permit you entry into my master''s sanctum so easily. Pursue me if you dare.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Не думайте, что я так легко позволю вам пройти в покои господина. Сразитесь со мной, если посмеете.',16754,1,0,0,'Tyrannus SAY_TYRANNUS_OUTRO_9'),
(36993,-1658040,'What a cruel end. Come, heroes. We must see if the gnome''s story is true. If we can separate Arthas from Frostmourne, we might have a chance at stopping him.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Какая ужасная смерть... Идемте, герои, проверим, правду ли сказал гном. Если нам удастся завладеть Ледяной Скорбью, возможно, мы сумеем остановить Артаса.',16613,1,0,0,'Jaina SAY_JAINA_OUTRO_10'),
(36990,-1658041,'A fitting end for a traitor. Come, we must free the slaves and see what is within the Lich King''s chamber for ourselves.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Смерть, достойная предателя. Идемте, освободим рабов и увидим своими глазами, что хранится в покоях Короля Лича',17035,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_10'),
(36658,-1658050,'Your pursuit shall be in vain, adventurers, for the Lich King has placed an army of undead at my command! Behold!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Все ваши усилия напрасны, чужаки, ибо Король Лич поставил меня во главе целой армии нежити! Берегитесь!',16755,1,0,0,'Tyrannus SAY_AMBUSH_1'),
(36658,-1658051,'Persistent whelps! You will not reach the entrance of my lord''s lair! Soldiers, destroy them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Настырные щенки! Вам не пройти в покои моего господина. Солдаты, уничтожить их!',16756,1,0,0,'Tyrannus SAY_AMBUSH_2'),
(36658,-1658052,'Rimefang! Trap them within the tunnel! Bury them alive!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Иней, останови их! Похорони их заживо!',16757,1,0,0,'Tyrannus SAY_GAUNTLET_START'),
(36658,-1658053,'Alas, brave, brave adventurers, your meddling has reached its end. Do you hear the clatter of bone and steel coming up the tunnel behind you? That is the sound of your impending demise.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Увы, бесстрашные герои, ваша навязчивость ускорила развязку. Вы слышите громыхание костей и скрежет стали за вашими спинами? Это предвестники скорой погибели!',16758,1,0,0,'Tyrannus SAY_TYRANNUS_INTRO_1'),
(36658,-1658055,'Ha, such an amusing gesture from the rabble. When I have finished with you, my master''s blade will feast upon your souls. Die!', NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ха-ха-ха-ха.. кто бы мог ожидать такого от черни. Когда я с вами покончу, клинок господина насытится вашими душами. Умрите!',16759,1,0,0,'Tyrannus SAY_TYRANNUS_INTRO_3'),
(36658,-1658056,'I shall not fail The Lich King! Come and meet your end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я не подведу Короля Лича! Идите ко мне, и встретьте свою смерть!',16760,1, 0,0,'Tyrannus SAY_AGGRO'),
(36658,-1658057,'Such a shameful display... You are better off dead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Какое жалкое кривляние... Умри и не позорься!',16761,1,0,0,'Tyrannus SAY_SLAY_1'),
(36658,-1658058,'Perhaps you should have stayed in the mountains!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Тебе надо было остаться в горах!',16762,1,0,0,'Tyrannus SAY_SLAY_2'),
(36658,-1658059,'Impossible! Rimefang... Warn...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Не может быть! Иней... предупреди...',16763,1,0,0,'Tyrannus SAY_DEATH'),
(36658,-1658060,'Rimefang, destroy this fool!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Иней, уничтожь этого глупца!',16764,1,0,0,'Tyrannus SAY_MARK_RIMEFANG_1'),
(36658,-1658062,'Power... overwhelming!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Меня переполняет мощь!',16765,1,0,0,'Tyrannus SAY_DARK_MIGHT_1'),
(36993,-1658066,'Heroes, to me!', NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ко мне, герои!',16614,1,0,0,'Jaina SAY_JAYNA_OUTRO_3'),
(36990,-1658067,'Take cover behind me! Quickly!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Укройтесь за мной! Скорее!',17037,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_3'),
(36993,-1658068,'The Frost Queen is gone. We must keep moving - our objective is near.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Королева льда улетела. Надо продолжать путь - цель уже близка.',16615, 0,0,0,'Jaina SAY_JAYNA_OUTRO_4'),
(36990,-1658069,'I thought he''d never shut up. At last, Sindragosa silenced that long-winded fool. To the Halls of Reflection, champions! Our objective is near... I can sense it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я думала, он никогда не заткнется. Но Синдрагоса заставила этого болтливого дурня умолкнуть. В Залы Отражений, герои!',17036, 0,0,0,'Sylvanas SAY_SYLVANAS_OUTRO_4'),
(36993,-1658070,'I... I could not save them... Damn you, Arthas! DAMN YOU!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я... Я не смогла их спасти... Будь ты Проклят, Артас! Будь ты Проклят!',16616, 0,0,0,'Jaina SAY_JAYNA_OUTRO_5'),

-- Halls of Refflection
(37221,-1668001,'The chill of this place... Brr... I can feel my blood freezing.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как же здесь холодно... Брр... Кровь стынет в жилах',16631,1,0,0,'Jaina SAY_JAINA_INTRO_1'),
(37221,-1668002,'What is that? Up ahead! Could it be... ? Heroes at my side!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Что это там? Впереди! Неужели.. Скорее, герои!',16632,1,0,0,'Jaina SAY_JAINA_INTRO_2'),
(37221,-1668003,'Frostmourne! The blade that destroyed our kingdom...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ледяная Скорбь! Клинок, разрушивший наше королевство...',16633,1,0,0,'Jaina SAY_JAINA_INTRO_3'),
(37221,-1668004,'Stand back! Touch that blade and your soul will be scarred for all eternity! I must attempt to commune with the spirits locked away within Frostmourne. Give me space, back up please!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Отойдите! Тот, кто коснется этого клинка, обречет себя на вечные муки! Я попытаюсь заговорить с душами, заключенными в Ледяной Скорби, расступитесь, прошу.',16634,1,0,0,'Jaina SAY_JAINA_INTRO_4'),
(37225,-1668005,'Jaina! Could it truly be you?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Джайна! Неужели это ты?!',16666,1,0,0,'Uther SAY_UTHER_INTRO_A2_1'),
(37221,-1668006,'Uther! Dear Uther! ... I... I''m so sorry.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Утер... Милый Утер... Мне... Мне так жаль...',16635,0,0,0,'Jaina SAY_JAINA_INTRO_5'),
(37225,-1668007,'Jaina you haven''t much time. The Lich King sees what the sword sees. He will be here shortly!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Джайна, у вас мало времени. Король Лич видит все, что видит Ледяная Скорбь. Вскоре он будет здесь!',16667,0,0,0,'Uther SAY_UTHER_INTRO_A2_2'),
(37221,-1668008,'Arthas is here? Maybe I...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Артас здесь? Может я...',16636,0,0,0,'Jaina SAY_JAINA_INTRO_6'),
(37225,-1668009,'No, girl. Arthas is not here. Arthas is merely a presence within the Lich King''s mind. A dwindling presence...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Нет, девочка. Артаса здесь нет. Артас - лишь тень, мелькающая в сознании Короля Лича. Смутная тень...',16668,0,0,0,'Uther SAY_UTHER_INTRO_A2_3'),
(37221,-1668010,'But Uther, if there''s any hope of reaching Arthas. I... I must try.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Но если есть малейшая надежда вернуть Артаса, я должна попытаться',16637,0,0,0,'Jaina SAY_JAINA_INTRO_7'),
(37225,-1668011,'Jaina, listen to me. You must destroy the Lich King. You cannot reason with him. He will kill you and your allies and raise you all as powerful soldiers of the Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Джайна, послушай меня. Вам нужно уничтожить Короля Лича. С ним нельзя договориться. Он убьет вас всех и превратит в могущественных воинов плети.',16669,0,0,0,'Uther SAY_UTHER_INTRO_A2_4'),
(37221,-1668012,'Tell me how, Uther? How do I destroy my prince? My...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Но как, Утер? Как мне убить моего принца? Моего...',16638,0,0,0,'Jaina SAY_JAINA_INTRO_8'),
(37225,-1668013,'Snap out of it, girl. You must destroy the Lich King at the place where he merged with Ner''zhul - atop the spire, at the Frozen Throne. It is the only way.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Забудь об этом, девочка. Короля Лича нужно уничтожить на том месте, где он слился с Нер` Зулом. На самой вершине, у Ледяного Трона.',16670,0,0,0,'Uther SAY_UTHER_INTRO_A2_5'),
(37221,-1668014,'You''re right, Uther. Forgive me. I... I don''t know what got a hold of me. We will deliver this information to the King and the knights that battle the Scourge within Icecrown Citadel.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты прав, Утер. Прости меня, я не знаю, что на меня нашло. Мы передадим твои слова Королю и Рыцарям, которые сражаются с Плетью, в Цитадели Ледяной Короны.',16639,0,0,0,'Jaina SAY_JAINA_INTRO_9'),
(37225,-1668015,'There is... something else that you should know about the Lich King. Control over the Scourge must never be lost. Even if you were to strike down the Lich King, another would have to take his place. For without the control of its master, the Scourge would run rampant across the world - destroying all living things.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Тебе нужно... знать еще кое-что о Короле Личе. Плеть не должна выйти из-под контроля! Даже если вы убьете Короля Лича, кто-то должен будет занять его место. Без Короля, Плеть налетит на мир, как стая саранчи, и уничтожит все живое!...',16671,0,0,0,'Uther SAY_UTHER_INTRO_A2_6'),
(37225,-1668016,'A grand sacrifice by a noble soul...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Великая жертва, благородной души...',16672,0,0,0,'Uther SAY_UTHER_INTRO_A2_7'),
(37221,-1668017,'Who could bear such a burden?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кому по силам такое бремя?',16640,0,0,0,'Jaina SAY_JAINA_INTRO_10'),
(37225,-1668018,'I do not know, Jaina. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Не знаю, Джайна. Мне кажется если бы не Артас, который все еще является частью Короля Лича, Плеть давно бы уже уничтожила Азерот.',16673,0,0,0,'Uther SAY_UTHER_INTRO_A2_8'),
(37221,-1668019,'Then maybe there is still hope...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Но может еще есть надежда...',16641,0,0,0,'Jaina SAY_JAINA_INTRO_11'),
(37225,-1668020,'No, Jaina! Aargh! He... He is coming! You... You must...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Нет, Джайна! Ааааа! Он... Он приближается! Вы... Вы должны...',16674,0,0,0,'Uther SAY_UTHER_INTRO_A2_9'),
(37223,-1668021,'I... I don''t believe it! Frostmourne stands before us, unguarded! Just as the Gnome claimed. Come, heroes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я... Я не верю своим глазам! Ледяная скорбь перед нами, безо всякой охраны, как и говорил гном. Вперед, герои!',17049,1,0,0,'Sylvanas SAY_SYLVANAS_INTRO_1'),
(37223,-1668022,'Standing this close to the blade that ended my life... The pain... It is renewed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Боль снова захлестывает меня, когда я вижу так близко меч, отнявший у меня жизнь.',17050,1,0,0,'Sylvanas SAY_SYLVANAS_INTRO_2'),
(37223,-1668023,'I dare not touch it. Stand back! Stand back as I attempt to commune with the blade! Perhaps our salvation lies within...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я не смею его коснуться. Назад! Отступите, я попробую установить связь с мечом! Возможно, спасение находится внутри...',17051,1,0,0,'Sylvanas SAY_SYLVANAS_INTRO_3'),
(37225,-1668024,'Careful, girl. I''ve heard talk of that cursed blade saving us before. Look around you and see what has been born of Frostmourne.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Осторожней, девочка. Однажды мне уже говорили, что этот Проклятый меч может нас спасти. Посмотри вокруг, и ты увидишь, что из этого вышло.',16659,0,0,0,'Uther SAY_UTHER_INTRO_H2_1'),
(37223,-1668025,'Uther...Uther the Lightbringer. How...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Утер... Утер Светоносный... Как...',17052,0,0,0,'Sylvanas SAY_SYLVANAS_INTRO_4'),
(37225,-1668026,'You haven''t much time. The Lich King sees what the sword sees. He will be here shortly.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'У вас мало времени. Король Лич видит все, что видит Ледяная Скорбь. Вскоре он будет здесь!',16660,0,0,0,'Uther SAY_UTHER_INTRO_H2_2'),
(37223,-1668027,'The Lich King is here? Then my destiny shall be fulfilled today!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Король Лич здесь?! Значит, моя судьба решится сегодня!',17053,0,0,0,'Sylvanas SAY_SYLVANAS_INTRO_5'),
(37225,-1668028,'You cannot defeat the Lich King. Not here. You would be a fool to try. He will kill those who follow you and raise them as powerful servants of the Scourge. But for you, Sylvanas, his reward for you would be worse than the last.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вам не победить Короля Лича. По крайней мере, не здесь. Глупо и пытаться. Он убьет твоих соратников, и воскресит их как воинов плети. Но что до тебя, Сильвана, он готовит тебе участь еще страшнее, чем в прошлый раз',16661,0,0,0,'Uther SAY_UTHER_INTRO_H2_3'),
(37223,-1668029,'There must be a way... ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Должен быть способ...',17054,0,0,0,'Sylvanas SAY_SYLVANAS_INTRO_6'),
(37225,-1668030,'Perhaps, but know this: there must always be a Lich King. Even if you were to strike down Arthas, another would have to take his place, for without the control of the Lich King, the Scourge would wash over this world like locusts, destroying all that they touched.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Возможно, но знай: Король Лич должен быть всегда. Даже если вы убьете Артаса, кто-то обязан будет занять его место. Лишившись правителя, Плеть налетит на мир как стая саранчи, и разрушит все на своем пути!',16662,0,0,0,'Uther SAY_UTHER_INTRO_H2_4'),
(37223,-1668031,'Who could bear such a burden?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Кому по силам такое бремя?',17055,0,0,0,'Sylvanas SAY_SYLVANAS_INTRO_7'),
(37225,-1668032,'I do not know, Banshee Queen. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Не знаю, Королева Банши. Если бы не Артас, который все еще является частью Короля Лича, Плеть давно бы уже уничтожила Азерот.',16663,0,0,0,'Uther SAY_UTHER_INTRO_H2_5'),
(37225,-1668033,'Alas, the only way to defeat the Lich King is to destroy him at the place he was created.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Увы, единственный способ одолеть Короля Лича - это убить его там, где он был порожден.',16664,0,0,0,'Uther SAY_UTHER_INTRO_H2_6'),
(37223,-1668034,'The Frozen Throne...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ледяной Трон...',17056,0,0,0,'Sylvanas SAY_SYLVANAS_INTRO_8'),
(37225,-1668035,'I... Aargh... He... He is coming... You... You must...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Да... Аааа... Он... Он приближается... Вы... Вы должны...',16665,0,0,0,'Uther SAY_UTHER_INTRO_H2_7'),
(37226,-1668036,'SILENCE, PALADIN!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ЗАМОЛЧИ, ПАЛАДИН!',17225,1,0,0,'Lich King SAY_LK_INTRO_1'),
(37226,-1668037,'So you wish to commune with the dead? You shall have your wish.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Так ты хочешь поговорить с мертвыми? Нет ничего проще.',17226,1,0,0,'Lich King SAY_LK_INTRO_2'),
(37226,-1668038,'Falric. Marwyn. Bring their corpses to my chamber when you are through.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Фалрик, Марвин, когда закончите, принесите их тела в мои покои.',17227,1,0,0,'Lich King SAY_LK_INTRO_3'),
(38112,-1668039,'As you wish, my lord.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как пожелаете, мой Господин',16717,1,0,0,'Falric SAY_FALRIC_INTRO_1'),
(38113,-1668040,'As you wish, my lord.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как пожелаете, мой Господин',16741,1,0,0,'Marwyn SAY_MARWYN_INTRO_1'),
(38112,-1668041,'Soldiers of Lordaeron, rise to meet your master''s call!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Солдаты Лордерона, восстаньте по зову господина',16714,1,0,0,'Falric SAY_FALRIC_INTRO_2'),
(37221,-1668042,'You won''t deny me this Arthas! I must know! I must find out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты от меня не отмахнешься, Артас! Я должна понять! Я должна знать!',16642,1,0,0,'Jaina SAY_JAINA_INTRO_END'),
(37223,-1668043,'You will not escape me that easily, Arthas! I will have my vengeance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты так просто от меня не уйдешь, Артас! Я отомщу тебе!',17057,1,0,0,'Sylvanas SAY_SYLVANAS_INTRO_END'),
(38112,-1668050,'Men, women and children... None were spared the master''s wrath. Your death will be no different.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мужчины, женщины и дети... Никто не избежал гнева господина. Вы разделите их участь.',16710,1,0,0,'Falric SAY_AGGRO'),
(38112,-1668051,'Sniveling maggot!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сопливый червяк!',16711,1,0,0,'Falric SAY_SLAY_1'),
(38112,-1668052,'The children of Stratholme fought with more ferocity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Стратхольмские детишки, и те защищались отчаяннее.',16712,1,0,0,'Falric SAY_SLAY_2'),
(38112,-1668053,'Marwyn, finish them...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Марвин, добей их...',16713,1,0,0,'Falric SAY_DEATH'),
(38112,-1668054,'Despair... so delicious...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как сладостно... отчаяние...',16715,1,0,0,'Falric SAY_IMPENDING_DESPAIR'),
(38112,-1668055,'Fear... so exhilarating...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Как приятен... страх...',16716,1,0,0,'Falric SAY_DEFILING_HORROR'),
(38113,-1668060,'Death is all that you will find here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы найдете здесь лишь смерть!',16734,1,0,0,'Marwyn SAY_AGGRO'),
(38113,-1668061,'I saw the same look in his eyes when he died. Terenas could hardly believe it. Hahahaha!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'У Теренаса был такой же взгляд в миг смерти. Он никак не мог поверить. Хахахахаха!',16735,1,0,0,'Marwyn SAY_SLAY_1'),
(38113,-1668062,'Choke on your suffering!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Захлебнись страданием!',16736,1,0,0,'Marwyn SAY_SLAY_2'),
(38113,-1668063,'Yes... Run... Run to meet your destiny... Its bitter, cold embrace, awaits you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Да... Бегите навстречу судьбе... Ее жестокие, холодные объятия, ждут вас.',16737,1,0,0,'Marwyn SAY_DEATH'),
(38113,-1668064,'Your flesh has decayed before your very eyes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы увидите, как разлагается ваша плоть!',16739,1,0,0,'Marwyn SAY_CORRUPTED_FLESH_1'),
(38113,-1668065,'Waste away into nothingness!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сгиньте без следа!',16740,1,0,0,'Marwyn SAY_CORRUPTED_FLESH_2'),

-- ToCr
(0,-1649070,'Welcome champions, you have heard the call of the Argent Crusade and you have boldly answered. It is here in the crusaders coliseum that you will face your greatest challenges. Those of you who survive the rigors of the coliseum will join the Argent Crusade on its marsh to ice crown citadel.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Добро пожаловать, герои, вы услышали призыв Серебряного Авангарда и без колебаний откликнулись на него. В этом Колизее вам предстоит сразиться с опаснейшими противниками. Те, из вас, кто смогут пережить испытания, войдут в ряды Серебряного Авангарда, который направится в Цитадель Ледяной Короны',16036,1,0,0,'34996'),
(0,-1649072,'Your beast will be no match for my champions Tirion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Твои чудовища не чета героям альянса, Тирион!',16069,1,0,0,'34990'),
(0,-1649073,'I have seen  more  worthy  challenges in the ring of blood, you waste our time paladin.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я видел и более достойных соперников в багровом круге, ты напрасно тратишь наше время, паладин.',16026,1,0,0,'34995'),
(0,-1649071,'Hailing from the deepest, darkest carverns of the storm peaks, Gormok the Impaler! Battle on, heroes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Из самых глубоких и темных пещер Грозовой Гряды, был призван Гормок Пронзающий Бивень! В бой, герои!',16038,1,0,0,'34996'),
(0,-1649074,'Steel yourselves, heroes, for the twin terrors Acidmaw and Dreadscale. Enter the arena!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Приготовьтесь к схватке с близнецами чудовищами. Кислотной Утробой и Жуткой Чешуей',16039,1,0,0,'34996'),
(0,-1649075,'The air freezes with the introduction of our next combatant, Icehowl! Kill or be killed, champions!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'В воздухе повеяло ледяным дыханием следующего бойца. На арену выходит Ледяной Рев! Сражайтесь или погибните, герои!',16040,1,0,0,'34996'),
(0,-1649076,'The monstrous menagerie has been vanquished!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Все чудовища повержены!',16041,1,0,0,'34996'),
(0,-1649080,'Grand Warlock Wilfred Fizzlebang will summon forth your next challenge. Stand by for his entry!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сейчас великий чернокнижник Вилфред Непопамс призовет вашего нового противника. Готовьтесь к бою!',16043,1,0,0,'34996'),
(0,-1649081,'Thank you, Highlord! Now challengers, I will begin the ritual of summoning! When I am done, a fearsome Doomguard will appear!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Благодарю, Верховный Лорд! А теперь, смельчаки, я приступаю к ритуалу призыва! Когда я закончу, появится грозный Демон!',16268,1,0,0,'35458'),
(0,-1649082,'Prepare for oblivion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Готовьтесь к забвению!',16269,1,0,0,'35458'),
(0,-1649083,'Ah ha! Behold the absolute power of Wilfred Fizzlebang, master summoner! You are bound to ME, demon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ага! Получилось! Трепещи перед всевластным Вилфредом Непопамсом, мастером призыва! Ты покорен МНЕ, демон!',16270,1,0,0,'35458'),
(0,-1649030,'Trifling gnome, your arrogance will be your undoing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ничтожный гном, тебя погубит твоя самоуверенность!',16143,1,0,0,'34780'),
(0,-1649084,'But I am in charge here-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Тут я главный... Аааа...',16271,1,0,0,'35458'),
(0,-1649031,'You face Jaraxxus, eredar lord of the Burning Legion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Перед вами Джераксус, Эредарский повелитель Пылающего Легиона!',16144,1,0,0,'34780'),
(0,-1649037,'Come forth, sister! Your master calls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Явись, сестра! Господин зовет!',16150,1,0,0,'34780'),
(0,-1649039,'INFERNO!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ИНФЕРНАЛ!',16151,1,0,0,'34780'),
(0,-1649032,'Another will take my place. Your world is doomed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мое место займут другие. Ваш мир обречен.',16147,1,0,0,'34780'),
(0,-1649088,'Treacherous Alliance dogs! You summon a demon lord against warriors of the Horde!? Your deaths will be swift!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Подлые собаки Альянса! Вы выпустили повелителя демонов на воинов Орды!? Ваша смерть будет быстрой!',16021,1,0,0,'34995'),
(0,-1649089,'The Alliance doesnt need the help of a demon lord to deal with Horde filth. Come, pig!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Альянсу не нужна помощь повелителя демонов, чтобы справиться с Ордынским отродьем. Пёс!',16064,1,0,0,'34990'),
(0,-1649087,'The loss of Wilfred Fizzlebang, while unfortunate, should be a lesson to those that dare dabble in dark magic. Alas, you are victorious and must now face the next challenge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Гибель Вилфреда Непопамса весьма трагична, и должна послужить уроком тем, кто смеет беспечно играть с темной магией. К счастью вы победили демона, и теперь вас ждет новый противник!',16045,1,0,0,'34996'),
(0,-1649090,'Everyone, calm down! Compose yourselves! There is no conspiracy at play here. The warlock acted on his own volition - outside of influences from the Alliance. The tournament must go on!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Тише, успокойтесь! Никакого заговора здесь нет. Чернокнижник заигрался - и поплатился за это. Турнир продолжается!',16046,1,0,0,'34996'),
(0,-1649091,'The next battle will be against the Argent Crusades most powerful knights! Only by defeating them will you be deemed worthy...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'В следующем бою вы встретитесь с могучими рыцарями Серебряного Авангарда. Лишь победив, их вы заслужите достойную награду...',16047,1,0,0,'34996'),
(0,-1649092,'Our honor has been besmirched! They make wild claims and false accusations against us. I demand justice! Allow my champions to fight in place of your knights, Tirion. We challenge the Horde!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Они хотели запятнать честь Альянса! Они пытались нас оклеветать. Я требую справедливости! Тирион, позволь моим чемпионам сражаться вместо твоих рыцарей. Мы бросаем вызов Орде!',16066,1,0,0,'34990'),
(0,-1649093,'The Horde demands justice! We challenge the Alliance. Allow us to battle in place of your knights, paladin. We will show these dogs what it means to insult the Horde!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Орда требует справедливости! Мы вызываем Альянс на бой. Позволь нам встать на место твоих рыцарей, паладин. Мы покажем этим псам, как оскорблять орду!',16023,1,0,0,'34995'),
(0,-1649094,'Very well, I will allow it. Fight with honor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Хорошо, да будет так. Сражайтесь с честью.',16048,1,0,0,'34996'),
(0,-1649095,'Fight for the glory of the Alliance, heroes! Honor your king and your people!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Сражайтесь во славу Альянса, герои! Во имя вашего короля!',16065,1,0,0,'34990'),
(0,-1649096,'Show them no mercy, Horde champions! LOK-TAR OGAR!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Не щадите никого, герои Орды! ЛОК-ТАР ОГАР!',16022,1,0,0,'34995'),
(0,-1649097,'GLORY OF THE ALLIANCE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'СЛАВА АЛЬЯНСУ!',16067,1,0,0,'34990'),
(0,-1649098,'LOK-TAR OGAR!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ЛОК-ТАР ОГАР!',16024,1,0,0,'34995'),
(0,-1649099,'A shallow and tragic victory. We are weaker as a whole from the losses suffered today. Who but the Lich King could benefit from such foolishness? Great warriors have lost their lives. And for what? The true threat looms ahead - the Lich King awaits us all in death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пустая и горькая победа. После сегодняшних потерь мы стали слабее как целое. Кто еще кроме Короля Лича выиграет от подобной глупости? Пали великие воины. И ради чего? Истинная опасность еще впереди - нас ждет битва с Королем Личом.',16049,1,0,0,'34996'),
(0,-1649100,'Only by working together will you overcome the final challenge. From the depths of Icecrown come two of the Scourges most powerful lieutenants: fearsome valkyr, winged harbingers of the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Лишь сплотившись, вы сможете пройти следующее испытание. Из глубин Ледяной Короны навстречу вам подымаются две могучие воительницы Плети: жуткие валькиры, крылатые вестницы Короля Лича!',16050,1,0,0,'34996'),
(0,-1649101,'Let the games begin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пусть состязания начнутся!',16037,1,0,0,'34996'),
(0,-1649040,'In the name of our dark master. For the Lich King. You. Will. Die.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Во имя темного повелителя. Во имя Короля Лича. Вы умрете!',16272,1,0,0,'34497'),
(0,-1649041,'The Scourge cannot be stopped...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Плеть не остановить...',16275,1,0,0,'34496'),
(0,-1649050,'Let the dark consume you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Да поглотит вас тьма!',16278,1,0,0,'34496'),
(0,-1649048,'Let the light consume you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Да поглотит вас свет!',16279,1,0,0,'34496'),
(0,-1649103,'Do you still question the might of the horde paladin? We will take on all comers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ты все еще сомневаешься в могуществе Орды, паладин? Мы примем любой вызов.',16025,1,0,0,'34995'),
(0,-1649104,'A mighty blow has been dealt to the Lich King! You have proven yourselves able bodied champions of the Argent Crusade. Together we will strike at Icecrown Citadel and destroy what remains of the Scourge! There is no challenge that we cannot face united!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Король Лич понес тяжелую потерю! Вы проявили себя как бесстрашные герои Серебряного Авангарда. Мы вместе нанесем удар по Цитадели Ледяной Короны и разнесем в клочья остатки Плети! Нет такого испытания, которое мы бы не могли пройти сообща!',16051,1,0,0,'34996'),
(0,-1649105,'You will have your challenge, Fordring.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Будет тебе такое испытание, Фордринг.',16321,1,0,0,'35877'),
(0,-1649106,'Arthas! You are hopelessly outnumbered! Lay down Frostmourne and I will grant you a just death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Артас! Нас гораздо больше! Сложи Ледяную Скорбь, и я подарю тебе заслуженную смерть.',16052,1,0,0,'34996'),
(0,-1649107,'The Nerubians built an empire beneath the frozen wastes of Northrend. An empire that you so foolishly built your structures upon. MY EMPIRE.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Нерубианцы воздвигли целую империю под льдами Нордскола. Империю, на которой вы так бездумно построили свои дома. МОЮ ИМПЕРИЮ.',16322,1,0,0,'35877'),
(0,-1649108,'The souls of your fallen champions will be mine, Fordring.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Души твоих павших чемпионов будут принадлежать мне, Фордринг.',16323,1,0,0,'35877'),
(0,-1649102,'Not even the Lich King most powerful minions can stand against the Alliance! All hail our victors!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Против Альянса не выстоять даже самым сильным прислужникам Короля Лича! Все славьте наших героев!',16068,1,0,0,'34990'),
(0,-1649056,'This place will serve as your tomb!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Это место станет вашей могилой!',16234,1,0,0,'34564'),
(0,-1649063,'The swarm shall overtake you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Стая поглотит вас!',16241,1,0,0,'34564'),
(0,-1649059,'I have failed you, master...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я подвел тебя, господин...',16238,1,0,0,'34564');

-- [Dungeon Finder] Fix Drak'Tharon Keep reward
UPDATE `instance_encounters` SET `creditType` = '0', `creditEntry` = '26632' WHERE `entry` IN ('376', '375');
-- [Dungeon Finder] Fix reward for Utgarde Keep.
UPDATE `instance_encounters` SET `creditEntry` = '23980' WHERE `entry` IN ('575', '576');
-- [Dungeon Finder] Fix CoS reward
UPDATE `instance_encounters` SET `creditType`='0', `creditEntry` = '26533' WHERE `entry` IN ('296', '300');

-- [Dungeon Finder] Fix ToC reward
UPDATE `instance_encounters` SET `creditType`='0', `creditEntry`='35451' WHERE `entry`='341';
UPDATE `instance_encounters` SET `creditType`='0', `creditEntry`='35451' WHERE `entry`='340';

-- Master Poisoner fix
DELETE FROM `spell_dbc` WHERE `Id` IN ('45176');
INSERT INTO `spell_dbc` (`Id`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `Stances`, `StancesNot`, `Targets`, `CastingTimeIndex`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `Comment`) VALUES
('45176','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','1','1','1','0','1','0','-1','0','0','3','0','0','0','0','0','0','0','0','0','0','0','0','0','0','6','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','8','0','0','0','0','0','0','0','0','0','0','1','Master Poisoner Trigger (SERVERSIDE)');
DELETE FROM `spell_proc_event` WHERE `entry` IN ('31226', '31227', '58410');
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
('31226','0','8','0','524288','0','0','0','0','0','0'), -- Master Poisoner (Rank 1)
('31227','0','8','0','524288','0','0','0','0','0','0'), -- Master Poisoner (Rank 2)
('58410','0','8','0','524288','0','0','0','0','0','0'); -- Master Poisoner (Rank 3)

-- Ulduar Proc Trinket's
DELETE FROM `spell_proc_event` WHERE `entry` IN (65007,65002,64738,64742,64714,65005,64792,65013,65025,64786,65020,64764);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(65007,0,0,0,0,0,0x00055400,0,0,100,0),         -- Eye of the Broodmother
(65002,0,0,0,0,0,0x00055400,0,0,0,45),          -- Sif's Remembrance
(64738,0,0,0,0,0,0x00055400,0,0,0,45),          -- Show of Faith
(64742,0,0,0,0,0,0x00055400,0,0,0,45),          -- Pandora's Plea
(64714,0,0,0,0,0,0x00010000,0x0040000,0,0,45),  -- Flare of the Heavens
(65005,0,0,0,0,0,0x00010000,0x0040000,0,0,45),  -- Elemental Focus Stone
(64792,0,0,0,0,0,0x00000154,0x0000002,0,0,45),  -- Blood of the old God
(65013,0,0,0,0,0,0x00000154,0x0000002,0,0,45),  -- Pyrite Infuser
(65025,0,0,0,0,0,0x00000154,0,0,0,45),          -- Dark Matter
(64786,0,0,0,0,0,0x00000154,0,0,0,45),          -- Comet's Trail
(65020,0,0,0,0,0,0x00000154,0,0,0,45),          -- Mjolnir Runestone
(64764,0,0,0,0,0,0x00100000,0,0,0,45);          -- The General's Heart

-- Fix DK teleportation
UPDATE `spell_target_position` SET `target_map`='0',`target_position_x`='2403.08',`target_position_y`='-5632.17',`target_position_z`='377.03',`target_orientation`='3.717547' WHERE (`id`='53098');

-- Fix memorial in Dalaran
UPDATE `gameobject_template` SET `ScriptName`='go_memorial_plaque' WHERE `entry` = 202443;

-- Achievement: Higher Learning, http://old.wowhead.com/achievement=1956
UPDATE `gameobject` SET `phaseMask` = 64 WHERE `id` IN (192708,192865,192866,192711,192710,192867,192713);

-- Some cleanup, Remove later.
DELETE FROM `conditions` WHERE `SourceEntry` = 56578 and `ConditionValue2` = 26693;

-- Spell: Shield Slam, http://old.wowhead.com/spell=23922
REPLACE INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES (23922,0,0,0,0,'Warrior - Shield Slam');

-- Fix Meteorite Crystal proc
UPDATE `spell_proc_event` SET `procEx`=0x0010000, `ppmRate`=0 WHERE `entry`=64999;

-- Achievement: Out With It, http://old.wowhead.com/achievement=288
DELETE FROM `spell_script_names` WHERE `spell_id`=44436;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(44436, 'spell_gen_tricky_treat');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (42965,42966);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(42965,42919,0, 'Hallows End - Tricky Treat'),
(42966,-42965,0, 'Hallows End - Upset Tummy removes Tricky Treat'),
(42966,-42919,0, 'Hallows End - Upset Tummy removes Tricky Treat');

-- Trains in stormwind
UPDATE gameobject SET rotation2 = 0, rotation3 = 1 WHERE id IN (176080,176081,176082,176083,176084,176085);

-- IC message fix
UPDATE `trinity_string` SET `content_loc8` = '%s захватил(а) %s' WHERE `entry` =1219;

-- ToC fix (fuckin' YTDB)
DELETE FROM `creature` WHERE `guid` IN (114727,137996,137982,137983,137984,137985);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('114727','34816','649','15','65535','0','0','559.258','90.2662','395.123','5.01319','300','0','0','126000','0','0','0','0','0'),
('137996','35651','649','1','1','29890','0','563.686','139.432','393.986','4.69494','180','0','0','1','0','0','0','0','0'),
('137982','34862','649','1','1','28549','0','735.403','75.3576','142.202','2.09439','180','0','0','1','0','0','0','0','0'),
('137983','34862','649','1','1','28549','0','692.92','184.809','142.203','5.35816','180','0','0','1','0','0','0','0','0'),
('137984','34862','649','1','1','28549','0','688.207','102.847','142.202','0.645772','180','0','0','1','0','0','0','0','0'),
('137985','34862','649','1','1','28549','0','740.545','189.113','142.197','3.75246','180','0','0','1','0','0','0','0','0');

-- Bladestorm Fix
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 46924;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(46924, -13810, 2, 'Bladestorm immune at Frost Trap'),
(46924, -51514, 2, 'Bladestorm immune at Hex'),
(46924, -116, 2, 'Bladestorm immune at FrostBolt'),
(46924, -45524, 2, 'Bladestorm immune at Chains of Ice'),
(46924, -68766, 2, 'Bladestorm immune at Desecration'),
(46924, -58617, 2, 'Bladestorm immune at Glyph of Heart Strike'),
(46924, -605, 2, 'Bladestorm immune at Mind Control');

-- Fix for all innkeeper's casts and for Trick or a Treat gossip
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `ConditionTypeOrReference`= 12; 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `ConditionValue1`= 24755;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_innkeeper' WHERE `npcflag` IN (66177,66179,65537,65665,65667,66433,66435,66536,66537,66539);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (295,1247,1464,2352,2388,3934,5111,5688,5814,6272,6734,6735,6736,6737,6738,
                                                    6739,6740,6741,6746,6747,6778,6790,6791,6806,6807,6928,6929,6930,7714,7731,
                                                    7733,7736,7737,7744,8931,9356,9501,11103,11106,11116,11118,12196,14731,15174,
                                                    15397,15433,16618,16739,17553,17630,16256,16553,16826,18957,19296,18251,18908,
                                                    18907,18906,19046,19232,18905,18914,18245,16542,16602,16458,18913,19319,19352,
                                                    19470,19495,19531,19571,21088,21110,21744,21746,22922,8999,23995,24208,23143,
                                                    25036,28687,24342,25287,28686,27950,27042,27066,26357,23937,27148,
                                                    27187,27027,27174,27052,26596,27069,24057,26709,28791,26985,24149,
                                                    24033,27125,29583,26680,29904,29926,29944,29963,29971,30005,30308,31433,31557,
                                                    32411,32413,32418,33970,33971);

-- Bad auras fix
UPDATE `creature_template_addon` SET `auras`='58806' WHERE `entry`='28113';

-- Fix warrior's Revenge spellbonus
UPDATE `spell_bonus_data` SET `ap_bonus` =  0.310 WHERE `entry` = 6572;

-- Fix trinket's exploits
DELETE FROM spell_bonus_data WHERE entry IN (67760,67714);
INSERT INTO spell_bonus_data (entry,direct_bonus,dot_bonus,ap_bonus,ap_dot_bonus,comments) VALUES
(67760,0,0,0,0, 'Item - Coliseum 25 Heroic Caster Trinket - Pillar of Flame'),
(67714,0,0,0,0, 'Item - Coliseum 25 Normal Caster Trinket - Pillar of Flame');
DELETE FROM spell_proc_event WHERE entry IN (67712,67758);
INSERT INTO spell_proc_event (entry,SchoolMask,SpellFamilyName,SpellFamilyMask0,SpellFamilyMask1,SpellFamilyMask2,procFlags,procEx,ppmRate,CustomChance,Cooldown) VALUES
(67712,0,0,0,0,0,0x00011000,0x0000002,0,0,2),
(67758,0,0,0,0,0,0x00011000,0x0000002,0,0,2);

-- Achievement: Bros. Before Ho Ho Ho's, http://old.wowhead.com/achievement=1685
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~0x100, `type_flags`=`type_flags`|0x4000000 WHERE `entry` IN (739,927,1182,1351,1444,5484,5489,5661,8140,12336,26044);
UPDATE `creature` SET `spawntimesecs`=20 WHERE `id` IN (739,927,1182,1351,1444,5484,5489,5661,8140,12336,26044);
UPDATE `item_template` SET `Flags`=0x40 WHERE `entry`=21519;
UPDATE `creature_template` SET `faction_A`='85',`faction_H`='85' WHERE `entry`='5661';

-- Some grammar fixes
UPDATE `trinity_string` SET content_loc8 = 'Битва за Низину Арати начнется через 1 минуту.' WHERE entry = 661;
UPDATE `trinity_string` SET content_loc8 = 'Битва за Низину Арати начнется через 30 секунд. Приготовьтесь!' WHERE entry = 662;
UPDATE `trinity_string` SET content_loc8 = 'Битва за Низину Арати началась!' WHERE entry = 663;

-- Arena Spectator
DELETE FROM `trinity_string` WHERE `entry` BETWEEN '11608' AND '11613';
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc8`) VALUES
('11608', 'Player %s forbided you to watch his arena match.', 'Игрок %s не находится в вашем списке друзей.'),
('11609', 'Player %s is not on arena match.', 'Игрок %s не на арене.'),
('11610', 'You should not on arena or battleground to be a spectator.', 'Вы не можете стать зрителем, находясь на поле боя или арене.'),
('11611', 'You already have a spectator state.', 'Вы уже являетесь зрителем.'),
('11612', 'Arena spectators system disabled.', 'Система зрителей отключена.'),
('11613', 'You cannot use chat while you are a spectator.', 'Находясь в режиме зрителя, вы не можете использовать чат.');
DELETE FROM `command` WHERE `name` = 'spectate';
INSERT INTO `command` VALUES ('spectate', '0', 'Syntax: .spectate $player\r\n\r\nMakes you a spectator of arena match with $player');

-- Ironforge: King and Guards scripts
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~2,`AIName`='',`ScriptName`='boss_king_magni_bronzebeard' WHERE `entry`=2784;
DELETE FROM `creature_text` WHERE `entry`=2784;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(2784,1,0,'For Khaz''Modan!',14,0,0,5,0,5896,'Magni Bronzebeard - Aggro'),
(2784,1,1,'Feel the fury of the mountain!',14,0,0,5,0,5896,'Magni Bronzebeard - Aggro');
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=5595;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=5595;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(5595,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,75,0,0,0,0,0,0,'Ironforge Guard - On Summon - Start Attack'),
(5595,0,1,0,0,0,100,0,5000,5000,5000,5000,49,0,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ironforge Guard - every 5 sec  - change Target'),
(5595,0,2,0,0,0,100,0,5000,7000,8000,10000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ironforge Guard - IC - cast Sunder Armor'),
(5595,0,3,0,0,0,100,0,5000,7000,10000,12000,11,8078,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ironforge Guard - IC - cast Thunderclap');

DELETE FROM `spell_script_names` WHERE `spell_id`=62705;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62705,'at_RX_214_repair_o_matic_station');

-- Disable TEST totems
DELETE FROM `disables` WHERE `sourceType`=0 AND `entry` IN (23789,61904);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `comment`) VALUES
(0, 23789, 8, 'Stoneclaw Totem TEST - can crash client by spawning too many totems'),
(0, 61904, 8, 'Magma Totem TEST - can crash client by spawning too many totems');
