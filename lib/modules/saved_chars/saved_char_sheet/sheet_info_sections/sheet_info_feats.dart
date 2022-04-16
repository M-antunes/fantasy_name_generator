import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/widgets/gradient_label_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/stats_tabs/features/widgets/feature_list_widget.dart';

class SheetInfoFeats extends StatelessWidget {
  const SheetInfoFeats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        children: [
          const GradientLabelSheet(label: "Feats"),
          SizedBox(height: deviceHeight! * 0.003),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return FeatureListWidget(
                  name: "trait.traiName",
                  selected: false,
                  description: "trait.traiDescription",
                  onTap: () {},
                );
              }),
        ],
      ),
    );
  }
}
