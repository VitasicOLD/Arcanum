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
SDName: Icecrown
SD%Complete: 100
SDComment: Quest support: 12807
SDCategory: Icecrown
EndScriptData */

/* ContentData
npc_arete
EndContentData */

#include "ScriptPCH.h"
#include "Vehicle.h"

/*######
## npc_arete
######*/

#define GOSSIP_ARETE_ITEM1 "Lord-Commander, I would hear your tale."
#define GOSSIP_ARETE_ITEM2 "<You nod slightly but do not complete the motion as the Lord-Commander narrows his eyes before he continues.>"
#define GOSSIP_ARETE_ITEM3 "I thought that they now called themselves the Scarlet Onslaught?"
#define GOSSIP_ARETE_ITEM4 "Where did the grand admiral go?"
#define GOSSIP_ARETE_ITEM5 "That's fine. When do I start?"
#define GOSSIP_ARETE_ITEM6 "Let's finish this!"
#define GOSSIP_ARETE_ITEM7 "That's quite a tale, Lord-Commander."

enum eArete
{
    GOSSIP_TEXTID_ARETE1        = 13525,
    GOSSIP_TEXTID_ARETE2        = 13526,
    GOSSIP_TEXTID_ARETE3        = 13527,
    GOSSIP_TEXTID_ARETE4        = 13528,
    GOSSIP_TEXTID_ARETE5        = 13529,
    GOSSIP_TEXTID_ARETE6        = 13530,
    GOSSIP_TEXTID_ARETE7        = 13531,

    QUEST_THE_STORY_THUS_FAR    = 12807
};

class npc_arete : public CreatureScript
{
public:
    npc_arete() : CreatureScript("npc_arete") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_THE_STORY_THUS_FAR) == QUEST_STATUS_INCOMPLETE)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE1, creature->GetGUID());
            return true;
        }

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE2, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE3, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE4, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE5, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+5:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE6, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+6:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ARETE_ITEM7, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_ARETE7, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+7:
                player->CLOSE_GOSSIP_MENU();
                player->AreaExploredOrEventHappens(QUEST_THE_STORY_THUS_FAR);
                break;
        }

        return true;
    }
};

/*######
## npc_squire_david
######*/

enum eSquireDavid
{
    QUEST_THE_ASPIRANT_S_CHALLENGE_H                    = 13680,
    QUEST_THE_ASPIRANT_S_CHALLENGE_A                    = 13679,

    NPC_ARGENT_VALIANT                                  = 33448,
    SPELL_SUMMON_ARGENT_VALIANT                         = 63028,

    GOSSIP_TEXTID_SQUIRE                                = 14407
};

#define GOSSIP_SQUIRE_ITEM_1 "I am ready to fight!"
#define GOSSIP_SQUIRE_ITEM_2 "How do the Argent Crusader raiders fight?"

class npc_squire_david : public CreatureScript
{
public:
    npc_squire_david() : CreatureScript("npc_squire_david") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if(player->HasAura(63034))
            if (player->GetQuestStatus(QUEST_THE_ASPIRANT_S_CHALLENGE_H) == QUEST_STATUS_INCOMPLETE ||
                player->GetQuestStatus(QUEST_THE_ASPIRANT_S_CHALLENGE_A) == QUEST_STATUS_INCOMPLETE)//We need more info about it.
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            }

        player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SQUIRE, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->CLOSE_GOSSIP_MENU();
            creature->CastSpell(player,SPELL_SUMMON_ARGENT_VALIANT,false);
        }
        return true;
    }
};

/*######
## npc_argent_valiant
######*/

enum eArgentValiant
{
    SPELL_THRUST                = 62544,
    SPELL_CHARGE                = 63010,
    SPELL_SHIELD_BREAKER        = 65147,
    SPELL_DEFEND                = 62719,

    NPC_ARGENT_VALIANT_CREDIT   = 38595,
    SPELL_GIVE_KILL_CREDIT_VALIANT = 63049,
};

class npc_argent_valiant : public CreatureScript
{
public:
    npc_argent_valiant() : CreatureScript("npc_argent_valiant") { }

    struct npc_argent_valiantAI : public ScriptedAI
    {
        npc_argent_valiantAI(Creature* creature) : ScriptedAI(creature)
        {
            creature->GetMotionMaster()->MovePoint(0, 8599.258f, 963.951f, 547.553f);
            creature->setFaction(35); //wrong faction in db?
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;

        void Reset()
        {
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;
        }

        void MovementInform(uint32 uiType, uint32 /*uiId*/)
        {
            if (uiType != POINT_MOTION_TYPE)
                return;

            me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
            me->setFaction(14);
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                if(pDoneBy->HasAura(63034))
                    pDoneBy->CastSpell(pDoneBy,SPELL_GIVE_KILL_CREDIT_VALIANT,true);
                me->setFaction(35);
                me->DespawnOrUnsummon(5000);
                me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
                EnterEvadeMode();
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                DoCastVictim(SPELL_CHARGE);
                uiChargeTimer = 7000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(SPELL_SHIELD_BREAKER);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            if (me->isAttackReady())
            {
                DoCast(me->getVictim(), SPELL_THRUST, true);
                me->resetAttackTimer();
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_argent_valiantAI(creature);
    }
};

/*######
## npc_guardian_pavilion
######*/

enum eGuardianPavilion
{
    SPELL_TRESPASSER_H                            = 63987,
    AREA_SUNREAVER_PAVILION                       = 4676,

    AREA_SILVER_COVENANT_PAVILION                 = 4677,
    SPELL_TRESPASSER_A                            = 63986,
};

class npc_guardian_pavilion : public CreatureScript
{
public:
    npc_guardian_pavilion() : CreatureScript("npc_guardian_pavilion") { }

    struct npc_guardian_pavilionAI : public Scripted_NoMovementAI
    {
        npc_guardian_pavilionAI(Creature* creature) : Scripted_NoMovementAI(creature) {}

        void MoveInLineOfSight(Unit* who)
        {
            if (me->GetAreaId() != AREA_SUNREAVER_PAVILION && me->GetAreaId() != AREA_SILVER_COVENANT_PAVILION)
                return;

            if (!who || who->GetTypeId() != TYPEID_PLAYER || !me->IsHostileTo(who) || !me->isInBackInMap(who, 5.0f))
                return;

            if (who->HasAura(SPELL_TRESPASSER_H) || who->HasAura(SPELL_TRESPASSER_A))
                return;

            if (who->ToPlayer()->GetTeamId() == TEAM_ALLIANCE)
                who->CastSpell(who, SPELL_TRESPASSER_H, true);
            else
                who->CastSpell(who, SPELL_TRESPASSER_A, true);

        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_guardian_pavilionAI(creature);
    }
};

/*########
## npc_the_ocular
#########*/
         
enum TheOcularSpells
{
    SPELL_THE_OCULAR_TRANSFORM                              = 55162,
    SPELL_DEATHLY_STARE                                     = 55269,
    SPELL_ITS_ALL_FUN_AND_GAMES_THE_OCULAR_KILL_CREDIT      = 55289
};

class npc_the_ocular : public CreatureScript
{
public:
    npc_the_ocular() : CreatureScript("npc_the_ocular"){ }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_the_ocularAI (pCreature);
    }

    struct npc_the_ocularAI : public Scripted_NoMovementAI
    {
        npc_the_ocularAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature) { }

        uint32 uiDeathlyStareTimer;

        void Reset()
        {
            uiDeathlyStareTimer = (urand (5000,7000));
        }
        
        void DamageTaken(Unit* attacker, uint32 &damage)
        {
            me->LowerPlayerDamageReq(damage);
        }

        void JustDied (Unit* killer)
        {
            if(killer && killer->ToPlayer())
                killer->ToPlayer()->CastSpell(killer,SPELL_ITS_ALL_FUN_AND_GAMES_THE_OCULAR_KILL_CREDIT,true);
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if(!me->HasAura(SPELL_THE_OCULAR_TRANSFORM))
                DoCast(me,SPELL_THE_OCULAR_TRANSFORM,true);
                
            if (!UpdateVictim())
                return;

            if (uiDeathlyStareTimer <= uiDiff)
            {
                DoCastVictim(SPELL_DEATHLY_STARE);
                uiDeathlyStareTimer = (urand (7000,9000));
            }
            else uiDeathlyStareTimer -= uiDiff;
        }
    };
};

enum eGeneralLightsbaneSpells
{
    SPELL_CLEAVE                = 15284,
    SPELL_DEATH_AND_DECAY       = 60160,
    SPELL_PLAGUE_STRIKE         = 60186,
};

enum eNpcs
{
    ENTRY_VILE                  = 29860,
    ENTRY_THE_LEAPER            = 29859,
    ENTRY_LADY_NIGHTSWOOD       = 29858,
};

class npc_general_lightsbane : public CreatureScript
{
public:
    npc_general_lightsbane() : CreatureScript("npc_general_lightsbane") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_general_lightsbaneAI (pCreature);
    }

