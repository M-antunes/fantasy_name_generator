import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/stats_tabs/features/widgets/feature_list_widget.dart';
import 'widgets/gradient_label_sheet.dart';

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
          const GradientLabelSheet(label: "Features"),
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
          SizedBox(height: deviceHeight! * 0.005),
          const GradientLabelSheet(label: "Special"),
          SizedBox(height: deviceHeight! * 0.005),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return FeatureListWidget(
                    name: "special.name",
                    selected: false,
                    description: "special.description",
                    onTap: () {});
              }),
        ],
      ),
    );
  }
}
