using Meteor.Common;
using Meteor.Map.DataObjects;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Meteor.Map.Actors
{
    class QuestStateManager
    {
        private const int SCENARIO_START = 110001;
        private const int SCENARIO_MAX = 2048;

        private readonly Player player;
        private readonly Bitstream AvailableQuestsBitfield = new Bitstream(SCENARIO_MAX);
        private readonly Bitstream MinLevelBitfield = new Bitstream(SCENARIO_MAX);
        private readonly Bitstream PrereqBitfield = new Bitstream(SCENARIO_MAX, true);
        private readonly Bitstream GCRankBitfield = new Bitstream(SCENARIO_MAX, true);

        private List<Quest> ActiveQuests = new List<Quest>();

        public QuestStateManager(Player player)
        {
            this.player = player;
        }

        public void Init()
        {
            // Init MinLv
            QuestData[] minLvl = Server.GetQuestGamedataByMaxLvl(player.GetHighestLevel(), true);
            foreach (var questData in minLvl)
                MinLevelBitfield.Set(questData.Id - SCENARIO_START);

            // Init Prereq
            Bitstream completed = new Bitstream(player.playerWork.questScenarioComplete);
            foreach (var questData in Server.GetQuestGamedataAllPrerequisite())
            {
                if (completed.Get(((Quest)Server.GetStaticActors(0xA0F00000 | questData.PrerequisiteQuest)).GetQuestId() - SCENARIO_START))
                    PrereqBitfield.Set(questData.Id - SCENARIO_START);
                else
                    PrereqBitfield.Clear(questData.Id - SCENARIO_START);
            }
            ComputeAvailable();
        }

        public void UpdateLevel(int level)
        {
            QuestData[] updated = Server.GetQuestGamedataByMaxLvl(level);
            foreach (var questData in updated)
                MinLevelBitfield.Set(questData.Id - SCENARIO_START);
            ComputeAvailable();
        }

        public void UpdateQuestComplete(Quest quest)
        {
            QuestData[] updated = Server.GetQuestGamedataByPrerequisite(quest.GetQuestId());
            foreach (var questData in updated)
                PrereqBitfield.Set(questData.Id - SCENARIO_START);
            ComputeAvailable();
        }

        public void QuestAdded(Quest quest)
        {
            ActiveQuests.Remove(quest);
        }

        private void ComputeAvailable()
        {
            Bitstream result = new Bitstream(player.playerWork.questScenarioComplete);
            result.NOT();
            result.AND(MinLevelBitfield);
            result.AND(PrereqBitfield);
            result.AND(GCRankBitfield);

            Bitstream difference = AvailableQuestsBitfield.Copy();
            difference.XOR(result);
            byte[] diffBytes = difference.GetBytes();

            for (int i = 0; i < diffBytes.Length; i++)
            {
                if (diffBytes[i] == 0)
                    continue;
                for (int shift = 0; shift < 8; shift++)
                {
                    if ((diffBytes[i] >> shift & 1) == 1)
                    {
                        int index = i * 8 + shift;
                        Quest quest = (Quest)Server.GetStaticActors(0xA0F00000 | (SCENARIO_START + (uint)index));
                        if (!AvailableQuestsBitfield.Get(index))
                            ActiveQuests.Add(new Quest(player, quest));
                        else
                            ActiveQuests.Remove(quest);
                    }
                }
            }

            AvailableQuestsBitfield.SetTo(result);
        }

        public Quest[] GetQuestsForNpc(Npc npc)
        {
            return ActiveQuests.FindAll(quest => quest.IsQuestENPC(player, npc)).ToArray();
        }
    }
}