    struct npc_general_lightsbaneAI : public ScriptedAI
    {
        npc_general_lightsbaneAI(Creature* pCreature) : ScriptedAI(pCreature) { }

        uint32 uiCleave_Timer;
        uint32 uiDeathDecay_Timer;
        uint32 uiPlagueStrike_Timer;
        uint32 uiSummonSupport_Timer;
        bool supportSummoned;

        void Reset()
        {
            uiCleave_Timer = urand (2000,3000);
            uiDeathDecay_Timer = urand (15000,20000);
            uiPlagueStrike_Timer = urand (5000,10000);

            std::list<Creature*> TargetList;
            me->GetCreatureListWithEntryInGrid(TargetList,me->GetEntry(), 100.0f);
            if(TargetList.size() > 1)
            {
                me->DespawnOrUnsummon(1000);
            }

            uiSummonSupport_Timer = 5000;
            supportSummoned = false;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if(!supportSummoned)
                if (uiSummonSupport_Timer <= uiDiff)
                {
                    Creature* temp = DoSummon(ENTRY_VILE,me,5,20000,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
                    temp->AI()->AttackStart(me);
                    
                    temp = DoSummon(ENTRY_THE_LEAPER,me,5,20000,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
                    temp->AI()->AttackStart(me);

                    temp = DoSummon(ENTRY_LADY_NIGHTSWOOD,me,5,20000,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT);
                    temp->AI()->AttackStart(me);

                    uiSummonSupport_Timer = (urand (4000,5000));
                    supportSummoned = true;
                }
                else uiSummonSupport_Timer -= uiDiff;

            if (uiCleave_Timer <= uiDiff)
            {
                DoCastVictim(SPELL_CLEAVE);
                uiCleave_Timer = (urand (4000,5000));
            }
            else uiCleave_Timer -= uiDiff;

            if (uiDeathDecay_Timer <= uiDiff)
            {
                DoCastVictim(SPELL_DEATH_AND_DECAY);
                uiDeathDecay_Timer = urand (15000,20000);
            }
            else uiDeathDecay_Timer -= uiDiff;

            if (uiPlagueStrike_Timer <= uiDiff)
            {
                DoCastVictim(SPELL_PLAGUE_STRIKE);
                uiPlagueStrike_Timer = urand (5000,10000);
            }
            else uiPlagueStrike_Timer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };
};


/*########
## npc_free_your_mind_vile
#########*/

enum eFreeYourMindNPCSpells
{
    SPELL_SOVEREIGN_ROD             = 29070,
    SPELL_SOVEREIGN_ROD_TRIGGERED   = 29071,
    // Vile Abilities
    SPELL_VILE_ENRAGE               = 56646,    // <50% HP ?
    SPELL_VILE_BACKHAND             =  6253,
    // Lady Nightswood Abilities
    SPELL_BANSHEE_CURSE             = 5884,
    SPELL_BANSHEE_SHRIEK            = 16838,
    // The Leaper Abilities
    SPELL_LEAPER_SNISTER_STRIKE     = 60195,
    SPELL_LEAPER_HUNGER_FOR_BLOOD   = 60177,
};

enum eFreeYourMindNPCEntrys
{
    ENTRY_FYM_VILE          = 29769,
    ENTRY_FYM_LADY          = 29770,
    ENTRY_FYM_LEAPER        = 29840
};

#define SAY_VILE_AGGRO              "Crush... maim... DESTROY!"
#define SAY_VILE_FREED              "Vile free? Vile love %n"

#define SAY_LADY_NIGHTSWOOD_AGGRO   "Who intrudes upon my ritual?"
#define SAY_LADY_NIGHTSWOOD_FREED   " You dare? Where is Baron Sliver? I would have words with him!"

#define SAY_THE_LEAPER_AGGRO        "Mrrfrmrfrmrrrrr!"
#define SAY_THE_LEAPER_FREED        "Mrmrmmrmrmrmrm... mrmrmrmr?!"

// UPDATE `creature_template` SET ScriptName = 'npc_free_your_mind' WHERE `entry` IN (29769,29770,29840);

class npc_free_your_mind : public CreatureScript
{
public:
    npc_free_your_mind() : CreatureScript("npc_free_your_mind") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_free_your_mindAI (pCreature);
    }

    struct npc_free_your_mindAI : public ScriptedAI
    {
        npc_free_your_mindAI(Creature* pCreature) : ScriptedAI(pCreature) { }

        bool Enraged;

        uint32 uiSpell1Entry_Timer;
        uint32 uiSpell2Entry_Timer;
        uint32 uiSpell1Entry;
        uint32 uiSpell2Entry;
        
        void Reset()
        {
            switch (me->GetEntry())
            {
            case ENTRY_FYM_VILE:
                uiSpell1Entry = SPELL_VILE_BACKHAND;
                uiSpell1Entry_Timer = urand (4000,6000);
                uiSpell2Entry = SPELL_VILE_ENRAGE;
                break;
            case ENTRY_FYM_LADY:
                uiSpell1Entry = SPELL_BANSHEE_CURSE;
                uiSpell1Entry_Timer = urand (5000,6000);
                uiSpell2Entry = SPELL_BANSHEE_SHRIEK;
                uiSpell2Entry_Timer = urand (10000,12000);
                break;
            case ENTRY_FYM_LEAPER:
                uiSpell1Entry = SPELL_LEAPER_SNISTER_STRIKE;
                uiSpell1Entry_Timer = urand (4000,6000);
                uiSpell2Entry = SPELL_LEAPER_HUNGER_FOR_BLOOD;
                break;
            }

            me->RestoreFaction();
        }

        void EnterCombat(Unit* who)
        {
            Enraged = false;
            switch (me->GetEntry())
            {
            case ENTRY_FYM_VILE:
                me->MonsterSay(SAY_VILE_AGGRO,LANG_UNIVERSAL,who->GetGUID());
                break;
            case ENTRY_FYM_LEAPER:
                me->MonsterSay(SAY_THE_LEAPER_AGGRO,LANG_UNIVERSAL,who->GetGUID());
                break;
            case ENTRY_FYM_LADY:
                me->MonsterSay(SAY_LADY_NIGHTSWOOD_AGGRO,LANG_UNIVERSAL,who->GetGUID());
                break;
            }
        }

        void SpellHit(Unit* caster, SpellInfo const* spell)
        {
            if (spell->Id == SPELL_SOVEREIGN_ROD_TRIGGERED)
            {
                if(caster && caster->ToPlayer())
                {
                    me->setDeathState(ALIVE);
                    me->setFaction(35);
                    me->DespawnOrUnsummon(4000);

                    switch (me->GetEntry())
                    {
                    case ENTRY_FYM_VILE:
                        me->MonsterSay(SAY_VILE_FREED,LANG_UNIVERSAL,caster->GetGUID());
                        caster->ToPlayer()->KilledMonsterCredit(29845,0);
                        break;
                    case ENTRY_FYM_LEAPER:
                        me->MonsterSay(SAY_THE_LEAPER_FREED,LANG_UNIVERSAL,caster->GetGUID());
                        caster->ToPlayer()->KilledMonsterCredit(29847,0);
                        break;
                    case ENTRY_FYM_LADY:
                        me->MonsterSay(SAY_LADY_NIGHTSWOOD_FREED,LANG_UNIVERSAL,caster->GetGUID());
                        caster->ToPlayer()->KilledMonsterCredit(29846,0);
                        break;
                    }
                }
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiSpell1Entry_Timer <= uiDiff)
            {
                DoCastVictim(uiSpell1Entry);
                switch (me->GetEntry())
                {
                case ENTRY_FYM_VILE:
                case ENTRY_FYM_LEAPER:
                    uiSpell1Entry_Timer = (urand (7000,9000));
                    break;
                case ENTRY_FYM_LADY:
                     uiSpell1Entry_Timer = (urand (10000,15000));
                     break;
                }
            }
            else uiSpell1Entry_Timer -= uiDiff;

            if(me->GetEntry() == ENTRY_FYM_VILE)
            {
                if (!Enraged && HealthBelowPct(30))
                {
                    DoCast(me, uiSpell2Entry, true);
                    Enraged = true;
                }
            }
            else
            {
                if (uiSpell2Entry_Timer <= uiDiff)
                {
                    DoCastVictim(uiSpell2Entry);
                    uiSpell2Entry_Timer = (urand (8000,10000));
                }
                else uiSpell2Entry_Timer -= uiDiff;
            }

            DoMeleeAttackIfReady();
        }
    };
};

/*###########################
# npc_father_kamaros (31279)
###########################*/

enum NotDeadYet
{
    QUEST_NOT_DEAD_YET_A = 13221,
    QUEST_NOT_DEAD_YET_H = 13229,
    NPC_NOT_DEAD_YET_TRIG = 97002,
    SPELL_PW_FORTITUDE = 23947,
    SPELL_PW_SHIELD = 20697
};

const Position KamarosWp[54] =
{
    {6718.48f, 3439.88f, 682.24f, 0.00f},
    {6723.54f, 3433.79f, 682.20f, 0.00f},
    {6734.04f, 3436.02f, 682.03f, 0.00f},
    {6737.66f, 3439.00f, 680.97f, 0.00f},
    {6742.07f, 3442.76f, 679.93f, 0.00f},
    {6745.65f, 3446.09f, 678.85f, 0.00f},
    {6750.47f, 3450.57f, 677.51f, 0.00f},
    {6755.94f, 3455.28f, 675.78f, 0.00f},
    {6759.58f, 3458.61f, 674.71f, 0.00f},
    {6765.04f, 3463.30f, 673.37f, 0.00f},
    {6769.22f, 3467.40f, 673.00f, 0.00f},
    {6771.95f, 3471.55f, 673.01f, 0.00f},
    {6777.21f, 3477.04f, 672.99f, 0.00f},
    {6782.91f, 3482.89f, 674.34f, 0.00f},
    {6779.54f, 3479.36f, 673.32f, 0.00f},
    {6773.88f, 3473.81f, 673.03f, 0.00f},
    {6786.32f, 3484.85f, 675.62f, 0.00f},
    {6792.51f, 3484.66f, 677.20f, 0.00f},
    {6797.39f, 3484.49f, 678.76f, 0.00f},
    {6800.64f, 3484.44f, 680.03f, 0.00f},
    {6805.98f, 3484.26f, 682.17f, 0.00f},
    {6810.80f, 3484.14f, 683.97f, 0.00f},
    {6816.15f, 3483.58f, 686.18f, 0.00f},
    {6822.91f, 3483.01f, 688.17f, 0.00f},
    {6829.09f, 3481.91f, 689.49f, 0.00f},
    {6836.49f, 3480.96f, 690.69f, 0.00f},
    {6844.57f, 3480.25f, 691.89f, 0.00f},
    {6853.38f, 3479.60f, 692.98f, 0.00f},
    {6859.95f, 3479.59f, 693.60f, 0.00f},
    {6867.60f, 3479.74f, 694.21f, 0.00f},
    {6875.25f, 3479.95f, 694.86f, 0.00f},
    {6882.69f, 3480.14f, 695.82f, 0.00f},
    {6889.85f, 3479.97f, 697.36f, 0.00f},
    {6896.19f, 3479.88f, 698.54f, 0.00f},
    {6902.49f, 3479.66f, 699.74f, 0.00f},
    {6908.08f, 3479.89f, 700.81f, 0.00f},
    {6913.89f, 3480.32f, 701.86f, 0.00f},
    {6920.57f, 3482.18f, 703.10f, 0.00f},
    {6925.61f, 3481.11f, 704.38f, 0.00f},
    {6930.92f, 3480.19f, 705.91f, 0.00f},
    {6936.04f, 3479.73f, 707.06f, 0.00f},
    {6942.06f, 3479.21f, 708.06f, 0.00f},
    {6947.22f, 3477.91f, 709.01f, 0.00f},
    {6953.44f, 3477.53f, 709.63f, 0.00f},
    {6959.23f, 3477.21f, 710.30f, 0.00f},
    {6967.35f, 3474.84f, 711.05f, 0.00f},
    {6980.54f, 3470.97f, 710.86f, 0.00f},
    {6985.85f, 3469.15f, 708.75f, 0.00f},
    {6991.36f, 3467.22f, 705.94f, 0.00f},
    {6997.30f, 3465.15f, 702.91f, 0.00f},
    {7004.14f, 3462.46f, 699.36f, 0.00f},
    {7009.42f, 3460.61f, 696.67f, 0.00f},
    {7018.43f, 3455.71f, 696.67f, 0.00f},
    {7029.21f, 3447.94f, 696.17f, 0.00f}
};

class npc_father_kamaros : public CreatureScript
{
public:
    npc_father_kamaros() : CreatureScript("npc_father_kamaros") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_NOT_DEAD_YET_A || quest->GetQuestId() == QUEST_NOT_DEAD_YET_H)
        {
            creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            creature->AI()->SetGUID(player->GetGUID());
            creature->CastSpell(player,SPELL_PW_FORTITUDE,true);
            player->CastSpell(player,SPELL_PW_SHIELD,true);
        }
        return true;
    }

