import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class StatsDescriptionColumn extends StatelessWidget {
  final String labeltop;
  final String labelBottom;
  final int textValueTop;
  final int textValueBottom;
  final int modTop;
  final int modBottom;
  const StatsDescriptionColumn({
    Key? key,
    required this.labeltop,
    required this.labelBottom,
    required this.textValueTop,
    required this.textValueBottom,
    required this.modTop,
    required this.modBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatsDescriptionText(
          label: labeltop,
          textValue: textValueTop,
          modValue: modTop,
        ),
        SizedBox(height: size.height * 0.006),
        StatsDescriptionText(
          label: labelBottom,
          textValue: textValueBottom,
          modValue: modBottom,
        ),
        SizedBox(height: size.height * 0.006),
      ],
    );
  }
}

class StatsDescriptionText extends StatelessWidget {
  final String label;
  final int textValue;
  final int modValue;
  const StatsDescriptionText({
    Key? key,
    required this.label,
    required this.textValue,
    required this.modValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "$label  ", style: AppTextStyle.statsLabel),
              TextSpan(
                  text: textValue.toString(), style: AppTextStyle.statsValue),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: CircleAvatar(
            backgroundColor: Colors.grey[900],
            radius: 16,
            child: Text(
              modValue.toString(),
              style: AppTextStyle.modefier,
            ),
          ),
        ),
      ],
    );
  }
}
