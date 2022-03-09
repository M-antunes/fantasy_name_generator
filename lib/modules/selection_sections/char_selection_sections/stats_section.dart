import 'package:fantasy_name_generator/shared/widgets/app_generate_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import 'widgets/atribute_division.dart';
import 'widgets/char_description_column.dart';
import 'widgets/defense_info.dart';
import 'widgets/stats_description_column.dart';

class StatsSection extends StatelessWidget {
  final VoidCallback onGenerate;
  const StatsSection({
    Key? key,
    required this.onGenerate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Consumer<CharController>(builder: (context, state, child) {
            return Stack(
              children: [
                Positioned(
                  top: size.height * 0.05,
                  right: 0,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AppGenerateButton(
                        icon: state.isCharGeneratorCleared
                            ? null
                            : const Icon(Icons.delete_forever, size: 40),
                        onGenerate: onGenerate),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            state.generatedChar.charName.fullName,
                            style: AppTextStyle.chosenName,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              state.isEpicLevelSelected
                                  ? const TextSpan(
                                      text: "Epic ",
                                      style: AppTextStyle.epicLabel)
                                  : state.isLegendaryLevelSelected
                                      ? const TextSpan(
                                          text: "Legendary ",
                                          style: AppTextStyle.epicLabel)
                                      : const TextSpan(
                                          text: "",
                                          style: AppTextStyle.legendaryLabel),
                              const TextSpan(
                                  text: "lv: ",
                                  style: AppTextStyle.subTextWhite),
                              TextSpan(
                                  text:
                                      state.generatedChar.charLevel.toString(),
                                  style: AppTextStyle.levelDisplayStatsPageText)
                            ],
                          ),
                        )
                        //  Text("lv: ${state.generatedChar.charLevel}",
                        //     style: AppTextStyle.chosenName)
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          child: CharDescriptionColumn(
                            labeltop: "Race:",
                            labelBottom: "Class:",
                            textValueTop: state.generatedChar.charRace.name,
                            textValueBottom: state.generatedChar.charClass.name,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.5,
                          child: CharDescriptionColumn(
                            labeltop: "Gender:",
                            labelBottom: "Alignment:",
                            textValueTop: state.generatedChar.charName.gender,
                            textValueBottom:
                                state.generatedChar.alignment.abreviation!,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          child: CharDescriptionColumn(
                            labeltop: "Height:",
                            labelBottom: "Weight:",
                            textValueTop:
                                "${state.generatedChar.charRace.height!.key} ft. ${state.generatedChar.charRace.height!.value} in.",
                            textValueBottom:
                                "${state.generatedChar.charRace.weight!.toInt()} lbs.",
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.5,
                          child: CharDescriptionColumn(
                              labeltop: "Age:",
                              labelBottom: "Speed:",
                              textValueTop:
                                  "${state.generatedChar.charRace.age}",
                              textValueBottom:
                                  "${state.generatedChar.charRace.speed} ft."),
                        ),
                      ],
                    ),
                    AtributeDivision(
                      size: size,
                      label: "ATRIBUTES  (BASE / MODIFIER)",
                      label2:
                          "These values might be altered depending on equipment",
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
                                textValueBottom: state
                                    .generatedChar.baseAtributes.dexterity!,
                                modTop:
                                    state.generatedChar.modAtributes.strength!,
                                modBottom:
                                    state.generatedChar.modAtributes.dexterity!,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.44,
                              child: StatsDescriptionText(
                                label: "Constitution:",
                                textValue: state
                                    .generatedChar.baseAtributes.constitution!,
                                modValue: state
                                    .generatedChar.modAtributes.constitution!,
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
                                textValueTop: state
                                    .generatedChar.baseAtributes.intelligence!,
                                textValueBottom:
                                    state.generatedChar.baseAtributes.wisdom!,
                                modTop: state
                                    .generatedChar.modAtributes.intelligence!,
                                modBottom:
                                    state.generatedChar.modAtributes.wisdom!,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.44,
                              child: StatsDescriptionText(
                                label: "Charisma:",
                                textValue:
                                    state.generatedChar.baseAtributes.charisma!,
                                modValue:
                                    state.generatedChar.modAtributes.charisma!,
                              ),
                            ),
                            SizedBox(height: size.height * 0.006),
                          ],
                        ),
                      ],
                    ),
                    AtributeDivision(
                      size: size,
                      label: "COMBAT",
                      label2:
                          "These values might be altered depending on equipment",
                    ),
                    DefenseInfo(
                      size: size,
                      label: "HP:",
                      value: state.generatedChar.hitPoints,
                    ),
                    Row(
                      children: [
                        DefenseInfo(
                          size: size,
                          label: "BAB:",
                          value:
                              state.generatedChar.combatStats.baseAttackBonus!,
                        ),
                        SizedBox(width: size.width * 0.03),
                        DefenseInfo(
                          size: size,
                          label: "CMB:",
                          value: state
                              .generatedChar.combatStats.combatManeuverBonus!,
                        ),
                        SizedBox(width: size.width * 0.03),
                        DefenseInfo(
                          size: size,
                          label: "CMD:",
                          value: state
                              .generatedChar.combatStats.combatManeuverDefense!,
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
                          value:
                              state.generatedChar.combatStats.armourSurprise!,
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
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
