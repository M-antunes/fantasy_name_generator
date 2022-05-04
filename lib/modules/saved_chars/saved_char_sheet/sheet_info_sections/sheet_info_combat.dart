import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/modules/char_creation/selection_sections/stats_sections/stats_tabs/combat/widgets/dual_wield_tile.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../char_creation/selection_sections/stats_sections/stats_tabs/combat/widgets/combat_info.dart';
import '../../../char_creation/selection_sections/stats_sections/stats_tabs/combat/widgets/weapon_tile.dart';
import '../../../char_creation/selection_sections/stats_sections/widgets/atribute_division.dart';
import '../../../char_creation/selection_sections/stats_sections/widgets/gradient_label.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoCombat extends StatelessWidget {
  final CharModel char;
  const SheetInfoCombat({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        children: [
          const LabelForCategoryIcon(label: "Combat"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AttributeDivision(
                label: "Defense",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: deviceWidth! * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CombatInfo(
                          label: "Hit Points:",
                          value: "${char.hitPoints}",
                          onCharSheet: true,
                        ),
                        const SizedBox(height: 3),
                        Column(
                          children: [
                            CombatInfo(
                              length: deviceWidth! * 0.5,
                              onCharSheet: true,
                              label: "Shield",
                              value: char.charEquip.shield != null
                                  ? char.loot.items!
                                      .firstWhere((element) => element.name
                                          .contains(
                                              char.charEquip.shield!.name!))
                                      .name
                                  : "no shield",
                            ),
                            const SizedBox(height: 3),
                          ],
                        ),
                        CombatInfo(
                          length: deviceWidth! * 0.5,
                          onCharSheet: true,
                          label: "Armor",
                          value: char.charEquip.armour != null
                              ? char.loot.items!
                                  .firstWhere((element) => element.name
                                      .contains(char.charEquip.armour!.name!))
                                  .name
                              : "no armor",
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CombatInfo(
                        length: deviceWidth! * 0.3,
                        label: "Armor Class:",
                        value: "${char.combatStats.armourClass}",
                        onCharSheet: true,
                      ),
                      const SizedBox(height: 3),
                      CombatInfo(
                        label: "Surprise:",
                        value: "${char.combatStats.armourSurprise}",
                        onCharSheet: true,
                      ),
                      const SizedBox(height: 3),
                      CombatInfo(
                        label: "Touch:",
                        value: "${char.combatStats.armourTouch}",
                        onCharSheet: true,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const GradientLabel(label: "Resistances"),
              Row(
                children: [
                  CombatInfo(
                    length: deviceWidth! * 0.25,
                    label: "Fortitude:",
                    value: "${char.resistances.fortitude}",
                    onCharSheet: true,
                  ),
                  SizedBox(width: deviceWidth! * 0.01),
                  CombatInfo(
                    length: deviceWidth! * 0.25,
                    label: "Reflex:",
                    value: "${char.resistances.reflex}",
                    onCharSheet: true,
                  ),
                  SizedBox(width: deviceWidth! * 0.01),
                  CombatInfo(
                    length: deviceWidth! * 0.25,
                    label: "Will:",
                    value: "${char.resistances.will}",
                    onCharSheet: true,
                  ),
                ],
              ),
              const AttributeDivision(label: "Offense"),
              Row(
                children: [
                  CombatInfo(
                    label: "Initiative:",
                    value: "${char.combatStats.initiative}",
                    onCharSheet: true,
                  ),
                  SizedBox(width: deviceWidth! * 0.01),
                  CombatInfo(
                    label: "Speed:",
                    value: "${char.charRace.speed} ft.",
                    onCharSheet: true,
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  CombatInfo(
                    length: deviceWidth! * 0.36,
                    label: "Base attack bonus:",
                    value: "${char.combatStats.baseAttackBonus}",
                    onCharSheet: true,
                  ),
                  SizedBox(width: deviceWidth! * 0.02),
                  CombatInfo(
                    length: deviceWidth! * 0.18,
                    label: "CMB:",
                    value: "${char.combatStats.combatManeuverBonus}",
                    onCharSheet: true,
                  ),
                  SizedBox(width: deviceWidth! * 0.02),
                  CombatInfo(
                    length: deviceWidth! * 0.18,
                    label: "CMD",
                    value: "${char.combatStats.combatManeuverDefense}",
                    onCharSheet: true,
                  ),
                ],
              ),
              if (char.charClass.name == "Rogue" ||
                  char.charClass.name == "Bandit")
                Column(
                  children: [
                    const SizedBox(height: 3),
                    CombatInfo(
                      length: deviceWidth! * 0.5,
                      label: "Sneak attack:",
                      value: char.charClass.traits!
                          .firstWhere((element) =>
                              element.traiName.contains("Sneak attack"))
                          .traiName
                          .substring(13),
                      onCharSheet: true,
                    ),
                  ],
                ),
              if (char.charClass.name == "Samurai")
                Column(
                  children: [
                    const SizedBox(height: 3),
                    CombatInfo(
                      length: deviceWidth! * 0.5,
                      label: char.charClass.traits!
                          .firstWhere((element) =>
                              element.traiName.contains("Challenge"))
                          .traiName
                          .substring(0, 9),
                      value: char.charClass.traits!
                          .firstWhere((element) =>
                              element.traiName.contains("Challenge"))
                          .traiName
                          .substring(10),
                    ),
                  ],
                ),
              if (char.charClass.name == "Paladin" ||
                  char.charClass.name == "Antipaladin")
                Column(
                  children: [
                    const SizedBox(height: 3),
                    CombatInfo(
                      length: deviceWidth! * 0.5,
                      onCharSheet: true,
                      label: char.charClass.traits!.isEmpty
                          ? ''
                          : char.charClass.traits!
                              .firstWhere((element) =>
                                  element.traiName.contains("Smite"))
                              .traiName
                              .substring(0, 10),
                      value: char.charClass.traits!.isEmpty
                          ? ''
                          : char.charClass.traits!
                              .firstWhere((element) =>
                                  element.traiName.contains("Smite"))
                              .traiName
                              .substring(10),
                    ),
                  ],
                ),
              if (char.charClass.name == "Monk")
                Column(
                  children: [
                    const SizedBox(height: 3),
                    const GradientLabel(label: "Flurry of blows"),
                    CombatInfo(
                        length: deviceWidth!,
                        label: "Total attack: ",
                        onCharSheet: true,
                        value: "${char.combatStats.dualWieldAttack}"),
                    CombatInfo(
                        length: deviceWidth!,
                        label: "Damage:",
                        onCharSheet: true,
                        value: "${char.combatStats.dualWieldDamage}")
                  ],
                ),
              WeaponTile(
                  isOnCharSheet: true,
                  type: char.physicalStyle.name == "Dual-wielder"
                      ? "One-hand fight"
                      : "Melee",
                  specificType: char.charEquip.meleeWeapon!.type!.wielding,
                  name: char.loot.items!
                      .firstWhere((element) => element.name
                          .contains(char.charEquip.meleeWeapon!.name!))
                      .name,
                  attack: "(${char.combatStats.meleeAttack})",
                  damageValue: char.combatStats.meleeDamage!,
                  critical: "${char.charEquip.meleeWeapon!.critical}"),
              if (char.physicalStyle.name == "Dual-wielder")
                Column(
                  children: [
                    const SizedBox(height: 3),
                    DualWieldTile(
                        weapons:
                            "${char.loot.items!.firstWhere((element) => element.name.contains(char.charEquip.meleeWeapon!.name!)).name} & ${char.loot.items!.firstWhere((element) => element.name.contains(char.charEquip.meleeWeapon!.name!)).name}",
                        isOnCharSheet: true,
                        attack: "${char.combatStats.dualWieldAttack}",
                        damage:
                            "${char.combatStats.meleeAttack} / ${char.combatStats.dualWieldAttack}",
                        critical:
                            "${char.charEquip.meleeWeapon!.critical} / ${char.charEquip.meleeWeapon!.critical}")
                  ],
                ),
              WeaponTile(
                  isOnCharSheet: true,
                  type: char.charEquip.rangeWeapon!.type!.wielding,
                  name: char.loot.items!
                      .firstWhere((element) => element.name
                          .contains(char.charEquip.rangeWeapon!.name!))
                      .name,
                  attack: "${char.combatStats.rangeAttack}",
                  damageValue: char.combatStats.rangeDamage!,
                  critical: "${char.charEquip.rangeWeapon!.critical}"),
            ],
          ),
        ],
      ),
    );
  }
}
