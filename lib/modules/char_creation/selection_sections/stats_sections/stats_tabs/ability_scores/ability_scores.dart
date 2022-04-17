import 'package:fantasy_name_generator/controllers/stats_controller/stats_controller.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/atribute_division.dart';
import 'widgets/stats_description_column.dart';
import 'widgets/stats_description_text.dart';

class AbilityScoreSection extends StatelessWidget {
  const AbilityScoreSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatsController>(builder: (context, state, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AttributeDivision(
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
                          textValueTop: state.char.baseAttributes.strength,
                          textValueBottom: state.char.baseAttributes.dexterity,
                          modTop: state.char.modAttributes.strength,
                          modBottom: state.char.modAttributes.dexterity,
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth! * 0.44,
                        child: StatsDescriptionText(
                          label: "Constitution:",
                          textValue: state.char.baseAttributes.constitution,
                          modValue: state.char.modAttributes.constitution,
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
                          textValueTop: state.char.baseAttributes.intelligence,
                          textValueBottom: state.char.baseAttributes.wisdom,
                          modTop: state.char.modAttributes.intelligence,
                          modBottom: state.char.modAttributes.wisdom,
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth! * 0.44,
                        child: StatsDescriptionText(
                          label: "Charisma:",
                          textValue: state.char.baseAttributes.charisma,
                          modValue: state.char.modAttributes.charisma,
                        ),
                      ),
                      SizedBox(height: deviceHeight! * 0.006),
                    ],
                  ),
                ],
              ),
              SizedBox(height: deviceHeight! * 0.02),
              AttributeDivision(
                  label: "Languages known (${state.charLanguages.length})"),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.charLanguages.length,
                itemBuilder: ((context, index) {
                  var language = state.charLanguages[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "${language.name} ",
                              style: AppTextStyle.statsLabelBrighter),
                          TextSpan(
                              text: " (Spoken by ${language.spokenBy})",
                              style: AppTextStyle.longDescription)
                        ])),
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ],
      );
    });
  }
}
