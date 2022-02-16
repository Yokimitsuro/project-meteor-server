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
using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace Meteor.Map.Actors
{
    class Quest : Actor
    {
        public const ushort SEQ_NOT_STARTED = 65535;
        public const ushort SEQ_COMPLETED = 65534;

        private struct QuestData
        {
            public UInt32 flags;
            public UInt16 counter1;
            public UInt16 counter2;
            public UInt16 counter3;
            public UInt16 counter4;

            public QuestData(uint flags, ushort counter1, ushort counter2, ushort counter3) : this()
            {
                this.flags = flags;
                this.counter1 = counter1;
                this.counter2 = counter2;
                this.counter3 = counter3;
            }
        }

        // This is only set on instance quests (non static)
        private Player Owner;
        private ushort currentSequence;
        private QuestState QuestState;
        private QuestData Data;
        private bool dataDirty = false;

        public void SetENpc(uint classId, byte flagType = 0, bool isTalkEnabled = true, bool isPushEnabled = false, bool isEmoteEnabled = false, bool isSpawned = false)
        {
            if (QuestState != null)
                QuestState.AddENpc(classId, flagType, isTalkEnabled, isPushEnabled, isEmoteEnabled, isSpawned);
        }

        public void UpdateENPCs()
        {
            if (dataDirty)
            {
                if (QuestState != null)
                    QuestState.UpdateState();
                dataDirty = false;
            }
        }

        public QuestState GetQuestState()
        {
            return QuestState;
        }

        public bool IsInstance()
        {
            return Owner != null;
        }

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

        public bool IsQuestENPC(Player caller, Npc npc)
        {
            List<LuaParam> returned = LuaEngine.GetInstance().CallLuaFunctionForReturn(caller, this, "IsQuestENPC", true, npc, this);
            bool scriptReturned = returned != null && returned.Count != 0 && returned[0].typeID == 3;
            return scriptReturned || QuestState.HasENpc(npc.GetActorClassId());
        }


        public object[] GetJournalInformation()
        {
            List<LuaParam> returned = LuaEngine.GetInstance().CallLuaFunctionForReturn(Owner, this, "getJournalInformation", true);
            if (returned != null && returned.Count != 0)
                return LuaUtils.CreateLuaParamObjectList(returned);
            else
                return new object[0];
        }

        public object[] GetJournalMapMarkerList()
        {
            List<LuaParam> returned = LuaEngine.GetInstance().CallLuaFunctionForReturn(Owner, this, "getJournalMapMarkerList", true);
            if (returned != null && returned.Count != 0)
                return LuaUtils.CreateLuaParamObjectList(returned);
            else
                return new object[0];
        }

        public ushort GetSequence()
        {
            return currentSequence;
        }

        public void StartSequence(ushort sequence)
        {            
            if (sequence == SEQ_NOT_STARTED)
                return;

            // Send the message that the journal has been updated
            if (currentSequence != SEQ_NOT_STARTED)
                Owner.SendGameMessage(Server.GetWorldManager().GetActor(), 25116, 0x20, (object)GetQuestId());

            currentSequence = sequence;
            dataDirty = true;
            UpdateENPCs();
        }

        public void ClearData()
        {
            Data.flags = Data.counter1 = Data.counter2 = Data.counter3 = Data.counter4 = 0;
        }

        public void SetFlag(int index)
        {
            if (index >= 0 && index < 32)
            {
                Data.flags |= (uint)(1 << index);
                dataDirty = true;
            }
        }

        public void ClearFlag(int index)
        {
            if (index >= 0 && index < 32)
            {
                Data.flags &= (uint)~(1 << index);
                dataDirty = true;
            }
        }

        public void IncCounter(int num)
        {
            dataDirty = true;

            switch (num)
            {
                case 0:
                    Data.counter1++;
                    return;
                case 1:
                    Data.counter2++;
                    return;
                case 2:
                    Data.counter3++;
                    return;
                case 3:
                    Data.counter4++;
                    return;
            }

            dataDirty = false;
        }

        public void DecCounter(int num)
        {
            dataDirty = true;

            switch (num)
            {
                case 0:
                    Data.counter1--;
                    return;
                case 1:
                    Data.counter2--;
                    return;
                case 2:
                    Data.counter3--;
                    return;
                case 3:
                    Data.counter4--;
                    return;
            }

            dataDirty = false;
        }

        public void SetCounter(int num, ushort value)
        {
            dataDirty = true;

            switch (num)
            {
                case 0:
                    Data.counter1 = value;
                    return;
                case 1:
                    Data.counter2 = value;
                    return;
                case 2:
                    Data.counter3 = value;
                    return;
                case 3:
                    Data.counter4 = value;
                    return;
            }

            dataDirty = false;
        }

        public bool GetFlag(int index)
        {
            if (index >= 0 && index < 32)
                return (Data.flags & (uint) (1 << index)) != 0;
            return false;
        }

        public uint GetFlags()
        {
            return Data.flags;
        }

        public ushort GetCounter(int num)
        {
            switch (num)
            {
                case 0:
                    return Data.counter1;
                case 1:
                    return Data.counter2;
                case 2:
                    return Data.counter3;
                case 3:
                    return Data.counter4;
            }

            return 0;
        }

        public void SaveData()
        {            
            Database.SaveQuest(Owner, this);
        }

        public Quest(uint actorID, string name)
            : base(actorID)
        {
            Name = name;            
        }

        public Quest(Player owner, Quest baseQuest): this(owner, baseQuest, SEQ_NOT_STARTED, 0, 0, 0, 0)
        {}

        public Quest(Player owner, Quest baseQuest, ushort sequence, uint flags, ushort counter1, ushort counter2, ushort counter3)
            : base(baseQuest.Id)
        {
            Owner = owner;
            Name = baseQuest.Name;
            className = baseQuest.className;
            classPath = baseQuest.classPath;
            currentSequence = sequence;
            QuestState = new QuestState(owner, this);
            Data = new QuestData(flags, counter1, counter2, counter3);
        }
       
        public uint GetQuestId()
        {
            return Id & 0xFFFFF;
        }

        public void DoAccept()
        {
            if (currentSequence == SEQ_NOT_STARTED)
                LuaEngine.GetInstance().CallLuaFunction(Owner, this, "onStart", false);
            else
                StartSequence(currentSequence);
        }

        public void DoComplete()
        {
            LuaEngine.GetInstance().CallLuaFunctionForReturn(Owner, this, "onFinish", true);
            Owner.SendDataPacket("attention", Server.GetWorldManager().GetActor(), "", 25225, (object)GetQuestId());
            Owner.SendGameMessage(Server.GetWorldManager().GetActor(), 25225, 0x20, (object)GetQuestId());
            currentSequence = SEQ_COMPLETED;
        }

        public void DoAbandon()
        {
            LuaEngine.GetInstance().CallLuaFunctionForReturn(Owner, this, "onFinish", false);
            Owner.SendGameMessage(Owner, Server.GetWorldManager().GetActor(), 25236, 0x20, (object)GetQuestId());
            currentSequence = SEQ_NOT_STARTED;
        }

        public override bool Equals(object obj)
        {
            if (obj is Quest quest)
                return quest.Id == this.Id;
            return false;
        }
    }
}
