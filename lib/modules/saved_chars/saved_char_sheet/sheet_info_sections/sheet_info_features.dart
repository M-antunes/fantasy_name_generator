import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/widgets/atribute_division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/stats_tabs/features/widgets/feature_list_widget.dart';
import '../controller/saved_char_controller.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoFeatures extends StatelessWidget {
  final CharModel char;

  const SheetInfoFeatures({
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
            const LabelForCategoryIcon(label: "Features"),
            SizedBox(height: deviceHeight! * 0.003),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: char.charClass.traits!.length,
                itemBuilder: (context, index) {
                  var trait = char.charClass.traits![index];
                  return FeatureListWidget(
                    name: trait.traiName,
                    selected: trait.isSelected,
                    description: trait.traiDescription,
                    onTap: () =>
                        ctrl.showDescriptions(index, char.charClass.traits!),
                  );
                }),
            SizedBox(height: deviceHeight! * 0.005),
            AtributeDivision(label: char.charClass.specialName),
            SizedBox(height: deviceHeight! * 0.005),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: char.charClass.speacials!.length,
                itemBuilder: (context, index) {
                  var special = char.charClass.speacials![index];
                  return FeatureListWidget(
                      name: special.name,
                      selected: special.isSelected,
                      description: special.description,
                      onTap: () => ctrl.showDescriptions(
                          index, char.charClass.speacials!));
                }),
          ],
        ),
      ),
    );
  }
}
