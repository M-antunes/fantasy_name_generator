import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CharProgression extends StatelessWidget {
  final CharController controller;
  const CharProgression({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: CircleAvatar(
                    child: Text(
                      controller.creationStage > 1
                          ? controller.tempRaceForSwitching.name
                          : '',
                      style: AppTextStyle.chosenRace,
                    ),
                    backgroundColor: Colors.black,
                    radius: 45),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.creationStage > 3)
                    Text("${controller.newName} ${controller.newLastName}",
                        style: AppTextStyle.changeRace),
                  if (controller.creationStage > 2)
                    Text(controller.isMale ? "Male" : "Female"),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      controller.isEpicLevelSelected
                          ? Row(
                              children: const [
                                Text(
                                  'EPIC',
                                  style: TextStyle(
                                    color: AppColors.primaryGold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            )
                          : const SizedBox(),
                      if (controller.creationStage > 4)
                        Text(controller.chosenClass.name,
                            style: AppTextStyle.selectRace),
                      if (controller.creationStage > 6)
                        Text("    lv: ${controller.levelSelected + 1}",
                            style: AppTextStyle.chosenRace),
                    ],
                  ),
                  if (controller.creationStage > 5)
                    Text(controller.chosenAlignment.name,
                        style: AppTextStyle.selectRace),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StepProgressIndicator(
              roundedEdges: const Radius.circular(10),
              totalSteps: 11,
              currentStep: controller.creationStage,
              selectedColor: AppColors.primary,
              selectedSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}
