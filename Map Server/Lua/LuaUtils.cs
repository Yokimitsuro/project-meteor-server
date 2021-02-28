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

using Meteor.Common;
using Meteor.Map.Actors;
using Meteor.Map.lua;
using MoonSharp.Interpreter;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;

namespace Meteor.Map
{
    class LuaUtils
    {
    
        public class ItemRefParam
        {
            public uint actorId;
            public ushort slot;
            public byte itemPackage;

            public ItemRefParam(uint actorId, ushort slot, byte itemPackage)
            {
                this.actorId = actorId;
                this.slot = slot;
                this.itemPackage = itemPackage;
            }
        }

        public class MultiItemRefParam
        {
            public readonly uint actorId;
            public readonly ushort[] itemSlots;
            public readonly byte[] itemPackages;

            public MultiItemRefParam(uint actorId, ushort[] itemSlots, byte[] itemPackages)
            {
                this.actorId = actorId;
                this.itemSlots = itemSlots;
                this.itemPackages = itemPackages;
            }
        }

        public class Type9Param
        {
            public ulong item1;
            public ulong item2;

            public Type9Param(ulong item1, ulong item2)
            {
                this.item1 = item1;
                this.item2 = item2;
            }
        }

        public static List<LuaParam> ReadLuaParams(BinaryReader reader)
        {
            List<LuaParam> luaParams = new List<LuaParam>();

            bool isDone = false;
            while (true)
            {
                byte code = reader.ReadByte();
                object value = null;
                bool wasNil = false;

                switch (code)
                {
                    case 0x0: //Int32
                        value = Utils.SwapEndian(reader.ReadInt32());                        
                        break;
                    case 0x1: //Int32
                        value = Utils.SwapEndian(reader.ReadUInt32());        
                        break;          
                    case 0x2: //Null Termed String                        
                        List<byte> list = new List<byte>();
                        while(true){
                            byte readByte = reader.ReadByte();
                            if (readByte == 0)
                                break;
                            list.Add(readByte);
                        }
                        value = Encoding.ASCII.GetString(list.ToArray());
                        break;
                    case 0x3: //Boolean True
                        value = true;
                        break;
                    case 0x4: //Boolean False
                        value = false;
                        break;
                    case 0x5: //Nil
                        wasNil = true;
                        break;
                    case 0x6: //Actor (By Id)
                        value = Utils.SwapEndian(reader.ReadUInt32());
                        break;
                    case 0x7: //Item Reference to Inventory Spot
                        {
                            uint actorId = Utils.SwapEndian(reader.ReadUInt32());
                            ushort slot = Utils.SwapEndian(reader.ReadUInt16());
                            byte itemPackage = reader.ReadByte();
                            value = new ItemRefParam(actorId, slot, itemPackage);
                        }
                        break;  
                    case 0x8: //Multi Item Reference to Inventory Spot
                        {
                            long currentPosition = reader.BaseStream.Position - 1;
                            uint actorId = Utils.SwapEndian(reader.ReadUInt32());
                            ushort itemSlot0 = Utils.SwapEndian(reader.ReadUInt16());
                            byte packageId0 = reader.ReadByte();

                            byte numberOfEntries = reader.ReadByte();

                            ushort[] itemSlots = new ushort[numberOfEntries];
                            byte[] packageIds = new byte[numberOfEntries];
                            itemSlots[0] = itemSlot0;
                            packageIds[0] = packageId0;

                            for (int i = 1; i < numberOfEntries; i++)
                            {
                                itemSlots[i] = Utils.SwapEndian(reader.ReadUInt16());
                                packageIds[i] = reader.ReadByte();
                            }

                            byte byteSize = reader.ReadByte();

                            reader.BaseStream.Seek(currentPosition + byteSize, SeekOrigin.Begin);

                            value = new MultiItemRefParam(actorId, itemSlots, packageIds);
                        }
                        break;
                    case 0x9: //Two Longs (only storing first one)
                        value = new Type9Param(Utils.SwapEndian(reader.ReadUInt64()), Utils.SwapEndian(reader.ReadUInt64()));
                        break;
                    case 0xC: //Byte
                        value = reader.ReadByte();
                        break;
                    case 0x1B: //Short?
                        value = reader.ReadUInt16();
                        break;
                    case 0xF: //End
                        isDone = true;
                        continue;
                    default:
                        throw new ArgumentOutOfRangeException();
                }

                if (isDone)
                    break;

                if (value != null)
                    luaParams.Add(new LuaParam(code, value));
                else if (wasNil)
                    luaParams.Add(new LuaParam(code, value));
            }

            return luaParams;
        }

