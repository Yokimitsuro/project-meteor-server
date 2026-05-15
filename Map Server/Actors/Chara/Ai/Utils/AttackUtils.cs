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

using Meteor.Map.Actors;
using Meteor.Map.actors.chara.npc;
using Meteor.Map.DataObjects;
using System;

namespace Meteor.Map.actors.chara.ai.utils
{
    static class AttackUtils
    {
        private static readonly double VARIANCE = 0.05;

        private static double GetVariance()
        {
            return 1.0 + (Program.Random.NextDouble() * 2 - 1) * VARIANCE;
        }

        public static ushort CalculateAutoAttackDamage(Character attacker)
        {
            int weaponDamage = GetWeaponDamage(attacker);
            double delay = attacker.GetMod(Modifier.Delay) / 1000.0;
            double attack = attacker.GetMod(Modifier.Attack);

            double baseDamage = weaponDamage * (delay / 3.0) * (1.0 + attack / 364.0);
            baseDamage *= GetVariance();

            return (ushort)Math.Max(1, (int)baseDamage);
        }

        public static ushort CalculateWeaponSkillDamage(Character attacker, BattleCommand skill)
        {
            int weaponDamage = GetWeaponDamage(attacker);
            double attack = attacker.GetMod(Modifier.Attack);

            double baseDamage = (skill.basePotency / 100.0) * weaponDamage * (1.0 + attack / 364.0);
            baseDamage *= GetVariance();

            return (ushort)Math.Max(1, (int)baseDamage);
        }

        public static ushort CalculateSpellDamage(Character attacker, BattleCommand spell)
        {
            double magicPotency = attacker.GetMod(Modifier.AttackMagicPotency);

            double baseDamage = (spell.basePotency / 100.0) * (1.0 + magicPotency / 228.0) * 100.0;
            baseDamage *= GetVariance();

            return (ushort)Math.Max(1, (int)baseDamage);
        }

        public static ushort CalculateHealAmount(Character caster, BattleCommand spell)
        {
            double healingPotency = caster.GetMod(Modifier.HealingMagicPotency);

            double baseHeal = (spell.basePotency / 100.0) * (1.0 + healingPotency / 228.0) * 100.0;
            baseHeal *= GetVariance();

            return (ushort)Math.Max(1, (int)baseHeal);
        }

        public static int GetWeaponDamage(Character attacker)
        {
            if (attacker is Player)
            {
                var equip = ((Player)attacker).GetEquipment();
                var mainHand = equip?.GetItemAtSlot(Character.MAINHAND);
                if (mainHand != null)
                {
                    var weapon = Server.GetItemGamedata(mainHand.itemId) as WeaponItem;
                    if (weapon != null)
                        return Math.Max(1, (int)weapon.damagePower);
                }
                return 5;
            }

            if (attacker is BattleNpc)
            {
                double combatDmg = attacker.GetMod(Modifier.Attack);
                return (int)Math.Max(1, combatDmg / 3);
            }

            return 5;
        }
    }
}
