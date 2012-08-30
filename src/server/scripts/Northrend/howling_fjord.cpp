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

/* ScriptData
SDName: Sholazar_Basin
SD%Complete: 100
SDComment: Quest support: 11253, 11241.
SDCategory: howling_fjord
EndScriptData */

/* ContentData
npc_plaguehound_tracker
npc_apothecary_hanes
EndContentData */

#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"
#include "Vehicle.h"

/*######
## npc_apothecary_hanes
######*/
enum Entries
{
    NPC_APOTHECARY_HANES         = 23784,
    FACTION_ESCORTEE_A           = 774,
    FACTION_ESCORTEE_H           = 775,
    NPC_HANES_FIRE_TRIGGER       = 23968,
    QUEST_TRAIL_OF_FIRE          = 11241,
    SPELL_COSMETIC_LOW_POLY_FIRE = 56274
};

class npc_apothecary_hanes : public CreatureScript
{
public:
    npc_apothecary_hanes() : CreatureScript("npc_apothecary_hanes") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_TRAIL_OF_FIRE)
        {
            switch (player->GetTeam())
            {
                case ALLIANCE:
                    creature->setFaction(FACTION_ESCORTEE_A);
                    break;
                case HORDE:
                    creature->setFaction(FACTION_ESCORTEE_H);
                    break;
            }
            CAST_AI(npc_escortAI, (creature->AI()))->Start(true, false, player->GetGUID());
        }
        return true;
    }

    struct npc_Apothecary_HanesAI : public npc_escortAI
    {
        npc_Apothecary_HanesAI(Creature* creature) : npc_escortAI(creature){}
        uint32 PotTimer;

        void Reset()
        {
            SetDespawnAtFar(false);
            PotTimer = 10000; //10 sec cooldown on potion
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Player* player = GetPlayerForEscort())
                player->FailQuest(QUEST_TRAIL_OF_FIRE);
        }

        void UpdateEscortAI(const uint32 diff)
        {
            if (HealthBelowPct(75))
            {
                if (PotTimer <= diff)
                {
                    DoCast(me, 17534, true);
                    PotTimer = 10000;
                } else PotTimer -= diff;
            }
            if (GetAttack() && UpdateVictim())
                DoMeleeAttackIfReady();
        }

        void WaypointReached(uint32 waypointId)
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
                case 1:
                    me->SetReactState(REACT_AGGRESSIVE);
                    SetRun(true);
                    break;
                case 23:
                    player->GroupEventHappens(QUEST_TRAIL_OF_FIRE, me);
                    me->DespawnOrUnsummon();
                    break;
                case 5:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(false);
                    break;
                case 6:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(true);
                    break;
                case 8:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(false);
                    break;
                case 9:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    break;
                case 10:
                    SetRun(true);
                    break;
                case 13:
                    SetRun(false);
                    break;
                case 14:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(true);
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_Apothecary_HanesAI(creature);
    }
};

/*######
## npc_plaguehound_tracker
######*/

enum ePlaguehound
{
    QUEST_SNIFF_OUT_ENEMY        = 11253
};

class npc_plaguehound_tracker : public CreatureScript
{
public:
    npc_plaguehound_tracker() : CreatureScript("npc_plaguehound_tracker") { }

    struct npc_plaguehound_trackerAI : public npc_escortAI
    {
        npc_plaguehound_trackerAI(Creature* creature) : npc_escortAI(creature) { }

        void Reset()
        {
            uint64 summonerGUID = 0;

            if (me->isSummon())
                if (Unit* summoner = me->ToTempSummon()->GetSummoner())
                    if (summoner->GetTypeId() == TYPEID_PLAYER)
                        summonerGUID = summoner->GetGUID();

            if (!summonerGUID)
                return;

            me->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
            Start(false, false, summonerGUID);
        }

