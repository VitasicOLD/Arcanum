/*
* Copyright (C) 2012 Arcanum Core Private <https://github.com/Vitasic/Arcanum/>
*/

#include "ScriptPCH.h"

//Deathspeaker Servant
#define SPELL_CHAOS_BOLT RAID_MODE<uint32>(69576,71108)
#define SPELL_CURSE_OF_AGONY RAID_MODE<uint32>(69404,71112)

//Deathspeaker Disciple
#define SPELL_SHADOW_MEND RAID_MODE<uint32>(69389,71107)

//Deathspeaker Attendant
#define SPELL_SHADOW_NOVA RAID_MODE<uint32>(69355,71106)

//Pustulating Horror
#define SPELL_PUS RAID_MODE<uint32>(71089,71090)

//Darkfallen Archmage
#define SPELL_AMPLIFY RAID_MODE<uint32>(70408,72336)
#define SPELL_BLAST_WAVE RAID_MODE<uint32>(70407,71151)
#define SPELL_FIREBALL RAID_MODE<uint32>(70409,71153)

//Darkfallen Noble
#define SPELL_SH_BOLT RAID_MODE<uint32>(72960,72961)

//Darkfallen Advisor
#define SPELL_LICH RAID_MODE<uint32>(72057,72421)

//Darkfallen Commander
#define SPELL_CHARGE RAID_MODE<uint32>(70449,71155)

//Darkfallen Lieutenant
#define SPELL_REND RAID_MODE<uint32>(70435,71154)


enum Spells
{
    //Deathspeaker Servant
    SPELL_CONSUMING_SHADOWS                    = 69405,

    //Deathspeaker Disciple
    SPELL_SHADOW_BOLT                          = 69387,
    SPELL_DARK_BLESSING                        = 69391,

    //Deathspeaker Zealot
    SPELL_SHADOW_CLEAVE                        = 69492,

    //Deathspeaker High Priest
    SPELL_DARK_RECKONING                       = 69483,
    SPELL_AURA_OF_DARKNESS                     = 69491,

    //Blighted Abomination
    SPELL_CLEAVE                               = 40504,
    SPELL_PLAGUE_CLOUD                         = 71150,
    SPELL_SCOURGE_HOOK                         = 71140,

    //Vengeful Fleshreaper
    SPELL_LEAPING_FACE_MAUL                   = 71164,

    //Plague Scientist
    SPELL_PLAGUE_BLAST                         = 73079,
    SPELL_PLAGUE_STREAM                        = 69871,
    SPELL_SPRAY                                = 71103,

    //Pustulating Horror
    SPELL_BOMB                                 = 71088,

    //Darkfallen Archmage
    SPELL_POLYMORPH                            = 70410,

    //Darkfallen Blood Knight
    SPELL_VAMPIRIC_AURA                        = 71736,
    SPELL_UNHOLY_STRIKE                        = 70437,

    //Darkfallen Noble
    SPELL_BANISH                               = 70645,

    //Darkfallen Advisor
    SPELL_MEELE                                = 72065,
    SPELL_SPELL                                = 72066,

    //Darkfallen Commander
    SPELL_BATTLE_SHOUT                         = 70750,

    //Darkfallen Lieutenant
    SPELL_VAM_CURSE                            = 70423,

    //Darkfallen Tactician
    SPELL_SHADOWSTEP                           = 70431,
    SPELL_UH_STRIKE                            = 70437,
    SPELL_BLOOD_SAP                            = 70432,

    //Ancient Skeletal Soldier
    SPELL_SHIELD_BASH                          = 70964,

    //Deathbound Ward
    SPELL_DISRUPTING_SHOUT                     = 71022,
    SPELL_SABER_LASH                           = 71021,

    //Servant of the Throne
    SPELL_GLACIAL_BLAST                        = 71029,

    //The Damned
    SPELL_BONE_FLURRY                          = 70960,
    SPELL_SHATTERED_BONES                      = 70961
};

class npc_deathspeaker_servant : public CreatureScript
{
public:
    npc_deathspeaker_servant() : CreatureScript("npc_deathspeaker_servant") { }

    struct npc_deathspeaker_servantAI : public ScriptedAI
    {
        npc_deathspeaker_servantAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_chaos_timer;
        uint32 m_ui_consuming_timer;
        uint32 m_ui_curse_timer;

        void Reset()
        {
            m_ui_chaos_timer = 2000;
            m_ui_consuming_timer = 6000;
            m_ui_curse_timer = 9000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_chaos_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_CHAOS_BOLT);
                m_ui_chaos_timer = 9000;
            }
            else
                m_ui_chaos_timer -= uiDiff;


