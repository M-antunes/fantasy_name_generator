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
    return Column(
      children: [
        SizedBox(height: size.height * 0.03),
        Container(
          width: size.width * 0.5,
          height: size.height * 0.003,
          color: Colors.grey,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.01,
          ),
          child: Text(
            label,
            style: AppTextStyle.changeRace,
          ),
        ),
        Container(
          width: size.width * 0.5,
          height: size.height * 0.003,
          color: Colors.grey,
        ),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }
}
