/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
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

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ulduar.h"

enum Spells
{
    SPELL_ASCEND                    = 64487,
    SPELL_BERSERK                   = 47008,
    SPELL_BIG_BANG_10               = 64443,
    SPELL_BIG_BANG_25               = 64584,
    SPELL_COSMIC_SMASH_10           = 62301,
    SPELL_COSMIC_SMASH_25           = 64598,
    SPELL_PHASE_PUNCH               = 64412,
    SPELL_PHASE_PUNCH_PHASE         = 64417,
    SPELL_PHASE_PUNCH_ALPHA_1       = 64435,
    SPELL_PHASE_PUNCH_ALPHA_2       = 64434,
    SPELL_PHASE_PUNCH_ALPHA_3       = 64428,
    SPELL_PHASE_PUNCH_ALPHA_4       = 64421,
    SPELL_QUANTUM_STRIKE_10         = 64395,
    SPELL_QUANTUM_STRIKE_25         = 64592,
    SPELL_BLACK_HOLE_CREDIT         = 65312,
    SPELL_BLACK_HOLE_EXPLOSION_10   = 64122,
    SPELL_BLACK_HOLE_EXPLOSION_25   = 65108,
    SPELL_BLACK_HOLE_SPAWN_VISUAL   = 62003,
    SPELL_BLACK_HOLE_STATE          = 64135,
    SPELL_BLACK_HOLE_TRIGGER        = 62185,
    SPELL_BLACK_HOLE_PHASE          = 62168,
    SPELL_DESPAWN_BLACK_HOLE        = 64391,
    SPELL_ARCANE_BARAGE_10          = 64599,
    SPELL_ARCANE_BARAGE_25          = 64607,
    SPELL_VOID_ZONE_VISUAL          = 64469,
    SPELL_DUAL_WIELD                = 42459,
    SPELL_BOSS_FINISHED             = 65184,
    SPELL_REORIGINATION             = 64996
};

enum Creatures
{
    NPC_COLLAPSING_STAR             = 32955,
    NPC_BLACK_HOLE                  = 32953,
    NPC_LIVING_CONSTELLATION        = 33052,
    NPC_DARK_MATTER                 = 33089,
    NPC_AZEROTH                     = 34246,
    NPC_COSMIC_SMASH_TRIGGER        = 33104,
    NPC_COSMIC_SMASH_TARGET         = 33105,
    NPC_UNLEASHED_DARK_MATTER       = 34097
};

enum Yells
{
    SAY_AGGRO                       = -1603000,
    SAY_SLAY_1                      = -1603001,
    SAY_SLAY_2                      = -1603002,
    SAY_ENGAGED_FOR_FIRST_TIME      = -1603003,
    SAY_PHASE_2                     = -1603004,
    SAY_SUMMON_COLLAPSING_STAR      = -1603005,
    SAY_DEATH_1                     = -1603006,
    SAY_DEATH_2                     = -1603007,
    SAY_DEATH_3                     = -1603008,
    SAY_DEATH_4                     = -1603009,
    SAY_DEATH_5                     = -1603010,
    SAY_BERSERK                     = -1603011,
    SAY_BIG_BANG_1                  = -1603012,
    SAY_BIG_BANG_2                  = -1603013,
    SAY_TIMER_1                     = -1603014,
    SAY_TIMER_2                     = -1603015,
    SAY_TIMER_3                     = -1603016,
    SAY_SUMMON_1                    = -1603017,
    SAY_SUMMON_2                    = -1603018,
    SAY_SUMMON_3                    = -1603019,
    EMOTE_STARS                     = -1603100,
    EMOTE_SMASH                     = -1603101,
    EMOTE_BANG                      = -1603102
};

enum Events
{
    EVENT_ASCEND = 1,
    EVENT_BERSERK,
    EVENT_BIGBANG,
    EVENT_COSMICSMASH,
    EVENT_PHASEPUNCH,
    EVENT_QUANTUMSTRIKE,
    EVENT_COLLAPSINGSTAR,
    EVENT_LIVINGCONSTELLATION,
    EVENT_DARKMATTER
};

