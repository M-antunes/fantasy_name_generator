import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/selection_sections/widgets/advance_button.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';

import 'widgets/level_choice_campaign_buttonm.dart';

class LevelSelection extends StatelessWidget {
  final VoidCallback onTap;
  const LevelSelection({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<CharController>(builder: (context, state, child) {
      return Column(
        children: [
          Row(
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
            itemCount: state.isEpicLevelSelected ? 10 : 20,
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
          AdvanceButton(size: size, onTap: onTap)
        ],
      );
    });
  }
}
