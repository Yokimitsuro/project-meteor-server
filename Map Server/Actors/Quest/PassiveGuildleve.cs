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

using Meteor.Map.dataobjects;
using Meteor.Map.DataObjects;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace Meteor.Map.Actors
{
    class PassiveGuildleve : Quest
    {
        private Recipe targetRecipe;

        private byte currentDifficulty;
        private short currentCrafted;
        private short currentAttempt;

        private bool hasMaterials;

        private PassiveGuildleveData passiveGLData;

        public PassiveGuildleve(Quest staticQuest, Player owner, byte currentDifficulty)
            : base(staticQuest, owner)
        {
            passiveGLData = Server.GetPassiveGLGamedata(GetQuestId());            
            targetRecipe = Server.ResolveRecipe().GetRecipeByItemID(passiveGLData.objectiveItemId[currentDifficulty]);
            this.currentDifficulty = currentDifficulty;
            currentAttempt = 0;
            currentCrafted = 0;
            hasMaterials = false;
        }

        public PassiveGuildleve(Quest staticQuest, Player owner, string questDataJson) : base(staticQuest, owner)
        {
            passiveGLData = Server.GetPassiveGLGamedata(GetQuestId());

            Dictionary<string, object> questData = null;

            if (questDataJson != null)
                questData = JsonConvert.DeserializeObject<Dictionary<string, object>>(questDataJson);

            if (questData == null)
                questData = new Dictionary<string, object>();

            currentDifficulty = questData.ContainsKey("currentDifficulty") ? (byte)Convert.ToByte(questData["currentDifficulty"]) : (byte)0;
            currentAttempt = questData.ContainsKey("currentAttempt") ? (short)Convert.ToInt16(questData["currentAttempt"]) : (short)0;
            currentCrafted = questData.ContainsKey("currentCrafted") ? (short)Convert.ToInt16(questData["currentCrafted"]) : (short)0;
            hasMaterials = questData.ContainsKey("hasMaterials") ? (bool)questData["hasMaterials"] : false;

            targetRecipe = Server.ResolveRecipe().GetRecipeByItemID(passiveGLData.objectiveItemId[currentDifficulty]);
        }

        public void CraftSuccess()
        {
            currentCrafted += (short) targetRecipe.resultQuantity;
            currentAttempt++;
        }

        public void CraftFail()
        {
            currentAttempt++;
        }

        public Recipe GetRecipe()
        {
            return targetRecipe;
        }

        public int GetObjectiveQuantity()
        {
            return passiveGLData.objectiveQuantity[currentDifficulty];
        }

        public int getCurrentCrafted()
        {
            return currentCrafted;
        }

        public int GetRemainingMaterials()
        {
            return passiveGLData.numberOfAttempts[currentDifficulty] - currentAttempt;
        }
        public int GetCurrentAttempt()
        {
            return currentAttempt;
        }

        public int GetMaxAttempts()
        {
            return passiveGLData.numberOfAttempts[currentDifficulty];
        }

        public byte GetCurrentDifficulty()
        {
            return currentDifficulty;
        }

        public bool HasMaterials()
        {
            return hasMaterials;
        }

        public PassiveGuildleveData GetPassiveGLData()
        {
            return passiveGLData;
        }

        public override void SaveData()
        {
            Database.SaveQuest(owner, this);
        }

        public override string GetSerializedQuestData()
        {
            Dictionary<string, object> questData = new Dictionary<string, object>
            {
                { "currentDifficulty", currentDifficulty },
                { "currentAttempt", currentAttempt },
                { "currentCrafted", currentCrafted },
                { "hasMaterials", hasMaterials }
            };
            return JsonConvert.SerializeObject(questData, Formatting.Indented);
        }
    }
}
