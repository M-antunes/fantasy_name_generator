import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

class DefenseInfo extends StatelessWidget {
  final String label;
  final String value;
  final double? length;
  const DefenseInfo({
    Key? key,
    required this.label,
    required this.value,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: length ?? deviceWidth! * 0.28,
      child: Row(
        children: [
          Text(label, style: AppTextStyle.statsLabel),
          const SizedBox(width: 10),
          Text(
            value,
            style: AppTextStyle.modefier,
          ),
        ],
      ),
    );
  }
}