        public static List<LuaParam> ReadLuaParams(byte[] bytesIn)
        {
            List<LuaParam> luaParams = new List<LuaParam>();

            using (MemoryStream memStream = new MemoryStream(bytesIn))
            {
                using (BinaryReader reader = new BinaryReader(memStream))
                {
                    bool isDone = false;
                    while (true)
                    {
                        byte code = reader.ReadByte();
                        object value = null;
                        bool wasNil = false;

                        switch (code)
                        {
                            case 0x0: //Int32
                                value = Utils.SwapEndian(reader.ReadInt32());
                                break;
                            case 0x1: //Int32
                                value = Utils.SwapEndian(reader.ReadUInt32());
                                break;
                            case 0x2: //Null Termed String                        
                                List<byte> list = new List<byte>();
                                while (true)
                                {
                                    byte readByte = reader.ReadByte();
                                    if (readByte == 0)
                                        break;
                                    list.Add(readByte);
                                }
                                value = Encoding.ASCII.GetString(list.ToArray());
                                break;
                            case 0x3: //Boolean True
                                value = true;
                                break;
                            case 0x4: //Boolean False
                                value = false;
                                break;
                            case 0x5: //Nil
                                wasNil = true;
                                break;
                            case 0x6: //Actor (By Id)
                                value = Utils.SwapEndian(reader.ReadUInt32());
                                break;
                            case 0x7: //Item Reference
                                {
                                    uint actorId = Utils.SwapEndian(reader.ReadUInt32());
                                    ushort slot = Utils.SwapEndian(reader.ReadUInt16());
                                    byte itemPackage = reader.ReadByte();
                                    value = new ItemRefParam(actorId, slot, itemPackage);
                                    break;
                                }
                            case 0x8: //Multi Item Reference
                                {
                                    long currentPosition = reader.BaseStream.Position - 1;
                                    uint actorId = Utils.SwapEndian(reader.ReadUInt32());
                                    ushort itemSlot0 = Utils.SwapEndian(reader.ReadUInt16());
                                    byte packageId0 = reader.ReadByte();

                                    byte numberOfEntries = reader.ReadByte();

                                    ushort[] itemSlots = new ushort[numberOfEntries];
                                    byte[] packageIds = new byte[numberOfEntries];
                                    itemSlots[0] = itemSlot0;
                                    packageIds[0] = packageId0;

                                    for (int i = 1; i < numberOfEntries; i++)
                                    {
                                        itemSlots[i] = Utils.SwapEndian(reader.ReadUInt16());
                                        packageIds[i] = reader.ReadByte();
                                    }

                                    byte byteSize = reader.ReadByte();

                                    reader.BaseStream.Seek(currentPosition + byteSize, SeekOrigin.Begin);

                                    value = new MultiItemRefParam(actorId, itemSlots, packageIds);
                                    break;
                                }
                            case 0x9: //Two Longs (only storing first one)
                                value = new Type9Param(Utils.SwapEndian(reader.ReadUInt64()), Utils.SwapEndian(reader.ReadUInt64()));
                                break;
                            case 0xC: //Byte
                                value = reader.ReadByte();
                                break;
                            case 0x1B: //Short?
                                value = reader.ReadUInt16();
                                break;
                            case 0xF: //End
                                isDone = true;
                                continue;
                            default:
                                throw new ArgumentException("Unknown lua param...");
                        }

                        if (isDone)
                            break;

                        if (value != null)
                            luaParams.Add(new LuaParam(code, value));
                        else if (wasNil)
                            luaParams.Add(new LuaParam(code, value));
                    }
                }
            }
            return luaParams;
        }

