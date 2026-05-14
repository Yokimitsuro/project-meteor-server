using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Meteor.Map.DataObjects
{
    class QuestGameData
    {
        public uint Id { get; }
        public string ClassName { get; }
        public string Name { get; }
        public uint PrerequisiteQuest { get; }
        public int MinLevel { get; }
        public int MinGCRank { get; }
        public int GCAffiliation { get; }
        public int ExpReward { get; }
        public int GilReward { get; }
        public uint ItemReward1 { get; }
        public int ItemReward1Qty { get; }
        public uint ItemReward2 { get; }
        public int ItemReward2Qty { get; }
        public uint ItemReward3 { get; }
        public int ItemReward3Qty { get; }
        public uint ItemReward4 { get; }
        public int ItemReward4Qty { get; }

        public QuestGameData(uint id, string className, string name, uint prereq, int minLv, int minGcRank, int gcAffiliation = 0,
            int expReward = 0, int gilReward = 0,
            uint itemReward1 = 0, int itemReward1Qty = 0,
            uint itemReward2 = 0, int itemReward2Qty = 0,
            uint itemReward3 = 0, int itemReward3Qty = 0,
            uint itemReward4 = 0, int itemReward4Qty = 0)
        {
            Id = id;
            ClassName = className;
            Name = name;
            PrerequisiteQuest = prereq;
            MinLevel = minLv;
            MinGCRank = minGcRank;
            GCAffiliation = gcAffiliation;
            ExpReward = expReward;
            GilReward = gilReward;
            ItemReward1 = itemReward1;
            ItemReward1Qty = itemReward1Qty;
            ItemReward2 = itemReward2;
            ItemReward2Qty = itemReward2Qty;
            ItemReward3 = itemReward3;
            ItemReward3Qty = itemReward3Qty;
            ItemReward4 = itemReward4;
            ItemReward4Qty = itemReward4Qty;
        }

        public bool HasRewards()
        {
            return ExpReward > 0 || GilReward > 0 || ItemReward1 > 0 || ItemReward2 > 0 || ItemReward3 > 0 || ItemReward4 > 0;
        }
    }
}
