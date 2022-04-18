import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../controllers/stats_controller/stats_controller.dart';
import '../../../../../../../shared/constants/phone_sizes.dart';
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
          const AttributeDivision(label: "Defense"),
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
                    DefenseEquipTile(
                      label: "Shield",
                      name: state.shieldName,
                    ),
                    const SizedBox(height: 3),
                    DefenseEquipTile(
                      label: "Armor",
                      name: state.armorName,
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
