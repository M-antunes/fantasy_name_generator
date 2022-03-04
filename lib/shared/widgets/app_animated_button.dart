import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class AppAnimatedButton extends StatelessWidget {
  final VoidCallback onGenerate;
  final String? label;
  final Color? color;
  final TextStyle? style;
  const AppAnimatedButton({
    Key? key,
    required this.onGenerate,
    this.label,
    this.color,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      width: 150,
      color: color ?? Colors.grey[900]!,
      duration: 30,
      height: 40,
      onPressed: onGenerate,
      child: Center(
        child:
            Text(label ?? 'Generate', style: style ?? AppTextStyle.changeRace),
      ),
    );
  }
}
