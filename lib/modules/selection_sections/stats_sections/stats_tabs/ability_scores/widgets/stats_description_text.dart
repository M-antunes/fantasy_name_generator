import 'package:flutter/material.dart';

import '../../../../../../shared/themes/app_text_styles.dart';

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
