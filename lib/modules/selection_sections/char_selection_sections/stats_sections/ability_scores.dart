import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/atribute_division.dart';
import '../widgets/stats_description_column.dart';

class AbilityScoreSection extends StatelessWidget {
  const AbilityScoreSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CharController>(builder: (context, state, child) {
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
                        textValueTop: state.cha.baseAtributes.strength!,
                        textValueBottom: state.cha.baseAtributes.dexterity!,
                        modTop: state.cha.modAtributes.strength!,
                        modBottom: state.cha.modAtributes.dexterity!,
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth! * 0.44,
                      child: StatsDescriptionText(
                        label: "Constitution:",
                        textValue: state.cha.baseAtributes.constitution!,
                        modValue: state.cha.modAtributes.constitution!,
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
                        textValueTop: state.cha.baseAtributes.intelligence!,
                        textValueBottom: state.cha.baseAtributes.wisdom!,
                        modTop: state.cha.modAtributes.intelligence!,
                        modBottom: state.cha.modAtributes.wisdom!,
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth! * 0.44,
                      child: StatsDescriptionText(
                        label: "Charisma:",
                        textValue: state.cha.baseAtributes.charisma!,
                        modValue: state.cha.modAtributes.charisma!,
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
