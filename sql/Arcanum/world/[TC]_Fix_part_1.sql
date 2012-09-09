-- Spell script name linking for Defending Wyrmrest Temple: Destabilize Azure Dragonshrine Effect
DELETE FROM `spell_script_names` WHERE `spell_id`=49370 ;
INSERT INTO `spell_script_names` VALUES
(49370,'spell_q12372_destabilize_azure_dragonshrine_dummy');

-- DB/Spells: Fix Flamecap Fire damage
SET @Spell := 28715; -- Flamecap Fire
DELETE FROM `spell_bonus_data` WHERE `entry`=@Spell;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES
(@Spell,0,0,0,0, 'Flamecap Fire');

-- Русификация конечного эвента в Пещерах Стенаний
UPDATE `script_texts` SET `content_loc8` = 'Я должен сделать необходимые приготовления перед тем, как Ритуал Пробуждения начнется. Вы должны защитить меня!' WHERE `entry` = -1043001;
UPDATE `script_texts` SET `content_loc8` = 'Эти пещеры были когда-то храмом, который подавал надежду на возобновление растительности в Степи. Теперь это залы начных кошмаров.' WHERE `entry` = -1043002;
UPDATE `script_texts` SET `content_loc8` = 'Пошлите! Мы должны продолжать. Еще нужно сделать много дел, прежде чем мы сможем вытащить Наралекса из его кошмара.' WHERE `entry` = -1043003;
UPDATE `script_texts` SET `content_loc8` = 'В этом круге огня я должен произнести заклинание, которое должно изгнать духов, убитых Повелителями Змей.' WHERE `entry` = -1043004;
UPDATE `script_texts` SET `content_loc8` = 'Пещеры были очищены. Теперь мы идем к Наралексу!' WHERE `entry` = -1043005;
UPDATE `script_texts` SET `content_loc8` = 'Помимо кошмара, Наралекс заключен в вечный сон. Нужно разбудить его пока не стало слишком поздно!' WHERE `entry` = -1043006;
UPDATE `script_texts` SET `content_loc8` = 'Защищайте меня, Смельчаки! Я буду углубляться в Изумрудный Сон, чтобы спасти Наралекса и положить конец этому!' WHERE `entry` = -1043007;
UPDATE `script_texts` SET `content_loc8` = 'Это Мутанус Пожиратель является главной преградой пробуждения Наралекса! Без сомнений.' WHERE `entry` = -10430012;
UPDATE `script_texts` SET `content_loc8` = 'Ах, я вырвался из страшного кошмара! Я благодарю тебя, мой верный ученик, вместе с храбрым товарищами.' WHERE `entry` = -10430015;
UPDATE `script_texts` SET `content_loc8` = 'Мы должны идти и встретиться с другими учениками. Предстоит сделать много работы, прежде чем я могу сделать еще одну попытку восстановить Степи. Прощайте, Смельчаки!' WHERE `entry` = -10430016;
UPDATE `script_texts` SET `content_loc8` = 'Наконец-то! Наралекса можно пробудить! Ну помогите мне, смелые искатели приключений!' WHERE `entry` = -1043000;
UPDATE `script_texts` SET `content_loc8` = 'Наконец-то! Я пробудился!' WHERE `entry` = -1043013;
UPDATE `script_texts` SET `content_loc8` = '%S начал выполнять Ритуал по пробуждению Наралекса' WHERE `entry` = -1043008;
UPDATE `script_texts` SET `content_loc8` = '%S судорожно метается в кошмарном сне.' WHERE `entry` = -1043009;
UPDATE `script_texts` SET `content_loc8` = '%S корчится в муках. Ученик пытается ему помочь!' WHERE `entry` = -1043010;
UPDATE `script_texts` SET `content_loc8` = '%S увидел ужастное видение. Что-то шевелится под мутной воде.' WHERE `entry` = -1043011;

