import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/stats_tabs/combat/widgets/weapon_tile.dart';
import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/widgets/atribute_division.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/stats_tabs/combat/widgets/combat_info.dart';
import '../../../selection_sections/stats_sections/stats_tabs/combat/widgets/defense_equip_tile.dart';
import '../../../selection_sections/stats_sections/widgets/char_description_text.dart';
import '../../../selection_sections/stats_sections/widgets/gradient_label.dart';
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
          SizedBox(height: deviceHeight! * 0.003),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AtributeDivision(
                label: "Defense",
              ),
              Row(
                children: [
                  SizedBox(
                    width: deviceWidth! * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CombatInfo(
                          label: "Hit Points:",
                          value: "${char.hitPoints}",
                        ),
                        const SizedBox(height: 3),
                        Column(
                          children: [
                            DefenseEquipTile(
                                isMasterWork: false,
                                label: "Shield",
                                name: char.charEquip.shield != null
                                    ? char.loot.items!
                                        .firstWhere((element) => element.name
                                            .contains(
                                                char.charEquip.shield!.name!))
                                        .name
                                    : "no shield",
                                magic: ""),
                            const SizedBox(height: 3),
                          ],
                        ),
                        DefenseEquipTile(
                            isMasterWork: false,
                            label: "Armor",
                            name: char.charEquip.armour != null
                                ? char.loot.items!
                                    .firstWhere((element) => element.name
                                        .contains(char.charEquip.armour!.name!))
                                    .name
                                : "no armor",
                            magic: "")
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
                      ),
                      const SizedBox(height: 3),
                      CombatInfo(
                          label: "Surprise:",
                          value: "${char.combatStats.armourSurprise}"),
                      const SizedBox(height: 3),
                      CombatInfo(
                          label: "Touch:",
                          value: "${char.combatStats.armourTouch}"),
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
                  ),
                  SizedBox(width: deviceWidth! * 0.01),
                  CombatInfo(
                    length: deviceWidth! * 0.25,
                    label: "Reflex:",
                    value: "${char.resistances.reflex}",
                  ),
                  SizedBox(width: deviceWidth! * 0.01),
                  CombatInfo(
                    length: deviceWidth! * 0.25,
                    label: "Will:",
                    value: "${char.resistances.will}",
                  ),
                ],
              ),
              const SizedBox(height: 3),
              const AtributeDivision(
                label: "Offense",
              ),
              Row(
                children: [
                  CombatInfo(
                    label: "Initiative:",
                    value: "${char.combatStats.initiative}",
                  ),
                  SizedBox(width: deviceWidth! * 0.01),
                  CombatInfo(
                    label: "Speed:",
                    value: "${char.charRace.speed} ft.",
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  CharDescriptionText(
                    label: "Base attack bonus:",
                    textValue: "${char.combatStats.baseAttackBonus}",
                  ),
                  SizedBox(width: deviceWidth! * 0.02),
                  CombatInfo(
                    length: deviceWidth! * 0.18,
                    label: "CMB:",
                    value: "${char.combatStats.combatManeuverBonus}",
                  ),
                  SizedBox(width: deviceWidth! * 0.02),
                  CombatInfo(
                    length: deviceWidth! * 0.18,
                    label: "CMD",
                    value: "${char.combatStats.combatManeuverDefense}",
                  ),
                ],
              ),
              WeaponTile(
                  type: char.physicalStyle.name == "Dual-weilder"
                      ? "Main-hand (Dual-weilder)"
                      : "Melee",
                  specificType: char.charEquip.meleeWeapon!.type!.wielding,
                  name: char.loot.items!
                      .firstWhere((element) => element.name
                          .contains(char.charEquip.meleeWeapon!.name!))
                      .name,
                  magic: "",
                  effect: "",
                  attack: "(${char.combatStats.meleeAttack})",
                  damageValue: char.charEquip.meleeWeapon!.damage!,
                  damageBonus: "+${char.combatStats.meleeDamage}",
                  extraDamage: char.charEquip.meleeWeapon!.enchantment == null
                      ? ""
                      : char.charEquip.meleeWeapon!.enchantment!.length > 1
                          ? char.charEquip.meleeWeapon!.enchantment![1]
                              .additionalDiceDamage!
                          : "",
                  critical: "${char.charEquip.meleeWeapon!.critical}"),
              WeaponTile(
                  type: char.charEquip.rangeWeapon!.type!.wielding,
                  name: char.loot.items!
                      .firstWhere((element) => element.name
                          .contains(char.charEquip.rangeWeapon!.name!))
                      .name,
                  magic: "",
                  effect: "",
                  attack: "${char.combatStats.rangeAttack}",
                  damageValue: "${char.charEquip.rangeWeapon!.damage}",
                  damageBonus: "+${char.combatStats.rangeDamage}",
                  extraDamage: char.charEquip.rangeWeapon!.enchantment == null
                      ? ""
                      : char.charEquip.rangeWeapon!.enchantment!.length > 1
                          ? char.charEquip.rangeWeapon!.enchantment![1]
                              .additionalDiceDamage!
                          : "",
                  critical: "${char.charEquip.rangeWeapon!.critical}"),
            ],
          ),
        ],
      ),
    );
  }
}