static Position miscLocations[]=
{
    {1624.31f, -297.44f, 417.33f, 0.0f},  // azeroth
    {1632.36f, -310.09f, 385.0f, 0.0f}    // cosmic smash trigger
};

static Position collapsingLocations[]=
{
    {1616.25f, -293.081f, 417.321f, 5.51543f},
    {1647.26f, -292.592f, 417.322f, 3.93168f},
    {1617.38f, -324.447f, 417.321f, 0.81718f},
    {1647.45f, -323.651f, 417.321f, 2.39740f}
};

static Position constellationLocations[]=
{
    {1649.30f, -295.34f, 458.13f, 0.0f},
    {1612.22f, -294.84f, 458.13f, 0.0f},
    {1629.95f, -327.90f, 458.13f, 0.0f}
};

#define EQUIP_ID_MAIN_HAND  45620
#define EQUIP_ID_OFF_HAND   45607

class boss_algalon : public CreatureScript
{
    public:
        boss_algalon() : CreatureScript("boss_algalon") { }

        struct boss_algalonAI : public BossAI
        {
            boss_algalonAI(Creature* c) : BossAI(c, TYPE_ALGALON)
            {
                _firstTime = true;
            }

            void Reset()
            {
                _Reset();

                if (_firstTime)
                {
                    me->SummonCreature(NPC_AZEROTH, miscLocations[0]);
                    DoCast(SPELL_REORIGINATION);
                }
                else
                    me->setFaction(7);

                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetReactState(REACT_PASSIVE);

                _phase = 0;
                _stepTimer = 0;
                _starCount = 0;
                _constellationCount = 0;
                _wipeRaid = false;
                _firstStars = true;

                DoCast(me, SPELL_DUAL_WIELD, true);
                me->SetAttackTime(OFF_ATTACK, 1100);
                me->SetStatFloatValue(UNIT_FIELD_MINOFFHANDDAMAGE, float(RAID_MODE<uint32>(15000, 28000)));
                me->SetStatFloatValue(UNIT_FIELD_MAXOFFHANDDAMAGE, float(RAID_MODE<uint32>(18000, 35000)));
                me->SetStatFloatValue(UNIT_FIELD_MINDAMAGE, float(RAID_MODE<uint32>(28000, 50000)));
                me->SetStatFloatValue(UNIT_FIELD_MAXDAMAGE, float(RAID_MODE<uint32>(35000, 60000)));
            }

            void JustReachedHome()
            {
                me->SummonCreature(NPC_AZEROTH, miscLocations[0]);
                DoCast(SPELL_REORIGINATION);
            }

            void EnterCombat(Unit* /*who*/)
            {
                me->setFaction(14);
                DoZoneInCombat();
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

                if (_firstTime)
                    _step = 1;
                else
                    _step = 4;

                events.ScheduleEvent(EVENT_BERSERK, 6*MINUTE*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_BIGBANG, 90*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_PHASEPUNCH, 15*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_QUANTUMSTRIKE, urand(4*IN_MILLISECONDS, 14*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_COSMICSMASH, 25*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_COLLAPSINGSTAR, 15*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_LIVINGCONSTELLATION, 50*IN_MILLISECONDS);
            }

            void FinishEncounter()
            {
                if (instance)
                {
                    instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, SPELL_BOSS_FINISHED);
                    instance->DoUpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_KILL_CREATURE, me->GetEntry(), 1);
                }

            }

            void KilledUnit(Unit* /*victim*/)
            {
                DoScriptText(RAND(SAY_SLAY_1, SAY_SLAY_2), me);
            }

            void JumpToNextStep(uint32 timer)
            {
                _stepTimer = timer;
                ++_step;
            }

            void DoAction(int32 const action)
            {
                // used for despawn
                // should do some roleplay
                _JustDied();
                me->DisappearAndDie();
            }

            void JustSummoned(Creature* summon)
            {
                summons.Summon(summon);

                switch (summon->GetEntry())
                {
                    case NPC_COLLAPSING_STAR:
                        ++_starCount;
                        summon->SetReactState(REACT_PASSIVE);
                        summon->SetInCombatWithZone();
                        summon->GetMotionMaster()->MoveRandom(15.0f);
                        break;
                    case NPC_LIVING_CONSTELLATION:
                        ++_constellationCount;
                        summon->SetInCombatWithZone();
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                            summon->AI()->AttackStart(target);
                        break;
                    case NPC_UNLEASHED_DARK_MATTER:
                        summon->SetInCombatWithZone();
                        if (Unit* target = SelectTarget(SELECT_TARGET_TOPAGGRO, 0))
                            summon->AI()->AttackStart(target);
                        break;
                    default:
                        break;
                }
            }