-- Перевод по квесту 898
UPDATE `script_texts` SET `content_loc8` = 'Будь рядом, $n. Мне понадобится твоя помощь. Возможно мне удастся вырваться отсюда. Пошли!' WHERE `entry` = -1000370;
UPDATE `script_texts` SET `content_loc8` = 'Наконец-то! Северная часовня не охраняется! Мне нужно время, чтобы отдышаться!' WHERE `entry` = -1000371;
UPDATE `script_texts` SET `content_loc8` = 'Теперь я чувствую себя лучше. Давайте вернемся к побегу. Пошли, $n.' WHERE `entry` = -1000372;
UPDATE `script_texts` SET `content_loc8` = 'Похоже, что Флибустьеры Южных морей сильно закрепились на побережье. Это может стать проблемой.' WHERE `entry` = -1000373;
UPDATE `script_texts` SET `content_loc8` = 'Помогай! $C атакуют!' WHERE `entry` = -1000374;
UPDATE `script_texts` SET `content_loc8` = 'Пришло время для мести!' WHERE `entry` = -1000375;
UPDATE `script_texts` SET `content_loc8` = '$C идет прямо на нас!' WHERE `entry` = -1000376;
UPDATE `script_texts` SET `content_loc8` = 'Получай, $C' WHERE `entry` = -1000377;
UPDATE `script_texts` SET `content_loc8` = 'Мы почти добрались! Давай ускоримся...' WHERE `entry` = -1000378;
UPDATE `script_texts` SET `content_loc8` = 'Ах, сладкий воздух побега.' WHERE `entry` = -1000379;
UPDATE `script_texts` SET `content_loc8` = 'Капитан Тало`тас Сияющий, $N помог мне сбежать! $N, я уверен, капитан вознаградит ваше мужество.' WHERE `entry` = -1000380;

-- Фикс квеста 4921 "Пропавшая без вести"
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 10668;

-- Русификация начальной зоны Рыцарей смерти.
-- Не оффлайк, перевод не точный
-- Если у кого то есть хоть какой-то перевод данной местности, просьба кинуть или в скайп, или в Request.
UPDATE `script_texts` SET `content_loc8` = 'Ты сделал большую ошибку, злодей!' WHERE `entry` = -1609000;
UPDATE `script_texts` SET `content_loc8` = 'Когда-то я был воином Света... Посмотрите, чем я стал...' WHERE `entry` = -1609001;
UPDATE `script_texts` SET `content_loc8` = 'Смерть это единственное лекарство!' WHERE `entry` = -1609016;
UPDATE `script_texts` SET `content_loc8` = 'В бой!' WHERE `entry` IN (1609012, 1609008);
UPDATE `script_texts` SET `content_loc8` = 'Я выиграю свою свободу и оставлю это проклятое место!' WHERE `entry` = -1609005;
UPDATE `script_texts` SET `content_loc8` = 'Нет спасения' WHERE `entry` = -1609080;
UPDATE `script_texts` SET `content_loc8` = 'Запомни этот день, $n, ибо это тот день, когда ты будешь повержен!' WHERE `entry` = -1609081;
UPDATE `script_texts` SET `content_loc8` = 'Не смеши меня.' WHERE `entry` = -1609083;

-- Criteria data for achievement 'Wrecking Ball'
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (3368, 3369, 3370, 12578, 7623, 3371);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (3368, 3369, 3370, 12578, 7623, 3371);
INSERT INTO `achievement_criteria_data`(`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(3368,2,0,0,''),
(3369,2,0,0,''),
(3370,2,0,0,''),
(12578,2,0,0,''),
(7623,2,0,0,''),
(3371,2,0,0,'');

-- Fix OfferRewardText for quest "Warsong Supplies"
UPDATE `quest_template` SET `OfferRewardText`='Excellent, $N. You''ve saved me a lot of work!$b$bBut don''t think that I''m not grateful!' WHERE `Id`=6571;