        void WaypointReached(uint32 waypointId)
        {
            if (waypointId != 26)
                return;

            me->DespawnOrUnsummon();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_plaguehound_trackerAI(creature);
    }
};

/*######
## npc_razael_and_lyana
######*/

#define GOSSIP_RAZAEL_REPORT "High Executor Anselm wants a report on the situation."
#define GOSSIP_LYANA_REPORT "High Executor Anselm requests your report."

enum eRazael
{
    QUEST_REPORTS_FROM_THE_FIELD = 11221,
    NPC_RAZAEL = 23998,
    NPC_LYANA = 23778,
    GOSSIP_TEXTID_RAZAEL1 = 11562,
    GOSSIP_TEXTID_RAZAEL2 = 11564,
    GOSSIP_TEXTID_LYANA1 = 11586,
    GOSSIP_TEXTID_LYANA2 = 11588
};

class npc_razael_and_lyana : public CreatureScript
{
public:
    npc_razael_and_lyana() : CreatureScript("npc_razael_and_lyana") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_REPORTS_FROM_THE_FIELD) == QUEST_STATUS_INCOMPLETE)
            switch (creature->GetEntry())
            {
                case NPC_RAZAEL:
                    if (!player->GetReqKillOrCastCurrentCount(QUEST_REPORTS_FROM_THE_FIELD, NPC_RAZAEL))
                    {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_RAZAEL_REPORT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                        player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_RAZAEL1, creature->GetGUID());
                        return true;
                    }
                break;
                case NPC_LYANA:
                    if (!player->GetReqKillOrCastCurrentCount(QUEST_REPORTS_FROM_THE_FIELD, NPC_LYANA))
                    {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LYANA_REPORT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                        player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LYANA1, creature->GetGUID());
                        return true;
                    }
                break;
            }
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_RAZAEL2, creature->GetGUID());
                player->TalkedToCreature(NPC_RAZAEL, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 2:
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LYANA2, creature->GetGUID());
                player->TalkedToCreature(NPC_LYANA, creature->GetGUID());
                break;
        }
        return true;
    }
};

/*######
## npc_mcgoyver
######*/

#define GOSSIP_ITEM_MG_I  "Walt sent me to pick up some dark iron ingots."
#define GOSSIP_ITEM_MG_II "Yarp."

enum eMcGoyver
{
    QUEST_WE_CAN_REBUILD_IT             = 11483,

    SPELL_CREATURE_DARK_IRON_INGOTS     = 44512,
    SPELL_TAXI_EXPLORERS_LEAGUE         = 44280,

    GOSSIP_TEXTID_MCGOYVER              = 12193
};

class npc_mcgoyver : public CreatureScript
{
public:
    npc_mcgoyver() : CreatureScript("npc_mcgoyver") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->GetQuestStatus(QUEST_WE_CAN_REBUILD_IT) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_MG_I, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_MG_II, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_MCGOYVER, creature->GetGUID());
                player->CastSpell(player, SPELL_CREATURE_DARK_IRON_INGOTS, true);
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->CastSpell(player, SPELL_TAXI_EXPLORERS_LEAGUE, true);
                player->CLOSE_GOSSIP_MENU();
                break;
        }
        return true;
    }
};

/*######
## npc_daegarn
######*/

enum eDaegarnn
{
    QUEST_DEFEAT_AT_RING            = 11300,

    NPC_FIRJUS                      = 24213,
    NPC_JLARBORN                    = 24215,
    NPC_YOROS                       = 24214,
    NPC_OLUF                        = 23931,

    NPC_PRISONER_1                  = 24253,  // looks the same but has different abilities
    NPC_PRISONER_2                  = 24254,
    NPC_PRISONER_3                  = 24255,
};

static float afSummon[] = {838.81f, -4678.06f, -94.182f};
static float afCenter[] = {801.88f, -4721.87f, -96.143f};

class npc_daegarn : public CreatureScript
{
public:
    npc_daegarn() : CreatureScript("npc_daegarn") { }

    bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest)
    {
        if (quest->GetQuestId() == QUEST_DEFEAT_AT_RING)
        {
            if (npc_daegarnAI* pDaegarnAI = CAST_AI(npc_daegarn::npc_daegarnAI, creature->AI()))
                pDaegarnAI->StartEvent(player->GetGUID());
        }

        return true;
    }

    // TODO: make prisoners help (unclear if summoned or using npc's from surrounding cages (summon inside small cages?))
    struct npc_daegarnAI : public ScriptedAI
    {
        npc_daegarnAI(Creature* creature) : ScriptedAI(creature) { }

        bool bEventInProgress;
        uint64 uiPlayerGUID;

        void Reset()
        {
            bEventInProgress = false;
            uiPlayerGUID = 0;
        }

        void StartEvent(uint64 uiGUID)
        {
            if (bEventInProgress)
                return;

            uiPlayerGUID = uiGUID;

            SummonGladiator(NPC_FIRJUS);
        }

        void JustSummoned(Creature* summon)
        {
            if (Player* player = me->GetPlayer(*me, uiPlayerGUID))
            {
                if (player->isAlive())
                {
                    summon->SetWalk(false);
                    summon->GetMotionMaster()->MovePoint(0, afCenter[0], afCenter[1], afCenter[2]);
                    summon->AI()->AttackStart(player);
                    return;
                }
            }

            Reset();
        }

        void SummonGladiator(uint32 uiEntry)
        {
            me->SummonCreature(uiEntry, afSummon[0], afSummon[1], afSummon[2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30*IN_MILLISECONDS);
        }

        void SummonedCreatureDies(Creature* summoned, Unit* /*killer*/)
        {
            uint32 uiEntry = 0;

            // will eventually reset the event if something goes wrong
            switch (summoned->GetEntry())
            {
                case NPC_FIRJUS:    uiEntry = NPC_JLARBORN; break;
                case NPC_JLARBORN:  uiEntry = NPC_YOROS;    break;
                case NPC_YOROS:     uiEntry = NPC_OLUF;     break;
                case NPC_OLUF:      Reset();                return;
            }

            SummonGladiator(uiEntry);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_daegarnAI(creature);
    }
};

enum ironRuneConstructData
{
    QUEST_IRON_RUNE_CONST_JUMP = 11485,
    QUEST_IRON_RUNE_CONST_DATA = 11489,
    QUEST_IRON_RUNE_CONST_BLUFF = 11491,

    NPC_IRON_RUNE_CONST_JUMP = 24823,
    NPC_IRON_RUNE_CONST_DATA = 24821,
    NPC_IRON_RUNE_CONST_BLUFF = 24825,

    SPELL_BLUFF = 44562,
};

class npc_iron_rune_construct : public CreatureScript
{
public:
    npc_iron_rune_construct() : CreatureScript("npc_iron_rune_construct") { }

    struct npc_iron_rune_constructAI : public ScriptedAI
    {
        npc_iron_rune_constructAI(Creature* creature) : ScriptedAI(creature) { }

        bool ocuppied;
        uint8 seatID;

        void UpdateAI(const uint32 /*diff*/)
        {
            Unit* player = me->GetVehicleKit()->GetPassenger(seatID);

            if (!player)
                me->DisappearAndDie();
        }

        void PassengerBoarded(Unit* passenger, int8 seatId, bool /*apply*/)
        {
            seatID = seatId;
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_iron_rune_constructAI(creature);
    }
};

class npc_lebronski : public CreatureScript
{
public:
    npc_lebronski() : CreatureScript("npc_lebronski") { }

    struct npc_lebronskiAI : public ScriptedAI
    {
        npc_lebronskiAI(Creature* creature) : ScriptedAI(creature) { }

        void SpellHit(Unit* caster, SpellInfo const* spell)
        {
            if(spell->Id == SPELL_BLUFF)
                caster->GetVehicleKit()->GetPassenger(0)->ToPlayer()->GroupEventHappens(QUEST_IRON_RUNE_CONST_BLUFF, me);
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_lebronskiAI(creature);
    }
};

class go_iron_rune_construct_workbank : public GameObjectScript
{
    public:
        go_iron_rune_construct_workbank() : GameObjectScript("go_iron_rune_construct_workbank") { }

        bool OnGossipHello(Player* player, GameObject* go)
        {
            if (player->GetQuestStatus(QUEST_IRON_RUNE_CONST_JUMP) == QUEST_STATUS_INCOMPLETE)
            {
                if(Creature* pConstruct = player->SummonCreature(NPC_IRON_RUNE_CONST_JUMP, player->GetPositionX(), player->GetPositionY(), player->GetPositionZ(), player->GetOrientation()))
                {
                    pConstruct->SetLevel(player->getLevel());
                    player->EnterVehicle(pConstruct);
                    player->GroupEventHappens(QUEST_IRON_RUNE_CONST_JUMP, pConstruct);
                }
                return true;
            }

            if (player->GetQuestStatus(QUEST_IRON_RUNE_CONST_DATA) == QUEST_STATUS_INCOMPLETE)
            {
                if(Creature* pConstruct = player->SummonCreature(NPC_IRON_RUNE_CONST_DATA, player->GetPositionX(), player->GetPositionY(), player->GetPositionZ(), player->GetOrientation()))
                {
                    pConstruct->SetLevel(player->getLevel());
                    player->EnterVehicle(pConstruct);
                }
                return true;
            }

            if (player->GetQuestStatus(QUEST_IRON_RUNE_CONST_BLUFF) == QUEST_STATUS_INCOMPLETE)
            {
                if(Creature* pConstruct = player->SummonCreature(NPC_IRON_RUNE_CONST_BLUFF, player->GetPositionX(), player->GetPositionY(), player->GetPositionZ(), player->GetOrientation()))
                {
                    pConstruct->SetLevel(player->getLevel());
                    player->EnterVehicle(pConstruct);
                }
                return true;
            }

            return true;
        }
};

enum ymironData
{
    QUEST_ECHO_YMIRON = 11343,
    NPC_ANCIENT_VRYKUL_M = 24314,
    NPC_ANCIENT_VRYKUL_F = 24315,
    NPC_LICHKING_HF = 24248,
    NPC_VALKYR = 24327,

    SAY_VRYKUL_1 = -1002011, // Male
    EMOTE_VRYKUL_1 = -1002012, // Male
    EMOTE_VRYKUL_2 = -1002013, // Female
    SAY_VRYKUL_2 = -1002014, // Male
    SAY_VRYKUL_3 = -1002015, // Female
    SAY_VRYKUL_4 = -1002016, // Male
    SAY_VRYKUL_5 = -1002017, // Female

    EMOTE_LK_1 = -1002018,
    EMOTE_LK_2 = -1002019,
    SAY_LK_1 = -1002020,
    SAY_LK_2 = -1002021, //Val'kyr
    SAY_LK_3 = -1002022,
    SAY_LK_4 = -1002023,
    SAY_LK_5 = -1002024,
    SAY_LK_6 = -1002025,

    SPELL_ECHO_YMIRON = 42786,
    SPELL_MAGNETIC_PULL = 29661,
    SPELL_LK_GRASP = 43489,
    SPELL_LK_WRATH = 43488,
};

class npc_ancient_vrykul : public CreatureScript
{
public:
    npc_ancient_vrykul() : CreatureScript("npc_ancient_vrykul") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_ancient_vrykulAI(creature);
    }
    struct npc_ancient_vrykulAI : public ScriptedAI
    {
        npc_ancient_vrykulAI(Creature* c) : ScriptedAI(c) { }

        EventMap events;
        Creature* pMale;
        uint64 uiPlayer;
        bool active;

        void Reset()
        {
            uiPlayer = 0;
            active = false;
            events.Reset();

            // Set both passive
            me->SetReactState(REACT_PASSIVE);

            if(Creature* male = me->FindNearestCreature(NPC_ANCIENT_VRYKUL_M, 5.0f))
            {
                male->SetReactState(REACT_PASSIVE);
                pMale = male;
            }
        }

        void SetGUID(const uint64 &uiGuid, int32 /*iId*/)
        {
            if (active)
                return;

            uiPlayer = uiGuid;
            events.ScheduleEvent(1, 2000);
            active = true;
        }

        void UpdateAI(const uint32 diff)
        {
            events.Update(diff);
            switch(events.ExecuteEvent())
            {
                case 1:
                    DoScriptText(SAY_VRYKUL_1, pMale);
                    events.ScheduleEvent(2, 2000);
                    break;
                case 2:
                    DoScriptText(EMOTE_VRYKUL_1, pMale);
                    events.ScheduleEvent(3, 1000);
                    break;
                case 3:
                    DoScriptText(EMOTE_VRYKUL_2, me);
                    events.ScheduleEvent(4, 2000);
                    break;
                case 4:
                    DoScriptText(SAY_VRYKUL_2, pMale);
                    events.ScheduleEvent(5, 3000);
                    break;
                case 5:
                    DoScriptText(SAY_VRYKUL_3, me);
                    events.ScheduleEvent(6,1000);
                    break;
                case 6:
                    DoScriptText(SAY_VRYKUL_4, pMale);
                    events.ScheduleEvent(7, 2500);
                    break;
                case 7:
                    DoScriptText(SAY_VRYKUL_5, me);
                    events.ScheduleEvent(8, 1000);
                    break;
                case 8:
                    if(Player* player = me->GetPlayer(*me, uiPlayer))
                        player->GroupEventHappens(QUEST_ECHO_YMIRON, me);
                    // Set long timer for reset, preventes restarting the event
                    events.ScheduleEvent(9,20000);
                    break;
                case 9:
                    Reset();
                    break;
            }
        }
    };
};

class at_ymiron_house : public AreaTriggerScript
{
    public:
        at_ymiron_house() : AreaTriggerScript("at_ymiron_house") {}

        bool OnTrigger(Player* player, AreaTriggerEntry const* /*trigger*/)
        {
            if(player->HasAura(SPELL_ECHO_YMIRON))
            {
                if(Creature * pVrykul = player->FindNearestCreature(NPC_ANCIENT_VRYKUL_F, 10.0f))
                    pVrykul->AI()->SetGUID(player->GetGUID());
            }
            return true;
        }
};

class npc_lich_king_hfjord : public CreatureScript
{
public:
    npc_lich_king_hfjord() : CreatureScript("npc_lich_king_hfjord") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_lich_king_hfjordAI(creature);
    }
    struct npc_lich_king_hfjordAI : public ScriptedAI
    {
        npc_lich_king_hfjordAI(Creature* c) : ScriptedAI(c) { }

        EventMap events;
        Player* player;
        bool active;

        void Reset()
        {
            player = NULL;
            active = false;
            events.Reset();

            me->SetReactState(REACT_PASSIVE);
            me->SetOrientation(3.29914f);
        }


        void UpdateAI(const uint32 diff)
        {
            if (!active)
            {
                if(Unit *pSelect = me->SelectNearestTarget(20.0f))
                {
                    if (pSelect->GetTypeId() == TYPEID_PLAYER)
                    {
                        player = pSelect->ToPlayer();
                        DoScriptText(EMOTE_LK_1, me);
                        me->CastSpell(player, SPELL_MAGNETIC_PULL, true);
                        me->CastSpell(player, SPELL_LK_GRASP, true);
                        active = true;
                        events.ScheduleEvent(1, 2000);
                     }
                }
            }

            events.Update(diff);
            switch(events.ExecuteEvent())
            {
                case 1:
                    DoScriptText(EMOTE_LK_2, me);
                    events.ScheduleEvent(2, 1000);
                    break;
                case 2:
                    DoScriptText(SAY_LK_1, me);
                    events.ScheduleEvent(3, 2500);
                    break;
                case 3:
                    if (Creature* pValkyr = me->FindNearestCreature(NPC_VALKYR, 5.0f))
                        DoScriptText(SAY_LK_2, pValkyr);
                    events.ScheduleEvent(4, 3000);
                    break;
                case 4:
                    DoScriptText(SAY_LK_3, me);
                    events.ScheduleEvent(5, 300);
                    break;
                case 5:
                    DoScriptText(SAY_LK_4, me);
                    events.ScheduleEvent(6,5500);
                    break;
                case 6:
                    DoScriptText(SAY_LK_5, me);
                    events.ScheduleEvent(7, 5500);
                    break;
                case 7:
                    DoScriptText(SAY_LK_6, me);
                    events.ScheduleEvent(8, 3000);
                    break;
                case 8:
                    if(player)
                        me->CastSpell(player, SPELL_LK_WRATH, true);
                    events.ScheduleEvent(9, 500);
                case 9:
                    if(player)
                        me->Kill(player);
                    // Set long timer for reset, preventes restarting the event
                    events.ScheduleEvent(10,20000);
                    break;
                case 10:
                    Reset();
                    break;
            }
        }
    };
};

enum q11429Data
{
    QUEST_DROP_IT_ROCK_IT = 11429,
    NPC_WINTERSKORN_DEFENDER = 24015,
};

class npc_banner_q11429 : public CreatureScript
{
public:
    npc_banner_q11429() : CreatureScript("npc_banner_q11429") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_banner_q11429AI(creature);
    }

    struct npc_banner_q11429AI : public ScriptedAI
    {
        npc_banner_q11429AI(Creature* c) : ScriptedAI(c) { }

        uint32 uiWaveTimer;
        uint8 killCounter;

        void Reset()
        {
            killCounter = 0;
            uiWaveTimer = 2000;
            me->SetReactState(REACT_PASSIVE);
            me->GetMotionMaster()->MoveIdle();
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Player* player = me->GetOwner()->ToPlayer())
                player->FailQuest(QUEST_DROP_IT_ROCK_IT);
        }

        void UpdateAI(const uint32 diff)
        {
            if(uiWaveTimer < diff)
            {
                if(Creature* pVrykul = me->SummonCreature(NPC_WINTERSKORN_DEFENDER, (1476.85f + rand()%20), (-5327.56f + rand()%20), (194.8f + rand()%2), 0.0f, TEMPSUMMON_CORPSE_DESPAWN))
                {
                    pVrykul->AI()->AttackStart(me);
                    pVrykul->GetMotionMaster()->Clear();
                    pVrykul->GetMotionMaster()->MoveChase(me);
                }
                uiWaveTimer = urand(8000, 16000);
            }
            else
                uiWaveTimer -= diff;
        }

        void SummonedCreatureDespawn(Creature* summon)
        {
            if (summon->GetEntry() == NPC_WINTERSKORN_DEFENDER)
                killCounter++;

            if(killCounter >= 3)
            {
                if (Player* player = me->GetOwner()->ToPlayer())
                    player->GroupEventHappens(QUEST_DROP_IT_ROCK_IT, me);

                me->DespawnOrUnsummon(2000);
            }
        }
    };
};

