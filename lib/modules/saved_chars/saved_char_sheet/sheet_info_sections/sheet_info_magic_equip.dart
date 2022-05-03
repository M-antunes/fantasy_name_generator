import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/char_admin_controller/char_adimin_controller.dart';
import '../../../../models/char_personal_models/char_model.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../char_creation/selection_sections/stats_sections/stats_tabs/magic_gear/widgets/spell_and_potion_description.dart';
import '../../../char_creation/selection_sections/stats_sections/widgets/atribute_division.dart';
import '../../../char_creation/selection_sections/stats_sections/widgets/general_magical_equip_row.dart';
import '../../../char_creation/selection_sections/stats_sections/widgets/gradient_label.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoMagicEquip extends StatelessWidget {
  final CharModel char;

  const SheetInfoMagicEquip({
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
            const LabelForCategoryIcon(label: "Magic Equip"),
            SizedBox(height: deviceHeight! * 0.003),
            const AttributeDivision(label: "Wonderous items"),
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
                }),
            SizedBox(height: deviceHeight! * 0.003),
            const AttributeDivision(label: "Potions"),
            SizedBox(height: deviceHeight! * 0.003),
            ListView.builder(
                itemCount: char.charEquip.potions.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var potion = char.charEquip.potions[index];
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: char.charLevel > 8 &&
                              potion.name == "Aid" &&
                              char.charEquip.potions.first.name == "Aid"
                          ? RichText(
                              text: TextSpan(children: [
                              TextSpan(
                                text: "Potion of ${potion.name}  ",
                                style: AppTextStyle.statsLabelBrighter,
                              ),
                              TextSpan(
                                  text: "used for encounter",
                                  style: AppTextStyle.penaltyStyleText)
                            ]))
                          : Text(
                              "Potion of ${potion.name}",
                              style: AppTextStyle.statsLabelBrighter,
                            ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: ((context) =>
                              SpellAndPotionDescription(potion: potion))),
                    ),
                  );
                }),
            SizedBox(height: deviceHeight! * 0.003),
            char.charEquip.tomesAndManuals!.isNotEmpty
                ? Column(
                    children: [
                      const GradientLabel(label: "Special Boosts"),
                      SizedBox(height: deviceHeight! * 0.003),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: char.charEquip.tomesAndManuals!.length,
                          itemBuilder: (context, index) {
                            var book = char.charEquip.tomesAndManuals![index];
                            return GeneralMagicalEquipRow(
                              isCharSheet: true,
                              label: "Book read",
                              item: book.name!,
                              selected: book.isSelected,
                              description: book.description!,
                              onTap: () => ctrl.showDescriptions(
                                  index, char.charEquip.tomesAndManuals),
                            );
                          })
                    ],
                  )
                : const SizedBox(),
            SizedBox(height: deviceHeight! * 0.003),
          ],
        ),
      ),
    );
  }
}
