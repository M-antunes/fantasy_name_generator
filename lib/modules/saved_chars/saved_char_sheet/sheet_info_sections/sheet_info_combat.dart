import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/stats_tabs/combat/widgets/weapon_tile.dart';
import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/widgets/atribute_division.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/stats_tabs/combat/widgets/combat_info.dart';
import '../../../selection_sections/stats_sections/stats_tabs/combat/widgets/defense_equip_tile.dart';
import '../../../selection_sections/stats_sections/widgets/char_description_text.dart';
import '../../../selection_sections/stats_sections/widgets/gradient_label.dart';
import 'widgets/gradient_label_sheet.dart';

class SheetInfoCombat extends StatelessWidget {
  const SheetInfoCombat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        children: [
          GradientLabelSheet(label: "Combat"),
          SizedBox(height: deviceHeight! * 0.003),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AtributeDivision(
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
                          value: "10",
                        ),
                        const SizedBox(height: 3),
                        Column(
                          children: [
                            DefenseEquipTile(
                              isMasterWork: false,
                              label: "Shield",
                              name: "Shield",
                              magic: "",
                            ),
                            const SizedBox(height: 3),
                          ],
                        ),
                        DefenseEquipTile(
                          isMasterWork: false,
                          label: "Armor",
                          name: "Armour",
                          magic: "",
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
                        value: "10",
                      ),
                      const SizedBox(height: 3),
                      CombatInfo(label: "Surprise:", value: "10"),
                      const SizedBox(height: 3),
                      CombatInfo(label: "Touch:", value: "10"),
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
                    value: "10",
                  ),
                  SizedBox(width: deviceWidth! * 0.01),
                  CombatInfo(
                    length: deviceWidth! * 0.25,
                    label: "Reflex:",
                    value: "10",
                  ),
                  SizedBox(width: deviceWidth! * 0.01),
                  CombatInfo(
                    length: deviceWidth! * 0.25,
                    label: "Will:",
                    value: "10",
                  ),
                ],
              ),
              const SizedBox(height: 3),
              AtributeDivision(
                label: "Offense",
              ),
              Row(
                children: [
                  CombatInfo(
                    label: "Initiative:",
                    value: "1",
                  ),
                  SizedBox(width: deviceWidth! * 0.01),
                  CombatInfo(
                    label: "Speed:",
                    value: "12 ft.",
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  CharDescriptionText(
                    label: "Base attack bonus:  ",
                    textValue: "1",
                  ),
                  SizedBox(width: deviceWidth! * 0.02),
                  CombatInfo(
                    length: deviceWidth! * 0.15,
                    label: "CMB:",
                    value: "1",
                  ),
                  SizedBox(width: deviceWidth! * 0.02),
                  CombatInfo(
                    length: deviceWidth! * 0.15,
                    label: "CMD",
                    value: "1",
                  ),
                ],
              ),
              WeaponTile(
                  type: "Example",
                  name: "Example",
                  magic: "Example",
                  effect: "Example",
                  attack: "Example",
                  damageValue: "Example",
                  damageBonus: "Example",
                  critical: "Ex"),
              WeaponTile(
                  type: "Example",
                  name: "Example",
                  magic: "Example",
                  effect: "Example",
                  attack: "Example",
                  damageValue: "Example",
                  damageBonus: "Example",
                  critical: "Ex")
            ],
          ),
        ],
      ),
    );
  }
}
