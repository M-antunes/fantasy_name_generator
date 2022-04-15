import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../shared/themes/app_colors.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  int currentStep = 0;

  advanceIndicator() {
    setState(() {
      currentStep++;
    });
  }

  advanceIndicatorAnimated() {
    Timer(const Duration(milliseconds: 400), () => advanceIndicator());
    Timer(const Duration(milliseconds: 800), () => advanceIndicator());
    Timer(const Duration(milliseconds: 1200), () => advanceIndicator());
    Timer(const Duration(milliseconds: 1300), () => advanceIndicator());
    Timer(const Duration(milliseconds: 1400), () => advanceIndicator());
    Timer(const Duration(milliseconds: 1500), () => advanceIndicator());
    Timer(
        const Duration(milliseconds: 1700), () => Navigator.of(context).pop());
  }

  @override
  void initState() {
    currentStep = 1;
    advanceIndicatorAnimated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Creating",
                style: AppTextStyle.legendaryLabel.copyWith(fontSize: 35),
              ),
              const SizedBox(height: 8),
              StepProgressIndicator(
                roundedEdges: const Radius.circular(10),
                totalSteps: 7,
                currentStep: currentStep,
                selectedColor: AppColors.primaryOrange,
                selectedSize: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
