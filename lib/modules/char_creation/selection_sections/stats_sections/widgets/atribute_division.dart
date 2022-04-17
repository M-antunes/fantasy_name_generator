import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import '../../../../../shared/widgets/app_horizontal_line.dart';

class AttributeDivision extends StatelessWidget {
  final String label;
  final String? label2;
  final double? defineWidth;
  const AttributeDivision({
    Key? key,
    required this.label,
    this.label2,
    this.defineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: deviceHeight! * 0.01),
        AppHorizontalLine(defineWidth: defineWidth),
        Padding(
            padding: const EdgeInsets.only(top: 3, left: 6),
            child: Text(
              label,
              style: AppTextStyle.attributeDivisionText
                  .copyWith(color: Colors.white),
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
