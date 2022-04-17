import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/widgets/atribute_division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/widgets/general_magical_equip_row.dart';
import '../controller/saved_char_controller.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoMagicEquip extends StatelessWidget {
  final CharModel char;

  const SheetInfoMagicEquip({
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
            const LabelForCategoryIcon(label: "Magic Equip"),
            SizedBox(height: deviceHeight! * 0.003),
            const AtributeDivision(label: "Wonderous items"),
            SizedBox(height: deviceHeight! * 0.003),
            ListView.builder(
                itemCount: char.charEquip.wonderousItems!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = char.charEquip.wonderousItems![index];
                  return GeneralMagicalEquipRow(
                      isCharSheet: true,
                      label: item.type!,
                      item: item.name!,
                      description: item.description!,
                      onTap: () => ctrl.showDescriptions(
                          index, char.charEquip.wonderousItems!),
                      selected: item.isSelected);
                })
          ],
        ),
      ),
    );
  }
}