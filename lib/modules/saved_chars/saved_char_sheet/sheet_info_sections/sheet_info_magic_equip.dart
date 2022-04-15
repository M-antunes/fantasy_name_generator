import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/widgets/gradient_label.dart';

class SheetInfoMagicEquip extends StatelessWidget {
  const SheetInfoMagicEquip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        children: [
          GradientLabel(label: "Magic Equip"),
          SizedBox(height: deviceHeight! * 0.003),
        ],
      ),
    );
  }
}
