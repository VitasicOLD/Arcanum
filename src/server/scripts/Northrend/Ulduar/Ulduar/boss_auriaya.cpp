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
    //Auriaya
    SPELL_TERRIFYING_SCREECH          = 64386,
    SPELL_SENTINEL_BLAST_10           = 64389,
    SPELL_SENTINEL_BLAST_25           = 64678,
    SPELL_SONIC_SCREECH_10            = 64422,
    SPELL_SONIC_SCREECH_25            = 64688,
    SPELL_SUMMON_SWARMING_GUARDIAN    = 64396,
    SPELL_FERAL_DEFENDER_TRIGGER      = 64449,
    SPELL_FERAL_DEFENDER_SUMMON       = 64447,
    SPELL_BERSERK                     = 47008,

    //Feral Defender
    SPELL_FERAL_ESSENCE               = 64455,
    SPELL_FERAL_RUSH_10               = 64496,
    SPELL_FERAL_RUSH_25               = 64674,
    SPELL_FERAL_POUNCE_10             = 64478,
    SPELL_FERAL_POUNCE_25             = 64669,
    SPELL_SLEEPING_FERAL_ESSENCE_10   = 64458,
    SPELL_SLEEPING_FERAL_ESSENCE_25   = 64676,

    //Sanctum Sentry
    SPELL_SAVAGE_POUNCE_10            = 64666,
    SPELL_SAVAGE_POUNCE_25            = 64374,
    SPELL_RIP_FLESH_10                = 64375,
    SPELL_RIP_FLESH_25                = 64667,
    SPELL_STRENGTH_OF_THE_PACK        = 64369
};

enum Yells
{
    SAY_AGGRO                         = -1603050,
    SAY_SLAY_1                        = -1603051,
    SAY_SLAY_2                        = -1603052,
    SAY_DEATH                         = -1603053,
    SAY_BERSERK                       = -1603054
};

enum Creatures
{
    NPC_SEEPING_ESSENCE_STALKER       = 34098,
    NPC_FERAL_DEFENDER                = 34035,
    NPC_SANCTUM_SENTRY                = 34014
};

enum Events
{
    EVENT_NONE,
    EVENT_TERRIFYING_SCREECH,
    EVENT_SONIC_SCREECH,
    EVENT_GUARDIAN_SWARM,
    EVENT_SENTINEL_BLAST,
    EVENT_FERAL_DEFENDER_SUMMON,
    EVENT_FERAL_DEFENDER_RESURRECTION,
    EVENT_BERSERK
};

enum Data
{
    DATA_NINE_LIVES,
    DATA_CRAZY_CAT_LADY,
    MODEL_INVISIBLE = 11686
};

class boss_auriaya : public CreatureScript
{
    public:
        boss_auriaya() : CreatureScript("boss_auriaya") { }

        struct boss_auriayaAI : public BossAI
        {
            boss_auriayaAI(Creature* creature) : BossAI(creature, TYPE_AURIAYA)
            {
                // dont interrupt by taking damage
                SpellInfo* spell = (SpellInfo*)sSpellMgr->GetSpellInfo(RAID_MODE(SPELL_SENTINEL_BLAST_10, SPELL_SENTINEL_BLAST_25));
                if (spell)
                    spell->ChannelInterruptFlags &= ~AURA_INTERRUPT_FLAG_TAKE_DAMAGE;
            }

            void Reset()
            {
                _Reset();
                _crazyCatLady = true;
                _defenderLifeCount = 9;

                uint8 max = RAID_MODE<uint32>(2, 4);
                for (uint8 i = 0; i < max; ++i)
                    if (Creature* sentry = me->SummonCreature(NPC_SANCTUM_SENTRY, *me, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 7000))
                        sentry->GetMotionMaster()->MoveFollow(me, (i < 2) ? 0.5f : 4.0f, M_PI - i - 1.5f);
            }

            void EnterCombat(Unit* who)
            {
                DoScriptText(SAY_AGGRO, me);
                _EnterCombat();
                summons.DoZoneInCombat();
                events.ScheduleEvent(EVENT_TERRIFYING_SCREECH, 40000);
                events.ScheduleEvent(EVENT_SONIC_SCREECH, 60000);
                events.ScheduleEvent(EVENT_GUARDIAN_SWARM, 30000);
                events.ScheduleEvent(EVENT_SENTINEL_BLAST, 20000);
                events.ScheduleEvent(EVENT_FERAL_DEFENDER_SUMMON, 60000);
                events.ScheduleEvent(EVENT_BERSERK, 600000);
            }