            if (m_ui_consuming_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_CONSUMING_SHADOWS);
                m_ui_consuming_timer = 15000;
            }
            else
                m_ui_consuming_timer -= uiDiff;

            if (m_ui_curse_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_CURSE_OF_AGONY);
                m_ui_curse_timer = 17500;
            }
            else
                m_ui_curse_timer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_deathspeaker_servantAI(creature);
    }
};

class npc_deathspeaker_disciple : public CreatureScript
{
public:
    npc_deathspeaker_disciple() : CreatureScript("npc_deathspeaker_disciple") { }

    struct npc_deathspeaker_discipleAI : public ScriptedAI
    {
        npc_deathspeaker_discipleAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_bolt_timer;
        uint32 m_ui_blessing_timer;
        uint32 m_ui_mend_timer;

        void Reset()
        {
            m_ui_bolt_timer = 2000;
            m_ui_blessing_timer = 1000;
            m_ui_mend_timer = 10000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_bolt_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHADOW_BOLT);
                m_ui_bolt_timer = 7000;
            }
            else
                m_ui_bolt_timer -= uiDiff;

            if (m_ui_blessing_timer <= uiDiff)
            {
                DoCast(me, SPELL_DARK_BLESSING);
                m_ui_blessing_timer = 15000;
            }
            else
                m_ui_blessing_timer -= uiDiff;

            if (m_ui_mend_timer <= uiDiff)
            {
                DoCast(me, SPELL_SHADOW_MEND);
                m_ui_mend_timer = 15000;
            }
            else
                m_ui_mend_timer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_deathspeaker_discipleAI(creature);
    }
};

class npc_deathspeaker_attendant : public CreatureScript
{
public:
    npc_deathspeaker_attendant() : CreatureScript("npc_deathspeaker_attendant") { }

    struct npc_deathspeaker_attendantAI : public ScriptedAI
    {
        npc_deathspeaker_attendantAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_bolt_timer;
        uint32 m_ui_nova_timer;

        void Reset()
        {
            m_ui_bolt_timer = 2000;
            m_ui_nova_timer = 5000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_bolt_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHADOW_BOLT);
                m_ui_bolt_timer = 5000;
            }
            else
                m_ui_bolt_timer -= uiDiff;

            if (m_ui_nova_timer <= uiDiff)
            {
                DoCastAOE(SPELL_SHADOW_NOVA);
                m_ui_nova_timer = 9000;
            }
            else
                m_ui_nova_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_deathspeaker_attendantAI(creature);
    }
};

class npc_deathspeaker_zealot : public CreatureScript
{
public:
    npc_deathspeaker_zealot() : CreatureScript("npc_deathspeaker_zealot") { }

    struct npc_deathspeaker_zealotAI : public ScriptedAI
    {
        npc_deathspeaker_zealotAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_cleave_timer;

        void Reset()
        {
            m_ui_cleave_timer = 5000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_cleave_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHADOW_CLEAVE);
                m_ui_cleave_timer = 5000;
            }
            else
                m_ui_cleave_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_deathspeaker_zealotAI(creature);
    }
};

class npc_deathspeaker_high_priest : public CreatureScript
{
public:
    npc_deathspeaker_high_priest() : CreatureScript("npc_deathspeaker_high_priest") { }

    struct npc_deathspeaker_high_priestAI : public ScriptedAI
    {
        npc_deathspeaker_high_priestAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_aura_timer;
        uint32 m_ui_reckoning_timer;

        void Reset()
        {
            m_ui_aura_timer = 1000;
            m_ui_reckoning_timer = 3000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_aura_timer <= uiDiff)
            {
                DoCast(me, SPELL_AURA_OF_DARKNESS);
                m_ui_aura_timer = 18000;
            }
            else
                m_ui_aura_timer -= uiDiff;

            if (m_ui_reckoning_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_DARK_RECKONING);
                m_ui_reckoning_timer = 10000;
            }
            else
                m_ui_reckoning_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_deathspeaker_high_priestAI(creature);
    }
};

class npc_blighted_abomination : public CreatureScript
{
public:
    npc_blighted_abomination() : CreatureScript("npc_blighted_abomination") { }

    struct npc_blighted_abominationAI : public ScriptedAI
    {
        npc_blighted_abominationAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_cloud_timer;
        uint32 m_ui_hook_timer;
        uint32 m_ui_cleave_timer;

        void Reset()
        {
            m_ui_cloud_timer = 10000;
            m_ui_hook_timer = 9000;
            m_ui_cleave_timer = 4000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_cloud_timer <= uiDiff)
            {
                DoCastAOE(SPELL_PLAGUE_CLOUD);
                m_ui_cloud_timer = 20000;
            }
            else
                m_ui_cloud_timer -= uiDiff;

