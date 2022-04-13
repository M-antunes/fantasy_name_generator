import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../controllers/stats_controller.dart';
import '../../../../../../shared/constants/phone_sizes.dart';
import '../../../widgets/atribute_division.dart';
import '../../../widgets/gradient_label.dart';
import '../widgets/combat_info.dart';
import '../widgets/defense_equip_tile.dart';

class DefenseSegment extends StatelessWidget {
  const DefenseSegment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AtributeDivision(label: "Defense"),
          Row(
            children: [
              SizedBox(
                width: deviceWidth! * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CombatInfo(
                      label: "Hit Points:",
                      value: "${state.char.hitPoints}",
                    ),
                    const SizedBox(height: 3),
                    state.char.physicalStyle.name == "Soldier"
                        ? Column(
                            children: [
                              DefenseEquipTile(
                                isMasterWork: state.char.charLevel > 2 &&
                                        state.char.charLevel < 5 &&
                                        state.char.charEquip.shield != null
                                    ? true
                                    : false,
                                label: "Shield",
                                name: state.char.charEquip.shield!.name != null
                                    ? state.char.charEquip.shield!.name!
                                    : "Shield",
                                magic:
                                    state.char.charEquip.shield?.enchantment !=
                                            null
                                        ? state.char.charEquip.shield!
                                            .enchantment![0].enchant
                                        : "",
                              ),
                              const SizedBox(height: 3),
                            ],
                          )
                        : SizedBox(height: deviceHeight! * 0.025),
                    if (state.char.battleStyle.name != "Spellcaster" ||
                        state.char.battleStyle.name != "Diplomat")
                      state.char.charEquip.armour != null
                          ? DefenseEquipTile(
                              isMasterWork: state.char.charLevel > 2 &&
                                      state.char.charLevel < 5
                                  ? true
                                  : false,
                              label: "Armor",
                              name: state.char.charEquip.armour!.name != null
                                  ? state.char.charEquip.armour!.name!
                                  : "Armour",
                              magic: state.char.charEquip.armour!.enchantment !=
                                      null
                                  ? state.char.charEquip.armour!.enchantment![0]
                                      .enchant
                                  : "",
                            )
                          : const DefenseEquipTile(
                              label: "Armor", name: "armor"),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CombatInfo(
                    length: deviceWidth! * 0.3,
                    label: "Armor Class:",
                    value: "${state.char.combatStats.armourClass}",
                  ),
                  const SizedBox(height: 3),
                  CombatInfo(
                      label: "Surprise:",
                      value: "${state.char.combatStats.armourSurprise}"),
                  const SizedBox(height: 3),
                  CombatInfo(
                      label: "Touch:",
                      value: "${state.char.combatStats.armourTouch}"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 3),
          const GradientLabel(label: "Resistances"),
          Row(
            children: [
              CombatInfo(
                label: "Fortitude:",
                value: "${state.char.resistances.fortitude!}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              CombatInfo(
                label: "Reflex:",
                value: "${state.char.resistances.reflex!}",
              ),
              SizedBox(width: deviceWidth! * 0.03),
              CombatInfo(
                label: "Will:",
                value: "${state.char.resistances.will!}",
              ),
            ],
          ),
        ],
      );
    });
  }
}
