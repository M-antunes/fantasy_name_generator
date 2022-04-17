import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';

class ProgressionBar extends StatelessWidget {
  final CharController controller;

  const ProgressionBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text("Character Creation Progress", style: AppTextStyle.changeRace),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: StepProgressIndicator(
            roundedEdges: const Radius.circular(10),
            totalSteps: 12,
            currentStep: controller.creationStage,
            selectedColor: AppColors.primary,
            selectedSize: 8,
          ),
        ),
      ],
      // ),
    );
  }
}