        public static void WriteLuaParams(BinaryWriter writer, List<LuaParam> luaParams)
        {
            if (luaParams == null)
            {
                Program.Log.Error("LuaUtils.WriteLuaParams LuaParams are null!");
                return;
            }

            foreach (LuaParam l in luaParams)
            {           
                if (l.typeID == 0x1)
                    writer.Write((byte)0);
                else
                    writer.Write((byte)l.typeID);

                switch (l.typeID)
                {
                    case 0x0: //Int32                        
                        writer.Write((int)Utils.SwapEndian((int)l.value));
                        break;
                    case 0x1: //Int32                        
                        writer.Write((uint)Utils.SwapEndian((uint)l.value));
                        break;
                    case 0x2: //Null Termed String
                        string sv = (string)l.value;
                        writer.Write(Encoding.ASCII.GetBytes(sv), 0, Encoding.ASCII.GetByteCount(sv));
                        writer.Write((byte)0);
                        break;
                    case 0x3: //Boolean True                        
                        break;
                    case 0x4: //Boolean False                        
                        break;
                    case 0x5: //Nil                        
                        break;
                    case 0x6: //Actor (By Id)
                        writer.Write((uint)Utils.SwapEndian((uint)l.value));
                        break;
                    case 0x7: //Weird one used for inventory
                        ItemRefParam type7 = (ItemRefParam)l.value;
                        writer.Write((uint)Utils.SwapEndian((uint)type7.actorId));
                        writer.Write((ushort)type7.slot);
                        writer.Write((byte)type7.itemPackage);
                        break;
                    case 0x8:
                        //TODO: Fill it out even if not used
                        break;
                    case 0x9: //Two Longs (only storing first one)
                        writer.Write((ulong)Utils.SwapEndian(((Type9Param)l.value).item1));
                        writer.Write((ulong)Utils.SwapEndian(((Type9Param)l.value).item2));
                        break;
                    case 0xC: //Byte
                        writer.Write((byte)l.value);
                        break;
                    case 0x1B: //Short?                        
                        break;
                    case 0xF: //End                        
                        continue;
                }
            }

            writer.Write((byte)0xF);
        }

        public static List<LuaParam> CreateLuaParamList(DynValue fromScript)
        {
            List<LuaParam> luaParams = new List<LuaParam>();

            if (fromScript == null)
                return luaParams;

            if (fromScript.Type == DataType.Tuple)
            {
                foreach (DynValue d in fromScript.Tuple)
                {
                    AddToList(d, luaParams);
                }
            }
            else
                AddToList(fromScript, luaParams);

            return luaParams;
        }

        public static List<LuaParam> CreateLuaParamList(params object[] list)
        {
            List<LuaParam> luaParams = new List<LuaParam>();

            foreach (object o in list)
            {
                if (o != null && o.GetType().IsArray)
                {
                    Array arrayO = (Array)o;
                    foreach (object o2 in arrayO)
                        AddToList(o2, luaParams);
                }
                else
                    AddToList(o, luaParams);                     
            }

            return luaParams;
        }

        private static void AddToList(DynValue d, List<LuaParam> luaParams)
        {
            if (d.Type == DataType.Number)
            {
                luaParams.Add(new LuaParam(0x0, (int)d.Number));
            }
            else if (d.Type == DataType.Number)
            {
                luaParams.Add(new LuaParam(0x1, (uint)d.Number));
            }
            else if (d.Type == DataType.String)
            {
                luaParams.Add(new LuaParam(0x2, (string)d.String));
            }
            else if (d.Type == DataType.Boolean)
            {
                if (d.Boolean)
                    luaParams.Add(new LuaParam(0x3, null));
                else
                    luaParams.Add(new LuaParam(0x4, null));
            }
            else if (d.Type == DataType.Nil)
            {
                luaParams.Add(new LuaParam(0x5, null));
            }
            else if (d.Type == DataType.Table)
            {
                //luaParams.Add(new LuaParam(0x6, ((Actor)o).actorId));
            }
        }