enum ghoulSpells
{
    SPELL_SHINING_LIGTH = 43202,
    SPELL_SHINING_LIGTH_HIT_VISUAL = 46400,
};

class npc_decomposing_ghoul : public CreatureScript
{
public:
    npc_decomposing_ghoul() : CreatureScript("npc_decomposing_ghoul") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_decomposing_ghoulAI(creature);
    }

    struct npc_decomposing_ghoulAI : public ScriptedAI
    {
        npc_decomposing_ghoulAI(Creature* c) : ScriptedAI(c) { }


        void EnterCombat(Unit * who)
        {
            if (who->HasAura(SPELL_SHINING_LIGTH))
            {
                DoCast(SPELL_SHINING_LIGTH_HIT_VISUAL);
                EnterEvadeMode();
            }
        }
    };
};

enum irulonData
{
    QUEST_GUIDED_BY_HONOR = 11289,
    NPC_TIRION = 24232,
    NPC_CLERIC = 24233,
    ITEM_ASHBRINGER = 13262,

    SAY_TIRION_1 = -1002000,
    EMOTE_TIRION_1 = -1002001,
    SAY_IRULON_1 = -1002002,
    SAY_TIRION_2 = -1002003,
    SAY_TIRION_3 = -1002004,
    SAY_IRULON_2 = -1002005,
    EMOTE_TIRION_2 = -1002006,
    SAY_TIRION_4 = -1002007,
    SAY_TIRION_5 = -1002008,
    EMOTE_TIRION_3 = -1002009,
    YELL_TIRION = -1002010,