    struct npc_father_kamarosAI : public ScriptedAI
    {
        npc_father_kamarosAI(Creature* creature) : ScriptedAI(creature) { }

        uint8 count;
        bool wp_reached;
        bool movementStarted;
        bool finished;
        uint64 uiPlayer;
        Player* player;
        
        void SetGUID(const uint64 &uiGuid, int32 /*iId*/)
        {
            movementStarted = true;
            me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_IMMUNE_TO_PC);
            me->SetReactState(REACT_PASSIVE);
            me->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
            me->GetMotionMaster()->MovePoint(0, KamarosWp[0]);
            uiPlayer = uiGuid;
        }

        void Reset()
        {
            count = 0;
            wp_reached = false;
            movementStarted = false;
            finished = false;
            uiPlayer = 0;
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type != POINT_MOTION_TYPE || id != count)
                return;

            if (movementStarted && id < 54)
            {
                ++count;
                wp_reached = true;
            }
        }

        void UpdateAI(const uint32 /*diff*/)
        {
            if (movementStarted)
            {
                player = me->GetPlayer(*me, uiPlayer);

                if (!player || !player->isAlive() || me->GetDistance(player) > 30.0f)
                    me->DisappearAndDie();

                if (player->isInCombat() && player->GetUInt64Value(UNIT_FIELD_TARGET))
                    me->Attack(me->GetUnit(*me, player->GetUInt64Value(UNIT_FIELD_TARGET)), true);
            }

            if (wp_reached && !finished)
            {
                wp_reached = false;
                me->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
                me->GetMotionMaster()->MovePoint(count, KamarosWp[count]);
            }
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (who->GetEntry() == NPC_NOT_DEAD_YET_TRIG && me->IsWithinDistInMap(who,10.0f,true))
            {
                if (Player* player = me->GetPlayer(*me, uiPlayer))
                {
                    switch (player->GetTeam())
                    {
                        case ALLIANCE: player->GroupEventHappens(QUEST_NOT_DEAD_YET_A, me); break;
                        case HORDE: player->GroupEventHappens(QUEST_NOT_DEAD_YET_H, me); break;
                    }
                    movementStarted = false;
                    finished = true;
                    me->DespawnOrUnsummon(10000);
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_father_kamarosAI(creature);
    }
};

/*######
## npc_vendor_tournament_fraction_champion
######*/

/*
UPDATE creature_template SET scriptname = 'npc_vendor_tournament_fraction_champion' WHERE entry IN (33657,33650,33653,33307,33310,33553,33554,33557,33556,33555);
*/

enum eAchievementsTournamentFactionChampion
{
    ACHIEVEMENT_CHAMPION_OF_DARNASSUS = 2777,
    ACHIEVEMENT_CHAMPION_OF_EXODAR = 2778,
    ACHIEVEMENT_CHAMPION_OF_GNOMEREGAN = 2779,
    ACHIEVEMENT_CHAMPION_OF_IRONFORGE = 2780,
    ACHIEVEMENT_CHAMPION_OF_STORMWIND = 2781,
    ACHIEVEMENT_CHAMPION_OF_ORGRIMMAR = 2783,
    ACHIEVEMENT_CHAMPION_OF_DARKSPEARS = 2784,
    ACHIEVEMENT_CHAMPION_OF_SILVERMOON = 2785,
    ACHIEVEMENT_CHAMPION_OF_THUNDERBLUFF = 2786,
    ACHIEVEMENT_CHAMPION_OF_UNDERCITY = 2787,

};

enum eNPCVendorEntrys
{
    ENTRY_EXODAR_VENDOR = 33657,
    ENTRY_GNOMEREGAN_VENDOR = 33650,
    ENTRY_DARNASSUS_VENDOR = 33653,
    ENTRY_STORMWIND_VENDOR = 33307,
    ENTRY_IRONFORGE_VENDOR = 33310,

    ENTRY_ORGRIMMAR_VENDOR = 33553,
    ENTRY_DARKSPEARS_VENDOR = 33554,
    ENTRY_SILVERMOON_VENDOR = 33557,
    ENTRY_THUNDERBLUFF_VENDOR = 33556,
    ENTRY_UNDERCITY_VENDOR = 33555,

};

class npc_vendor_tournament_fraction_champion : public CreatureScript
{
public:
    npc_vendor_tournament_fraction_champion() : CreatureScript("npc_vendor_tournament_fraction_champion") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        bool showVendor = false;

        switch (creature->GetEntry())
        {
        case ENTRY_EXODAR_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_EXODAR);
            break;
        case ENTRY_GNOMEREGAN_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_GNOMEREGAN);
            break;
        case ENTRY_DARNASSUS_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_DARNASSUS);
            break;
        case ENTRY_STORMWIND_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_STORMWIND);
            break;
        case ENTRY_IRONFORGE_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_IRONFORGE);
            break;
        case ENTRY_ORGRIMMAR_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_ORGRIMMAR);
            break;
        case ENTRY_DARKSPEARS_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_DARKSPEARS);
            break;
        case ENTRY_SILVERMOON_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_SILVERMOON);
            break;
        case ENTRY_THUNDERBLUFF_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_THUNDERBLUFF);
            break;
        case ENTRY_UNDERCITY_VENDOR:
            showVendor = player->HasAchieved(ACHIEVEMENT_CHAMPION_OF_UNDERCITY);
            break;
        }

        if (showVendor)
        {
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        }

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_TRADE)
            player->GetSession()->SendListInventory(creature->GetGUID());
        return true;
    }
};

