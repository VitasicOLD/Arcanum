/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
SDName: Ironforge
SD%Complete: 100
SDComment: Quest support: 3702
SDCategory: Ironforge
EndScriptData */

/* ContentData
npc_royal_historian_archesonus
EndContentData */

#include "ScriptPCH.h"
#include "Vehicle.h"

/*######
## npc_royal_historian_archesonus
######*/

#define GOSSIP_ITEM_ROYAL   "I am ready to listen"
#define GOSSIP_ITEM_ROYAL_1 "That is tragic. How did this happen?"
#define GOSSIP_ITEM_ROYAL_2 "Interesting, continue please."
#define GOSSIP_ITEM_ROYAL_3 "Unbelievable! How dare they??"
#define GOSSIP_ITEM_ROYAL_4 "Of course I will help!"

class npc_royal_historian_archesonus : public CreatureScript
{
public:
    npc_royal_historian_archesonus() : CreatureScript("npc_royal_historian_archesonus") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                player->SEND_GOSSIP_MENU(2236, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(2237, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                player->SEND_GOSSIP_MENU(2238, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                player->SEND_GOSSIP_MENU(2239, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->CLOSE_GOSSIP_MENU();
                player->AreaExploredOrEventHappens(3702);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(3702) == QUEST_STATUS_INCOMPLETE)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
            player->SEND_GOSSIP_MENU(2235, creature->GetGUID());
        }
        else
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

/*######
## npc_gnome_citizen
## spell_motivate_a_tron
######*/

enum Spells
{
    SPELL_CITIZEN_AURA                  = 74034,
    SPELL_PETACT_AURA                   = 74071,
    SPELL_QUEST_CREDIT                  = 73960,

    SPELL_MOTIVATE_1                    = 73943,
    SPELL_MOTIVATE_2                    = 74080,

    SPELL_TURNIN                        = 75078,
    SPELL_AOE_TURNIN                    = 73955,

    SPELL_SALUTE_CREDIT                 = 73771,
    SPELL_DANCE_CREDIT                  = 73830,
    SPELL_ROAR_CREDIT                   = 73832,
    SPELL_CHEER_CREDIT                  = 73833,

    SPELL_SHOOT_CREDIT                  = 74184,
    SPELL_SHOOT_VISUAL                  = 74179,

    SPELL_CREATE_TELEPORTER             = 74206,
    SPELL_CREDIT_OZZIE                  = 74154,
    SPELL_CREDIT_MILLI                  = 74155,
    SPELL_CREDIT_TOG                    = 74156,
};

enum Creatures
{
    NPC_SPARKNOZZLE                     = 39675,

    NPC_CITIZEN_1                       = 39253,
    NPC_CITIZEN_2                       = 39623,

    NPC_MOTIVATED_CITIZEN_1             = 39466,
    NPC_MOTIVATED_CITIZEN_2             = 39624,

    NPC_TRAINEE                         = 39349,

    NPC_TARGET                          = 39711,

    NPC_OZZIE                           = 1268,
    NPC_MILLI                           = 7955,
    NPC_TOG                             = 6119,
    NPC_SUMMONING_PAD                   = 39817,

};

enum Points
{
    POINT_SPARKNOZZLE                   = 4026500,
};

enum Texts
{
    SAY_CITIZEN_START                   = 0,
    SAY_CITIZEN_END                     = 1,
};

class npc_gnome_citizen : public CreatureScript
{
    public:
        npc_gnome_citizen() : CreatureScript("npc_gnome_citizen") { }

        struct npc_gnome_citizenAI : public ScriptedAI
        {
            npc_gnome_citizenAI(Creature* creature) : ScriptedAI(creature)
            {
                Reset();
                Player* player = me->GetOwner()->ToPlayer();

                switch (urand(1, 4))
                {
                    case 1:
                        _mountModel = 6569;
                        break;
                    case 2:
                        _mountModel = 9473;
                        break;
                    case 3:
                        _mountModel = 9474;
                        break;
                    case 4:
                        _mountModel = 9475;
                        break;
                }
                if (player)
                    me->GetMotionMaster()->MoveFollow(player, 5.0f, float(rand_norm() + 1.0f) * M_PI / 3.0f * 4.0f);
            }

            void Reset()
            {
                _complete = false;
                me->AddAura(SPELL_CITIZEN_AURA, me);
                DoCast(me, SPELL_PETACT_AURA);
                me->SetReactState(REACT_PASSIVE);
                Talk(SAY_CITIZEN_START);
            }

            void MovementInform(uint32 type, uint32 id)
            {
                if (type != POINT_MOTION_TYPE)
                    return;
                if (id == POINT_SPARKNOZZLE)
                    me->DespawnOrUnsummon();
            }

            void SpellHit(Unit* caster, SpellEntry const* spell)
            {
                if (spell->Id == SPELL_AOE_TURNIN && caster->GetEntry() == NPC_SPARKNOZZLE && !_complete)
                {
                    _complete = true;    // Preventing from giving credit twice
                    DoCast(me, SPELL_TURNIN);
                    DoCast(me, SPELL_QUEST_CREDIT);
                    Talk(SAY_CITIZEN_END);
                    me->GetMotionMaster()->MovePoint(POINT_SPARKNOZZLE, caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ());
                }
            }

            void UpdateAI(const uint32 diff)
            {
                Unit* owner = me->GetOwner();

                if (!owner)
                    return;

                if (owner->IsMounted() && !me->IsMounted())
                    me->Mount(_mountModel);
                else if (!owner->IsMounted() && me->IsMounted())
                    me->Dismount();

                me->SetSpeed(MOVE_RUN, owner->GetSpeedRate(MOVE_RUN));
                me->SetSpeed(MOVE_WALK, owner->GetSpeedRate(MOVE_WALK));
            }

        private:
            uint32 _mountModel;
            bool _complete;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_gnome_citizenAI(creature);
        }
};

class spell_motivate_a_tron : public SpellScriptLoader
{
    public:
        spell_motivate_a_tron() : SpellScriptLoader("spell_motivate_a_tron") {}

        class spell_motivate_a_tron_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_motivate_a_tron_SpellScript)
            bool Validate(SpellInfo const* /*spellEntry*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_MOTIVATE_1))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_MOTIVATE_2))
                    return false;
               return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (Unit* target = GetHitUnit())
                {
                    uint32 motivate = 0;
                    if (target->GetEntry() == NPC_CITIZEN_1)
                        motivate = SPELL_MOTIVATE_1;
                    else if (target->GetEntry() == NPC_CITIZEN_2)
                        motivate = SPELL_MOTIVATE_2;
                    if (motivate)
                        caster->CastSpell(target, motivate, true, NULL, NULL, caster->GetGUID());
                }
            }

            void Register()
            {
                OnEffectHit += SpellEffectFn(spell_motivate_a_tron_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_motivate_a_tron_SpellScript();
        }
};

#define STEAM_0 "Ну, бесполезная куча шестеренок, давайте-ка приниматься за работу!"
#define STEAM_1 "Я научу вас всему, что должен уметь настоящий солдат!"
#define STEAM_2 "Прежде всего, вам необходимо пройти строевую подготовку."
#define STEAM_3 "По сигналу покажите мне, как надо приветствовать командира по уставу!"
#define STEAM_4 "Итак, рекруты, отдайте честь своему командиру!"
#define STEAM_5 "Отличная работа!"
#define STEAM_6 "На поле боя важно устрашить врага бешеным боевым ревом!"
#define STEAM_7 "Как только я дам сигнал, покажите мне, что такое настоящее бешенство!"
#define STEAM_8 "Покажите мне настоящее бешенство!"
#define STEAM_9 "Ух ты, славно!"
#define STEAM_10 "Помните, что важнейший фактор в любой битве - это дух!"
#define STEAM_11 "Приготовьтесь показать мне как солдат должен быть рад победе!"
#define STEAM_12 "Давайте! Выразите свой восторг!"
#define STEAM_13 "Потрясающе!"
#define STEAM_14 "Однако, самое в сражении - уметь правильно отметить заработанную потом и кровью победу!"
#define STEAM_15 "Исполните для меня свой самый лучший победный танец! Начинайте по сигналу!"
#define STEAM_16 "А теперь - танцевать!"
#define STEAM_17 "Великолепно!"
#define STEAM_18 "Вы - лучший отряд новобранцев, который я когда-либо видел! Давайте-ка всё повторим!"

class npc_steamcrank : public CreatureScript
{
    public:
        npc_steamcrank() : CreatureScript("npc_steamcrank") { }

        struct npc_steamcrankAI : public ScriptedAI
        {
            npc_steamcrankAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
            }

            void JumpToNextStep(uint32 uiTimer)
            {
                _stepTimer = uiTimer;
                ++_step;
                if (_step > 26)
                {
                    _step = 0;
                    _stepTimer = 2000;
                }
            }

            void ReceiveEmote(Player* pPlayer, uint32 uiTextEmote)
            {
                switch(uiTextEmote)
                {
                    case TEXT_EMOTE_SALUTE:
                        if (_step >= 5 && _step < 8)
                            me->CastSpell(pPlayer, SPELL_SALUTE_CREDIT, true);
                        break;
                    case TEXT_EMOTE_ROAR:
                        if (_step >= 11 && _step < 14)
                            me->CastSpell(pPlayer, SPELL_ROAR_CREDIT, true);
                        break;
                    case TEXT_EMOTE_CHEER:
                        if (_step >= 17 && _step < 20)
                            me->CastSpell(pPlayer, SPELL_CHEER_CREDIT, true);
                        break;
                    case TEXT_EMOTE_DANCE:
                        if (_step >= 23 && _step < 26)
                            me->CastSpell(pPlayer, SPELL_DANCE_CREDIT, true);
                        break;
                }
            }

            void ForceEmote(uint32 uiEmote)
            {
                std::list<Creature*> Trainees;
                GetCreatureListWithEntryInGrid(Trainees, me, NPC_TRAINEE, 15.0f);
                if (!Trainees.empty())
                {
                    for (std::list<Creature*>::iterator itr = Trainees.begin(); itr != Trainees.end(); ++itr)
                        (*itr)->SetUInt32Value(UNIT_NPC_EMOTESTATE, uiEmote);
                }
            }

            void UpdateAI(const uint32 diff)
            {
                if (_stepTimer <= diff)
                {
                    switch (_step)
                    {
                        case 0:
                            me->MonsterSay(STEAM_0, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 1:
                            me->MonsterSay(STEAM_1, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 2:
                            me->MonsterSay(STEAM_2, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 3:
                            me->MonsterSay(STEAM_3, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 4:
                            me->MonsterSay(STEAM_4, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(1000);
                            break;
                        case 5:
                            ForceEmote(EMOTE_ONESHOT_SALUTE);
                            JumpToNextStep(1500);
                            break;
                        case 6:
                            ForceEmote(EMOTE_ONESHOT_NONE);
                            JumpToNextStep(3000);
                        case 7:
                            me->MonsterSay(STEAM_5, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 8:
                            me->MonsterSay(STEAM_6, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 9:
                            me->MonsterSay(STEAM_7, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 10:
                            me->MonsterSay(STEAM_8, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(1000);
                            break;
                        case 11:
                            ForceEmote(EMOTE_ONESHOT_ROAR);
                            JumpToNextStep(2000);
                            break;
                        case 12:
                            ForceEmote(EMOTE_ONESHOT_NONE);
                            JumpToNextStep(3000);
                            break;
                        case 13:
                            me->MonsterSay(STEAM_9, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 14:
                            me->MonsterSay(STEAM_10, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 15:
                            me->MonsterSay(STEAM_11, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 16:
                            me->MonsterSay(STEAM_12, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(1000);
                            break;
                        case 17:
                            ForceEmote(EMOTE_ONESHOT_CHEER);
                            JumpToNextStep(1500);
                            break;
                        case 18:
                            ForceEmote(EMOTE_ONESHOT_NONE);
                            JumpToNextStep(3000);
                            break;
                        case 19:
                            me->MonsterSay(STEAM_13, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 20:
                            me->MonsterSay(STEAM_14, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 21:
                            me->MonsterSay(STEAM_15, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 22:
                            me->MonsterSay(STEAM_16, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(1000);
                            break;
                        case 23:
                            ForceEmote(EMOTE_ONESHOT_DANCE);
                            JumpToNextStep(2500);
                            break;
                        case 24:
                            ForceEmote(EMOTE_ONESHOT_NONE);
                            JumpToNextStep(3000);
                            break;
                        case 25:
                            me->MonsterSay(STEAM_17, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                        case 26:
                            me->MonsterSay(STEAM_18, LANG_UNIVERSAL, NULL);
                            JumpToNextStep(5000);
                            break;
                    }
                }
                else
                    _stepTimer -= diff;
            }

        private:
            uint32 _step;
            uint32 _stepTimer;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_steamcrankAI(creature);
        }
};

class npc_shoot_bunny : public CreatureScript
{
    public:
        npc_shoot_bunny() : CreatureScript("npc_shoot_bunny") { }

        struct npc_shoot_bunnyAI : public ScriptedAI
        {
            npc_shoot_bunnyAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                if (me->FindNearestCreature(NPC_TARGET, 3.0f, true))
                    if (Unit* vehSummoner = me->ToTempSummon()->GetSummoner())
                        if (Vehicle* vehicle = vehSummoner->GetVehicleKit())
                            if (Unit* driver = vehicle->GetPassenger(0))
                                driver->CastSpell(driver, SPELL_SHOOT_CREDIT, true);
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_shoot_bunnyAI(creature);
        }
};

#define MEK_1_0 "Пусть они заберут наши жизни, но им никогда не забрать..."
#define MEK_1_1 "...нашу ИЗОБРЕТАТЕЛЬНОСТЬ!"
#define LIS_1_0 "Что? Я понятия не имею о чем он говорит! Это ужастно!"
#define MEK_2_0 "Мы не позволим себя уничтожить! Мы не сдадимся без боя!"
#define MEK_2_1 "Мы будем жить! Мы будем продолжать жить! Сегодня мы празднуем..."
#define MEK_2_2 "...наш День Независимости!"
#define LIS_2_0 "Кошмар! Хотя... может и ничего, если немного подчистить."
#define MEK_3_0 "Вы должны тщательно обыскать каждую заправку, все дома, склады, фермы, уборные и конуры в этом районе."
#define MEK_3_1 "Имя беглеца - Анжинер Термоштепсель."
#define MEK_3_2 "Идите и задержите его."
#define LIS_3_0 "Пожалуй, должно работать. Хотя чего-то ему явно не хватает."

class npc_mekkatorque : public CreatureScript
{
    public:
        npc_mekkatorque() : CreatureScript("npc_mekkatorque") { }

        struct npc_mekkatorqueAI : public ScriptedAI
        {
            npc_mekkatorqueAI(Creature* creature) : ScriptedAI(creature)
            {
                if (Creature* ozzie = me->FindNearestCreature(NPC_OZZIE, 15.0f, true))
                    _listener = ozzie;
                else if (Creature* milli = me->FindNearestCreature(NPC_MILLI, 15.0f, true))
                    _listener = milli;
                else if(Creature* tog = me->FindNearestCreature(NPC_TOG, 15.0f, true))
                    _listener = tog;
                else
                {
                    me->ForcedDespawn();
                    return;
                }
                _variation = urand (1,3);
                me->CastSpell(me, SPELL_CREATE_TELEPORTER, true);
            }

            void Reset()
            {
            }

            void JumpToNextStep(uint32 uiTimer)
            {
                _stepTimer = uiTimer;
                ++_step;
            }

            void CastCredit()
            {
                Unit* owner = me->GetOwner();
                switch (_listener->GetEntry())
                {
                    case NPC_OZZIE:
                        me->CastSpell(owner, SPELL_CREDIT_OZZIE, true);
                        break;
                    case NPC_MILLI:
                        me->CastSpell(owner, SPELL_CREDIT_MILLI, true);
                        break;
                    case NPC_TOG:
                        me->CastSpell(owner, SPELL_CREDIT_TOG, true);
                        break;
                }
                me->ForcedDespawn();
            }

            void UpdateAI(const uint32 diff)
            {
                if (_stepTimer <= diff)
                {
                    switch (_variation)
                    {
                        case 1:
                            switch (_step)
                            {
                                case 0:
                                    me->MonsterSay(MEK_1_0, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(5000);
                                    break;
                                case 1:
                                    me->MonsterSay(MEK_1_1, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(5000);
                                    break;
                                case 2:
                                    _listener->MonsterSay(LIS_1_0, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(3000);
                                    break;
                                case 3:
                                    if (Creature* Pad = me->FindNearestCreature(NPC_SUMMONING_PAD, 1.0f, true))
                                        Pad->ForcedDespawn();
                                    CastCredit();
                                    break;
                            }
                            break;
                        case 2:
                            switch (_step)
                            {
                                case 0:
                                    me->MonsterSay(MEK_2_0, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(5000);
                                    break;
                                case 1:
                                    me->MonsterSay(MEK_2_1, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(5000);
                                    break;
                                case 2:
                                    me->MonsterSay(MEK_2_2, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(5000);
                                    break;
                                case 3:
                                    _listener->MonsterSay(LIS_2_0, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(3000);
                                    break;
                                case 4:
                                    if (Creature* Pad = me->FindNearestCreature(NPC_SUMMONING_PAD, 1.0f, true))
                                        Pad->ForcedDespawn();
                                    CastCredit();
                                    break;
                            }
                            break;
                        case 3:
                            switch (_step)
                            {
                                case 0:
                                    me->MonsterSay(MEK_3_0, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(7000);
                                    break;
                                case 1:
                                    me->MonsterSay(MEK_3_1, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(3000);
                                    break;
                                case 2:
                                    me->MonsterSay(MEK_3_2, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(3000);
                                    break;
                                case 3:
                                    _listener->MonsterSay(LIS_3_0, LANG_UNIVERSAL, NULL);
                                    JumpToNextStep(3000);
                                    break;
                                case 4:
                                    if (Creature* Pad = me->FindNearestCreature(NPC_SUMMONING_PAD, 1.0f, true))
                                        Pad->ForcedDespawn();
                                    CastCredit();
                                    break;
                            }
                            break;
                    }
                }
                else
                    _stepTimer -= diff;
            }

        private:
            uint32 _step;
            uint32 _stepTimer;
            uint32 _variation;
            Creature* _listener;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_mekkatorqueAI(creature);
        }
};

static Position IronforgeGuard[] =
{
    {-4869.67f, -1037.57f, 502.30f, 0.347319f},
    {-4860.41f, -1051.07f, 502.30f, 1.490071f},
    {-4844.45f, -1048.32f, 502.30f, 2.299032f},
    {-4840.58f, -1033.14f, 502.30f, 3.265075f},
    {-4850.67f, -1018.92f, 502.30f, 4.482435f},
    {-4865.12f, -1024.41f, 505.90f, 5.428836f}
};

enum Magni
{
    SPELL_AVATAR            = 19135,
    SPELL_KNOCK_AWAY        = 20686,
    SPELL_STORM_BOLT        = 20685,
    SPELL_CHARGE            = 20508,	
    SPELL_LAY_ON_HANDS      = 633,  // may the wrong spell - but works fine in this case

    ENTRY_IRONFORGE_GUARD   = 5595,

    SAY_AGGRO               = 1
};

class boss_king_magni_bronzebeard : public CreatureScript
{
public:
    boss_king_magni_bronzebeard() : CreatureScript("boss_king_magni_bronzebeard") {}

    struct boss_king_magni_bronzebeardAI : public ScriptedAI
    {
        boss_king_magni_bronzebeardAI(Creature* creature) : ScriptedAI(creature) , summons(me) {}

        void Reset()
        {
            summons.DespawnAll();

            _avatarTimer = 15 *IN_MILLISECONDS;
            _knockawayTimer = 15 *IN_MILLISECONDS;
            _stormboltTimer = urand(5, 7) *IN_MILLISECONDS;
            _chargeTimer = urand(13, 17) *IN_MILLISECONDS;
            _summonTimer = urand(20, 40) *IN_MILLISECONDS;
            _layonhandsTimer = 5*IN_MILLISECONDS*MINUTE;
        }

        void JustSummoned(Creature* summoned)
        {
            summons.Summon(summoned);
        }

        void JustDied (Unit* /*victim*/)
        {
            summons.DespawnAll();
        }

        void EnterCombat(Unit* /*who*/)
        {
            Talk(SAY_AGGRO);
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            if (_stormboltTimer <= diff)
            {
                Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1);
                if (target)
                {
                    DoCast(target, SPELL_STORM_BOLT);
                    _stormboltTimer = urand(7, 9) *IN_MILLISECONDS;
                }
            }
            else
                _stormboltTimer -= diff;

            if (_avatarTimer <= diff)
            {
                DoCast(me, SPELL_AVATAR);
                _avatarTimer = 45 *IN_MILLISECONDS;
            }
            else
                _avatarTimer -= diff;

            if (_knockawayTimer <= diff)
            {
                DoResetThreat();									// Threat Reset
                DoCastVictim(SPELL_KNOCK_AWAY);
                _knockawayTimer = 15 *IN_MILLISECONDS;
            }
            else
                _knockawayTimer -= diff;

            if (_chargeTimer <= diff)
            {
                Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 25.0f);
                if (target)
                {
                    DoCast(target, SPELL_CHARGE);
                    _chargeTimer = 15 *IN_MILLISECONDS;
                }
            }
            else
                _chargeTimer -= diff;

            if (_summonTimer <= diff)
            {
                for (uint8 i = 0; i < 6; ++i)
                    me->SummonCreature(ENTRY_IRONFORGE_GUARD, IronforgeGuard[i], TEMPSUMMON_CORPSE_DESPAWN , 0);
                    _summonTimer = urand(20, 40) *IN_MILLISECONDS;
            }
            else
                _summonTimer -= diff;

            if (_layonhandsTimer <= diff)
            {
                DoCast(me, SPELL_LAY_ON_HANDS);
                _layonhandsTimer = 5 *MINUTE;
            }
            else
                _layonhandsTimer -=diff;

            DoMeleeAttackIfReady();
        }

    private:
        SummonList summons;
        uint32	_avatarTimer;
        uint32	_knockawayTimer;
        uint32	_stormboltTimer;
        uint32	_chargeTimer;
        uint32	_summonTimer;
        uint32	_layonhandsTimer;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_king_magni_bronzebeardAI(creature);
    }
};

void AddSC_ironforge()
{
    new npc_royal_historian_archesonus();
    new npc_gnome_citizen();
    new spell_motivate_a_tron();
    new npc_steamcrank();
    new npc_shoot_bunny();
    new npc_mekkatorque();
    new boss_king_magni_bronzebeard();
}