            void SummonedCreatureDies(Creature* summon, Unit* /*killer*/)
            {
                switch (summon->GetEntry())
                {
                    case NPC_COLLAPSING_STAR:
                        --_starCount;
                        me->SummonCreature(NPC_BLACK_HOLE, summon->GetPositionX(), summon->GetPositionY(), summon->GetPositionZ());
                        break;
                    case NPC_LIVING_CONSTELLATION:
                        --_constellationCount;
                        break;
                    default:
                        break;
                }
            }

            void SpellHitTarget(Unit* target, SpellInfo const* spell)
            {
                if (spell->Id == SPELL_PHASE_PUNCH)
                {
                    uint32 stackAmount = target->GetAuraCount(SPELL_PHASE_PUNCH);
                    switch (stackAmount)
                    {
                        case 1:
                            target->CastSpell(target, SPELL_PHASE_PUNCH_ALPHA_1, true);
                            break;
                        case 2:
                            target->CastSpell(target, SPELL_PHASE_PUNCH_ALPHA_2, true);
                            break;
                        case 3:
                            target->CastSpell(target, SPELL_PHASE_PUNCH_ALPHA_3, true);
                            break;
                        case 4:
                            target->CastSpell(target, SPELL_PHASE_PUNCH_ALPHA_4, true);
                            break;
                        case 5:
                            target->CastSpell(target, SPELL_PHASE_PUNCH_PHASE, true);
                            break;
                        default:
                            break;
                    }
                }
            }

            void EnterEvadeMode()
            {
                if (!_wipeRaid)
                {
                    summons.DespawnAll();

                    // remove players from phase
                    instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_PHASE_PUNCH_PHASE);
                    instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BLACK_HOLE_PHASE);

