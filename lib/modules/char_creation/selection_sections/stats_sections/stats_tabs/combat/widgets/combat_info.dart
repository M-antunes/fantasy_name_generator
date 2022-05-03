import 'package:flutter/material.dart';

import '../../../../../../../shared/constants/phone_sizes.dart';
import '../../../../../../../shared/themes/app_text_styles.dart';

class CombatInfo extends StatelessWidget {
  final String label;
  final String value;
  final double? length;
  final bool onCharSheet;
  const CombatInfo({
    Key? key,
    required this.label,
    required this.value,
    this.length,
    this.onCharSheet = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: length ?? deviceWidth! * 0.28,
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyle.statsLabel,
            textScaleFactor: onCharSheet ? 0.9 : 1,
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: AppTextStyle.modefier,
            textScaleFactor: onCharSheet ? 0.9 : 1,
          ),
        ],
      ),
    );
  }
}
