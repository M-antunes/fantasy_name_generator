import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProgressionBar extends StatelessWidget {
  final CharController controller;

  const ProgressionBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Text("Character Creation Progress", style: AppTextStyle.changeRace),
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