        private static void AddToList(object o, List<LuaParam> luaParams)
        {
            if (o is int)
            {
                luaParams.Add(new LuaParam(0x0, (int)o));
            }
            else if (o is uint)
            {
                luaParams.Add(new LuaParam(0x1, (uint)o));
            }                
            else if (o is double)
            {
                if (((double)o) % 1 == 0)
                    luaParams.Add(new LuaParam(0x0, (int)(double)o));
            }
            else if (o is string)
            {
                luaParams.Add(new LuaParam(0x2, (string)o));
            }
            else if (o is bool)
            {
                if (((bool)o))
                    luaParams.Add(new LuaParam(0x3, null));
                else
                    luaParams.Add(new LuaParam(0x4, null));
            }
            else if (o == null)
            {
                luaParams.Add(new LuaParam(0x5, null));
            }
            else if (o is Actor)
            {
                luaParams.Add(new LuaParam(0x6, ((Actor)o).actorId));
            }
            else if (o is ItemRefParam)
            {
                luaParams.Add(new LuaParam(0x7, (ItemRefParam)o));
            }
            else if (o is MultiItemRefParam)
            {
                luaParams.Add(new LuaParam(0x8, (MultiItemRefParam)o));
            }
            else if (o is Type9Param)
            {
                luaParams.Add(new LuaParam(0x9, (Type9Param)o));
            }
            else if (o is byte)
            {
                luaParams.Add(new LuaParam(0xC, (byte)o));
            }
        }

        public static object[] CreateLuaParamObjectList(List <LuaParam> luaParams)
        {
            object[] list = new object[luaParams.Count];

            for (int i = 0; i < list.Length; i++)
                list[i] = luaParams[i].value;

            return list;
        }
    
      
        public static string DumpParams(List<LuaParam> lParams)
        {
            if (lParams == null)
                return "Param list was null?";

            string dumpString = "";
            for (int i = 0; i < lParams.Count; i++)
            {
                switch (lParams[i].typeID)
                {
                    case 0x0: //Int32
                        dumpString += string.Format("0x{0:X}", (int)lParams[i].value);
                        break;
                    case 0x1: //Int32
                        dumpString += string.Format("0x{0:X}", (uint)lParams[i].value);
                        break;
                    case 0x2: //Null Termed String                        
                        dumpString += string.Format("\"{0}\"", (string)lParams[i].value);
                        break;
                    case 0x3: //Boolean True
                        dumpString += "true";
                        break;
                    case 0x4: //Boolean False
                        dumpString += "false";
                        break;
                    case 0x5: //Null
                        dumpString += "nil";
                        break;
                    case 0x6: //Actor (By Id)
                        dumpString += string.Format("0x{0:X}", (uint)lParams[i].value);
                        break;
                    case 0x7: //Single Item Reference
                        ItemRefParam type7Param = ((ItemRefParam)lParams[i].value);
                        dumpString += string.Format("Item Ref: (0x{0:X}, 0x{1:X}, 0x{2:X})", type7Param.actorId, type7Param.slot, type7Param.itemPackage);
                        break;
                    case 0x8: //Multi Item Reference
                        MultiItemRefParam multiItemRef = ((MultiItemRefParam)lParams[i].value);
                        string array = "";

                        for (int j = 0; j < multiItemRef.itemSlots.Length; j++)
                        {
                            if (j + 1 != multiItemRef.itemSlots.Length)
                                array += string.Format("[0x{0:X}, 0x{1:X}], ", multiItemRef.itemSlots[j], multiItemRef.itemPackages[j]);
                            else
                                array += string.Format("[0x{0:X}, 0x{1:X}]", multiItemRef.itemSlots[j], multiItemRef.itemPackages[j]);
                        }

                        dumpString += string.Format("Item Ref: (0x{0:X}, [{1}])", multiItemRef.actorId, array);
                        break;
                    case 0x9: //Long (+ 8 bytes ignored)
                        Type9Param type9Param = ((Type9Param)lParams[i].value);
                        dumpString += string.Format("Type9 Param: (0x{0:X}, 0x{1:X})", type9Param.item1, type9Param.item2);
                        break;
                    case 0xC: //Byte
                        dumpString += string.Format("0x{0:X}", (byte)lParams[i].value);
                        break;                   
                    case 0x1B: //Short?
                        dumpString += string.Format("0x{0:X}", (ushort)lParams[i].value);
                        break;
                    case 0xF: //End
                        break;
                }

                if (i != lParams.Count - 1)
                    dumpString += ", ";
            }

            return dumpString;
        }

    }
}
