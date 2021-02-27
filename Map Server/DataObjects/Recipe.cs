using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Meteor.Map.DataObjects
{
    class Recipe
    {
        public readonly uint id;
        public readonly uint resultItemID;
        public readonly uint resultQuantity;
        public readonly uint[] materials;
        public readonly byte[] allowedCrafters;
        public readonly uint crystalId1;
        public readonly uint crystalId2;
        public readonly uint crystalQuantity1;
        public readonly uint crystalQuantity2;
        public readonly byte tier;

        public Recipe(uint id, uint resultItemID, uint resultQuantity, uint[] materials, uint crystalId1, uint crystalQuantity1, uint crystalId2, uint crystalQuantity2, byte[] allowedCrafters, byte tier)
        {
            this.id = id;
            this.resultItemID = resultItemID;
            this.resultQuantity = resultQuantity;
            this.materials = materials;
            this.allowedCrafters = allowedCrafters;
            this.crystalId1 = crystalId1;
            this.crystalId2 = crystalId2;
            this.crystalQuantity1 = crystalQuantity1;
            this.crystalQuantity2 = crystalQuantity2;
            this.tier = tier;
        }
    }
}
