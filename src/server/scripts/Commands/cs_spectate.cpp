#include "ScriptMgr.h"
#include "Chat.h"
#include "SocialMgr.h"

class spectator_commandscript : public CommandScript
{
public:
    spectator_commandscript() : CommandScript("spectator_commandscript") { }

    ChatCommand* GetCommands() const
    {
        static ChatCommand commandTable[] =
        {
            { "spectate",       SEC_PLAYER,         false, &HandleSpectateCommand,  "", NULL },
            { NULL,             0,                  false, NULL,                    "", NULL }
        };
        return commandTable;
    }

    static bool HandleSpectateCommand(ChatHandler* handler, const char* args)
    {
        if (!sWorld->getBoolConfig(CONFIG_ARENA_SPECTATORS_ENABLE))
        {
            handler->SendSysMessage(LANG_SPECTATOR_DISABLED);
            handler->SetSentErrorMessage(true);
            return false;
        }

        Player* target;
        uint64 target_gu;
        std::string target_na;

        if (!handler->extractPlayerTarget((char*)args, &target, &target_gu, &target_na))
            return false;

        Player* _player = handler->GetSession()->GetPlayer();
        if (target == _player || target_gu == _player->GetGUID())
        {
            handler->SendSysMessage(LANG_CANT_TELEPORT_SELF);
            handler->SetSentErrorMessage(true);
            return false;
        }

        if (_player->IsArenaSpectator())
        {
            handler->SendSysMessage(LANG_SPECTATOR_ALREADY_SPECTATOR);
            handler->SetSentErrorMessage(true);
            return false;
        }

        if (_player->GetMap()->IsBattlegroundOrArena())
        {
            handler->SendSysMessage(LANG_SPECTATOR_ON_ARENA_OR_BG);
            handler->SetSentErrorMessage(true);
            return false;
        }

        if (target)
        {
            std::string chrNameLink = handler->playerLink(target_na);

            if (!target->InArena())
            {
                handler->PSendSysMessage(LANG_SPECTATOR_NOT_ON_ARENA, chrNameLink.c_str());
                handler->SetSentErrorMessage(true);
                return false;
            }

            if (sWorld->getBoolConfig(CONFIG_ARENA_SPECTATORS_ONLY_FRIEND))
            {
                if (!target->GetSocial()->HasFriend(_player->GetGUIDLow()))
                {
                    handler->PSendSysMessage(LANG_SPECTATOR_FORBID, chrNameLink.c_str());
                    handler->SetSentErrorMessage(true);
                    return false;
                }
            }

            if (_player->isInFlight())
            {
                handler->SendSysMessage(LANG_YOU_IN_FLIGHT);
                handler->SetSentErrorMessage(true);
                return false;
            }

            else
                _player->SaveRecallPosition();

            _player->SetBattlegroundId(target->GetBattlegroundId(), target->GetBattlegroundTypeId());
            _player->SetBattlegroundEntryPoint();

            handler->PSendSysMessage(LANG_APPEARING_AT, chrNameLink.c_str());

            float x, y, z;
            target->GetContactPoint(_player, x, y, z);

            _player->TeleportTo(target->GetMapId(), x, y, z, _player->GetAngle(target));
            _player->SetArenaSpectator(true);
            _player->SetPhaseMask(target->GetPhaseMask(), true);
        }
        return true;
    }
};

void AddSC_spectator_commandscript()
{
    new spectator_commandscript();
}
