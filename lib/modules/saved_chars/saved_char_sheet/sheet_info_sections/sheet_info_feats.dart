import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../char_creation/selection_sections/stats_sections/stats_tabs/features/widgets/feature_list_widget.dart';
import '../controller/saved_char_controller.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoFeats extends StatelessWidget {
  final CharModel char;

  const SheetInfoFeats({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<SavedCharController>();

    return ExpandedSection(
      expand: true,
      child: SizedBox(
        height: deviceHeight! * 0.75,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const LabelForCategoryIcon(label: "Feats"),
            SizedBox(height: deviceHeight! * 0.003),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: char.feats.length,
                itemBuilder: (context, index) {
                  var feat = char.feats[index];
                  return FeatureListWidget(
                    name: feat.traiName,
                    selected: feat.isSelected,
                    description: feat.traiDescription,
                    onTap: () => ctrl.showDescriptions(index, char.feats),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
