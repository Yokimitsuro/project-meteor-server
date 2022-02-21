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
using System;
using System.Collections.Generic;

namespace Meteor.Map.Actors.QuestNS
{
    class Quest : Actor
    {
        public const ushort SEQ_NOT_STARTED = 65535;
        public const ushort SEQ_COMPLETED = 65534;

        private Player owner;
        private ushort currentSequence;
        private QuestState questState = null;
        private QuestData data = null;

        // Creates a Static Quest for the StaticActors list.
        public Quest(uint actorID, string className, string classPath)
            : base(actorID)
        {
            Name = className;
            this.className = className;
            this.classPath = classPath;
        }

        // Creates a Static Quest from another Static Quest
        public Quest(Quest staticQuest)
            : this(staticQuest.Id, staticQuest.Name, staticQuest.classPath)
        { }

        // Creates a Instance Quest that has been started.
        public Quest(Player owner, Quest staticQuest, ushort sequence) : this(staticQuest)
        {
            this.owner = owner;
            currentSequence = sequence;
            questState = new QuestState(owner, this);
            questState.UpdateState();
        }

        // Creates a Instance Quest that has not been started.
        public Quest(Player owner, Quest staticQuest) : this(owner, staticQuest, SEQ_NOT_STARTED)
        { }

        #region Getters
        public uint GetQuestId()
        {
            return Id & 0xFFFFF;
        }

        public override bool Equals(object obj)
        {
            if (obj != null && obj is Quest quest)
                return quest.Id == this.Id;
            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public bool IsInstance()
        {
            return questState != null;
        }

        public bool IsMainScenario()
        {
            uint id = GetQuestId();
            return id >= 110001 && id <= 110021;
        }

        public ushort GetSequence()
        {
            return currentSequence;
        }
        #endregion

        #region Quest Data
        public void SetData(uint flags, ushort counter1, ushort counter2, ushort counter3, ushort counter4)
        {
            data = new QuestData(owner, this, flags, counter1, counter2, counter3, counter4);
        }

        public QuestData GetData()
        {
            return data;
        }

        public bool HasData()
        {
            return data != null;
        }
        #endregion

        #region Quest State
        public void SetENpc(uint classId, byte flagType = 0, bool isTalkEnabled = true, bool isPushEnabled = false, bool isEmoteEnabled = false, bool isSpawned = false)
        {
            if (questState != null)
                questState.AddENpc(classId, flagType, isTalkEnabled, isPushEnabled, isEmoteEnabled, isSpawned);
        }

        public void UpdateENPCs()
        {
            if (data != null && data.Dirty)
            {
                if (questState != null)
                    questState.UpdateState();
                data.ClearDirty();
            }
        }

        public QuestState GetQuestState()
        {
            return questState;
        }
        #endregion

        #region Script Callbacks
        public void OnTalk(Player caller, Npc npc)
        {
            LuaEngine.GetInstance().CallLuaFunction(caller, this, "onTalk", true, npc);
        }

        public void OnEmote(Player caller, Npc npc, Command command)
        {
            LuaEngine.GetInstance().CallLuaFunction(caller, this, "onEmote", true, npc, command);
        }

        public void OnPush(Player caller, Npc npc)
        {
            LuaEngine.GetInstance().CallLuaFunction(caller, this, "onPush", true, npc);
        }

        public void OnNotice(Player caller)
        {
            LuaEngine.GetInstance().CallLuaFunction(caller, this, "onNotice", true);
        }

        public void OnNpcLS(Player caller, uint npcLSId)
        {
            LuaEngine.GetInstance().CallLuaFunction(caller, this, "onNpcLS", true, npcLSId);
        }

        public object[] GetJournalInformation()
        {
            List<LuaParam> returned = LuaEngine.GetInstance().CallLuaFunctionForReturn(owner, this, "getJournalInformation", true);
            if (returned != null && returned.Count != 0)
                return LuaUtils.CreateLuaParamObjectList(returned);
            else
                return new object[0];
        }

        public object[] GetJournalMapMarkerList()
        {
            List<LuaParam> returned = LuaEngine.GetInstance().CallLuaFunctionForReturn(owner, this, "getJournalMapMarkerList", true);
            if (returned != null && returned.Count != 0)
                return LuaUtils.CreateLuaParamObjectList(returned);
            else
                return new object[0];
        }
        #endregion

        public bool IsQuestENPC(Player caller, Npc npc)
        {
            List<LuaParam> returned = LuaEngine.GetInstance().CallLuaFunctionForReturn(caller, this, "IsQuestENPC", true, npc, this);
            bool scriptReturned = returned != null && returned.Count != 0 && returned[0].typeID == 3;
            return scriptReturned || (questState?.HasENpc(npc.GetActorClassId()) ?? false);
        }

        public void StartSequence(ushort sequence)
        {
            if (sequence == SEQ_NOT_STARTED)
                return;

            // Send the message that the journal has been updated
            if (currentSequence != SEQ_NOT_STARTED)
                owner.SendGameMessage(Server.GetWorldManager().GetActor(), 25116, 0x20, (object)GetQuestId());

            currentSequence = sequence;            
            questState.UpdateState();
        }

        public void OnAccept()
        {
            data = new QuestData(owner, this);
            if (currentSequence == SEQ_NOT_STARTED)
                LuaEngine.GetInstance().CallLuaFunction(owner, this, "onStart", false);
            else
                StartSequence(currentSequence);
        }

        public void OnComplete()
        {
            LuaEngine.GetInstance().CallLuaFunctionForReturn(owner, this, "onFinish", true);
            currentSequence = SEQ_COMPLETED;
            data = null;
            questState.UpdateState();
        }

        public void OnAbandon()
        {
            LuaEngine.GetInstance().CallLuaFunctionForReturn(owner, this, "onFinish", false);
            currentSequence = SEQ_NOT_STARTED;
            data = null;
            questState.UpdateState();
        }

    }
}