/*######
## npc_faction_valiant_champion
######*/

/*
UPDATE creature_template SET scriptname = 'npc_faction_valiant_champion' WHERE entry IN (33559,33562,33558,33564,33306,33285,33382,33561,33383,33384);
UPDATE creature_template SET scriptname = 'npc_faction_valiant_champion' WHERE entry IN (33738,33739,33740,33743,33744,33745,33746,33747,33748,33749);
 */

enum eFactionValiantChampion
{
    //SPELL_CHARGE = 63010,
    //SPELL_SHIELD_BREAKER = 65147,
    SPELL_REFRESH_MOUNT       = 66483,

    SPELL_GIVE_VALIANT_MARK_1 = 62724,
    SPELL_GIVE_VALIANT_MARK_2 = 62770,
    SPELL_GIVE_VALIANT_MARK_3 = 62771,
    SPELL_GIVE_VALIANT_MARK_4 = 62995,
    SPELL_GIVE_VALIANT_MARK_5 = 62996,
    SPELL_GIVE_CHAMPION_MARK  = 63596,

    QUEST_THE_GRAND_MELEE_0 = 13665,
    QUEST_THE_GRAND_MELEE_1 = 13745,
    QUEST_THE_GRAND_MELEE_2 = 13750,
    QUEST_THE_GRAND_MELEE_3 = 13756,
    QUEST_THE_GRAND_MELEE_4 = 13761,
    QUEST_THE_GRAND_MELEE_5 = 13767,
    QUEST_THE_GRAND_MELEE_6 = 13772,
    QUEST_THE_GRAND_MELEE_7 = 13777,
    QUEST_THE_GRAND_MELEE_8 = 13782,
    QUEST_THE_GRAND_MELEE_9 = 13787,
    QUEST_AMONG_THE_CHAMPIONS_0 = 13790,
    QUEST_AMONG_THE_CHAMPIONS_1 = 13793,
    QUEST_AMONG_THE_CHAMPIONS_2 = 13811,
    QUEST_AMONG_THE_CHAMPIONS_3 = 13814,
    
    SPELL_BESTED_DARNASSUS      = 64805,
    SPELL_BESTED_GNOMEREGAN     = 64809,
    SPELL_BESTED_IRONFORGE      = 64810,
    SPELL_BESTED_ORGRIMMAR      = 64811,
    SPELL_BESTED_SENJIN         = 64812,
    SPELL_BESTED_SILVERMOON     = 64813,
    SPELL_BESTED_STORMWIND      = 64814,
    SPELL_BESTED_EXODAR         = 64808,
    SPELL_BESTED_UNDERCITY      = 64816,
    SPELL_BESTED_THUNDERBLUFF   = 64815,
    SPELL_DEFEND_AURA_PERIODIC  = 64223,
};

#define GOSSIP_MELEE_FIGHT "I'am ready to fight!"

class npc_faction_valiant_champion : public CreatureScript
{
public:
    npc_faction_valiant_champion() : CreatureScript("npc_faction_valiant_champion") { }

    struct npc_faction_valiant_championAI : public ScriptedAI
    {
        npc_faction_valiant_championAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;
        uint64 guidAttacker;
        bool chargeing;

        void Reset()
        {
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;

            me->setFaction(35);
        }

        void EnterCombat(Unit* attacker)
        {
            guidAttacker = attacker->GetGUID();
            DoCast(me, SPELL_DEFEND_AURA_PERIODIC, true);
            if(Aura* aur = me->AddAura(SPELL_DEFEND,me))
                aur->ModStackAmount(1);
        }

        void MovementInform(uint32 uiType, uint32 uiId)
        {
            if (uiType != POINT_MOTION_TYPE)
                return;
                
                if(uiId != 1)
                   return;

            chargeing = false;
            
            DoCastVictim(SPELL_CHARGE);
            if(me->getVictim())
                me->GetMotionMaster()->MoveChase(me->getVictim());
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if(pDoneBy && pDoneBy->GetGUID() != guidAttacker)
                uiDamage = 0;

            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;

                if(pDoneBy->HasAura(63034))
                {
                    switch (me->GetEntry())
                    {
                    case 33559: // Darnassus
                    case 33562: // Exodar
                    case 33558: // Gnomeregan
                    case 33564: // Ironforge
                    case 33306: // Orgrimmar
                    case 33285: // Sen'jin
                    case 33382: // Silvermoon
                    case 33561: // Stormwind
                    case 33383: // Thunder Bluff
                    case 33384: // Undercity
                        {
                            pDoneBy->CastSpell(pDoneBy,SPELL_GIVE_VALIANT_MARK_1,true);
                            break;
                        }
                    case 33738: // Darnassus
                    case 33739: // Exodar
                    case 33740: // Gnomeregan
                    case 33743: // Ironforge
                    case 33744: // Orgrimmar
                    case 33745: // Sen'jin
                    case 33746: // Silvermoon
                    case 33747: // Stormwind
                    case 33748: // Thunder Bluff
                    case 33749: // Undercity
                        {
                            pDoneBy->CastSpell(pDoneBy,SPELL_GIVE_CHAMPION_MARK,true);
                            break;
                        }
                    }
                    switch (me->GetEntry())
                    {
                        case 33738: // Darnassus
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_DARNASSUS,true); break;
                        case 33739: // Exodar
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_EXODAR,true); break;
                        case 33740: // Gnomeregan
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_GNOMEREGAN,true); break;
                        case 33743: // Ironforge
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_IRONFORGE,true); break;
                        case 33744: // Orgrimmar
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_ORGRIMMAR,true); break;
                        case 33745: // Sen'jin
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_SENJIN,true); break;
                        case 33746: // Silvermoon
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_SILVERMOON,true); break;
                        case 33747: // Stormwind
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_STORMWIND,true); break;
                        case 33748: // Thunder Bluff
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_THUNDERBLUFF,true); break;
                        case 33749: // Undercity
                            pDoneBy->CastSpell(pDoneBy,SPELL_BESTED_UNDERCITY,true); break;
                    }
                }

                me->setFaction(35);
                EnterEvadeMode();
                me->CastSpell(me,SPELL_REFRESH_MOUNT,true);
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                chargeing = true;
                float x,y,z;
                me->GetNearPoint(me, x, y, z, 1.0f, 15.0f, float(M_PI*2*rand_norm()));
                me->GetMotionMaster()->MovePoint(1,x,y,z);

                uiChargeTimer = 15000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(SPELL_SHIELD_BREAKER);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            if (me->isAttackReady())
            {
                DoCast(me->getVictim(), SPELL_THRUST, true);
                me->resetAttackTimer();
            }
            
            if(Player* plr = Player::GetPlayer(*me,guidAttacker))
                 if(!plr->HasAura(63034))
                     EnterEvadeMode();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_faction_valiant_championAI(creature);
    }
    
    bool CanMakeDuel(Player* player, uint32 npcEntry)
    {
        switch (npcEntry)
        {
        case 33738: // Darnassus
            return !player->HasAura(SPELL_BESTED_DARNASSUS);
        case 33739: // Exodar
            return !player->HasAura(SPELL_BESTED_EXODAR);
        case 33740: // Gnomeregan
            return !player->HasAura(SPELL_BESTED_GNOMEREGAN);
        case 33743: // Ironforge
            return !player->HasAura(SPELL_BESTED_IRONFORGE);
        case 33744: // Orgrimmar
            return !player->HasAura(SPELL_BESTED_ORGRIMMAR);
        case 33745: // Sen'jin
            return !player->HasAura(SPELL_BESTED_SENJIN);
        case 33746: // Silvermoon
            return !player->HasAura(SPELL_BESTED_SILVERMOON);
        case 33747: // Stormwind
            return !player->HasAura(SPELL_BESTED_STORMWIND);
        case 33748: // Thunder Bluff
            return !player->HasAura(SPELL_BESTED_THUNDERBLUFF);
        case 33749: // Undercity
            return !player->HasAura(SPELL_BESTED_UNDERCITY);
        }
        return true;
    }

    void AddMeleeFightGossip(Player* player)
    {
         if(!player)
            return;

         if( player->HasAura(63034) &&
            ((player->GetQuestStatus(QUEST_THE_GRAND_MELEE_0) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_1) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_2) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_3) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_4) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_5) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_6) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_7) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_8) == QUEST_STATUS_INCOMPLETE) ||
            (player->GetQuestStatus(QUEST_THE_GRAND_MELEE_9) == QUEST_STATUS_INCOMPLETE)))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MELEE_FIGHT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        switch (creature->GetEntry())
        {
        case 33559: // Darnassus
        case 33562: // Exodar
        case 33558: // Gnomeregan
        case 33564: // Ironforge
        case 33561: // Stormwind
            {
                if(player->GetTeamId() == TEAM_ALLIANCE)
                    AddMeleeFightGossip(player);
                break;
            }
        case 33306: // Orgrimmar
        case 33285: // Sen'jin
        case 33382: // Silvermoon
        case 33383: // Thunder Bluff
        case 33384: // Undercity
            {
                if(player->GetTeamId() == TEAM_HORDE)
                    AddMeleeFightGossip(player);
                break;
            }
        case 33738: // Darnassus
        case 33739: // Exodar
        case 33740: // Gnomeregan
        case 33743: // Ironforge
        case 33744: // Orgrimmar
        case 33745: // Sen'jin
        case 33746: // Silvermoon
        case 33747: // Stormwind
        case 33748: // Thunder Bluff
        case 33749: // Undercity
             {
                if( player->HasAura(63034) &&
                    ((player->GetQuestStatus(QUEST_AMONG_THE_CHAMPIONS_0) == QUEST_STATUS_INCOMPLETE) ||
                    (player->GetQuestStatus(QUEST_AMONG_THE_CHAMPIONS_1) == QUEST_STATUS_INCOMPLETE) ||
                    (player->GetQuestStatus(QUEST_AMONG_THE_CHAMPIONS_2) == QUEST_STATUS_INCOMPLETE) ||
                    (player->GetQuestStatus(QUEST_AMONG_THE_CHAMPIONS_3) == QUEST_STATUS_INCOMPLETE)))
                {
                    if(CanMakeDuel(player,creature->GetEntry()))
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_MELEE_FIGHT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                }
                break;
            }
        }
        
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        player->CLOSE_GOSSIP_MENU();
        if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
        {
            creature->setFaction(14);
            creature->AI()->AttackStart(player);
            return true;
        }

        if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
        {
            creature->setFaction(14);
            creature->AI()->AttackStart(player);
            return true;
        }
        return true;
    }
};