                    _wipeRaid = true;
                    me->InterruptNonMeleeSpells(true);
                    DoCast(SPELL_ASCEND);
                    return;
                }

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                _EnterEvadeMode();
                me->GetMotionMaster()->MoveTargetedHome();
                Reset();
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                if (_phase == 1 && HealthBelowPct(20))
                {
                    _phase = 2;
                    DoScriptText(SAY_PHASE_2, me);
                    summons.DespawnAll();
                    events.CancelEvent(EVENT_COLLAPSINGSTAR);
                    events.CancelEvent(EVENT_LIVINGCONSTELLATION);
                    events.ScheduleEvent(EVENT_DARKMATTER, 5*IN_MILLISECONDS);

                    // summon 4 unstable black holes
                    for (uint8 i = 0; i < 4; ++i)
                        me->SummonCreature(NPC_BLACK_HOLE, collapsingLocations[i]);
                }

                if (_phase == 2 && HealthBelowPct(2))
                {
                    summons.DespawnAll();
                    me->InterruptNonMeleeSpells(true);
                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    me->SetReactState(REACT_PASSIVE);
                    me->RemoveAllAuras();
                    _step = 1;
                    _phase = 3;
                }

                if (_phase == 0)
                {
                    if (_stepTimer <= diff)
                    {
                        switch (_step)
                        {
                            case 1:
                                DoScriptText(SAY_SUMMON_1, me);
                                JumpToNextStep(7500);
                                break;
                            case 2:
                                DoScriptText(SAY_SUMMON_2, me);
                                JumpToNextStep(6000);
                                break;
                            case 3:
                                DoScriptText(SAY_SUMMON_3, me);
                                JumpToNextStep(11000);
                                break;
                            case 4:
                                _EnterCombat();
                                summons.DespawnEntry(NPC_AZEROTH);
                                SetEquipmentSlots(false, EQUIP_ID_MAIN_HAND, EQUIP_ID_OFF_HAND, EQUIP_NO_CHANGE);
                                DoScriptText(SAY_AGGRO, me);
                                if (!_firstTime)
                                    JumpToNextStep(7000);
                                else
                                    JumpToNextStep(15000);
                                break;
                            case 5:
                                if (!_firstTime)
                                {
                                    JumpToNextStep(0);
                                    break;
                                }
                                DoScriptText(SAY_ENGAGED_FOR_FIRST_TIME, me);
                                JumpToNextStep(11000);
                                break;
                            case 6:
                                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                                me->SetReactState(REACT_AGGRESSIVE);
                                _firstTime = false;
                                _phase = 1;
                                break;
                        }
                    }
                    else
                        _stepTimer -= diff;

                    return;
                }

                if (_phase == 3)
                {
                    if (_stepTimer <= diff)
                    {
                        switch (_step)
                        {
                            case 1:
                                me->SummonGameObject(RAID_MODE<uint32>(GO_GIFT_OF_THE_OBSERVER_10, GO_GIFT_OF_THE_OBSERVER_25), 1634.258667f,
                                    -295.101166f, 417.321381f, 0, 0, 0, 0, 0, 0);
                                _JustDied();
                                DoScriptText(SAY_DEATH_1, me);
                                JumpToNextStep(40000);
                                break;
                            case 2:
                                DoScriptText(SAY_DEATH_2, me);
                                JumpToNextStep(17000);
                                break;
                            case 3:
                                DoScriptText(SAY_DEATH_3, me);
                                JumpToNextStep(10000);
                                break;
                            case 4:
                                DoScriptText(SAY_DEATH_4, me);
                                JumpToNextStep(11000);
                                break;
                            case 5:
                                DoScriptText(SAY_DEATH_5, me);
                                JumpToNextStep(11000);
                                break;
                            case 6:
                                me->DisappearAndDie();
                                FinishEncounter();
                                break;
                        }
                    }
                    else
                        _stepTimer -= diff;

                    return;
                }

                _DoAggroPulse(diff);
                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_BIGBANG:
                            DoScriptText(RAND(SAY_BIG_BANG_1, SAY_BIG_BANG_2), me);
                            DoScriptText(EMOTE_BANG, me);
                            me->GetMotionMaster()->MoveDistract(10*IN_MILLISECONDS);
                            DoCast(RAID_MODE<uint32>(SPELL_BIG_BANG_10, SPELL_BIG_BANG_25));
                            events.RescheduleEvent(EVENT_COSMICSMASH, urand(10, 15) *IN_MILLISECONDS);
                            events.ScheduleEvent(EVENT_BIGBANG, 90*IN_MILLISECONDS);
                            return;
                        case EVENT_PHASEPUNCH:
                            DoCastVictim(SPELL_PHASE_PUNCH, true);
                            events.ScheduleEvent(EVENT_PHASEPUNCH, 15*IN_MILLISECONDS);
                            break;
                        case EVENT_QUANTUMSTRIKE:
                            DoCastVictim(RAID_MODE<uint32>(SPELL_QUANTUM_STRIKE_10, SPELL_QUANTUM_STRIKE_25));
                            events.ScheduleEvent(EVENT_QUANTUMSTRIKE, urand(4*IN_MILLISECONDS, 10*IN_MILLISECONDS));
                            break;
                        case EVENT_COSMICSMASH:
                            DoScriptText(EMOTE_SMASH, me);
                            DoCast(RAID_MODE<uint32>(SPELL_COSMIC_SMASH_10, SPELL_COSMIC_SMASH_25));
                            events.ScheduleEvent(EVENT_COSMICSMASH, 25*IN_MILLISECONDS);
                            break;
                        case EVENT_COLLAPSINGSTAR:
                            DoScriptText(SAY_SUMMON_COLLAPSING_STAR, me);
                            if (_firstStars)
                            {
                                DoScriptText(EMOTE_STARS, me);
                                _firstStars = false;
                            }
                            for (uint8 i = _starCount; i < 4; ++i)
                                me->SummonCreature(NPC_COLLAPSING_STAR, collapsingLocations[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3*IN_MILLISECONDS);
                            events.ScheduleEvent(EVENT_COLLAPSINGSTAR, 60*IN_MILLISECONDS);
                            break;
                        case EVENT_LIVINGCONSTELLATION:
                            for (uint8 i = _constellationCount; i < 3; ++i)
                                me->SummonCreature(NPC_LIVING_CONSTELLATION, constellationLocations[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 1*IN_MILLISECONDS);
                            events.ScheduleEvent(EVENT_LIVINGCONSTELLATION, 45*IN_MILLISECONDS);
                            break;
                        case EVENT_DARKMATTER:
                            for (uint8 i = 0; i < 4; ++i)
                                me->SummonCreature(NPC_UNLEASHED_DARK_MATTER, collapsingLocations[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3*IN_MILLISECONDS);
                            events.ScheduleEvent(EVENT_DARKMATTER, 20*IN_MILLISECONDS);
                            break;
                        case EVENT_BERSERK:
                            DoScriptText(SAY_BERSERK, me);
                            DoCast(me, SPELL_BERSERK, true);
                            events.ScheduleEvent(EVENT_ASCEND, 3*IN_MILLISECONDS);
                            break;
                        case EVENT_ASCEND:
                            DoCast(SPELL_ASCEND);
                            events.ScheduleEvent(EVENT_ASCEND, 10*IN_MILLISECONDS);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
                //EnterEvadeIfOutOfCombatArea(diff);
            }

        private:
            uint8 _constellationCount;
            uint8 _starCount;
            uint8 _phase;
            uint8 _step;
            uint32 _stepTimer;
            bool _firstStars;
            bool _firstTime;
            bool _wipeRaid;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_algalonAI(creature);
        }
};