            if (m_ui_hook_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_SCOURGE_HOOK);
                m_ui_hook_timer = 9000;
            }
            else
                m_ui_hook_timer -= uiDiff;

            if (m_ui_cleave_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_CLEAVE);
                m_ui_cleave_timer = 6000;
            }
            else
                m_ui_cleave_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_blighted_abominationAI(creature);
    }
};

class npc_vengeful_fleshreapert : public CreatureScript
{
public:
    npc_vengeful_fleshreapert() : CreatureScript("npc_vengeful_fleshreapert") { }

    struct npc_vengeful_fleshreapertAI : public ScriptedAI
    {
        npc_vengeful_fleshreapertAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_jump_timer;

        void Reset()
        {
            m_ui_jump_timer = urand(3000, 20000);
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_jump_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_LEAPING_FACE_MAUL);
                m_ui_jump_timer = urand(20000,40000);
            }
            else
                m_ui_jump_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_vengeful_fleshreapertAI(creature);
    }
};

class npc_plague_scientist : public CreatureScript
{
public:
    npc_plague_scientist() : CreatureScript("npc_plague_scientist") { }

    struct npc_plague_scientistAI : public ScriptedAI
    {
        npc_plague_scientistAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_stream_timer;
        uint32 m_ui_spray_timer; 
        uint32 m_ui_blast_timer;   

        void Reset()
        {
            m_ui_stream_timer = 1000;
            m_ui_spray_timer = 1000;
            m_ui_blast_timer = 2000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_stream_timer <= uiDiff)
            {
                DoCast(me, SPELL_PLAGUE_STREAM);
                m_ui_stream_timer = 30000;
            }
            else
                m_ui_stream_timer -= uiDiff;

            if (m_ui_spray_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_SPRAY);
                m_ui_spray_timer = 8000;
            }
            else
                m_ui_spray_timer -= uiDiff;

            if (m_ui_blast_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_PLAGUE_BLAST);
                m_ui_blast_timer = 4000;
            }
            else
                m_ui_blast_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_plague_scientistAI(creature);
    }
};

class npc_pustulating_horror : public CreatureScript
{
public:
    npc_pustulating_horror() : CreatureScript("npc_pustulating_horror") { }

    struct npc_pustulating_horrorAI : public ScriptedAI
    {
        npc_pustulating_horrorAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_bomb_timer;
        uint32 m_ui_pus_timer;

        void Reset()
        {
            m_ui_bomb_timer = 20000;
            m_ui_pus_timer = 2000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_bomb_timer <= uiDiff)
            {
                DoCastAOE(SPELL_BOMB);
                m_ui_bomb_timer = 30000;
            }
            else
                m_ui_bomb_timer -= uiDiff;

            if (m_ui_pus_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_PUS);
                m_ui_pus_timer = 9000;
            }
            else
                m_ui_pus_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_pustulating_horrorAI(creature);
    }
};

class npc_darkfallen_archmage : public CreatureScript
{
public:
    npc_darkfallen_archmage() : CreatureScript("npc_darkfallen_archmage") { }

    struct npc_darkfallen_archmageAI : public ScriptedAI
    {
        npc_darkfallen_archmageAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_amplify_timer;
        uint32 m_ui_polymorph_timer;
        uint32 m_ui_fireball_timer;
        uint32 m_ui_blast_timer;

        void Reset()
        {
            m_ui_amplify_timer = 2000;
            m_ui_polymorph_timer = 9000;
            m_ui_fireball_timer = 4000;
            m_ui_blast_timer = 8000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_amplify_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_AMPLIFY);
                m_ui_amplify_timer = 10000;
            }
            else
                m_ui_amplify_timer -= uiDiff;

            if (m_ui_polymorph_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_POLYMORPH);
                m_ui_polymorph_timer = 15000;
            }
            else
                m_ui_polymorph_timer -= uiDiff;

            if (m_ui_fireball_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_FIREBALL);
                m_ui_fireball_timer = 11000;
            }
            else
                m_ui_fireball_timer -= uiDiff;

            if (m_ui_blast_timer <= uiDiff)
            {
                DoCastAOE(SPELL_BLAST_WAVE);
                m_ui_blast_timer = 21000;
            }
            else
                m_ui_blast_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_darkfallen_archmageAI(creature);
    }
};

class npc_darkfallen_blood_knight : public CreatureScript
{
public:
    npc_darkfallen_blood_knight() : CreatureScript("npc_darkfallen_blood_knight") { }

