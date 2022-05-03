import 'package:flutter/material.dart';

import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../char_creation/selection_sections/stats_sections/stats_tabs/loot/widgets/loot_tile.dart';
import '../../../char_creation/selection_sections/stats_sections/widgets/atribute_division.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoLoot extends StatelessWidget {
  final CharModel char;

  const SheetInfoLoot({
    Key? key,
    required this.char,
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
            const LabelForCategoryIcon(label: "Loot"),
            SizedBox(height: deviceHeight! * 0.003),
            AttributeDivision(defineWidth: deviceWidth! * 075, label: "Gear"),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: char.loot.items!.length,
                itemBuilder: (context, index) {
                  var item = char.loot.items![index];
                  return LootTile(
                    name: item.name,
                    fullPrice: formatGoldPiece(item.finalPrice),
                    onCharSheet: true,
                  );
                }),
            AttributeDivision(defineWidth: deviceWidth! * 075, label: "Jwels"),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: char.loot.jwels!.length,
                itemBuilder: (context, index) {
                  var jwel = char.loot.jwels![index];
                  return LootTile(
                    name: jwel.name,
                    fullPrice: formatGoldPiece(jwel.finalPrice),
                    price: jwel.price,
                    qnt: jwel.qnt,
                    onCharSheet: true,
                  );
                }),
            AttributeDivision(
              defineWidth: deviceWidth! * 075,
              label: "Potions",
              label2:
                  "(Only available if not used by this NPC during encounter)",
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: char.loot.potions!.length,
                itemBuilder: (context, index) {
                  var potion = char.loot.potions![index];
                  return LootTile(
                    name: potion.name,
                    fullPrice: formatGoldPiece(potion.finalPrice),
                    price: potion.price,
                    qnt: potion.qnt,
                    onCharSheet: true,
                  );
                }),
            AttributeDivision(defineWidth: deviceWidth! * 075, label: "Coin"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 4),
                  Text(formatGoldPiece(char.loot.gold!),
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