class mob_collapsing_star : public CreatureScript
{
    public:
        mob_collapsing_star() : CreatureScript("mob_collapsing_star") { }

        struct mob_collapsing_starAI : public ScriptedAI
        {
            mob_collapsing_starAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                _collapsed = false;
                _loseHealthTimer = 1*IN_MILLISECONDS;
            }

            void AttackStart(Unit* /*target*/) { }
            void MoveInLineOfSight(Unit* /*who*/) { }

            void DamageTaken(Unit* /*attacker*/, uint32 &damage)
            {
                if (damage >= me->GetHealth() && !_collapsed)
                {
                    _collapsed = true;
                    DoCast(me, SPELL_BLACK_HOLE_CREDIT, true);
                    DoCast(me, RAID_MODE<uint32>(SPELL_BLACK_HOLE_EXPLOSION_10, SPELL_BLACK_HOLE_EXPLOSION_25), true);
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (_loseHealthTimer <= diff)
                {
                    me->DealDamage(me, me->CountPctFromMaxHealth(1));
                    _loseHealthTimer = 1*IN_MILLISECONDS;
                }
                else
                    _loseHealthTimer -= diff;
            }

        private:
            bool _collapsed;
            uint32 _loseHealthTimer;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new mob_collapsing_starAI(creature);
        }
};

class npc_living_constellation : public CreatureScript
{
    public:
        npc_living_constellation() : CreatureScript("npc_living_constellation") { }

        struct npc_living_constellationAI : public ScriptedAI
        {
            npc_living_constellationAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                me->SetCanFly(true);
                me->SetSpeed(MOVE_FLIGHT, 0.7f);
                _arcaneBarrageTimer = urand(5*IN_MILLISECONDS, 10*IN_MILLISECONDS);
            }

            void MoveInLineOfSight(Unit* who)
            {
                ScriptedAI::MoveInLineOfSight(who);

                if (who->GetTypeId() != TYPEID_UNIT)
                    return;

                if (who->GetEntry() == NPC_BLACK_HOLE && who->GetDistance(me) < 5.0f)
                {
                    who->ToCreature()->CastSpell(who, SPELL_DESPAWN_BLACK_HOLE, true);
                    who->ToCreature()->ForcedDespawn();
                    me->DealDamage(me, me->GetHealth());
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (_arcaneBarrageTimer <= diff)
                {
                    DoCast(RAID_MODE<uint32>(SPELL_ARCANE_BARAGE_10, SPELL_ARCANE_BARAGE_25));
                    _arcaneBarrageTimer = urand(5*IN_MILLISECONDS, 7*IN_MILLISECONDS);
                }
                else
                    _arcaneBarrageTimer -= diff;
            }

        private:
            uint32 _arcaneBarrageTimer;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_living_constellationAI(creature);
        }
};

