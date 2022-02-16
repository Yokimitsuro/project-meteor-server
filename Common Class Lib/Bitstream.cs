using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Meteor.Common
{
    public class Bitstream
    {
        private readonly byte[] Data;

        public Bitstream(uint numBits, bool setAllTrue = false)
        {
            Debug.Assert(numBits % 8 == 0);
            Debug.Assert(numBits % 4 == 0);
            Data = new byte[numBits / 8];

            if (setAllTrue)
                SetAll(true);
        }

        public Bitstream(bool[] boolArray)
        {
            Data = Utils.ConvertBoolArrayToBinaryStream(boolArray);
        }

        private Bitstream(byte[] byteArray)
        {
            Data = byteArray;
        }

        public void SetAll(bool to)
        {
            for (int i = 0; i < Data.Length; i += 4)
            {
                Data[i] = Data[i + 1] = Data[i + 2] = Data[i + 3] = (byte)(to ? 0xFF : 0x00);
            }
        }

        public void SetTo(Bitstream result)
        {
            Debug.Assert(Data.Length == result.Data.Length);
            for (int i = 0; i < result.Data.Length; i += 4)
            {
                Data[i] = result.Data[i];
                Data[i + 1] = result.Data[i + 1];
                Data[i + 2] = result.Data[i + 2];
                Data[i + 3] = result.Data[i + 3];
            }
        }

        public bool Get(uint at)
        {
            return Get((int)at);
        }

        public bool Get(int at)
        {
            int bytePos = at / 8;
            int bitPos = at % 8;
            return (Data[bytePos] & (1 << bitPos)) != 0;
        }

        public void Set(uint at)
        {
            Set((int)at);
        }

        public void Set(int at)
        {
            int bytePos = at / 8;
            int bitPos = at % 8;
            Data[bytePos] |= (byte)(1 << bitPos);
        }

        public void Clear(uint at)
        {
            Clear((int)at);
        }

        public void Clear(int at)
        {
            int bytePos = at / 8;
            int bitPos = at % 8;
            Data[bytePos] &= (byte)~(1 << bitPos);
        }

        public void NOT()
        {
            for (int i = 0; i < Data.Length; i += 4)
            {
                Data[i] = (byte)~Data[i];
                Data[i + 1] = (byte)~Data[i + 1];
                Data[i + 2] = (byte)~Data[i + 2];
                Data[i + 3] = (byte)~Data[i + 3];
            }
        }

        public void OR(Bitstream other)
        {
            Debug.Assert(Data.Length == other.Data.Length);
            for (int i = 0; i < Data.Length; i += 4)
            {
                Data[i] |= other.Data[i];
                Data[i + 1] |= other.Data[i + 1];
                Data[i + 2] |= other.Data[i + 2];
                Data[i + 3] |= other.Data[i + 3];
            }
        }

        public void AND(Bitstream other)
        {
            Debug.Assert(Data.Length == other.Data.Length);
            for (int i = 0; i < Data.Length; i += 4)
            {
                Data[i] &= other.Data[i];
                Data[i + 1] &= other.Data[i + 1];
                Data[i + 2] &= other.Data[i + 2];
                Data[i + 3] &= other.Data[i + 3];
            }
        }

        public void XOR(Bitstream other)
        {
            Debug.Assert(Data.Length == other.Data.Length);
            for (int i = 0; i < Data.Length; i += 4)
            {
                Data[i] ^= other.Data[i];
                Data[i + 1] ^= other.Data[i + 1];
                Data[i + 2] ^= other.Data[i + 2];
                Data[i + 3] ^= other.Data[i + 3];
            }
        }

        public Bitstream Copy()
        {
            byte[] copy = new byte[Data.Length];
            Array.Copy(Data, copy, Data.Length);
            return new Bitstream(copy);
        }

        public byte[] GetBytes()
        {
            return Data;
        }

    }
}