    struct npc_darkfallen_blood_knightAI : public ScriptedAI
    {
        npc_darkfallen_blood_knightAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_strike_timer;
        uint32 m_ui_aura_timer;

        void Reset()
        {
            m_ui_strike_timer = 6000;
            m_ui_aura_timer = 5000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_strike_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_UNHOLY_STRIKE);
                m_ui_strike_timer = 6000;
            }
            else
                m_ui_strike_timer -= uiDiff;

            if (m_ui_aura_timer <= uiDiff)
            {
                DoCast(me, SPELL_VAMPIRIC_AURA);
                m_ui_aura_timer = 15000;
            }
            else
                m_ui_aura_timer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_darkfallen_blood_knightAI(creature);
    }
};

class npc_darkfallen_noble : public CreatureScript
{
public:
    npc_darkfallen_noble() : CreatureScript("npc_darkfallen_noble") { }

    struct npc_darkfallen_nobleAI : public ScriptedAI
    {
        npc_darkfallen_nobleAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_bolt_timer;
        uint32 m_ui_banish_timer;

        void Reset()
        {
            m_ui_bolt_timer = 5000;
            m_ui_banish_timer = 3000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_bolt_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SH_BOLT);
                m_ui_bolt_timer = 5000;
            }
            else
                m_ui_bolt_timer -= uiDiff;

            if (m_ui_banish_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_BANISH);
                m_ui_banish_timer = 15000;
            }
            else
                m_ui_banish_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_darkfallen_nobleAI(creature);
    }
};

class npc_darkfallen_advisor : public CreatureScript
{
public:
    npc_darkfallen_advisor() : CreatureScript("npc_darkfallen_advisor") { }

    struct npc_darkfallen_advisorAI : public ScriptedAI
    {
        npc_darkfallen_advisorAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_lich_timer;
        uint32 m_ui_melee_timer;
        uint32 m_ui_spell_timer;

        void Reset()
        {
            m_ui_lich_timer = 2000;
            m_ui_melee_timer = 1000;
            m_ui_spell_timer = 7000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_lich_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_LICH);
                m_ui_lich_timer = 4500;
            }
            else
                m_ui_lich_timer -= uiDiff;

            if (m_ui_melee_timer <= uiDiff)
            {
                DoCast(me, SPELL_MEELE);
                m_ui_melee_timer = 12000;
            }
            else
                m_ui_melee_timer -= uiDiff;

            if (m_ui_spell_timer <= uiDiff)
            {
                DoCast(me, SPELL_SPELL);
                m_ui_spell_timer = 12000;
            }
            else
                m_ui_spell_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_darkfallen_advisorAI(creature);
    }
};

class npc_darkfallen_commander : public CreatureScript
{
public:
    npc_darkfallen_commander() : CreatureScript("npc_darkfallen_commander") { }

    struct npc_darkfallen_commanderAI : public ScriptedAI
    {
        npc_darkfallen_commanderAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_shout_timer;
        uint32 m_ui_charge_timer;


        void Reset()
        {
            m_ui_shout_timer = 8000;
            m_ui_charge_timer = 4000;
        }


        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_shout_timer <= uiDiff)
            {
                DoCast(me, SPELL_BATTLE_SHOUT);
                m_ui_shout_timer = 40000;
            }
            else
                m_ui_shout_timer -= uiDiff;

            if (m_ui_charge_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_CHARGE);
                m_ui_charge_timer = 12000;
            }
            else
                m_ui_charge_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_darkfallen_commanderAI(creature);
    }
};

class npc_darkfallen_lieutenant : public CreatureScript
{
public:
    npc_darkfallen_lieutenant() : CreatureScript("npc_darkfallen_lieutenant") { }

    struct npc_darkfallen_lieutenantAI : public ScriptedAI
    {
        npc_darkfallen_lieutenantAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_rend_timer;
        uint32 m_ui_curse_timer;

        void Reset()
        {
            m_ui_rend_timer = 10000;
            m_ui_curse_timer = 8000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_rend_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_REND);
                m_ui_rend_timer = 25000;
            }
            else
                m_ui_rend_timer -= uiDiff;

            if (m_ui_curse_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_VAM_CURSE);
                m_ui_curse_timer = 12000;
            }
            else
                m_ui_curse_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_darkfallen_lieutenantAI(creature);
    }
};

class npc_darkfallen_tactician : public CreatureScript
{
public:
    npc_darkfallen_tactician() : CreatureScript("npc_darkfallen_tactician") { }

    struct npc_darkfallen_tacticianAI : public ScriptedAI
    {
        npc_darkfallen_tacticianAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_strike_timer;
        uint32 m_ui_sap_timer;
        uint32 m_ui_shadowstep_timer;


