import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class SelectionLabel extends StatelessWidget {
  final Size size;
  final String label;
  const SelectionLabel({
    Key? key,
    required this.size,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.005, horizontal: size.height * 0.015),
      child: Text(
        label,
        style: AppTextStyle.mainPageLabel,
      ),
    );
  }
}