    ACTION_START,
};

enum iluronEvents
{
    EVENT_NONE,
    EVENT_00,
    EVENT_01,
    EVENT_02,
    EVENT_03,
    EVENT_04,
    EVENT_05,
    EVENT_06,
    EVENT_07,
    EVENT_08,
    EVENT_09,
    EVENT_10,
};

class npc_irulon_trueblade : public CreatureScript
{
public:
    npc_irulon_trueblade() : CreatureScript("npc_irulon_trueblade") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_irulon_truebladeAI(creature);
    }

    bool OnGossipHello(Player* player, Creature* me)
    {
        if (me->isQuestGiver())
            player->PrepareQuestMenu(me->GetGUID());

        player->GroupEventHappens(QUEST_GUIDED_BY_HONOR, me);

        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, me->GetGUID());
        return true;
    }
    bool OnQuestReward(Player* /*player*/, Creature* me, Quest const* quest, uint32 /*item*/)
    {
        if (quest->GetQuestId() == QUEST_GUIDED_BY_HONOR)
            me->AI()->DoAction(ACTION_START);
        return true;
    }

    struct npc_irulon_truebladeAI : public ScriptedAI
    {
        npc_irulon_truebladeAI(Creature* c) : ScriptedAI(c) { }

        EventMap events;
        uint64 uiTirion;

        void Reset()
        {
            uiTirion = 0;
            events.Reset();
        }

        void DoAction(const int32 actionId)
        {
            switch(actionId)
            {
                case ACTION_START:
                    uiTirion = 0;
                    events.ScheduleEvent(EVENT_00, 1500);
                    break;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            events.Update(diff);
            switch(events.ExecuteEvent())
            {
                case EVENT_00:
                    me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                    me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

                    if(Creature* pTirion = me->FindNearestCreature(NPC_CLERIC, 7.0f))
                    {
                        uiTirion = pTirion->GetGUID();
                        DoScriptText(SAY_TIRION_1, pTirion);
                        pTirion->SetWalk(true);
                        pTirion->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STAND);
                        pTirion->GetMotionMaster()->MovePoint(0, me->GetPositionX() + 3.0f, me->GetPositionY() + 3.0f, me->GetPositionZ() + 0.5f);
                    }
                    events.ScheduleEvent(EVENT_01, 2000);
                    break;
                case EVENT_01:
                    if(Creature* pTirion = me->GetCreature(*me, uiTirion))
                    {
                        DoScriptText(EMOTE_TIRION_1, pTirion);
                        pTirion->UpdateEntry(NPC_TIRION);
                        pTirion->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID, 0);
                    }
                    events.ScheduleEvent(EVENT_02, 1000);
                    break;
                case EVENT_02:
                    DoScriptText(SAY_IRULON_1, me);
                    events.ScheduleEvent(EVENT_03, 2000);
                    break;
                case EVENT_03:
                    if(Creature* pTirion = me->GetCreature(*me, uiTirion))
                        DoScriptText(SAY_TIRION_2, pTirion);
                    events.ScheduleEvent(EVENT_04, 3000);
                    break;
                case EVENT_04:
                    if(Creature* pTirion = me->GetCreature(*me, uiTirion))
                        DoScriptText(SAY_TIRION_3, pTirion);
                    events.ScheduleEvent(EVENT_05,1000);
                    break;
                case EVENT_05:
                    DoScriptText(SAY_IRULON_2, me);
                    events.ScheduleEvent(EVENT_06, 2500);
                    break;
                case EVENT_06:
                    if(Creature* pTirion = me->GetCreature(*me, uiTirion))
                        DoScriptText(EMOTE_TIRION_2, pTirion);
                    events.ScheduleEvent(EVENT_07,1000);
                    break;
                case EVENT_07:
                    if(Creature* pTirion = me->GetCreature(*me, uiTirion))
                        DoScriptText(SAY_TIRION_4, pTirion);
                    events.ScheduleEvent(EVENT_08,1500);
                    break;
                case EVENT_08:
                    if(Creature* pTirion = me->GetCreature(*me, uiTirion))
                        DoScriptText(SAY_TIRION_5, pTirion);
                    events.ScheduleEvent(EVENT_09,1500);
                    break;
                case EVENT_09:
                    if(Creature* pTirion = me->GetCreature(*me, uiTirion))
                    {
                        DoScriptText(EMOTE_TIRION_3, pTirion);
                        pTirion->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID, ITEM_ASHBRINGER);
                    }
                    events.ScheduleEvent(EVENT_10,2000);
                    break;
                case EVENT_10:
                    if(Creature* pTirion = me->GetCreature(*me, uiTirion))
                    {
                        DoScriptText(YELL_TIRION, pTirion);
                        pTirion->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID, 0);
                        pTirion->DespawnOrUnsummon(5000);
                    }
                    me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                    me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
                    break;
            }
        }
    };
};

