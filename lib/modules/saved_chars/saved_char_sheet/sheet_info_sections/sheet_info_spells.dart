import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/widgets/gradient_label_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';

class SheetInfoSpells extends StatelessWidget {
  const SheetInfoSpells({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        children: [
          const GradientLabelSheet(label: "Spells"),
          SizedBox(height: deviceHeight! * 0.003),
        ],
      ),
    );
  }
}
