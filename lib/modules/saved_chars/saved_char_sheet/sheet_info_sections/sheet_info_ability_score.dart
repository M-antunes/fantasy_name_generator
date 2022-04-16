import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/controller/saved_char_controller.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import '../../../selection_sections/stats_sections/widgets/general_magical_equip_row.dart';
import 'widgets/gradient_label_sheet.dart';

class SheetInfoAbilityScore extends StatelessWidget {
  const SheetInfoAbilityScore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Consumer<SavedCharController>(builder: (context, state, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientLabelSheet(label: "Ability Scores"),
            SizedBox(height: deviceHeight! * 0.003),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  AbilityRow(label: "Strength:", modValue: 1, value: 1),
                  AbilityRow(label: "Dexterity:", modValue: 1, value: 1),
                  AbilityRow(label: "Constitution:", modValue: 1, value: 1),
                  AbilityRow(label: "Intelligence:", modValue: 1, value: 1),
                  AbilityRow(label: "Wisdom:", modValue: 1, value: 1),
                  AbilityRow(label: "Charisma:", modValue: 1, value: 1),
                ],
              ),
            ),
            SizedBox(height: deviceHeight! * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return GeneralMagicalEquipRow(
                      label: "Book read",
                      item: "book.name",
                      selected: true,
                      description: "book.description",
                      onTap: () {},
                    );
                  }),
            )
          ],
        );
      }),
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
