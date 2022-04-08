import 'package:fantasy_name_generator/controllers/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/atribute_division.dart';
import '../widgets/stats_description_column.dart';

class AbilityScoreSection extends StatelessWidget {
  const AbilityScoreSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AtributeDivision(
              label: "Ability Scores  (base / modifier)",
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: deviceWidth! * 0.44,
                      child: StatsDescriptionColumn(
                        labeltop: "Strength:",
                        labelBottom: "Dexterity:",
                        textValueTop: state.char.baseAtributes.strength!,
                        textValueBottom: state.char.baseAtributes.dexterity!,
                        modTop: state.char.modAtributes.strength!,
                        modBottom: state.char.modAtributes.dexterity!,
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth! * 0.44,
                      child: StatsDescriptionText(
                        label: "Constitution:",
                        textValue: state.char.baseAtributes.constitution!,
                        modValue: state.char.modAtributes.constitution!,
                      ),
                    )
                  ],
                ),
                SizedBox(width: deviceWidth! * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: deviceWidth! * 0.44,
                      child: StatsDescriptionColumn(
                        labeltop: "Intelligence:",
                        labelBottom: "Wisdom:",
                        textValueTop: state.char.baseAtributes.intelligence!,
                        textValueBottom: state.char.baseAtributes.wisdom!,
                        modTop: state.char.modAtributes.intelligence!,
                        modBottom: state.char.modAtributes.wisdom!,
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth! * 0.44,
                      child: StatsDescriptionText(
                        label: "Charisma:",
                        textValue: state.char.baseAtributes.charisma!,
                        modValue: state.char.modAtributes.charisma!,
                      ),
                    ),
                    SizedBox(height: deviceHeight! * 0.006),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
