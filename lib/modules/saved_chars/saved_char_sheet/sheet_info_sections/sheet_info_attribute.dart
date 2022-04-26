import 'package:fantasy_name_generator/modules/char_creation/selection_sections/stats_sections/widgets/atribute_division.dart';
import 'package:flutter/material.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/shared/themes/app_text_styles.dart';

import '../../../../shared/constants/phone_sizes.dart';
import '../../../../shared/widgets/expanded_section.dart';
import 'widgets/label_for_category_icon.dart';

class SheetInfoAbilityScore extends StatelessWidget {
  final CharModel char;
  const SheetInfoAbilityScore({
    Key? key,
    required this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelForCategoryIcon(label: "Attributes"),
          SizedBox(height: deviceHeight! * 0.003),
          const AttributeDivision(label: "Ability Scores"),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AbilityRow(
                    label: "Strength:",
                    modValue: char.modAttributes.strength,
                    value: char.baseAttributes.strength),
                AbilityRow(
                    label: "Dexterity:",
                    modValue: char.modAttributes.dexterity,
                    value: char.baseAttributes.dexterity),
                AbilityRow(
                    label: "Constitution:",
                    modValue: char.modAttributes.constitution,
                    value: char.baseAttributes.constitution),
                AbilityRow(
                    label: "Intelligence:",
                    modValue: char.modAttributes.intelligence,
                    value: char.baseAttributes.intelligence),
                AbilityRow(
                    label: "Wisdom:",
                    modValue: char.modAttributes.wisdom,
                    value: char.baseAttributes.wisdom),
                AbilityRow(
                    label: "Charisma:",
                    modValue: char.modAttributes.charisma,
                    value: char.baseAttributes.charisma),
              ],
            ),
          ),
          AttributeDivision(
              label: "languages known (${char.languages.length})"),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: char.languages.length,
                itemBuilder: (context, index) {
                  var idiom = char.languages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: "${idiom.name} ",
                              style: AppTextStyle.statsLabelBrighter),
                          TextSpan(
                              text: " (Spoken by ${idiom.spokenBy})",
                              style: AppTextStyle.longDescription)
                        ],
                      ))
                    ],
                  );
                }),
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: SizedBox(
        width: deviceWidth! * 0.45,
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
            CircleAvatar(
              backgroundColor: Colors.grey[900],
              radius: 16,
              child: Text(
                "$modValue",
                style: AppTextStyle.modefier,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