            void KilledUnit(Unit* /*victim*/)
            {
                DoScriptText(RAND(SAY_SLAY_1, SAY_SLAY_2), me);
            }

            uint32 GetData(uint32 type)
            {
                switch (type)
                {
                    case DATA_NINE_LIVES:
                        return !_defenderLifeCount ? 1 : 0;
                    case DATA_CRAZY_CAT_LADY:
                        return _crazyCatLady ? 1 : 0;
                }

                return 0;
            }

            void JustDied(Unit* /*victim*/)
            {
                DoScriptText(SAY_DEATH, me);
                _JustDied();
            }

            void MoveInLineOfSight(Unit* /*who*/) { }

            void SummonedCreatureDies(Creature* summon, Unit* /*killer*/)
            {
                switch (summon->GetEntry())
                {
                    case NPC_FERAL_DEFENDER:
                        --_defenderLifeCount;
                        me->SummonCreature(NPC_SEEPING_ESSENCE_STALKER, *summon);
                        if (_defenderLifeCount)
                            events.ScheduleEvent(EVENT_FERAL_DEFENDER_RESURRECTION, 30000);
                        break;
                    case NPC_SANCTUM_SENTRY:
                        _crazyCatLady = false;
                        break;
                    default:
                        break;
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                _DoAggroPulse(diff);
                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_TERRIFYING_SCREECH:
                            DoCast(SPELL_TERRIFYING_SCREECH);
                            events.ScheduleEvent(EVENT_TERRIFYING_SCREECH, 35000);
                            return;
                        case EVENT_SONIC_SCREECH:
                            DoCastVictim(RAID_MODE(SPELL_SONIC_SCREECH_10, SPELL_SONIC_SCREECH_25));
                            events.ScheduleEvent(EVENT_SONIC_SCREECH, 27000);
                            return;
                        case EVENT_GUARDIAN_SWARM:
                            DoCastVictim(SPELL_SUMMON_SWARMING_GUARDIAN);
                            events.ScheduleEvent(EVENT_GUARDIAN_SWARM, 35000);
                            return;
                        case EVENT_SENTINEL_BLAST:
                            DoCast(RAID_MODE(SPELL_SENTINEL_BLAST_10, SPELL_SENTINEL_BLAST_25));
                            events.ScheduleEvent(EVENT_SENTINEL_BLAST, 25000);
                            return;
                        case EVENT_FERAL_DEFENDER_SUMMON:
                            DoCast(SPELL_FERAL_DEFENDER_SUMMON);
                            if (Creature* defender = me->FindNearestCreature(NPC_FERAL_DEFENDER, 100.0f, true))
                            {
                                defender->AddAura(SPELL_FERAL_ESSENCE, defender);
                                defender->SetAuraStack(SPELL_FERAL_ESSENCE, defender, _defenderLifeCount);
                            }
                            return;
                        case EVENT_FERAL_DEFENDER_RESURRECTION:
                            if (Creature* defender = me->FindNearestCreature(NPC_FERAL_DEFENDER, 500.0f, false))
                            {
                                defender->Respawn();
                                defender->SetInCombatWithZone();
                                defender->AddAura(SPELL_FERAL_ESSENCE, defender);
                                defender->SetAuraStack(SPELL_FERAL_ESSENCE, defender, _defenderLifeCount);
                            }
                            return;
                        case EVENT_BERSERK:
                            DoScriptText(SAY_BERSERK, me);
                            DoCast(me, SPELL_BERSERK, true);
                            return;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

        private:
            uint8 _defenderLifeCount;
            bool _crazyCatLady;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_auriayaAI(creature);
        }
};

class mob_feral_defender: public CreatureScript
{
    public:
        mob_feral_defender() : CreatureScript("mob_feral_defender") { }

        struct mob_feral_defenderAI : public ScriptedAI
        {
            mob_feral_defenderAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                _feralRushTimer = 4000;
                _feralPounceTimer = 6000;
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                if (_feralRushTimer <= diff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, RAID_MODE(SPELL_FERAL_RUSH_10, SPELL_FERAL_RUSH_25));
                    _feralRushTimer = 5000;
                }
                else
                    _feralRushTimer -= diff;

                if (_feralPounceTimer <= diff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, RAID_MODE(SPELL_FERAL_POUNCE_10, SPELL_FERAL_POUNCE_25));
                    _feralPounceTimer = 5000;
                }
                else
                    _feralPounceTimer -= diff;