/*######
## npc_maiden_of_drakmar
######*/

/*
DELETE FROM `event_scripts` WHERE `id`=20990;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(20990,1,10,33273,60000,0,4602.782715,-1600.874146,158,1.387292);
UPDATE creature_template SET scriptname = 'npc_maiden_of_drakmar' WHERE entry = 33273;
+*/

#define SAY_1 "Are those winter hyacinths? For me?"
#define SAY_2 "It\'s been so long since a traveler has come here bearing flowers."
#define SAY_3 "The lake has been too lonely these past years. The travelers stopped coming and evil came to these waters."
#define SAY_4 "Your gift is a rare kindness, traveler. Please take this blade with my gratitude. Long ago, another traveler left it here, but I have little use for it."

enum eEntrys
{
     GO_DRAKMAR_LILY_PAD = 194239,
     GO_BLADE_OF_DRAKMAR = 194238,
     ENTRY_MAIDEN_OF_DRAKMAR = 33273,
};

static Position miscLocations[]=
{
    {4602.08f, -1600.22f, 156.657f, 0.128299f}, //GO_DRAKMAR_LILY_PAD
    {4601.53f, -1600.47f, 156.986f, 1.944937f} //GO_BLADE_OF_DRAKMAR
};

class npc_maiden_of_drakmar : public CreatureScript
{
public:
    npc_maiden_of_drakmar() : CreatureScript("npc_maiden_of_drakmar") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_maiden_of_drakmarAI (pCreature);
    }

    struct npc_maiden_of_drakmarAI : public Scripted_NoMovementAI
    {
        npc_maiden_of_drakmarAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
        {
            me->SetCanFly(true); // cosmetic workaround
        }
       
        uint32 uiSayTimer;
        uint8 uiSayStep;

        void Reset ()
        {
            uiSayStep = 0;
            uiSayTimer = 2000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (uiSayTimer <= uiDiff)
            {
                switch (uiSayStep)
                {
                    case 0:
                        me->SummonGameObject(GO_DRAKMAR_LILY_PAD, miscLocations[0].GetPositionX(),miscLocations[0].GetPositionY(),miscLocations[0].GetPositionZ(),miscLocations[0].GetOrientation(),0,0,0,0,30000);
                        me->MonsterSay(SAY_1,LANG_UNIVERSAL,0);
                        uiSayTimer = 3000;
                        ++uiSayStep;
                        break;
                    case 1:
                        me->MonsterSay(SAY_2,LANG_UNIVERSAL,0);
                        uiSayTimer = 5000;
                        ++uiSayStep;
                        break;
                    case 2:
                        me->MonsterSay(SAY_3,LANG_UNIVERSAL,0);
                       uiSayTimer = 7000;
                        ++uiSayStep;
                    break;
                    case 3:
                        me->SummonGameObject(GO_BLADE_OF_DRAKMAR, miscLocations[1].GetPositionX(),miscLocations[1].GetPositionY(),miscLocations[1].GetPositionZ(),miscLocations[1].GetOrientation(),0,0,0,0,30000);
                        me->MonsterSay(SAY_4,LANG_UNIVERSAL,0);
                        uiSayTimer = 99999999;
                        ++uiSayStep;
                        break;
                }
            }
            else uiSayTimer -= uiDiff;
        }
    };
};

/*######
npc_squire_danny
######*/

/*
UPDATE creature_template SET scriptname = 'npc_squire_danny' WHERE entry = 33518;
*/

enum eSquireDanny
{
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_UNDERCITY = 13729,
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_SENJIN = 13727,
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_THUNDERBLUFF = 13728,
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_SILVERMOON = 13731,
    QUEST_THE_VALIANT_S_CHALLENGE_HORDE_ORGRIMMAR = 13726,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_DARNASSUS = 13725,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_IRONFORGE = 13713,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_GNOMEREGAN = 13723,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_EXODAR = 13724,
    QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_STORMWIND = 13699,

    NPC_ARGENT_CHAMPION = 33707,
    SPELL_SUMMON_ARGENT_CHAMPION = 63171,

    GOSSIP_TEXTID_SQUIRE_DANNY = 14407
};

class npc_squire_danny : public CreatureScript
{
public:
    npc_squire_danny() : CreatureScript("npc_squire_danny") { }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        {
            pPlayer->CLOSE_GOSSIP_MENU();
            pCreature->CastSpell(pPlayer,SPELL_SUMMON_ARGENT_CHAMPION,false);
        }
        //else
        //pPlayer->SEND_GOSSIP_MENU(???, pCreature->GetGUID()); Missing text
        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pPlayer->HasAura(63034) 
            && ((pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_UNDERCITY) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_SENJIN) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_THUNDERBLUFF) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_SILVERMOON) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_HORDE_ORGRIMMAR) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_DARNASSUS) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_IRONFORGE) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_GNOMEREGAN) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_EXODAR) == QUEST_STATUS_INCOMPLETE)
            || (pPlayer->GetQuestStatus(QUEST_THE_VALIANT_S_CHALLENGE_ALLIANCE_STORMWIND) == QUEST_STATUS_INCOMPLETE)))
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SQUIRE_ITEM_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
        }

    pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXTID_SQUIRE_DANNY, pCreature->GetGUID());
    return true;
    }
};

/*######
## npc_argent_champion
######*/
// To Do Argent Valiant, Faction Valiant, Argent Champion and Faction Champion have the same script -> make one

/*
UPDATE creature_template SET scriptname = 'npc_argent_champion' WHERE entry = 33707;
*/

enum eArgentChampion
{
    //SPELL_CHARGE = 63010,
    //SPELL_SHIELD_BREAKER = 65147,

    SPELL_ARGENT_CRUSADE_CHAMPION = 63501,
    SPELL_GIVE_KILL_CREDIT_CHAMPION = 63516,
};

class npc_argent_champion : public CreatureScript
{
public:
    npc_argent_champion() : CreatureScript("npc_argent_champion") { }

