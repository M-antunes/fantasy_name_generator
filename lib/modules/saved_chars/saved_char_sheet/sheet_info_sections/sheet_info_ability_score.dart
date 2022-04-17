import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import '../../../../controllers/char_admin_controller/char_adimin_controller.dart';
import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../char_creation/selection_sections/stats_sections/widgets/general_magical_equip_row.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoAbilityScore extends StatelessWidget {
  final CharModel char;
  const SheetInfoAbilityScore({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<CharAdminController>();
    return ExpandedSection(
      expand: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelForCategoryIcon(label: "Ability Socores"),
          SizedBox(height: deviceHeight! * 0.003),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              children: [
                AbilityRow(
                    label: "Strength:",
                    modValue: char.modAtributes.strength,
                    value: char.baseAtributes.strength),
                AbilityRow(
                    label: "Dexterity:",
                    modValue: char.modAtributes.dexterity,
                    value: char.baseAtributes.dexterity),
                AbilityRow(
                    label: "Constitution:",
                    modValue: char.modAtributes.constitution,
                    value: char.baseAtributes.constitution),
                AbilityRow(
                    label: "Intelligence:",
                    modValue: char.modAtributes.intelligence,
                    value: char.baseAtributes.intelligence),
                AbilityRow(
                    label: "Wisdom:",
                    modValue: char.modAtributes.wisdom,
                    value: char.baseAtributes.wisdom),
                AbilityRow(
                    label: "Charisma:",
                    modValue: char.modAtributes.charisma,
                    value: char.baseAtributes.charisma),
              ],
            ),
          ),
          SizedBox(height: deviceHeight! * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: char.charEquip.tomesAndManuals!.length,
                itemBuilder: (context, index) {
                  var book = char.charEquip.tomesAndManuals![index];
                  return GeneralMagicalEquipRow(
                    label: "Book read",
                    item: book.name!,
                    selected: book.isSelected,
                    description: book.description!,
                    onTap: () => ctrl.showDescriptions(
                        index, char.charEquip.tomesAndManuals),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class AbilityRow extends StatelessWidget {
  final String label;
  final int value;
  final int modValue;
  const AbilityRow({
    Key? key,
    required this.label,
    required this.value,
    required this.modValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth! * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: deviceWidth! * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label, style: AppTextStyle.statsLabel),
                  Text("$value", style: AppTextStyle.statsValue),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CircleAvatar(
              backgroundColor: Colors.grey[900],
              radius: 16,
              child: Text(
                "$modValue",
                style: AppTextStyle.modefier,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
