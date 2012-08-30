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
SDName: Thunder_Bluff
SD%Complete: 100
SDComment: Quest support: 925
SDCategory: Thunder Bluff
EndScriptData */

#include "ScriptPCH.h"

/*#####
# boss_cairne_bloodhoof
######*/

enum Cairne
{
    SPELL_CLEAVE        = 15284,
    SPELL_MORTAL_STRIKE = 16856,
    SPELL_THUNDERCLAP   = 23931,
    SPELL_UPPERCUT      = 22916,
    SPELL_WARSTOMP      = 59705,

    SAY_AGGRO           = 1
};

#define GOSSIP_HCB "I know this is rather silly but a young ward who is a bit shy would like your hoofprint."

class boss_cairne_bloodhoof : public CreatureScript
{
public:
    boss_cairne_bloodhoof() : CreatureScript("boss_cairne_bloodhoof") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_SENDER_INFO)
        {
            player->CastSpell(player, 23123, false);
            player->SEND_GOSSIP_MENU(7014, creature->GetGUID());
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(925) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HCB, GOSSIP_SENDER_MAIN, GOSSIP_SENDER_INFO);

        player->SEND_GOSSIP_MENU(7013, creature->GetGUID());

        return true;
    }

    struct boss_cairne_bloodhoofAI : public ScriptedAI
    {
        boss_cairne_bloodhoofAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            _warstompTimer = urand(15, 20) *IN_MILLISECONDS;
            _cleaveTimer = urand(5, 7) *IN_MILLISECONDS;
            _mortalstrikeTimer = urand(10, 12) *IN_MILLISECONDS;
            _thunderclapTimer = urand(13, 15) *IN_MILLISECONDS;
            _uppercutTimer = urand(8, 10) *IN_MILLISECONDS;
        }

        void EnterCombat(Unit* /*who*/) 
        {
            Talk(SAY_AGGRO);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (_warstompTimer <= diff)
            {
                Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0);
                if (target)
                    DoCast(target, SPELL_WARSTOMP);
                _warstompTimer = urand(25, 30) *IN_MILLISECONDS;
            } 
            else
                _warstompTimer -= diff;

            if (_uppercutTimer <= diff)
            {
                DoCastVictim(SPELL_UPPERCUT);
                _uppercutTimer = urand(10, 12) *IN_MILLISECONDS;;
            } 
            else
                _uppercutTimer -= diff;

            if (_thunderclapTimer <= diff)
            {
                DoCast(SPELL_THUNDERCLAP);
                _thunderclapTimer = urand(13, 15) *IN_MILLISECONDS;
            } 
            else 
                _thunderclapTimer -= diff;

            if (_mortalstrikeTimer <= diff)
            {
                DoCastVictim(SPELL_MORTAL_STRIKE);
                _mortalstrikeTimer = urand(12, 14) *IN_MILLISECONDS;
            } 
            else
                _mortalstrikeTimer -= diff;

            if (_cleaveTimer <= diff)
            {
                DoCastVictim(SPELL_CLEAVE);
                _cleaveTimer = urand (5, 7) *IN_MILLISECONDS;
            } 
            else
                _cleaveTimer -= diff;

            DoMeleeAttackIfReady();
        }

    private:
        uint32 _warstompTimer;
        uint32 _cleaveTimer;
        uint32 _mortalstrikeTimer;
        uint32 _thunderclapTimer;
        uint32 _uppercutTimer;

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_cairne_bloodhoofAI (creature);
    }

};

void AddSC_thunder_bluff()
{
    new boss_cairne_bloodhoof();
}
