#include "ScriptPCH.h"
#include "Channel.h"
 
class System_Censure : public PlayerScript
{
public:
        System_Censure() : PlayerScript("System_Censure") {}
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg)
        {
                CheckMessage(player, msg, lang, NULL, NULL, NULL, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Player* receiver)
        {
                CheckMessage(player, msg, lang, receiver, NULL, NULL, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Group* group)
        {
                CheckMessage(player, msg, lang, NULL, group, NULL, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Guild* guild)
        {
                CheckMessage(player, msg, lang, NULL, NULL, guild, NULL);
        }
 
        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Channel* channel)
        {
                CheckMessage(player, msg, lang, NULL, NULL, NULL, channel);
        }
 
void CheckMessage(Player* player, std::string& msg, uint32 lang, Player* /*receiver*/, Group* /*group*/, Guild* /*guild*/, Channel* channel)
{
    //if (player->isGameMaster() || lang == LANG_ADDON)
            //return;
 
    // transform to lowercase (for simpler checking)
    std::string lower = msg;
    std::transform(lower.begin(), lower.end(), lower.begin(), ::tolower);
 
    uint8 cheksSize = 27;
    std::string checks[27];
    checks[0] ="http://";
    checks[1] =".com";
    checks[2] =".www";
    checks[3] =".net";
    checks[4] =".org";
    checks[5] =".ru";
    checks[6] ="www.";
    checks[7] ="wow-";
    checks[8] ="-wow";
    checks[9] ="rondor";
    checks[10] ="no-ip";
    checks[11] =".zapto";
    checks[12] ="wow-cool";
    checks[13] ="elgracia";
    checks[14] ="spzone";
    checks[15] ="fakewow";
    checks[16] ="deathside";
    checks[17] ="warsong";
    checks[18] ="RiverRise";
    checks[19] ="air-world";
    checks[20] =".lt";
    checks[21] ="sirus";
    checks[22] ="backkor";
    checks[23] ="isengard";
    checks[24] ="wowcircle";
    checks[25] ="izbooshka";
    checks[26] ="magic";
    for (int i = 0; i < cheksSize; ++i)
        if (lower.find(checks[i]) != std::string::npos)
        {
            msg = "";
            ChatHandler(player).PSendSysMessage("Реклама запрещена!");         
            return;
        }
} 
};
 
void AddSC_System_Censure()
{
    new System_Censure();
}