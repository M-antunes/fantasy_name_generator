import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/widgets/gradient_label.dart';

class SheetInfoFeatures extends StatelessWidget {
  const SheetInfoFeatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        children: [
          GradientLabel(label: "Features"),
          SizedBox(height: deviceHeight! * 0.003),
        ],
      ),
    );
  }
}