    struct npc_argent_championAI : public ScriptedAI
    {
        npc_argent_championAI(Creature* creature) : ScriptedAI(creature)
        {
            creature->GetMotionMaster()->MovePoint(0, 8561.30f, 1113.30f, 556.9f);
            creature->setFaction(35); //wrong faction in db?
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;

        void Reset()
        {
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;
        }

        void MovementInform(uint32 uiType, uint32 /*uiId*/)
        {
            if (uiType != POINT_MOTION_TYPE)
                return;

            me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
            me->setFaction(14);
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                if(pDoneBy->HasAura(63034))
                    pDoneBy->CastSpell(pDoneBy,SPELL_GIVE_KILL_CREDIT_CHAMPION,true);
                me->setFaction(35);
                me->DespawnOrUnsummon(5000);
                me->SetHomePosition(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation());
                EnterEvadeMode();
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (uiChargeTimer <= uiDiff)
            {
                DoCastVictim(SPELL_CHARGE);
                uiChargeTimer = 7000;
            } else uiChargeTimer -= uiDiff;

            if (uiShieldBreakerTimer <= uiDiff)
            {
                DoCastVictim(SPELL_SHIELD_BREAKER);
                uiShieldBreakerTimer = 10000;
            } else uiShieldBreakerTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_argent_championAI(creature);
    }
};

#define GOSSIP_TRADE "Visit a trader."
#define GOSSIP_BANK "Visit a bank."
#define GOSSIP_MAIL "Visit a mailbox."

#define GOSSIP_ORC_PENNANT "Orgrimmar Champion's Pennant"
#define GOSSIP_SEN_PENNANT "Darkspear Champion's Pennant"
#define GOSSIP_UND_PENNANT "Forsaken Champion's Pennant"
#define GOSSIP_SIL_PENNANT "Silvermoon Champion's Pennant"
#define GOSSIP_TBL_PENNANT "Thunder Bluff Champion's Pennant"

#define GOSSIP_STW_PENNANT "Stormwind Champion's Pennant"
#define GOSSIP_IFR_PENNANT "Ironforge Champion's Pennant"
#define GOSSIP_GNO_PENNANT "Gnomeregan Champion's Pennant"
#define GOSSIP_DAR_PENNANT "Darnassus Champion's Pennant"
#define GOSSIP_EXO_PENNANT "Exodar Champion's Pennant"

enum eSquireGruntling
{
    SPELL_BANK_ERRAND_H = 68849,
    SPELL_POSTMAN_H = 68850,
    SPELL_SHOP_H = 68851,
    SPELL_TIRED_H = 68852,

    SPELL_BANK_ERRAND_A = 67368,
    SPELL_POSTMAN_A = 67376,
    SPELL_SHOP_A = 67377,
    SPELL_TIRED_A = 67401,

    SPELL_PEND_DAR = 63443,
    SPELL_PEND_GNO = 63442,
    SPELL_PEND_IRO = 63440,
    SPELL_PEND_ORG = 63444,
    SPELL_PEND_SEN = 63446,
    SPELL_PEND_SIL = 63438,
    SPELL_PEND_STO = 62727,
    SPELL_PEND_EXO = 63439,
    SPELL_PEND_UND = 63441,
    SPELL_PEND_THU = 63445,


    ACHIEVEMENT_CHAMP_DARNASSUS = 2777,
    ACHIEVEMENT_CHAMP_GNOMEREGAN = 2779,
    ACHIEVEMENT_CHAMP_IRONFORGE = 2780,
    ACHIEVEMENT_CHAMP_ORGRIMMAR = 2783,
    ACHIEVEMENT_CHAMP_SENJIN = 2784,
    ACHIEVEMENT_CHAMP_SILVERMOON = 2785,
    ACHIEVEMENT_CHAMP_STORMWIND = 2781,
    ACHIEVEMENT_CHAMP_EXODAR = 2778,
    ACHIEVEMENT_CHAMP_UNDERCITY = 2787,
    ACHIEVEMENT_CHAMP_THUNDERBLUFF = 2786,

    GOS_CHAMP_DAR = 1,
    GOS_CHAMP_GNO = 2,
    GOS_CHAMP_IRO = 3,
    GOS_CHAMP_ORG = 4,
    GOS_CHAMP_SEN = 5,
    GOS_CHAMP_SIL = 6,
    GOS_CHAMP_STO = 7,
    GOS_CHAMP_EXO = 8,
    GOS_CHAMP_UND = 9,
    GOS_CHAMP_THU = 10,

    ENTRY_SQUIRE = 33238,
    ENTRY_GRUNTLING = 33239,
};

//UPDATE creature_template SET scriptname = 'npc_argent_squire_gruntling' WHERE entry in (33238,33239);

class npc_argent_squire_gruntling : public CreatureScript
{
public:
    npc_argent_squire_gruntling() : CreatureScript("npc_argent_squire_gruntling") { }

    bool canShowPostman(Creature* pCreature)
    {
        if(pCreature->HasAura(SPELL_POSTMAN_H) || pCreature->HasAura(SPELL_POSTMAN_A))
            return true;

        if(pCreature->HasAura(SPELL_BANK_ERRAND_H) || pCreature->HasAura(SPELL_BANK_ERRAND_A))
            return false;

        if(pCreature->HasAura(SPELL_SHOP_H) || pCreature->HasAura(SPELL_SHOP_A))
            return false;

        if(pCreature->HasAura(SPELL_TIRED_H) || pCreature->HasAura(SPELL_TIRED_A))
            return false;

        return true;
    }

    bool canShowShop(Creature* pCreature)
    {
        if(pCreature->HasAura(SPELL_POSTMAN_H) || pCreature->HasAura(SPELL_POSTMAN_A))
            return false;

        if(pCreature->HasAura(SPELL_BANK_ERRAND_H) || pCreature->HasAura(SPELL_BANK_ERRAND_A))
            return false;

        if(pCreature->HasAura(SPELL_SHOP_H) || pCreature->HasAura(SPELL_SHOP_A))
            return true;

        if(pCreature->HasAura(SPELL_TIRED_H) || pCreature->HasAura(SPELL_TIRED_A))
            return false;

        return true;
    }

    bool canShowBank(Creature* pCreature)
    {
        if(pCreature->HasAura(SPELL_POSTMAN_H) || pCreature->HasAura(SPELL_POSTMAN_A))
            return false;

        if(pCreature->HasAura(SPELL_BANK_ERRAND_H) || pCreature->HasAura(SPELL_BANK_ERRAND_A))
            return true;

        if(pCreature->HasAura(SPELL_SHOP_H) || pCreature->HasAura(SPELL_SHOP_A))
            return false;

        if(pCreature->HasAura(SPELL_TIRED_H) || pCreature->HasAura(SPELL_TIRED_A))
            return false;

        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if(!pPlayer)
            return true;

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_DARNASSUS))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_DAR_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_DAR);

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_GNOMEREGAN))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_GNO_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_GNO);

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_IRONFORGE))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_IFR_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_IRO);

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_ORGRIMMAR))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ORC_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_ORG);

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_SENJIN))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_DAR_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_SEN);

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_SILVERMOON))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SIL_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_SIL);

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_STORMWIND))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_STW_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_STO);

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_EXODAR))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_EXO_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_EXO);

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_UNDERCITY))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_UND_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_UND);

        if(pPlayer->HasAchieved(ACHIEVEMENT_CHAMP_THUNDERBLUFF))
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TBL_PENNANT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_THU);

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
        return true;
    }

    void cleanUpAllAuras(Creature* pCreature)
    {
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_DAR);
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_GNO);
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_IRO);
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_ORG);
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_SEN);
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_SIL);
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_STO);
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_EXO);
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_UND);
        pCreature->RemoveAurasDueToSpell(SPELL_PEND_THU);
    }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_DAR:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_DAR,true);
            break;
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_GNO:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_GNO,true);
            break;
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_IRO:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_IRO,true);
            break;
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_ORG:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_ORG,true);
            break;
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_SEN:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_SEN,true);
            break;
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_SIL:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_SIL,true);
            break;
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_STO:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_STO,true);
            break;
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_EXO:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_EXO,true);
            break;
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_UND:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_UND,true);
            break;
        case GOSSIP_ACTION_INFO_DEF+GOS_CHAMP_THU:
            cleanUpAllAuras(pCreature);
            pCreature->CastSpell(pCreature,SPELL_PEND_THU,true);
            break;
        }

        pPlayer->CLOSE_GOSSIP_MENU();
        return true;
    }
};

/*######
## npc_vereth_the_cunning
######*/

enum eVerethTheCunning
{
    NPC_GEIST_RETURN_BUNNY_KC   = 31049,
    NPC_LITHE_STALKER           = 30894,
    SPELL_SUBDUED_LITHE_STALKER = 58151,
};

class npc_vereth_the_cunning : public CreatureScript
{
public:
    npc_vereth_the_cunning() : CreatureScript("npc_vereth_the_cunning") { }

    struct npc_vereth_the_cunningAI : public ScriptedAI
    {
        npc_vereth_the_cunningAI(Creature* creature) : ScriptedAI(creature) {}