class npc_black_hole : public CreatureScript
{
    public:
        npc_black_hole() : CreatureScript("npc_black_hole") { }

        struct npc_black_holeAI : public Scripted_NoMovementAI
        {
            npc_black_holeAI(Creature* creature) : Scripted_NoMovementAI(creature)
            {
                DoCast(me, SPELL_BLACK_HOLE_SPAWN_VISUAL, true);
                DoCast(me, SPELL_BLACK_HOLE_STATE, true);
                DoCast(me, SPELL_BLACK_HOLE_TRIGGER, true);
                DoCast(me, SPELL_VOID_ZONE_VISUAL, true);
                me->setFaction(14);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
                me->SetReactState(REACT_PASSIVE);
                me->SetInCombatWithZone();
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_black_holeAI(creature);
        }
};

class go_planetarium_access : public GameObjectScript
{
    public:
        go_planetarium_access() : GameObjectScript("go_planetarium_access") { }

        bool OnGossipHello(Player* player, GameObject* go)
        {
            InstanceScript* instance = go->GetInstanceScript();
            uint32 item = uint32(go->GetMap()->GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL ? 45796 : 45798);

            if (player->HasItemCount(item, 1))
            {
                instance->SetBossState(TYPE_ALGALON, SPECIAL);
                go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NOT_SELECTABLE);
                go->SetGoState(GO_STATE_ACTIVE);
            }
            return true;
        }
};

// cast spell effects on same target
class spell_cosmic_smash : public SpellScriptLoader
{
    public:
        spell_cosmic_smash() : SpellScriptLoader("spell_cosmic_smash") { }

        class spell_cosmic_smash_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_SpellScript);

            void FilterTargetsInitial(std::list<Unit*>& unitList)
            {
                sharedUnitList = unitList;
            }

            void FilterTargetsSubsequent(std::list<Unit*>& unitList)
            {
                unitList = sharedUnitList;
            }

            void HandleForceCast(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);

                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();

                uint32 triggered_spell_id = GetSpellInfo()->Effects[effIndex].TriggerSpell;

                if (caster && target)
                    target->CastSpell(target, triggered_spell_id, true, NULL, NULL, caster->GetGUID());
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_cosmic_smash_SpellScript::FilterTargetsInitial, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                OnUnitTargetSelect += SpellUnitTargetFn(spell_cosmic_smash_SpellScript::FilterTargetsSubsequent, EFFECT_1, TARGET_UNIT_SRC_AREA_ENEMY);
                OnEffectHitTarget += SpellEffectFn(spell_cosmic_smash_SpellScript::HandleForceCast, EFFECT_0, SPELL_EFFECT_FORCE_CAST);
            }

            std::list<Unit*> sharedUnitList;
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_SpellScript();
        }
};

// set trigger summon location
class spell_cosmic_smash_summon_trigger : public SpellScriptLoader
{
    public:
        spell_cosmic_smash_summon_trigger() : SpellScriptLoader("spell_cosmic_smash_summon_trigger") { }

        class spell_cosmic_smash_summon_trigger_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_summon_trigger_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                if (GetCaster())
                    GetCaster()->SummonCreature(NPC_COSMIC_SMASH_TRIGGER, miscLocations[1], TEMPSUMMON_TIMED_DESPAWN, 7900);
            }

            void Register()
            {
                OnEffectHit += SpellEffectFn(spell_cosmic_smash_summon_trigger_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SUMMON);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_summon_trigger_SpellScript();
        }
};

// set target summon location
class spell_cosmic_smash_summon_target : public SpellScriptLoader
{
    public:
        spell_cosmic_smash_summon_target() : SpellScriptLoader("spell_cosmic_smash_summon_target") { }

        class spell_cosmic_smash_summon_target_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_summon_target_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                if (GetCaster())
                    GetCaster()->SummonCreature(NPC_COSMIC_SMASH_TARGET, GetCaster()->GetPositionX(), GetCaster()->GetPositionY(),
                        GetCaster()->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN, 10*IN_MILLISECONDS);
            }

            void Register()
            {
                OnEffectHit += SpellEffectFn(spell_cosmic_smash_summon_target_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SUMMON);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_summon_target_SpellScript();
        }
};

