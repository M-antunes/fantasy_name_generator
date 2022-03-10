import 'package:animated_button/animated_button.dart';
import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class AppAnimatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? label;
  final Color? color;
  final TextStyle? style;
  const AppAnimatedButton({
    Key? key,
    required this.onTap,
    this.label,
    this.color,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      width: 120,
      color: color ?? Colors.grey[900]!,
      duration: 30,
      height: deviceWidth! < 400 ? 35 : 40,
      onPressed: onTap,
      child: Center(
        child: Text(label ?? 'Next', style: style ?? AppTextStyle.changeRace),
      ),
    );
  }
}
