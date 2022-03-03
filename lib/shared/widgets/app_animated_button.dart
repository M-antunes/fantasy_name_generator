import 'package:animated_button/animated_button.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppAnimatedButton extends StatelessWidget {
  final VoidCallback onGenerate;
  final String? label;
  const AppAnimatedButton({
    Key? key,
    required this.onGenerate,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      width: 150,
      color: Colors.grey[700]!,
      duration: 30,
      height: 40,
      onPressed: onGenerate,
      child: Center(
        child: Text(label ?? 'Generate', style: AppTextStyle.changeRace),
      ),
    );
  }
}
