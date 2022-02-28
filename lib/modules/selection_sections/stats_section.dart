import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/advance_button.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:fantasy_name_generator/shared/widgets/app_animated_button.dart';

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
      padding: const EdgeInsets.all(12),
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
                      padding: const EdgeInsets.symmetric(vertical: 15),
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
                SizedBox(height: size.height * 0.1),
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

class AtributeDivision extends StatelessWidget {
  final Size size;
  final String label;
  const AtributeDivision({
    Key? key,
    required this.size,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.015),
        Container(
          width: size.width * 0.92,
          height: size.height * 0.002,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Text(label),
        ),
        Container(
          width: size.width * 0.92,
          height: size.height * 0.002,
          color: Colors.grey,
        ),
        SizedBox(height: size.height * 0.015),
      ],
    );
  }
}
