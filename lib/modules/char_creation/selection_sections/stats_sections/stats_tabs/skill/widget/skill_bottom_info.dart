import 'package:flutter/material.dart';

import '../../../../../../../shared/themes/app_text_styles.dart';

class SkillBottomInfo extends StatelessWidget {
  final String text;
  final String? coloredIndex;
  final Color? color;
  const SkillBottomInfo({
    Key? key,
    required this.text,
    this.coloredIndex = "",
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textScaleFactor: 0.9,
        text: TextSpan(
            style: AppTextStyle.longDescription
                .copyWith(fontStyle: FontStyle.italic),
            children: [
              TextSpan(text: coloredIndex, style: TextStyle(color: color)),
              TextSpan(text: text),
            ]));
  }
}
