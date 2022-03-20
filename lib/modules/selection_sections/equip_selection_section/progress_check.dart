import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';

import '../../../shared/themes/app_text_styles.dart';
import '../../../shared/widgets/atribute_division.dart';
import '../char_selection_sections/widgets/defense_info.dart';
import '../char_selection_sections/widgets/stats_description_column.dart';

class ProgressCheck extends StatefulWidget {
  const ProgressCheck({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressCheck> createState() => _ProgressCheckState();
}

class _ProgressCheckState extends State<ProgressCheck> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<CharController>(builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyle.subTextGrey,
                  children: [
                    const TextSpan(
                      text: "The  ",
                    ),
                    TextSpan(
                        text: state.generatedChar.charClass.name,
                        style: AppTextStyle.subTextWhite),
                    const TextSpan(
                      text: "  of level  ",
                    ),
                    TextSpan(
                        text: "${state.generatedChar.charLevel}, ",
                        style: AppTextStyle.subTextWhite),
                    const TextSpan(
                      text: " named  ",
                    ),
                    TextSpan(
                        text: state.generatedChar.charName.fullName,
                        style: AppTextStyle.subTextWhite),
                    const TextSpan(
                      text: "  has no equipment so far.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const AtributeDivision(
                label: "ABILITY SCORES  (base / modifier)",
                label2: "These values might be altered depending on equipment",
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.44,
                        child: StatsDescriptionColumn(
                          labeltop: "Strength:",
                          labelBottom: "Dexterity:",
                          textValueTop:
                              state.generatedChar.baseAtributes.strength!,
                          textValueBottom:
                              state.generatedChar.baseAtributes.dexterity!,
                          modTop: state.generatedChar.modAtributes.strength!,
                          modBottom:
                              state.generatedChar.modAtributes.dexterity!,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.44,
                        child: StatsDescriptionText(
                          label: "Constitution:",
                          textValue:
                              state.generatedChar.baseAtributes.constitution!,
                          modValue:
                              state.generatedChar.modAtributes.constitution!,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: size.width * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.44,
                        child: StatsDescriptionColumn(
                          labeltop: "Intelligence:",
                          labelBottom: "Wisdom:",
                          textValueTop:
                              state.generatedChar.baseAtributes.intelligence!,
                          textValueBottom:
                              state.generatedChar.baseAtributes.wisdom!,
                          modTop:
                              state.generatedChar.modAtributes.intelligence!,
                          modBottom: state.generatedChar.modAtributes.wisdom!,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.44,
                        child: StatsDescriptionText(
                          label: "Charisma:",
                          textValue:
                              state.generatedChar.baseAtributes.charisma!,
                          modValue: state.generatedChar.modAtributes.charisma!,
                        ),
                      ),
                      SizedBox(height: size.height * 0.006),
                    ],
                  ),
                ],
              ),
              const AtributeDivision(
                label: "COMBAT",
                label2: "These values might be altered depending on equipment",
              ),
              Row(
                children: [
                  DefenseInfo(
                    size: size,
                    label: "HP:",
                    value: state.generatedChar.hitPoints,
                  ),
                  SizedBox(width: size.width * 0.03),
                  DefenseInfo(
                    size: size,
                    label: "Initiative",
                    value: state.generatedChar.modAtributes.dexterity!,
                  ),
                ],
              ),
              Row(
                children: [
                  DefenseInfo(
                    size: size,
                    label: "FORT:",
                    value: state.generatedChar.resistances.fortitude!,
                  ),
                  SizedBox(width: size.width * 0.03),
                  DefenseInfo(
                    size: size,
                    label: "REF:",
                    value: state.generatedChar.resistances.reflex!,
                  ),
                  SizedBox(width: size.width * 0.03),
                  DefenseInfo(
                    size: size,
                    label: "WILL:",
                    value: state.generatedChar.resistances.will!,
                  ),
                ],
              ),
              Row(
                children: [
                  DefenseInfo(
                    size: size,
                    label: "AC:",
                    value: state.generatedChar.combatStats.armourClass!,
                  ),
                  SizedBox(width: size.width * 0.03),
                  DefenseInfo(
                    size: size,
                    label: "Touch:",
                    value: state.generatedChar.combatStats.armourTouch!,
                  ),
                  SizedBox(width: size.width * 0.03),
                  DefenseInfo(
                    size: size,
                    label: "Surp:",
                    value: state.generatedChar.combatStats.armourSurprise!,
                  ),
                ],
              ),
              Row(
                children: [
                  DefenseInfo(
                    size: size,
                    label: "BAB:",
                    value: state.generatedChar.combatStats.baseAttackBonus!,
                  ),
                  SizedBox(width: size.width * 0.03),
                  DefenseInfo(
                    size: size,
                    label: "CMB:",
                    value: state.generatedChar.combatStats.combatManeuverBonus!,
                  ),
                  SizedBox(width: size.width * 0.03),
                  DefenseInfo(
                    size: size,
                    label: "CMD:",
                    value:
                        state.generatedChar.combatStats.combatManeuverDefense!,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.015),
              Row(
                children: [
                  Text("Click", style: AppTextStyle.subTextGrey),
                  TextButton(
                      child: const Text(
                        "HERE",
                        style: TextStyle(color: AppColors.primaryGold),
                      ),
                      onPressed: () {
                        showStartingOverConfirmation(context, state);
                      }),
                  Text("to start over", style: AppTextStyle.subTextGrey),
                ],
              ),
              Text("Or click next to start equipment generation",
                  style: AppTextStyle.subTextGrey),
              SizedBox(height: size.height * 0.01),
            ],
          ),
        );
      }),
    );
  }

  Future<dynamic> showStartingOverConfirmation(
      BuildContext context, CharController state) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                "ATENTION!",
                style: TextStyle(
                  color: AppColors.primaryGold,
                ),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    "If you start over, the ${state.generatedChar.charClass.name} ${state.generatedChar.charName.fullName}, will be lost forever.",
                    style: AppTextStyle.subTextGrey,
                    textAlign: TextAlign.center),
                Text("Is that what you desire?",
                    style: AppTextStyle.subTextGrey),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  state.startCharAllOver();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'YES',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'NO',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          );
        });
  }
}
