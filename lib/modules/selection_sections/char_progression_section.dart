import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/advance_button.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class CharProgression extends StatelessWidget {
  final VoidCallback onTap;
  const CharProgression({
    Key? key,
    required this.onTap,
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
                        "${state.newName} ${state.newLastName}",
                        style: AppTextStyle.chosenName,
                      ),
                    ),
                    Text("Lv: ${state.levelSelected + 1}",
                        style: AppTextStyle.chosenName),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    const Text("Race:  ", style: AppTextStyle.statsLabel),
                    Text(state.chosenRace.name,
                        style: AppTextStyle.selectButtonReady),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    const Text("Gender:  ", style: AppTextStyle.statsLabel),
                    Text(state.isMale ? "Male" : "Female",
                        style: AppTextStyle.selectButtonReady),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    const Text("Class:  ", style: AppTextStyle.statsLabel),
                    Text(state.chosenClass.name,
                        style: AppTextStyle.selectButtonReady),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    const Text("Alignment:  ", style: AppTextStyle.statsLabel),
                    Text(state.chosenAlignment.name,
                        style: AppTextStyle.selectButtonReady),
                  ],
                ),
              ],
            );
          }),
          SizedBox(height: size.height * 0.1),
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
