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
        public const ushort SEQ_NOT_STARTED = ushort.MaxValue;

        public enum QuestFlag { None = 0, Map = 1, Plate = 2 }
        public enum ENpcProperty { QuestFlag = 0, CanTalk = 1, CanPush = 2,  CanEmote = 3, CanNotice = 4}

        public class ENpcQuestInstance
        {
            public readonly uint actorClassId;
            public byte questFlagType { set; get; }
            public bool isSpawned { set; get; }
            public bool isTalkEnabled { set; get; }
            public bool isEmoteEnabled { set; get; }
            public bool isPushEnabled { set; get; }

            public ENpcQuestInstance(uint actorClassId, byte questFlagType, bool isSpawned, bool isTalkEnabled, bool isEmoteEnabled, bool isPushEnabled)
            {
                this.actorClassId = actorClassId;
                this.questFlagType = questFlagType;
                this.isSpawned = isSpawned;
                this.isTalkEnabled = isTalkEnabled;
                this.isEmoteEnabled = isEmoteEnabled;
                this.isPushEnabled = isPushEnabled;
            }

            public bool IsChanged(byte flagType, bool isTalkEnabled, bool isPushEnabled, bool isEmoteEnabled, bool isSpawned)
            {
                return flagType != this.questFlagType
                    || isTalkEnabled != this.isTalkEnabled
                    || isPushEnabled != this.isPushEnabled
                    || isEmoteEnabled != this.isEmoteEnabled
                    || isSpawned != this.isSpawned;
            }

            public void Update(byte flagType, bool isTalkEnabled, bool isPushEnabled, bool isEmoteEnabled, bool isSpawned)
            {
                this.questFlagType = flagType;
                this.isSpawned = isSpawned;
                this.isTalkEnabled = isTalkEnabled;
                this.isEmoteEnabled = isEmoteEnabled;
                this.isPushEnabled = isPushEnabled;
            }
        }

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

        private Player Owner;
        private ushort currentSequence;
        private QuestData data = new QuestData();
        private bool dataDirty = false;
        private Dictionary<uint, ENpcQuestInstance> CurrentENPCs = new Dictionary<uint, ENpcQuestInstance>();
        private Dictionary<uint, ENpcQuestInstance> OldENPCs = new Dictionary<uint, ENpcQuestInstance>();

        public void AddENpc(uint classId, byte flagType = 0, bool isTalkEnabled = true, bool isPushEnabled = false, bool isEmoteEnabled = false, bool isSpawned = false)
        {
            ENpcQuestInstance instanceUpdated = null; 

            if (OldENPCs.ContainsKey(classId))
            {
                if (OldENPCs[classId].IsChanged(flagType, isTalkEnabled, isPushEnabled, isEmoteEnabled, isSpawned))
                {
                    OldENPCs[classId].Update(flagType, isTalkEnabled, isPushEnabled, isEmoteEnabled, isSpawned);
                    instanceUpdated = OldENPCs[classId];
                }

                CurrentENPCs.Add(classId, OldENPCs[classId]);
                OldENPCs.Remove(classId);
            }
            else
            {
                instanceUpdated = new ENpcQuestInstance(classId, flagType, isSpawned, isTalkEnabled, isEmoteEnabled, isPushEnabled);
                CurrentENPCs.Add(classId, instanceUpdated);
            }

            if (instanceUpdated != null)
                Owner.playerSession.UpdateQuestNpcInInstance(instanceUpdated);
        }
        
        public ENpcQuestInstance GetENpcInstance(uint classId)
        {
            if (CurrentENPCs.ContainsKey(classId))
                return CurrentENPCs[classId];
            return null;
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

        public void UpdateENPCs()
        {
            if (dataDirty)
            {
                OldENPCs = CurrentENPCs;
                CurrentENPCs = new Dictionary<uint, ENpcQuestInstance>();
                LuaEngine.GetInstance().CallLuaFunctionForReturn(Owner, this, "onSequence", false, currentSequence);
                foreach (var enpc in OldENPCs)
                    Owner.playerSession.UpdateQuestNpcInInstance(enpc.Value);
                OldENPCs = null;
                dataDirty = false;
            }
        }

        public bool IsQuestENPC(Player caller, Npc npc)
        {
            List<LuaParam> returned = LuaEngine.GetInstance().CallLuaFunctionForReturn(caller, this, "IsQuestENPC", true, npc, this);
            bool scriptReturned = returned != null && returned.Count != 0 && returned[0].typeID == 3;
            return scriptReturned || CurrentENPCs.ContainsKey(npc.GetActorClassId());
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
            data.flags = data.counter1 = data.counter2 = data.counter3 = data.counter4 = 0;
        }

        public void SetFlag(int index)
        {
            if (index >= 0 && index < 32)
            {
                data.flags |= (uint)(1 << index);
                dataDirty = true;
            }
        }

        public void ClearFlag(int index)
        {
            if (index >= 0 && index < 32)
            {
                data.flags &= (uint)~(1 << index);
                dataDirty = true;
            }
        }

        public void IncCounter(int num)
        {
            dataDirty = true;

            switch (num)
            {
                case 0:
                    data.counter1++;
                    return;
                case 1:
                    data.counter2++;
                    return;
                case 2:
                    data.counter3++;
                    return;
                case 3:
                    data.counter4++;
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
                    data.counter1--;
                    return;
                case 1:
                    data.counter2--;
                    return;
                case 2:
                    data.counter3--;
                    return;
                case 3:
                    data.counter4--;
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
                    data.counter1 = value;
                    return;
                case 1:
                    data.counter2 = value;
                    return;
                case 2:
                    data.counter3 = value;
                    return;
                case 3:
                    data.counter4 = value;
                    return;
            }

            dataDirty = false;
        }

        public bool GetFlag(int index)
        {
            if (index >= 0 && index < 32)
                return (data.flags & (uint) (1 << index)) != 0;
            return false;
        }

        public uint GetFlags()
        {
            return data.flags;
        }

        public ushort GetCounter(int num)
        {
            switch (num)
            {
                case 0:
                    return data.counter1;
                case 1:
                    return data.counter2;
                case 2:
                    return data.counter3;
                case 3:
                    return data.counter4;
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
            data = new QuestData(flags, counter1, counter2, counter3);

            if (currentSequence == SEQ_NOT_STARTED)
                LuaEngine.GetInstance().CallLuaFunction(Owner, this, "onStart", false);
            else
                StartSequence(currentSequence);
        }
       
        public uint GetQuestId()
        {
            return Id & 0xFFFFF;
        }

        public void DoComplete()
        {
            LuaEngine.GetInstance().CallLuaFunctionForReturn(Owner, this, "onFinish", true);
            Owner.SendDataPacket("attention", Server.GetWorldManager().GetActor(), "", 25225, (object)GetQuestId());
            Owner.SendGameMessage(Server.GetWorldManager().GetActor(), 25225, 0x20, (object)GetQuestId());
        }

        public void DoAbandon()
        {
            LuaEngine.GetInstance().CallLuaFunctionForReturn(Owner, this, "onFinish", false);
            Owner.SendGameMessage(Owner, Server.GetWorldManager().GetActor(), 25236, 0x20, (object)GetQuestId());
        }
    }
}
