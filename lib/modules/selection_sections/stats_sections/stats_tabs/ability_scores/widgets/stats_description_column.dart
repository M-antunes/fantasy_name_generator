import 'package:flutter/material.dart';

import 'stats_description_text.dart';

class StatsDescriptionColumn extends StatelessWidget {
  final String labeltop;
  final String labelBottom;
  final int textValueTop;
  final int textValueBottom;
  final int modTop;
  final int modBottom;
  const StatsDescriptionColumn({
    Key? key,
    required this.labeltop,
    required this.labelBottom,
    required this.textValueTop,
    required this.textValueBottom,
    required this.modTop,
    required this.modBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatsDescriptionText(
          label: labeltop,
          textValue: textValueTop,
          modValue: modTop,
        ),
        SizedBox(height: size.height * 0.006),
        StatsDescriptionText(
          label: labelBottom,
          textValue: textValueBottom,
          modValue: modBottom,
        ),
        SizedBox(height: size.height * 0.006),
      ],
    );
  }
}