// set damage based on proximity
class spell_cosmic_smash_dmg : public SpellScriptLoader
{
    public:
        spell_cosmic_smash_dmg() : SpellScriptLoader("spell_cosmic_smash_dmg") { }

        class spell_cosmic_smash_dmg_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_dmg_SpellScript);

            void CalcDamage()
            {
                if (!GetHitUnit() || !GetTargetDest())
                    return;

                float distance = GetHitUnit()->GetExactDist2d(GetTargetDest());
                if (distance < 6.0f)
                    return;

                SetHitDamage(int32(GetHitDamage() * 10.0f / pow(distance - 2.6f, 1.9f)));
            }

            void Register()
            {
                OnHit += SpellHitFn(spell_cosmic_smash_dmg_SpellScript::CalcDamage);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_dmg_SpellScript();
        }
};

// prevent target gets selected twice after spell destination is set
class spell_cosmic_smash_missile_target : public SpellScriptLoader
{
    public:
        spell_cosmic_smash_missile_target() : SpellScriptLoader("spell_cosmic_smash_missile_target") { }

        class spell_cosmic_smash_missile_target_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_cosmic_smash_missile_target_SpellScript);

            void FilterTarget(std::list<Unit*>& unitList)
            {
                for (std::list<Unit*>::iterator itr = unitList.begin(); itr != unitList.end(); ++itr)
                {
                    if ((*itr)->isAlive())
                        (*itr)->Kill(*itr);
                }
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_cosmic_smash_missile_target_SpellScript::FilterTarget, EFFECT_0, TARGET_DEST_NEARBY_ENTRY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_cosmic_smash_missile_target_SpellScript();
        }
};

class spell_remove_player_from_phase : public SpellScriptLoader
{
    public:
        spell_remove_player_from_phase() : SpellScriptLoader("spell_remove_player_from_phase") { }

        class spell_remove_player_from_phaseScript : public AuraScript
        {
            PrepareAuraScript(spell_remove_player_from_phaseScript);

            bool Validate(SpellInfo const* /*spellInfo*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_BLACK_HOLE_PHASE))
                    return false;
                if (!sSpellMgr->GetSpellInfo(SPELL_PHASE_PUNCH_PHASE))
                    return false;
                return true;
            }

            void HandlePeriodicTick(AuraEffect const* /*aurEff*/)
            {
                PreventDefaultAction();
                if (InstanceScript* instance = GetUnitOwner()->GetInstanceScript())
                {
                    instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_BLACK_HOLE_PHASE);
                    instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_PHASE_PUNCH_PHASE);
                }
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_remove_player_from_phaseScript::HandlePeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_remove_player_from_phaseScript();
        }
};

// reset threat after apply and remove
class spell_algalon_phased : public SpellScriptLoader
{
    public:
        spell_algalon_phased() : SpellScriptLoader("spell_algalon_phased") { }

        class spell_algalon_phased_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_algalon_phased_AuraScript);

            void OnApplyOrRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Unit* target = GetTarget())
                {
                    target->CombatStop();
                    target->getHostileRefManager().deleteReferences();
                }
            }

            void Register()
            {
                AfterEffectApply += AuraEffectApplyFn(spell_algalon_phased_AuraScript::OnApplyOrRemove, EFFECT_0, SPELL_AURA_PHASE, AURA_EFFECT_HANDLE_REAL);
                AfterEffectRemove += AuraEffectRemoveFn(spell_algalon_phased_AuraScript::OnApplyOrRemove, EFFECT_0, SPELL_AURA_PHASE, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_algalon_phased_AuraScript();
        }
};

void AddSC_boss_algalon()
{
    new boss_algalon();
    new mob_collapsing_star();
    new npc_living_constellation();
    new npc_black_hole();
    new go_planetarium_access();
    new spell_cosmic_smash();
    new spell_cosmic_smash_summon_trigger();
    new spell_cosmic_smash_summon_target();
    new spell_cosmic_smash_dmg();
    new spell_cosmic_smash_missile_target();
    new spell_remove_player_from_phase();
    new spell_algalon_phased();
}
