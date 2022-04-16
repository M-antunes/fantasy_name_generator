import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/sheet_info_sections/widgets/gradient_label_sheet.dart';
import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/widgets/atribute_division.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/stats_tabs/loot/widgets/loot_tile.dart';

class SheetInfoLoot extends StatelessWidget {
  const SheetInfoLoot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: SizedBox(
        height: deviceHeight! * 0.73,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const GradientLabelSheet(label: "Loot"),
            SizedBox(height: deviceHeight! * 0.003),
            AtributeDivision(defineWidth: deviceWidth! * 075, label: "Gear"),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return LootTile(
                      name: "item.name", fullPrice: formatGoldPiece(110));
                }),
            AtributeDivision(defineWidth: deviceWidth! * 075, label: "Jwels"),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return LootTile(
                      name: "jwel.name",
                      fullPrice: formatGoldPiece(123),
                      price: 2,
                      qnt: 1);
                }),
            AtributeDivision(defineWidth: deviceWidth! * 075, label: "Coin"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 4),
                  Text(formatGoldPiece(112),
                      style: AppTextStyle.statsLabel
                          .copyWith(color: Colors.grey[300])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