/*############
# Quest 11472
#############*/

enum AttractedReefBullData
{
    NPC_FEMALE_REEF_COW = 24797,
    SPELL_ANUNIAQS_NET = 21014,
    SPELL_TASTY_REEF_FISH = 44454,
    SPELL_LOVE_COSMETIC = 52148,
    ITEM_TASTY_REEF_FISH = 34127,
    QUEST_THE_WAY_TO_HIS_HEART = 11472
};

class npc_attracted_reef_bull : public CreatureScript
{
    public:

        npc_attracted_reef_bull() : CreatureScript("npc_attracted_reef_bull") {}

        struct npc_attracted_reef_bullAI : public ScriptedAI
        {
            npc_attracted_reef_bullAI(Creature* creature) : ScriptedAI(creature) {}

            uint64 playerGUID;
            uint8 point;

            void Reset()
            {
                playerGUID = 0;
                point = 0;
            }

            void UpdateAI(const uint32 diff) {}

            void SpellHit(Unit* caster, const SpellInfo* spell)
            {
                if (!caster->ToPlayer())
                    return;

                if (spell->Id == SPELL_TASTY_REEF_FISH)
                {
                    if (playerGUID == 0)
                        playerGUID = caster->GetGUID();

                    me->GetMotionMaster()->MovePoint(point, caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ());
                    ++point;
                }

                if (Creature* female = me->FindNearestCreature(NPC_FEMALE_REEF_COW, 5.0f, true))
                {
                    if (Player* player = me->GetPlayer(*me, playerGUID))
                    {
                        DoCast(me, SPELL_LOVE_COSMETIC);
                        female->AI()->DoCast(female, SPELL_LOVE_COSMETIC);
                        player->GroupEventHappens(QUEST_THE_WAY_TO_HIS_HEART, me);
                        me->DespawnOrUnsummon(5000);
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_attracted_reef_bullAI(creature);
        }
};

class spell_anuniaqs_net : public SpellScriptLoader
{
public:
    spell_anuniaqs_net() : SpellScriptLoader("spell_anuniaqs_net") {}

    class spell_anuniaqs_net_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_anuniaqs_net_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/)
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_ANUNIAQS_NET))
                return false;         
            return true;
        }

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
                if (caster->ToPlayer())
                    caster->ToPlayer()->AddItem(ITEM_TASTY_REEF_FISH, urand(1,5));
        }

        void Register()
        {
            OnEffectHit += SpellEffectFn(spell_anuniaqs_net_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_anuniaqs_net_SpellScript();
    }
};

void AddSC_howling_fjord()
{
    new npc_apothecary_hanes();
    new npc_plaguehound_tracker();
    new npc_razael_and_lyana();
    new npc_mcgoyver();
    new npc_daegarn();
    new npc_iron_rune_construct();
    new npc_lebronski();
    new go_iron_rune_construct_workbank();
    new npc_ancient_vrykul();
    new at_ymiron_house();
    new npc_lich_king_hfjord();
    new npc_banner_q11429();
    new npc_decomposing_ghoul();
    new npc_irulon_trueblade();
    new npc_attracted_reef_bull();
    new spell_anuniaqs_net();
 }