                DoMeleeAttackIfReady();
            }

        private:
            uint32 _feralRushTimer;
            uint32 _feralPounceTimer;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new mob_feral_defenderAI(creature);
        }
};

class mob_sanctum_sentry: public CreatureScript
{
    public:
        mob_sanctum_sentry() : CreatureScript("mob_sanctum_sentry") { }

        struct mob_sanctum_sentryAI : public ScriptedAI
        {
            mob_sanctum_sentryAI(Creature* creature) : ScriptedAI(creature)
            {
                _instance = creature->GetInstanceScript();
            }

            void Reset()
            {
                _ripFleshTimer = 10000;
            }

            void EnterCombat(Unit* /*who*/)
            {
                me->AddAura(SPELL_STRENGTH_OF_THE_PACK, me);
                DoCast(RAID_MODE(SPELL_SAVAGE_POUNCE_10, SPELL_SAVAGE_POUNCE_25));

                if (me->ToTempSummon())
                {
                    Unit* auriaya = me->ToTempSummon()->GetSummoner();
                    if (auriaya && auriaya->ToCreature() && !auriaya->isInCombat())
                        auriaya->ToCreature()->SetInCombatWithZone();
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                if (_ripFleshTimer <= diff)
                {
                    DoCastVictim(RAID_MODE(SPELL_RIP_FLESH_10, SPELL_RIP_FLESH_25));
                    _ripFleshTimer = 10000;
                }
                else
                    _ripFleshTimer -= diff;

                DoMeleeAttackIfReady();
            }

        private:
            InstanceScript* _instance;
            uint32 _ripFleshTimer;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new mob_sanctum_sentryAI(creature);
        }
};

class mob_seeping_essence_stalker: public CreatureScript
{
    public:
        mob_seeping_essence_stalker() : CreatureScript("mob_seeping_essence_stalker") { }

        struct mob_seeping_essence_stalkerAI : public ScriptedAI
        {
            mob_seeping_essence_stalkerAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                me->SetDisplayId(MODEL_INVISIBLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE);
                DoCast(RAID_MODE(SPELL_SLEEPING_FERAL_ESSENCE_10, SPELL_SLEEPING_FERAL_ESSENCE_25));
            }

            void UpdateAI(uint32 const /*diff*/) { }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new mob_seeping_essence_stalkerAI(creature);
        }
};

class SanctumSentryCheck
{
    public:
        bool operator() (Unit* unit)
        {
            if (unit->GetEntry() == NPC_SANCTUM_SENTRY)
                return false;

            return true;
        }
};

class spell_auriaya_strenght_of_the_pack : public SpellScriptLoader
{
    public:
        spell_auriaya_strenght_of_the_pack() : SpellScriptLoader("spell_auriaya_strenght_of_the_pack") { }

        class spell_auriaya_strenght_of_the_pack_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_auriaya_strenght_of_the_pack_SpellScript);

            void FilterTargets(std::list<Unit*>& unitList)
            {
                unitList.remove_if (SanctumSentryCheck());
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_auriaya_strenght_of_the_pack_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ALLY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_auriaya_strenght_of_the_pack_SpellScript();
        }
};

class achievement_nine_lives : public AchievementCriteriaScript
{
    public:
        achievement_nine_lives() : AchievementCriteriaScript("achievement_nine_lives")
        {
        }

        bool OnCheck(Player* /*player*/, Unit* target)
        {
            if (!target)
                return false;

            if (Creature* Auriaya = target->ToCreature())
                if (Auriaya->AI()->GetData(DATA_NINE_LIVES))
                    return true;

            return false;
        }
};

class achievement_crazy_cat_lady : public AchievementCriteriaScript
{
    public:
        achievement_crazy_cat_lady() : AchievementCriteriaScript("achievement_crazy_cat_lady")
        {
        }

        bool OnCheck(Player* /*player*/, Unit* target)
        {
            if (!target)
                return false;

            if (Creature* Auriaya = target->ToCreature())
                if (Auriaya->AI()->GetData(DATA_CRAZY_CAT_LADY))
                    return true;

            return false;
        }
};

void AddSC_boss_auriaya()
{
    new boss_auriaya();
    new mob_feral_defender();
    new mob_seeping_essence_stalker();
    new mob_sanctum_sentry();
    new spell_auriaya_strenght_of_the_pack();
    new achievement_nine_lives();
    new achievement_crazy_cat_lady();
}