        void Reset()
        {
            m_ui_strike_timer = 4000;
            m_ui_sap_timer = 1000;
            m_ui_shadowstep_timer = 13000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_strike_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_UH_STRIKE);
                m_ui_strike_timer = 6000;
            }
            else
                m_ui_strike_timer -= uiDiff;

            if (m_ui_sap_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_BLOOD_SAP);
                m_ui_sap_timer = 9000;
            }
            else
                m_ui_sap_timer -= uiDiff;

            if (m_ui_shadowstep_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_SHADOWSTEP);
                m_ui_shadowstep_timer = 17500;
            }
            else
                m_ui_shadowstep_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_darkfallen_tacticianAI(creature);
    }
};

class npc_ancient_skeletal_soldier : public CreatureScript
{
public:
    npc_ancient_skeletal_soldier() : CreatureScript("npc_ancient_skeletal_soldier") { }

    struct npc_ancient_skeletal_soldierAI : public ScriptedAI
    {
        npc_ancient_skeletal_soldierAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_bash_timer;

        void Reset()
        {
            m_ui_bash_timer = 10000;       
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_bash_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHIELD_BASH);
                m_ui_bash_timer = 10000;
            }
            else
                m_ui_bash_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_ancient_skeletal_soldierAI(creature);
    }
};

class npc_deathbound_ward : public CreatureScript
{
public:
    npc_deathbound_ward() : CreatureScript("npc_deathbound_ward") { }

    struct npc_deathbound_wardAI : public ScriptedAI
    {
        npc_deathbound_wardAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_disrupting_shout_timer;
        uint32 m_ui_saber_lash_timer;

        void Reset()
        {
            m_ui_disrupting_shout_timer = 25000;       
            m_ui_saber_lash_timer = 8000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_disrupting_shout_timer <= uiDiff)
            {
                DoCastAOE(SPELL_DISRUPTING_SHOUT);
                m_ui_disrupting_shout_timer = 25000;
            }
            else
                m_ui_disrupting_shout_timer -= uiDiff;

            if (m_ui_saber_lash_timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SABER_LASH);
                m_ui_saber_lash_timer = 8000;
            }
            else
                m_ui_saber_lash_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_deathbound_wardAI(creature);
    }
};

class npc_servant_of_the_throne : public CreatureScript
{
public:
    npc_servant_of_the_throne() : CreatureScript("npc_servant_of_the_throne") { }

    struct npc_servant_of_the_throneAI : public ScriptedAI
    {
        npc_servant_of_the_throneAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_glacial_blast_timer;

        void Reset()
        {
            m_ui_glacial_blast_timer = 8000;       
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_glacial_blast_timer <= uiDiff)
            {
                if  (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_GLACIAL_BLAST);
                m_ui_glacial_blast_timer = 10000;
            }
            else
                m_ui_glacial_blast_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_servant_of_the_throneAI(creature);
    }
};

class npc_the_damned : public CreatureScript
{
public:
    npc_the_damned() : CreatureScript("npc_the_damned") { }

    struct npc_the_damnedAI : public ScriptedAI
    {
        npc_the_damnedAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 m_ui_bone_flurry_timer;

        void Reset()
        {
            m_ui_bone_flurry_timer = 20000;    
        }

        void JustDied(Unit * killer)
        {
            DoCastAOE(SPELL_SHATTERED_BONES);
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (m_ui_bone_flurry_timer <= uiDiff)
            {
                DoCast(me, SPELL_BONE_FLURRY);
                m_ui_bone_flurry_timer = 30000;
            }
            else
                m_ui_bone_flurry_timer -= uiDiff;

            DoMeleeAttackIfReady();   
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_the_damnedAI(creature);
    }
};

void AddSC_icc_trashmobs()
{
    new npc_deathspeaker_servant();
    new npc_deathspeaker_disciple();
    new npc_deathspeaker_attendant();
    new npc_deathspeaker_zealot();
    new npc_deathspeaker_high_priest();
    new npc_blighted_abomination();
    new npc_vengeful_fleshreapert();
    new npc_plague_scientist();
    new npc_pustulating_horror();
    new npc_darkfallen_archmage();
    new npc_darkfallen_blood_knight();
    new npc_darkfallen_noble();
    new npc_darkfallen_advisor();
    new npc_darkfallen_commander();
    new npc_darkfallen_lieutenant();
    new npc_darkfallen_tactician();
    new npc_ancient_skeletal_soldier();
    new npc_deathbound_ward();
    new npc_servant_of_the_throne();
    new npc_the_damned();
}
