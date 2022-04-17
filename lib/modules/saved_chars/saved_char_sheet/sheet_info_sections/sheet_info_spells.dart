import 'package:flutter/material.dart';

import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoSpells extends StatelessWidget {
  final CharModel char;

  const SheetInfoSpells({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        children: [
          const LabelForCategoryIcon(label: "Spells"),
          SizedBox(height: deviceHeight! * 0.003),
        ],
      ),
    );
  }
}
