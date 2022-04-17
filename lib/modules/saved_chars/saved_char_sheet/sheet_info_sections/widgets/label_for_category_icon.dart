import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/widgets/app_horizontal_line.dart';

class LabelForCategoryIcon extends StatelessWidget {
  final String label;
  const LabelForCategoryIcon({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AppHorizontalLine(color: Colors.grey[700]),
        Chip(
          label: Text(label,
              style: AppTextStyle.selectRace.copyWith(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 26)),
          backgroundColor: Colors.grey[700],
        )
      ],
    );
  }
}
