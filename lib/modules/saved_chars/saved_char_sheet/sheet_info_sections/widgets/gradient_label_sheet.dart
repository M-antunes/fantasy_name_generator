import 'package:fantasy_name_generator/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_text_styles.dart';

class GradientLabelSheet extends StatelessWidget {
  final String label;
  final String? label2;
  const GradientLabelSheet({
    Key? key,
    required this.label,
    this.label2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              Colors.transparent,
            ],
          ),
        ),
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Text(" $label",
                style:
                    AppTextStyle.selectRace.copyWith(color: Colors.grey[400])),
            Text(label2 != null ? "  ($label2)" : "",
                style:
                    AppTextStyle.statsLabel.copyWith(color: Colors.grey[400])),
          ],
        ));
  }
}
