import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/advance_button.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';

import 'widgets/atribute_division.dart';
import 'widgets/char_description_column.dart';
import 'widgets/stats_description_column.dart';

class CharProgression extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onGenerate;
  const CharProgression({
    Key? key,
    required this.onTap,
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
            return Column(
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
                    Text("lv: ${state.generatedChar.charLevel}",
                        style: AppTextStyle.chosenName),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.43,
                      child: CharDescriptionColumn(
                        labeltop: "Race:",
                        labelBottom: "Class:",
                        textValueLeft: state.generatedChar.charRace.name,
                        textValueRight: state.generatedChar.charClass.name,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: CharDescriptionColumn(
                        labeltop: "Gender:",
                        labelBottom: "Alignment:",
                        textValueLeft: state.generatedChar.charName.gender,
                        textValueRight: state.generatedChar.alignment.name,
                      ),
                    ),
                  ],
                ),
                AtributeDivision(
                  size: size,
                  label: "ATRIBUTES  (BASE / MODIFIER)",
                  label2:
                      "These values might get increased depending on equipment",
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
                    SizedBox(width: size.width * 0.05),
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
                  label: "DEFENSES",
                  label2:
                      "These values might get increased depending on equipment",
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
                    SizedBox(width: size.width * 0.03),
                  ],
                ),
                Row(
                  children: [
                    DefenseInfo(
                      size: size,
                      label: "FORT:",
                      value: 0,
                    ),
                    SizedBox(width: size.width * 0.03),
                    DefenseInfo(
                      size: size,
                      label: "REF:",
                      value: 0,
                    ),
                    SizedBox(width: size.width * 0.03),
                    DefenseInfo(
                      size: size,
                      label: "WILL:",
                      value: 0,
                    ),
                    SizedBox(width: size.width * 0.03),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                Align(
                    alignment: Alignment.center,
                    child: AppAnimatedButton(onGenerate: onGenerate)),
              ],
            );
          }),
          AdvanceButton(
            size: size,
            onTap: onTap,
            label: "CONFIRM",
          )
        ],
      ),
    );
  }
}

class DefenseInfo extends StatelessWidget {
  final Size size;
  final String label;
  final int value;
  const DefenseInfo({
    Key? key,
    required this.size,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.23,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppTextStyle.selectButtonNotReady),
              CircleAvatar(
                backgroundColor: Colors.grey[900],
                radius: 18,
                child: Text(
                  value.toString(),
                  style: AppTextStyle.selectRace,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.005),
      ],
    );
  }
}