        void MoveInLineOfSight(Unit* who)
        {
            ScriptedAI::MoveInLineOfSight(who);

            if (who->GetEntry() == NPC_LITHE_STALKER && me->IsWithinDistInMap(who, 10.0f))
            {
                if (Unit* owner = who->GetCharmer())
                {
                    if (who->HasAura(SPELL_SUBDUED_LITHE_STALKER))
                        {
                            owner->ToPlayer()->KilledMonsterCredit(NPC_GEIST_RETURN_BUNNY_KC, 0);
                            who->ToCreature()->DisappearAndDie();
                        
                    }
                }
            }
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_vereth_the_cunningAI(creature);
    }
};

/*##########################
# spell_construct_barricade
###########################*/

enum BarricadeData
{
    SPELL_CONSTRUCT_BARRICADE = 59925,
    SPELL_SUMMON_BARRICADE_A = 59922,
    SPELL_SUMMON_BARRICADE_B = 59923,
    SPELL_SUMMON_BARRICADE_C = 59924,
    NPC_EBON_BLADE_MARKER = 31887
};

class spell_construct_barricade : public SpellScriptLoader
{
public:
    spell_construct_barricade() : SpellScriptLoader("spell_construct_barricade") {}

    class spell_construct_barricade_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_construct_barricade_SpellScript)

        bool Validate(SpellInfo const * /*spellInfo*/)
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_CONSTRUCT_BARRICADE))
                return false;
            return true;
        }

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
                if (Player* player = caster->ToPlayer())
                {
                    uint32 SummonBarricadeSpell = 0;
                    switch (urand(1,3))
                    {
                        case 1: SummonBarricadeSpell = SPELL_SUMMON_BARRICADE_A; break;
                        case 2: SummonBarricadeSpell = SPELL_SUMMON_BARRICADE_B; break;
                        case 3: SummonBarricadeSpell = SPELL_SUMMON_BARRICADE_C; break;
                    }
                    player->CastSpell(player, SummonBarricadeSpell, true);
                    player->KilledMonsterCredit(NPC_EBON_BLADE_MARKER, 0);
                }
        }
        void Register()
        {
            OnEffectHit += SpellEffectFn(spell_construct_barricade_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_construct_barricade_SpellScript();
    }
};

/*######
npc_squire_calvin
######*/

enum eSquireCalvin
{
    QUEST_THE_BLACK_KNIGHTS_FALL = 13664,
    NPC_BLACK_KNIGHT = 33785,
};

/*
UPDATE creature_template SET scriptname = 'npc_squire_calvin' WHERE entry = 33522;
*/

#define GOSSIP_SUMMON_BLACK_KNIGHT "Ask Cavin to summon the Black Knight."

class npc_squire_calvin : public CreatureScript
{
public:
    npc_squire_calvin() : CreatureScript("npc_squire_calvin") { }

    bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
    {
        pPlayer->PlayerTalkClass->ClearMenus();
        if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        {
            Position pos;
            pCreature->GetPosition(&pos);
            {
                if(TempSummon* temp = pCreature->SummonCreature(NPC_BLACK_KNIGHT,pos,TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,10000))
                    temp->AI()->SetGUID(pPlayer->GetGUID());
            }
            pPlayer->CLOSE_GOSSIP_MENU();
        }
        return true;
    }

    bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    {
        if (pPlayer->HasAura(63663) && (pPlayer->GetQuestStatus(QUEST_THE_BLACK_KNIGHTS_FALL) == QUEST_STATUS_INCOMPLETE))
        {
            std::list<Creature*> checkList;
            pCreature->GetCreatureListWithEntryInGrid(checkList,NPC_BLACK_KNIGHT,100.0f);
            if(checkList.size() == 0)
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SUMMON_BLACK_KNIGHT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
        }

        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
        return true;
    }
};


enum eBlackKnight
{
    SPELL_BK_CHARGE = 63003,
    //SPELL_SHIELD_BREAKER = 65147,
    SPELL_DARK_SHIELD = 64505,

};

// UPDATE creature_template SET scriptname = 'npc_the_black_knight' WHERE entry = 33785;

#define YELL_ATTACK_PHASE_1_END "Get off that horse and fight me man-to-man!"
#define YELL_ATTACK_PHASE_2 "I will not fail you, master!"

class npc_the_black_knight : public CreatureScript
{
public:
    npc_the_black_knight() : CreatureScript("npc_the_black_knight") { }

    struct npc_the_black_knightAI : public ScriptedAI
    {
        npc_the_black_knightAI(Creature* creature) : ScriptedAI(creature)
        {
        }

        uint32 uiChargeTimer;
        uint32 uiShieldBreakerTimer;
        uint64 guidAttacker;
        uint32 uireattackTimer;

        bool chargeing;

        bool mountDuel;
        bool handDuel;

        void Reset()
        {
            uiChargeTimer = 7000;
            uiShieldBreakerTimer = 10000;
            uireattackTimer = 10000;

            me->setFaction(35);

            mountDuel = false;
            handDuel = false;
        }

        void SetGUID(uint64 guid, int32)
        {
            if(Player* plr = Player::GetPlayer(*me,guid))
            {
                guidAttacker = guid;
                mountDuel = true;
                handDuel = false;
                me->setFaction(14);
                me->Mount(28652);
                AttackStart(plr);
                // Move Point

                me->SetMaxHealth(50000);
                me->SetHealth(50000);
            }
        }

        void JustDied(Unit* killer)
        {
            me->DespawnOrUnsummon(5000);
        }

        void EnterCombat(Unit* attacker)
        {
            DoCast(me,SPELL_DEFEND_AURA_PERIODIC,true);
        }

        void MovementInform(uint32 uiType, uint32 uiId)
        {
            if (uiType != POINT_MOTION_TYPE)
                return;

            if(uiId == 1)
            {

                chargeing = false;

                DoCastVictim(SPELL_BK_CHARGE);
                if(me->getVictim())
                    me->GetMotionMaster()->MoveChase(me->getVictim());

            }else if(uiId == 2)
            {
                if(Player* plr = Player::GetPlayer(*me,guidAttacker))
                {
                    AttackStart(plr);
                }
            }
        }

        void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
        {
            if(pDoneBy && pDoneBy->GetGUID() != guidAttacker)
                uiDamage = 0;

            if(handDuel)
                return;
            if(!mountDuel)
                return;

            if (uiDamage > me->GetHealth() && pDoneBy->GetTypeId() == TYPEID_PLAYER)
            {
                uiDamage = 0;
                mountDuel = false;
                me->SetHealth(50000);
                me->Dismount();
                me->GetMotionMaster()->MoveIdle();
                me->RemoveAurasDueToSpell(SPELL_DEFEND_AURA_PERIODIC);
                me->SetFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);
                me->MonsterYell(YELL_ATTACK_PHASE_1_END,LANG_UNIVERSAL,guidAttacker);
                uireattackTimer = 10000;
            }
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if(mountDuel)
            {
                if (uiChargeTimer <= uiDiff)
                {
                    chargeing = true;
                    float x,y,z;
                    me->GetNearPoint(me, x, y, z, 1.0f, 15.0f, float(M_PI*2*rand_norm()));
                    me->GetMotionMaster()->MovePoint(1,x,y,z);

                    uiChargeTimer = 7000;
                } else uiChargeTimer -= uiDiff;

                if (uiShieldBreakerTimer <= uiDiff)
                {
                    DoCastVictim(SPELL_SHIELD_BREAKER);
                    uiShieldBreakerTimer = 10000;
                } else uiShieldBreakerTimer -= uiDiff;

                if (me->isAttackReady())
                {
                    DoCast(me->getVictim(), SPELL_THRUST, true);
                    me->resetAttackTimer();
                }
            }else if(handDuel)
            {
                if (uiShieldBreakerTimer <= uiDiff)
                {
                    DoCastVictim(SPELL_DARK_SHIELD);
                    uiShieldBreakerTimer = 30000;
                } else uiShieldBreakerTimer -= uiDiff;

                DoMeleeAttackIfReady();
            }else
            {
                if(uireattackTimer <= uiDiff)
                {
                    handDuel = true;
                    if(me->getVictim())
                        me->GetMotionMaster()->MoveChase(me->getVictim());
                    me->RemoveFlag(UNIT_FIELD_FLAGS,UNIT_FLAG_NON_ATTACKABLE);

                    if(Player* plr = Player::GetPlayer(*me,guidAttacker))
                        plr->ExitVehicle();

                    me->SetMaxHealth(12500);
                    me->SetHealth(12500);
                    me->MonsterYell(YELL_ATTACK_PHASE_2,LANG_UNIVERSAL,guidAttacker);
                    uireattackTimer = 99999999;
                }else uireattackTimer -= uiDiff;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_the_black_knightAI(creature);
    }
};

class spell_flaming_spear_targeting : public SpellScriptLoader
{
    public:
        spell_flaming_spear_targeting() : SpellScriptLoader("spell_flaming_spear_targeting") { }

        class spell_flaming_spear_targeting_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_flaming_spear_targeting_SpellScript);

            bool Load()
            {
                return GetCaster()->ToPlayer() != NULL;
            }

