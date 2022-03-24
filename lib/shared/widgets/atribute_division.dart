import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import 'app_horizontal_line.dart';

class AtributeDivision extends StatelessWidget {
  final String label;
  final String? label2;
  const AtributeDivision({
    Key? key,
    required this.label,
    this.label2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: deviceHeight! * 0.005),
        const AppHorizontalLine(),
        Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              label,
              style: AppTextStyle.atributeDivisionText,
            )),
        const AppHorizontalLine(),
        if (label2 != null)
          Text(
            label2!,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        SizedBox(height: deviceHeight! * 0.01),
      ],
    );
  }
}
