import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';

import 'widgets/level_choice_campaign_buttonm.dart';

class LevelSelection extends StatelessWidget {
  const LevelSelection({
    Key? key,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<CharController>(builder: (context, state, child) {
      return Column(
        children: [
          state.chosenClass.name == "Aristocrat" ||
                  state.chosenClass.name == "Commoner" ||
                  state.chosenClass.name == "Noble"
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          state.chosenClass.name == "Aristocrat"
                              ? "Aristocrats CANNOT be Epic and go no further than lv:10"
                              : state.chosenClass.name == "Commoner"
                                  ? "Commoners CANNOT be Epic and go no further than lv:5"
                                  : state.chosenClass.name == "Noble"
                                      ? "Nobles CANNOT be Epic and go no further than lv:15"
                                      : "",
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      width: size.width * 0.92,
                      height: size.height * 0.003,
                      color: Colors.grey,
                    ),
                    SizedBox(height: size.height * 0.01),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LevelChoiceCampaignButton(
                      label: "Regular",
                      boxColor: state.isRegularLevelSelected
                          ? AppColors.primary
                          : Colors.black38,
                      textColor: state.isRegularLevelSelected
                          ? Colors.white
                          : Colors.grey[400]!,
                      onTap: () => state.switchToRegularLevel(),
                    ),
                    LevelChoiceCampaignButton(
                      label: "Epic",
                      boxColor: state.isEpicLevelSelected
                          ? AppColors.primary
                          : Colors.black38,
                      textColor: state.isEpicLevelSelected
                          ? Colors.white
                          : Colors.grey[400]!,
                      onTap: () => state.switchToEpicLevel(),
                    ),
                  ],
                ),
          GridView.builder(
            itemCount: state.isEpicLevelSelected ||
                    state.chosenClass.name == "Aristocrat"
                ? 10
                : state.chosenClass.name == "Noble"
                    ? 15
                    : state.chosenClass.name == "Commoner"
                        ? 5
                        : 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var level = state.isEpicLevelSelected ? index + 21 : index + 1;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio<int>(
                          activeColor: AppColors.primary,
                          toggleable: true,
                          value: index,
                          groupValue: state.levelSelected,
                          onChanged: (newValue) =>
                              state.updateLevelSelected(newValue)),
                      Text(
                        level.toString(),
                      ),
                    ],
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 12 / 4,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
          ),
          // SizedBox(height: size.height * 0.03),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     AppAnimatedButton(
          //       label: "Previous",
          //       onGenerate: () => state.retreatCreationStage(),
          //     ),
          //     AppAnimatedButton(
          //       onGenerate: onTap,
          //     ),
          //   ],
          // )
        ],
      );
    });
  }
}
