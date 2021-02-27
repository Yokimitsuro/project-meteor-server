/*
===========================================================================
Copyright (C) 2015-2019 Project Meteor Dev Team

This file is part of Project Meteor Server.

Project Meteor Server is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Project Meteor Server is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with Project Meteor Server. If not, see <https:www.gnu.org/licenses/>.
===========================================================================
*/

using Meteor.Map.lua;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace Meteor.Map.Actors
{
    class Quest : Actor
    {
        protected Player owner;

        public Quest(uint actorID, string name)
            : base(actorID)
        {
            actorName = name;
        }

        public Quest(Quest staticQuest, Player owner) : base(staticQuest.actorId)
        {
            this.owner = owner;
            actorName = staticQuest.actorName;
        }

        public uint GetQuestId()
        {
            return actorId & 0xFFFFF;
        }

        public virtual void SaveData() { }
        public virtual string GetSerializedQuestData() { return null; }

        public void DoCompletionCheck()
        {
            List<LuaParam> returned = LuaEngine.GetInstance().CallLuaFunctionForReturn(owner, this, "isObjectivesComplete", true);
            if (returned != null && returned.Count >= 1 && returned[0].typeID == 3)
            {
                owner.SendDataPacket("attention", Server.GetWorldManager().GetActor(), "", 25225, (object)GetQuestId());
                owner.SendGameMessage(Server.GetWorldManager().GetActor(), 25225, 0x20, (object)GetQuestId());	
            }
        }

        public void DoAbandon()
        {
            LuaEngine.GetInstance().CallLuaFunctionForReturn(owner, this, "onAbandonQuest", true);
            owner.SendGameMessage(owner, Server.GetWorldManager().GetActor(), 25236, 0x20, (object)GetQuestId());
        }

        public static Quest LoadQuestDB(Player player, MySqlDataReader reader)
        {
            uint questID = 0xA0F00000 | reader.GetUInt32("questId");
            Quest staticQuest = Server.GetStaticActors(questID) as Quest;
            string questData = null;

            if (!reader.IsDBNull(reader.GetOrdinal("questData")))
                questData = reader.GetString("questData");
            else
                questData = "{}";

            if (staticQuest.IsScenario())
            {
                uint questFlags = 0;
                uint currentPhase = 0;

                if (!reader.IsDBNull(reader.GetOrdinal("questFlags")))
                    questFlags = reader.GetUInt32("questFlags");

                if (!reader.IsDBNull(reader.GetOrdinal("currentPhase")))
                    currentPhase = reader.GetUInt32("currentPhase");

                return new Scenario(staticQuest, player, questData, questFlags, currentPhase);
            }
            else if (staticQuest.IsCraftPassiveGuildleve())
            {
                return new PassiveGuildleve(staticQuest, player, questData);
            }
            throw new NotImplementedException("Unknown quest type added");
        }

        public bool IsScenario()
        {
            return !IsCraftPassiveGuildleve();
        }

        public bool IsCraftPassiveGuildleve()
        {
            return GetQuestId() > 120000 && GetQuestId() < 121024;
        }
    }
}
