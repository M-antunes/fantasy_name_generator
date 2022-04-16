import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/widgets/general_magical_equip_row.dart';
import 'widgets/gradient_label_sheet.dart';

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
          const GradientLabelSheet(label: "Magic Equip"),
          SizedBox(height: deviceHeight! * 0.003),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GeneralMagicalEquipRow(
                    label: "item.type",
                    item: "item.name",
                    description: "item.description",
                    onTap: () {},
                    selected: false);
              })
        ],
      ),
    );
  }
}
