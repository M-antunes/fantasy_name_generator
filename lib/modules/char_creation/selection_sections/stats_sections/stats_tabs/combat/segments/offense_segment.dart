import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/modules/char_creation/selection_sections/stats_sections/widgets/gradient_label.dart';

import '../../../../../../../controllers/stats_controller/stats_controller.dart';
import '../../../../../../../shared/constants/phone_sizes.dart';
import '../../../widgets/atribute_division.dart';
import '../../../widgets/char_description_text.dart';
import '../widgets/combat_info.dart';
import '../widgets/dual_wield_tile.dart';
import '../widgets/unique_char_info.dart';
import '../widgets/weapon_tile.dart';

class OffenseSegment extends StatelessWidget {
  const OffenseSegment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AttributeDivision(label: "Offense"),
          Row(
            children: [
              CombatInfo(
                label: "Initiative:",
                value: "${state.char.combatStats.initiative}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              CombatInfo(
                label: "Speed:",
                value: "${state.char.charRace.speed} ft.",
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              CharDescriptionText(
                label: "Base attack bonus:  ",
                textValue: "${state.char.combatStats.baseAttackBonus}",
              ),
              SizedBox(width: deviceWidth! * 0.05),
              CombatInfo(
                length: deviceWidth! * 0.2,
                label: "CMB:",
                value: "${state.char.combatStats.combatManeuverBonus}",
              ),
              CombatInfo(
                length: deviceWidth! * 0.2,
                label: "CMD",
                value: "${state.char.combatStats.combatManeuverDefense}",
              ),
            ],
          ),
          if (state.char.battleStyle.name == "Hybrid" ||
              state.char.battleStyle.name == "Spellcaster")
            Row(
              children: [
                CombatInfo(
                    length: deviceWidth! * 0.45,
                    label: "Touch attack",
                    value: "+${state.char.combatStats.touchAttack!}"),
                CombatInfo(
                    length: deviceWidth! * 0.45,
                    label: "Concentration",
                    value: "+${state.char.combatStats.concentration!}"),
              ],
            ),
          if (state.char.charClass.name == "Rogue" ||
              state.char.charClass.name == "Bandit")
            UniqueCharInfo(
                traits: state.traits, label: "Sneak attack", stringIndex: 13),
          if (state.char.charClass.name == "Samurai")
            UniqueCharInfo(
                traits: state.traits, label: "Challenge", stringIndex: 10),
          if (state.char.charClass.name == "Paladin" ||
              state.char.charClass.name == "Antipaladin")
            UniqueCharInfo(
                traits: state.traits, label: "Smite", stringIndex: 10),
          if (state.char.charClass.name == "Monk")
            Column(
              children: [
                const SizedBox(height: 3),
                const GradientLabel(label: "Flurry of blows"),
                CombatInfo(
                    length: deviceWidth!,
                    label: "Total attack: ",
                    value: "${state.char.combatStats.dualWieldAttack}"),
                CombatInfo(
                    length: deviceWidth!,
                    label: "Damage:",
                    value: "${state.char.combatStats.dualWieldDamage}")
              ],
            ),
          if (state.char.charEquip.meleeWeapon != null)
            Column(
              children: [
                WeaponTile(
                  type: state.char.physicalStyle.name == "Dual-wielder"
                      ? "One-hand fight"
                      : "Melee",
                  specificType:
                      state.char.charEquip.meleeWeapon!.type!.wielding,
                  name: state.meleeName,
                  attack: "(${state.char.combatStats.meleeAttack!})",
                  damageValue: state.char.combatStats.meleeDamage!,
                  critical: state.char.charEquip.meleeWeapon!.critical!,
                ),
                if (state.char.physicalStyle.name == "Dual-wielder")
                  Column(
                    children: [
                      const SizedBox(height: 3),
                      DualWieldTile(
                        weapons: "${state.meleeName} & ${state.meleeName}",
                        attack: "${state.char.combatStats.dualWieldAttack}",
                        damage:
                            "${state.char.combatStats.meleeDamage!} / ${state.char.combatStats.dualWieldDamage}",
                        critical:
                            "${state.char.charEquip.meleeWeapon!.critical!} / ${state.char.charEquip.meleeWeapon!.critical!}",
                      )
                    ],
                  ),
                WeaponTile(
                  type: "Range",
                  name: state.rangeName,
                  attack: state.char.charEquip.rangeWeapon != null
                      ? "(${state.char.combatStats.rangeAttack!})"
                      : "",
                  damageValue: state.char.combatStats.rangeDamage!,
                  critical: state.char.charEquip.rangeWeapon!.critical!,
                ),
              ],
            ),
          if (state.char.charEquip.meleeWeapon == null)
            Column(
              children: const [
                WeaponTile(
                    type: "Melee",
                    name: "Weapon Name",
                    attack: "(Attack value)",
                    damageValue: "damage +bonus",
                    critical: "x"),
                WeaponTile(
                    type: "Range",
                    name: "Weapon Name",
                    attack: "(Attack value)",
                    damageValue: "damage +bonus",
                    critical: "x"),
              ],
            ),
        ],
      );
    });
  }
}
