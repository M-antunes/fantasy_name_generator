import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class CharDescriptionText extends StatelessWidget {
  final String label;
  final String textValue;
  const CharDescriptionText({
    Key? key,
    required this.label,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaleFactor: 0.95,
      text: TextSpan(
        children: [
          TextSpan(text: "$label  ", style: AppTextStyle.statsLabel),
          TextSpan(text: textValue, style: AppTextStyle.statsValue),
        ],
      ),
    );
  }
}
