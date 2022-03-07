import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class CharDescriptionColumn extends StatelessWidget {
  final String labeltop;
  final String labelBottom;
  final String textValueTop;
  final String textValueBottom;
  const CharDescriptionColumn({
    Key? key,
    required this.labeltop,
    required this.labelBottom,
    required this.textValueTop,
    required this.textValueBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CharDescriptionText(label: labeltop, textValue: textValueTop),
        SizedBox(height: size.height * 0.006),
        CharDescriptionText(label: labelBottom, textValue: textValueBottom),
        SizedBox(height: size.height * 0.006),
      ],
    );
  }
}

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
      text: TextSpan(
        children: [
          TextSpan(text: "$label  ", style: AppTextStyle.statsLabel),
          TextSpan(text: textValue, style: AppTextStyle.statsValue),
        ],
      ),
    );
  }
}
