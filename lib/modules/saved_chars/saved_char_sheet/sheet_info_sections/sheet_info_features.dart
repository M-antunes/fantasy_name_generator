import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/char_admin_controller/char_adimin_controller.dart';
import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../char_creation/selection_sections/stats_sections/stats_tabs/features/widgets/feature_list_widget.dart';
import '../../../char_creation/selection_sections/stats_sections/stats_tabs/features/widgets/ranger_favored_info.dart';
import '../../../char_creation/selection_sections/stats_sections/widgets/atribute_division.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoFeatures extends StatelessWidget {
  final CharModel char;

  const SheetInfoFeatures({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<CharAdminController>();
    return ExpandedSection(
      expand: true,
      child: SizedBox(
        height: deviceHeight! * 0.75,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const LabelForCategoryIcon(label: "Features"),
            AttributeDivision(label: "${char.charClass.name} Features"),
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
            char.charClass.specials!.isNotEmpty &&
                    (char.charClass.name != "Ranger" &&
                        char.charClass.name != "Bandit")
                ? Column(
                    children: [
                      AttributeDivision(
                          label:
                              "${char.charClass.name}  ${char.charClass.specialName}"),
                      SizedBox(height: deviceHeight! * 0.005),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: char.charClass.specials!.length,
                          itemBuilder: (context, index) {
                            var special = char.charClass.specials![index];
                            return FeatureListWidget(
                              name: special.name,
                              selected: special.isSelected,
                              description: special.description,
                              onTap: () => ctrl.showDescriptions(
                                  index, char.charClass.specials),
                            );
                          }),
                      SizedBox(height: deviceHeight! * 0.05),
                    ],
                  )
                : char.charClass.specials!.isNotEmpty &&
                        (char.charClass.name == "Ranger" ||
                            char.charClass.name == "Bandit")
                    ? Column(
                        children: [
                          RangerFavoredInfo(
                              label: char.charClass.name == "Bandit"
                                  ? "Favored Prey"
                                  : "Favored Enemies",
                              specials: char.charClass.specials!,
                              enemyOrTerrainId: 0),
                          RangerFavoredInfo(
                              label: "Favored Terrains",
                              specials: char.charClass.specials!,
                              enemyOrTerrainId: 1),
                        ],
                      )
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