            void GetTargets(std::list<Unit*>& targetList)
            {
                targetList.clear();

                std::list<Creature*> pTargetList;
                GetCaster()->GetCreatureListWithEntryInGrid(pTargetList,35092, 150.0f);
                GetCaster()->GetCreatureListWithEntryInGrid(pTargetList,34925, 150.0f);

                if(pTargetList.empty())
                    return;

                pTargetList.sort(Trinity::ObjectDistanceOrderPred(GetCaster()));

                std::list<Creature*>::iterator itr = pTargetList.begin();
                uint8 i = 3;
                for (std::list<Creature*>::const_iterator itr = pTargetList.begin(); itr != pTargetList.end(); ++itr)
                {
                    if(i == 0)
                        break;
                    if((*itr)->isAlive())
                    {
                        targetList.push_back(*itr);
                        i--;
                    }
                }
            }

            void Register()
            {
                OnUnitTargetSelect += SpellUnitTargetFn(spell_flaming_spear_targeting_SpellScript::GetTargets, EFFECT_0, TARGET_UNIT_TARGET_ANY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_flaming_spear_targeting_SpellScript();
        }
};

enum quest_shadow_vault_decree
{
    QUEST_SVD = 12943,
    NPC_SVD   = 29919
};

class shadow_vault_decree : public ItemScript
{
public:
    shadow_vault_decree() : ItemScript("shadow_vault_decree") { }

    bool OnUse(Player* player, Item* /*item*/, SpellCastTargets const& /*targets*/)
    {
        if (player->GetQuestStatus(QUEST_SVD) == QUEST_STATUS_INCOMPLETE)
        {
            if (Creature* svd = player->FindNearestCreature(NPC_SVD, 20.0f, true))
            {
                svd->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
            }
        }
        return false;
    }
};

enum BattleForFuckingCrusaders
{
    QUEST_BATTLE_FOR_FUCKING_CRUSADERS = 13141,
    GO_FUCKING_SKULLS = 193003
};

class blessed_banner : public ItemScript
{
public:
    blessed_banner() : ItemScript("blessed_banner") { }

    bool OnUse(Player* player, Item* /*item*/, SpellCastTargets const& /*targets*/)
    {
        if (player->GetQuestStatus(QUEST_BATTLE_FOR_FUCKING_CRUSADERS) == QUEST_STATUS_INCOMPLETE)
        {
            if (GameObject* skulls = player->FindNearestGameObject(GO_FUCKING_SKULLS, 5.0f))
            {
                player->CompleteQuest(QUEST_BATTLE_FOR_FUCKING_CRUSADERS);
            }
        }
        return false;
    }
};

/*######
* npc_tournament_training_dummy
######*/
enum TournamentDummy
{
    NPC_CHARGE_TARGET         = 33272,
    NPC_MELEE_TARGET          = 33229,
    NPC_RANGED_TARGET         = 33243,

    SPELL_CHARGE_CREDIT       = 62658,
    SPELL_MELEE_CREDIT        = 62672,
    SPELL_RANGED_CREDIT       = 62673,

    SPELL_PLAYER_THRUST       = 62544,
    SPELL_PLAYER_BREAK_SHIELD = 62626,
    SPELL_PLAYER_CHARGE       = 62874,

    SPELL_RANGED_DEFEND       = 62719,
    SPELL_CHARGE_DEFEND       = 64100,
    SPELL_VULNERABLE          = 62665,

    SPELL_COUNTERATTACK       = 62709,

    EVENT_DUMMY_RECAST_DEFEND = 1,
    EVENT_DUMMY_RESET         = 2,
};

class npc_tournament_training_dummy : public CreatureScript
{
    public:
        npc_tournament_training_dummy(): CreatureScript("npc_tournament_training_dummy"){}

        struct npc_tournament_training_dummyAI : Scripted_NoMovementAI
        {
            npc_tournament_training_dummyAI(Creature* creature) : Scripted_NoMovementAI(creature) {}

            EventMap events;
            bool isVulnerable;

            void Reset()
            {
                me->SetControlled(true, UNIT_STATE_STUNNED);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
                isVulnerable = false;

                // Cast Defend spells to max stack size
                switch (me->GetEntry())
                {
                    case NPC_CHARGE_TARGET:
                        DoCast(SPELL_CHARGE_DEFEND);
                        break;
                    case NPC_RANGED_TARGET:
                        me->CastCustomSpell(SPELL_RANGED_DEFEND, SPELLVALUE_AURA_STACK, 3, me);
                        break;
                }

                events.Reset();
                events.ScheduleEvent(EVENT_DUMMY_RECAST_DEFEND, 5000);
            }

            void EnterEvadeMode()
            {
                if (!_EnterEvadeMode())
                    return;

                Reset();
            }

            void DamageTaken(Unit* /*attacker*/, uint32& damage)
            {
                damage = 0;
                events.RescheduleEvent(EVENT_DUMMY_RESET, 10000);
            }

            void SpellHit(Unit* caster, SpellInfo const* spell)
            {
                switch (me->GetEntry())
                {
                    case NPC_CHARGE_TARGET:
                        if (spell->Id == SPELL_PLAYER_CHARGE)
                            if (isVulnerable)
                                DoCast(caster, SPELL_CHARGE_CREDIT, true);
                        break;
                    case NPC_MELEE_TARGET:
                        if (spell->Id == SPELL_PLAYER_THRUST)
                        {
                            DoCast(caster, SPELL_MELEE_CREDIT, true);

                            if (Unit* target = caster->GetVehicleBase())
                                DoCast(target, SPELL_COUNTERATTACK, true);
                        }
                        break;
                    case NPC_RANGED_TARGET:
                        if (spell->Id == SPELL_PLAYER_BREAK_SHIELD)
                            if (isVulnerable)
                                DoCast(caster, SPELL_RANGED_CREDIT, true);
                        break;
                }

                if (spell->Id == SPELL_PLAYER_BREAK_SHIELD)
                    if (!me->HasAura(SPELL_CHARGE_DEFEND) && !me->HasAura(SPELL_RANGED_DEFEND))
                        isVulnerable = true;
            }

            void UpdateAI(uint32 const diff)
            {
                events.Update(diff);

                switch (events.ExecuteEvent())
                {
                    case EVENT_DUMMY_RECAST_DEFEND:
                        switch (me->GetEntry())
                        {
                            case NPC_CHARGE_TARGET:
                            {
                                if (!me->HasAura(SPELL_CHARGE_DEFEND))
                                    DoCast(SPELL_CHARGE_DEFEND);
                                break;
                            }
                            case NPC_RANGED_TARGET:
                            {
                                Aura* defend = me->GetAura(SPELL_RANGED_DEFEND);
                                if (!defend || defend->GetStackAmount() < 3 || defend->GetDuration() <= 8000)
                                    DoCast(SPELL_RANGED_DEFEND);
                                break;
                            }
                        }
                        isVulnerable = false;
                        events.ScheduleEvent(EVENT_DUMMY_RECAST_DEFEND, 5000);
                        break;
                    case EVENT_DUMMY_RESET:
                        if (UpdateVictim())
                        {
                            EnterEvadeMode();
                            events.ScheduleEvent(EVENT_DUMMY_RESET, 10000);
                        }
                        break;
                }

                if (!UpdateVictim())
                    return;

                if (!me->HasUnitState(UNIT_STATE_STUNNED))
                    me->SetControlled(true, UNIT_STATE_STUNNED);
            }

            void MoveInLineOfSight(Unit* /*who*/){}
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_tournament_training_dummyAI(creature);
        }

};

class npc_dying_soldier : public CreatureScript
{
public:
    npc_dying_soldier() : CreatureScript("npc_dying_soldier") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(13232) == QUEST_STATUS_INCOMPLETE)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Пусть земля тебе будет пухом, герой Альянса!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

            return true;
        }

        if (player->GetQuestStatus(12231) == QUEST_STATUS_INCOMPLETE)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Расспросить солдата.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

            return true;
        }

        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();

        if (action == GOSSIP_ACTION_INFO_DEF+1)
        {
            player->KilledMonsterCredit(31312,0);
            creature->DealDamage(creature, creature->GetHealth());
        }

        if (action == GOSSIP_ACTION_INFO_DEF+2)
        {
            player->KilledMonsterCredit(31312,0);
        }

        return true;
    }
};

void AddSC_icecrown()
{
    new npc_arete();
    new npc_squire_david();
    new npc_argent_valiant();
    new npc_guardian_pavilion();
    new npc_the_ocular();
    new npc_general_lightsbane();
    new npc_free_your_mind();
    new npc_father_kamaros();
    new npc_vendor_tournament_fraction_champion();
    new npc_faction_valiant_champion();
    new npc_maiden_of_drakmar();
    new npc_squire_danny();
    new npc_argent_champion();
    new npc_argent_squire_gruntling();
    new npc_vereth_the_cunning();
    new spell_construct_barricade();
    new npc_squire_calvin();
    new npc_the_black_knight();
    new spell_flaming_spear_targeting();
    new shadow_vault_decree();
    new blessed_banner();
    new npc_tournament_training_dummy();
    new npc_dying_soldier();
}
