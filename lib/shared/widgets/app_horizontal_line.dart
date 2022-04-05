import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/shared/constants/phone_sizes.dart';

class AppHorizontalLine extends StatelessWidget {
  final double? defineWidth;
  final Color? color;
  const AppHorizontalLine({
    Key? key,
    this.defineWidth,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defineWidth ?? deviceWidth! * 0.92,
      height: deviceHeight! * 0.002,
      color: color ?? Colors.grey,
    );
  }
}
