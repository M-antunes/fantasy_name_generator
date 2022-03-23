import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class DefenseInfo extends StatelessWidget {
  final String label;
  final int value;
  const DefenseInfo({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: deviceWidth! * 0.26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppTextStyle.statsLabel),
              CircleAvatar(
                backgroundColor: Colors.grey[900],
                radius: 16,
                child: Text(
                  value.toString(),
                  style: AppTextStyle.modefier,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: deviceHeight! * 0.005),
      ],
    );
  }
}
